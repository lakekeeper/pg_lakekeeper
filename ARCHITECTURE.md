# Architecture

`pg_lakekeeper` is a PostgreSQL extension that adds read-only SQL access to the
catalog state of a [Lakekeeper](https://github.com/lakekeeper/lakekeeper) Iceberg
REST Catalog. It installs into the database Lakekeeper already writes to and reads
that database's tables directly. Nothing in it writes, and nothing in it talks to
the network.

## Objects

The extension creates two objects per published relation, in its own schema
(`lakekeeper`):

- a function named with a leading underscore (`_warehouse`, `_tabular`, `_field`),
  `LANGUAGE sql STABLE`, whose body is one `SELECT` over Lakekeeper's tables and
  whose `RETURNS TABLE` clause declares the published column names and types;
- a view over that function, `WITH (security_invoker = true)`, defined as
  `SELECT * FROM @extschema@._name()`.

Four objects describe the installation itself:

| Object | Holds |
|---|---|
| `_pin()` | the upstream commit, release version, migration count and migration digest this extension version was written against |
| `_lakekeeper_schema()` | the schema this installation is bound to |
| `_resolve_lakekeeper_schema()` | the schema resolution rule, evaluated at call time |
| `check_schema()` | one row per check: the binding, the presence of upstream migrations, and the migration digest against the pin |

`info` and `migration` are views over those and over Lakekeeper's migration table.

The document functions (`schema_json`, `table_metadata`, `load_table`,
`view_metadata`, `load_view`) are `LANGUAGE plpgsql STABLE` and return `jsonb`.

## Schema binding

Lakekeeper's tables live in the schema its `LAKEKEEPER__PG_SCHEMA` setting names,
or in `public` when it names none. Each function body names that schema literally,
resolved once during installation in this order:

1. the `pg_lakekeeper.lakekeeper_schema` setting, when it is set;
2. the single schema containing a `_sqlx_migrations` table;
3. `public`.

`_define(text)` takes a definition, replaces the `@lk@` marker with
`quote_ident()` of the resolved name, and executes it. Every definition that reads
Lakekeeper's tables is installed through it, so no installed body resolves a
relation through the caller's `search_path`. `_define` is dropped when
installation finishes.

`check_schema()` re-runs the resolution at query time and compares it against the
binding, so a database whose layout no longer matches its installed extension is
named by that check.

Because the binding is fixed at installation, a deployment that puts Lakekeeper in
a named schema sets `pg_lakekeeper.lakekeeper_schema` at server, database or role
level. A setting at any of those levels is in effect when `pg_restore` opens its
connection, which is what keeps restore a single command.

## Why the function layer exists

A view defined directly over Lakekeeper's tables records a dependency on each of
them. A function with a string body records none, and that gives three properties.

**The extension installs into a database that holds no Lakekeeper tables.**
`CREATE EXTENSION` runs with `check_function_bodies` off, so a body naming a table
that does not exist yet is stored without being parsed. A dump emits
`CREATE EXTENSION` before any table, so `pg_restore` of a database holding both
Lakekeeper's schema and this extension is one command with no manual step.

**Upstream migrations are never blocked.** No `pg_depend` row points from an
extension object to a Lakekeeper table, so an upstream
`ALTER TABLE ... ALTER COLUMN ... TYPE` does not have to drop anything here.
Upgrading Lakekeeper is upgrading Lakekeeper.

**Queries plan as though the views read the tables directly.** The planner inlines
a set-returning SQL function that is `LANGUAGE sql`, returns a set, and is not
`STRICT`, not `VOLATILE`, not `SECURITY DEFINER` and carries no `SET` clause.
Every `_name()` function meets those conditions, so a predicate on a view column
reaches the upstream index. `pgl_test.inlined()` asserts it for each view by
failing on a plan that contains a function scan over one of them.

Schema drift reports itself by name at query time: a renamed upstream column makes
the body fail to resolve, and a changed type fails against the `RETURNS TABLE`
declaration.

## What the interface covers

Catalog state, in relational form:

| Area | Views |
|---|---|
| Server and tenancy | `server`, `project`, `warehouse` |
| Naming | `namespace`, `tabular` |
| Iceberg tables | `iceberg_table`, `table_property`, `table_snapshot`, `table_ref`, `table_snapshot_log`, `table_metadata_log`, `table_partition_field`, `table_sort_field`, `table_statistics`, `partition_statistics`, `table_encryption_key` |
| Schemas | `tabular_schema`, `field` |
| Iceberg views | `iceberg_view`, `view_version`, `view_representation`, `view_property`, `view_version_log` |
| Other table formats | `generic_table`, `generic_table_property` |
| Identity | `users`, `role`, `role_assignment`, `role_membership` |
| Authorization | `grant` |
| Classification | `tag_definition`, `tag_allowed_value`, `tag` |
| Installation | `info`, `migration` |

`tabular` is the one relation covering tables, views and generic tables together,
because Lakekeeper stores all three in one table and names are unique across them
within a namespace. `iceberg_table`, `iceberg_view` and `generic_table` join it to
the per-kind detail.

Detail views are keyed by ids, not names: joining `table_property` to
`iceberg_table` on `(warehouse_id, table_id)` gives the name. Every join onto a
tabular or a namespace carries `warehouse_id`, because those ids are unique only
within a warehouse.

Key material is never read. `warehouse.storage_profile` is the profile document,
which holds bucket, endpoint and region settings, and
`warehouse.has_storage_credential` reports only whether a credential is stored.
`table_encryption_key` names the keys a table references and who wrapped them,
without the wrapped key itself.

`grant` rows are what the catalog stores. An authorizer that keeps its own grant
store enforces from there, and the allow-all authorizer records grants without
enforcing any of them.

## Derived columns

| Column | Derived from |
|---|---|
| `namespace.namespace_path` | `namespace_name` joined with dots |
| `namespace.parent_namespace_name` | `namespace_name` without its last element, null at depth 1 |
| `tabular.location` | `fs_protocol` and `fs_location` |
| `tabular.full_name` | upstream's `concat_namespace_name_tabular_name()` |
| `tabular.is_live` | `deleted_at IS NULL AND (metadata_location IS NOT NULL OR typ = 'generic-table')`, the predicate of upstream's partial index |
| `iceberg_table.current_snapshot_id` | the `main` row of `table_refs` |
| `iceberg_view.current_version_id` | `current_view_metadata_version` |
| `table_snapshot` counters | the standard keys of the snapshot `summary`, as `bigint` columns; `summary` keeps every key the writer set |
| `table_ref` retention columns | the ref's `retention` document |
| `table_partition_field`, `table_sort_field` | the stored spec documents, one row per field through a lateral join that keeps a row for an empty spec |
| `field.node_role` | the parent row's `type_kind`: a struct member is a `field`, a list member an `element`, a map's two members `key` and `value` |
| `field.type_name` | `iceberg_type_name(type_kind, type_params)`, which renders `decimal(12, 2)` and `fixed[16]` |
| `grant.resource_name` | the resource named by `resource_type` |
| `grant.tabular_type` | the joined tabular's kind, so a grant on a table, a view and a generic table are distinguishable |
| `tag.target_type` | which target id columns are set |

## JSON documents

Iceberg clients speak in documents, and the catalog assembles those documents from
the same rows the views expose. Five functions assemble them in SQL:

- `schema_json(warehouse_id, tabular_id, schema_id)` builds one Iceberg schema.
  Nested types recurse through two internal functions, `_field_members` and
  `_field_type`, which call each other.
- `table_metadata(warehouse_id, table_id)` builds the table metadata document.
  Keys that the catalog omits when empty are omitted here too. Format version 3
  adds `next-row-id` to the document and a row lineage range (`first-row-id` and
  `added-rows`) plus an optional `key-id` to each snapshot, all read from the
  columns that hold them. Two cases raise instead of returning a document that
  looks complete: a format version 1 table, whose document has a different shape,
  and a table carrying encryption keys, whose document includes wrapped key
  material that this extension does not read.
- `view_metadata(warehouse_id, view_id)` builds the view metadata document.
- `load_table(warehouse_id, namespace, name)` and
  `load_view(warehouse_id, namespace, name)` return the load response,
  `metadata-location` and `metadata`, for a table or view named the way the
  catalog API names it. They return null when no live table or view has that name.

The test suite compares these documents against responses captured from the
catalog's own REST API on the same data.

## Collation

Lakekeeper stores names under a non-deterministic ICU collation
(`case_insensitive`), which is how catalog name lookups ignore case. A
non-deterministic collation rejects `LIKE`.

The function boundary settles this: a column declared `text` in `RETURNS TABLE`
comes back under the database default collation whatever the underlying column
carries. In these views `LIKE` and `ILIKE` both work, and equality is
case-sensitive.

`load_table()` and `load_view()` resolve their arguments against the upstream
columns, so they match names the way the catalog matches them, case-insensitively
and through the unique indexes.

## Security

Every view is `security_invoker`, so reading one checks the caller's privileges on
Lakekeeper's tables. Installation grants `USAGE` on the extension schema and
`SELECT` on its views to `PUBLIC`, which gives a role exactly the catalog rows it
could already read and nothing else.

## Version pinning

The extension reads Lakekeeper's tables by name, so it is written against one
upstream schema. `_pin()` records the upstream commit, release version, migration
count and a digest over the applied migrations. Installation compares the digest
against the database and raises when they differ, naming both;
`SET pg_lakekeeper.allow_unsupported_schema = on` turns that into a warning. A
database with no `_sqlx_migrations` table, such as one mid-restore, gets a notice
and the installation proceeds.

`tools/repin.sh` regenerates `sql/005_pin.sql` by running the pinned upstream
image's migrations against an empty database and reading the result.

## Test architecture

```
tools/fixture/    docker-compose.yaml  upstream.env  populate.sh  generate.sh
test/fixture/     schema.sql  data.sql  api/*.json  UPSTREAM
test/             sql/  expected/  helper/pgl_test.sql
ci/               lint.sh  test.sh  inside.sh  load-db.sh
                  restore-test.sh  restore-inside.sh  canary.sh  check-parity.sh  all.sh
```

`tools/fixture/generate.sh` brings up the pinned upstream image against PostgreSQL
and MinIO, runs `populate.sh` to create catalog content through the REST API, and
dumps the result. The content is chosen to make every shape the views render
appear at least once: three warehouses including a deactivated and a protected
one, namespaces three deep, a table with nested struct, list and map fields and an
identifier field, a partition spec and a sort order, two snapshots with a branch
and a tag, both statistics kinds, an Iceberg view with two versions and two
dialects, a generic table, tags of all three value kinds on all six target kinds,
grants at every resource level, a soft-deleted table, a protected table, one table
per allowed format version, a format version 3 table whose snapshots carry a row
lineage range and an encryption key reference, and a table with an encryption key
registered. `populate.sh` also captures the REST responses
the document functions are compared against, with vended storage credentials
removed.

The fixture is dumped on the oldest supported major so it loads on all of them,
and committed, so the suite needs only PostgreSQL and the repository.

`ci/test.sh <major>` builds a container image from `postgres:<major>` plus the
server development package, starts it, and runs `ci/inside.sh` there, so a local
run and a CI run execute the same steps. `ci/load-db.sh` builds the test database:
fixture, extension, helpers, and the captured REST responses in `pgl_test.api`.
Setting `LAKEKEEPER_SCHEMA` moves the fixture out of `public` first, which
exercises the binding against a named schema.

Tests are `pg_regress` scripts under `test/sql`, checked against `test/expected`.
Four helpers carry the assertions: `pgl_test.ok(condition, message)` raises a
named error, which `pg_regress` records in the diff and then continues past, so
one run reports every failure; `pgl_test.inlined(query)` fails when the plan for a
query contains a function scan over one of the extension's functions;
`pgl_test.doc_eq(ours, theirs, unordered)` compares two documents key by key,
exactly, except for the named keys whose arrays the catalog serves from unordered
collections (`snapshots` and `versions`); `pgl_test.json_canonical(jsonb)` sorts
every array, for those keys.

The captured responses are the oracle twice over. The document functions are
compared against them whole, so field order inside a schema and the order of both
logs are checked exactly. Each detail view is then compared against the matching
section of the same response, because a view and a document function read the same
upstream rows through different expressions, and only one of the two would
otherwise be checked.

`test/sql/02_guard.sql` tampers inside a transaction and rolls back, so the
failure paths are exercised: a changed migration checksum, a binding that no
longer resolves, a renamed upstream column, and a changed upstream column type.

`test/sql/01_contract.sql` holds a snapshot of every column of every upstream
table, with its type, nullability and collation, plus every enum's labels. An
upstream change shows up as a diff that names it.

`ci/restore-test.sh` dumps a database holding Lakekeeper's schema, this extension
and the test helpers, restores it into an empty database with
`pg_restore --exit-on-error`, and runs the suite against the restored copy.

`ci/canary.sh` resolves upstream main's head commit, runs that build's migrations,
and compares the migration digest against the pin. `ci/check-parity.sh` requires
every workflow step to be one of these scripts.
