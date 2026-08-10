# pg_lakekeeper

**Run the Lakekeeper Iceberg REST Catalog natively inside PostgreSQL.**

> [!WARNING]
> **Status: design phase. There is no working code yet.**
> This repository exists to scope the project in the open and find collaborators.
> Interfaces, architecture, and scope described below are proposals, not commitments.
> If you want to shape them, now is the time: see [Getting involved](#getting-involved).

---

## What it is

`pg_lakekeeper` embeds the [Lakekeeper](https://github.com/lakekeeper/lakekeeper) Iceberg
REST Catalog into Postgres.

It is about the **catalog**: which tables exist, who may see them, what the current
metadata pointer is, who changed it, and when. It is not a query engine: it does not read
Iceberg data files, and it does not turn Postgres into an analytics database.

## Why

Lakekeeper's catalog is already a Postgres database: the rows are the source of truth,
reads are served from them, and the standalone service is a REST layer in front. For a
large share of deployments that instance is the only stateful component in the stack,
already running, already backed up, already monitored, already inside the compliance
boundary.

Running the catalog *as* a Postgres extension rather than *next to* Postgres buys three
things that a separate service cannot offer. The phase in which each one lands is marked:

**SQL-native introspection** (Phase 1). Catalog state becomes queryable with `SELECT`.
Auditors, BI tools, `psql`, and existing Postgres-based governance tooling all work
without a bespoke API client.

**Transactional catalog commits** (Phase 2). A catalog commit and the application's own
SQL writes can share a single transaction. Either both land or neither does. Today,
coordinating a metadata commit with operational state requires an outbox, a saga, or
accepting that the two can drift. This is a property of the SQL write path: commits
arriving over the REST API behave as they do with a standalone Lakekeeper.

**Fewer moving parts** (Phase 2). Once the catalog is embedded, there is no separate
service to deploy, monitor, or upgrade.

## What this is not

- Not a replacement for the standalone Lakekeeper server. The service remains the primary
  deployment mode and will keep getting features first.
- Not related to Lakekeeper's internal `ext_*` extension mechanism. Upstream reserves the
  `ext_*` table prefix for downstream components that store state in the catalog database;
  that is a different meaning of the word "extension" and this project is not one of them.
  We will keep the terminology distinct in docs.

## Proposed scope

Three phases, ordered so that something useful ships early. **Phase boundaries are open
for discussion**: if you think this is the wrong split, open an issue.

### Phase 1: Read-only SQL catalog access

A pure-SQL extension installed into the database that a standalone Lakekeeper service
already uses. The service keeps running unchanged and continues to handle all writes and
all REST traffic; the extension adds read-only views and functions over Lakekeeper's
existing schema, mirroring the catalog API's read endpoints: namespaces, tables, views,
warehouses, roles, and permissions, all queryable with `SELECT`.

- No Rust. No background worker. No network listener.
- Installs on any Postgres that already hosts a Lakekeeper database, including managed
  Postgres.
- Write paths are out of scope: writes keep going through the standalone service until
  Phase 2, and a pure-SQL write path could race the running service's own writes.
- Forces us to define the SQL interface Phase 2 needs anyway.

This is a thin layer, and that is the point: it is small enough to finish and useful on
its own.

### Phase 2: Embedded Lakekeeper

Lakekeeper itself compiled into the extension with
[pgrx](https://github.com/pgcentralfoundation/pgrx). Reads and writes become SQL
functions, with Lakekeeper's persistence layer reaching the catalog tables through SPI
instead of a network connection. SPI executes inside the calling transaction, so a
catalog commit invoked as a SQL function shares the caller's transaction; this is where
the transactional-commits benefit lands. The functions cover DDL (namespaces, tables)
and commits, and each takes the same payload as its REST counterpart, so a client can
switch one call-site at a time from REST to SQL. The commit logic itself is upstream's
Rust, reused, not rewritten in SQL. The REST API is served from a background worker, so
Spark, Trino, PyIceberg, and the rest of the Iceberg ecosystem connect exactly as they
would to a standalone Lakekeeper.

This is the phase where the separate service stops being necessary: a fully functional
Lakekeeper running inside Postgres. Substantially harder than Phase 1, and carrying real
operational risk (see the constraints below). Not started until Phase 1 is stable and
there are enough hands to maintain it.

### Phase 3: Beyond core Lakekeeper

Capabilities that only make sense with the catalog inside the database, and that are not
part of core Lakekeeper yet. For example:

- Queued commits: order and apply competing metadata commits server-side instead of
  failing them back to clients for retry.
- Multi-node commit ordering for active-active Postgres setups, using a bakery-style
  ticketing algorithm; any node accepts commits, no node is the catalog primary.
- Catalog reads and commit conflict detection built on Postgres MVCC rather than
  optimistic retries at the API layer: one REPEATABLE READ transaction sees the whole
  catalog at a single point in time, and a multi-table commit is N pointer updates in
  one transaction.

Whatever proves generally useful here is a candidate to contribute upstream.

## Constraints and open questions

Known problems, several unresolved. Outside expertise on any of them is welcome.

**Managed Postgres stops at Phase 1.** Phase 1 is pure SQL and installs anywhere. Phases
2 and 3 need a Postgres that can load a custom Rust extension, which today means
self-managed.

**Background worker containment.** A misbehaving background worker affects the whole
cluster, not just the catalog. Panics, runtime stalls, and connection exhaustion inside
the worker must be contained. This needs a serious design before any code is written.

**Postgres is not an HTTP server.** Hosting a tokio runtime and an axum listener inside
the postmaster's process tree is an unusual shape. Doable, and others have done similar
things, but it will surprise Postgres DBAs and needs careful documentation.

**Lockstep with upstream.** The extension builds against Lakekeeper's persistence layer,
which is not a stable public API, so we track upstream releases in lockstep. Two rules
keep that cheap: the views are the stable interface, versioned with upstream's
migrations, and embedded code plugs into upstream's extension points rather than editing
its files, so upstream merges stay conflict-free.

**Toolchain.** Upstream Lakekeeper targets a recent Rust MSRV; `pgrx` has historically
lagged on new toolchain support. Compatibility needs verifying before committing to the
Phase 2 design.

**Version skew.** Extension version, upstream Lakekeeper version, and Postgres major
version form a three-dimensional support matrix. We should decide early how narrow to
keep it.

## Getting involved

This project needs people who know Postgres extension internals, `pgrx`, or the Iceberg
REST specification, and people who have operated a catalog in production and can say
which of the above tradeoffs actually matter.

- Start with the issues tagged [`good first issue`](../../labels/good%20first%20issue).
- Design discussion happens in [Discussions](../../discussions) and in the
  [Lakekeeper community channels](https://github.com/lakekeeper/lakekeeper#community).
- For anything larger than a bugfix, open an issue before a PR so we can agree on the
  approach first.

Disagreement with the scope above is useful input, not an obstacle. If you think Phase 2
is a bad idea, say so in an issue; that is a cheaper way to find out than building it.

## License and contributions

Licensed under the [Apache License, Version 2.0](LICENSE), matching upstream Lakekeeper.

Contributions require signing the same Contributor License Agreement used by upstream
Lakekeeper. Signing is handled by [CLA assistant](https://github.com/cla-assistant/cla-assistant):
when you open your first pull request, a bot will comment with a link, and you sign in the
PR itself. It takes about a minute and is a one-time step covering all Lakekeeper
repositories.

If you are contributing on behalf of an employer, make sure you have authority to do so;
some organizations require a corporate CLA instead.

## Related projects

- [Lakekeeper](https://github.com/lakekeeper/lakekeeper) — the Iceberg REST Catalog this
  extension embeds
- [Apache Iceberg](https://iceberg.apache.org/) — the table format and REST specification
- [pgrx](https://github.com/pgcentralfoundation/pgrx) — the Rust framework intended for
  Phase 2
