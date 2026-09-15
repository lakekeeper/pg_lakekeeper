EXTENSION  = pg_lakekeeper
EXTVERSION = 0.1

# Ordered: the binding and the pin must install before anything that uses them.
SQL_SRC = \
	sql/000_header.sql \
	sql/005_pin.sql \
	sql/010_bind.sql \
	sql/020_meta.sql \
	sql/100_warehouse.sql \
	sql/110_namespace.sql \
	sql/120_tabular.sql \
	sql/130_table.sql \
	sql/140_schema.sql \
	sql/150_view.sql \
	sql/160_generic_table.sql \
	sql/170_identity.sql \
	sql/180_grant.sql \
	sql/190_tag.sql \
	sql/200_fn_schema.sql \
	sql/210_fn_table.sql \
	sql/220_fn_view.sql \
	sql/900_cleanup.sql

DATA_built  = $(EXTENSION)--$(EXTVERSION).sql
STANDALONE  = $(EXTENSION)-standalone.sql
EXTRA_CLEAN = $(EXTENSION)--$(EXTVERSION).sql $(STANDALONE)

REGRESS      = 00_meta 01_contract 10_warehouse 20_tabular 30_table 40_schema 50_view 60_generic_table 70_identity 80_grant 90_tag A0_schema_json B0_table_metadata C0_view_metadata D0_privileges
REGRESS_OPTS = --inputdir=test --outputdir=test --use-existing

PG_CONFIG ?= pg_config
PGXS      := $(shell $(PG_CONFIG) --pgxs)
include $(PGXS)

$(EXTENSION)--$(EXTVERSION).sql: $(SQL_SRC)
	cat $(SQL_SRC) > $@

# A single script for a server where an extension cannot be installed.
standalone: $(STANDALONE)

$(STANDALONE): $(EXTENSION)--$(EXTVERSION).sql
	{ \
	  echo 'BEGIN;'; \
	  echo 'CREATE SCHEMA IF NOT EXISTS lakekeeper;'; \
	  echo 'SET LOCAL check_function_bodies = off;'; \
	  sed -e '/^\\echo/d' -e 's/@extschema@/lakekeeper/g' $<; \
	  echo 'COMMIT;'; \
	} > $@

repin:
	tools/repin.sh

.PHONY: repin standalone
