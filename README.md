# pg_lakekeeper

**Run the Lakekeeper Iceberg REST Catalog natively inside PostgreSQL.**

> [!WARNING]
> **Status: design phase. There is no working code yet.**
> This repository exists to scope the project in the open and find collaborators.
> Interfaces, architecture, and scope described below are proposals, not commitments.
> If you want to shape them, now is the time — see [Getting involved](#getting-involved).

---

## What it is

`pg_lakekeeper` embeds the [Lakekeeper](https://github.com/lakekeeper/lakekeeper) Iceberg
REST Catalog into Postgres.

It is about the **catalog**: which tables exist, who may see them, what the current
metadata pointer is, who changed it, and when. It is not a query engine — it does not read
Iceberg data files, and it does not turn Postgres into an analytics database.

## Why

Lakekeeper already stores all of its state in Postgres. For a large share of deployments,
that Postgres instance is the only stateful component in the stack — and it is already
running, already backed up, already monitored, already inside the compliance boundary.

Running the catalog *as* a Postgres extension rather than *next to* Postgres buys two
things that a separate service cannot offer:

**Transactional catalog commits.** A catalog commit and the application's own SQL writes
can share a single transaction. Either both land or neither does. Today, coordinating a
metadata commit with operational state requires an outbox, a saga, or accepting that the
two can drift.

**SQL-native introspection.** Catalog state becomes queryable with `SELECT`. Auditors,
BI tools, `psql`, and existing Postgres-based governance tooling all work without a
bespoke API client. For regulated environments where the audit trail must be queryable
by people who do not write Go, this is the whole pitch.

Fewer moving parts is a real but secondary benefit — see the constraints below for why it
is smaller than it first appears.

## What this is not

- Not a replacement for the standalone Lakekeeper server. The service remains the primary
  deployment mode and will keep getting the features first.
- Not a way to run Lakekeeper on managed Postgres. See constraints.
- Not related to Lakekeeper's internal `ext_*` extension mechanism. Upstream reserves the
  `ext_*` table prefix for downstream components that store state in the catalog database;
  that is a different meaning of the word "extension" and this project is not one of them.
  We will try to keep the terminology distinct in docs.

## Proposed scope

Two phases, deliberately ordered so that something useful ships early. **Phase boundaries
are open for discussion** — if you think this is the wrong split, open an issue.

### Phase 1 — SQL-native catalog access

A pure-SQL extension over Lakekeeper's existing schema: stable views and functions for
namespaces, tables, views, warehouses, roles, and permissions.

- No Rust. No background worker. No network listener.
- Installs on any Postgres that already hosts a Lakekeeper database — **including managed
  Postgres**.
- Read-only to begin with. Write paths, if any, come later and carefully.
- Forces us to define the SQL surface we would need in Phase 2 anyway.

This is a thin layer, and that is the point: it is small enough to finish, and it is
independently useful even if Phase 2 never happens.

### Phase 2 — Embedded REST catalog

The Lakekeeper REST API served from inside the Postgres process tree, via a `pgrx`
background worker hosting the existing `axum` application.

Substantially harder, and carrying real operational risk (see below). Not started until
Phase 1 is stable and there are enough hands to maintain it.

## Constraints and open questions

These are known problems, listed honestly rather than discovered later. Several are
unresolved and would benefit from outside expertise.

**Managed Postgres cannot run Phase 2.** RDS, Cloud SQL, Azure Database, Neon, and
Supabase will not load a custom Rust extension, let alone one that opens a network
listener. The "one less service to deploy" argument therefore applies only to
self-managed Postgres — which is a real constituency, but a smaller one, and one that is
already comfortable running a container.

**Background worker blast radius.** A misbehaving BGW affects the whole cluster, not just
the catalog. Panics, runtime stalls, and connection exhaustion inside the worker have to
be contained. This needs a serious design before any code is written.

**Postgres is not an HTTP server.** Hosting a tokio runtime and an axum listener inside
the postmaster's process tree is an unusual shape. Doable, and others have done similar
things, but it will surprise Postgres DBAs and needs careful documentation.

**Coupling to upstream internals.** The extension needs access to Lakekeeper's persistence
layer, which is not a stable public API. Either we stabilize a surface for it, or we
accept living in lockstep with upstream. Open question.

**Toolchain.** Upstream Lakekeeper currently targets a recent Rust MSRV; `pgrx` has
historically lagged on new toolchain support. Compatibility needs verifying before
committing to the Phase 2 design.

**Version skew.** Extension version, upstream Lakekeeper version, and Postgres major
version form a three-dimensional support matrix. We should decide early how narrow to
keep it.

## Getting involved

This project needs people who know Postgres extension internals, `pgrx`, or the Iceberg
REST specification — and people who have operated a catalog in production and can say
which of the above tradeoffs actually matter.

- Start with the issues tagged [`good first issue`](../../labels/good%20first%20issue).
- Design discussion happens in [Discussions](../../discussions) and in the
  [Lakekeeper community channels](https://github.com/lakekeeper/lakekeeper#community).
- For anything larger than a bugfix, open an issue before a PR so we can agree on the
  approach first.

Disagreement with the scope above is useful input, not an obstacle. If you think Phase 2
is a bad idea, say so in an issue — that is a cheaper way to find out than building it.

## License and contributions

Licensed under the [Apache License, Version 2.0](LICENSE), matching upstream Lakekeeper.

Contributions require signing the same Contributor License Agreement used by upstream
Lakekeeper. Signing is handled by [CLA assistant](https://github.com/cla-assistant/cla-assistant):
when you open your first pull request, a bot will comment with a link, and you sign in the
PR itself. It takes about a minute and is a one-time step covering all Lakekeeper
repositories.

If you are contributing on behalf of an employer, make sure you have authority to do so —
some organizations require a corporate CLA instead.

## Related projects

- [Lakekeeper](https://github.com/lakekeeper/lakekeeper) — the Iceberg REST Catalog this
  extension embeds
- [Apache Iceberg](https://iceberg.apache.org/) — the table format and REST specification
- [pgrx](https://github.com/pgcentralfoundation/pgrx) — the Rust framework intended for
  Phase 2