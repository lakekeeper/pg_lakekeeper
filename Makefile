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
	sql/900_cleanup.sql

DATA_built  = $(EXTENSION)--$(EXTVERSION).sql
EXTRA_CLEAN = $(EXTENSION)--$(EXTVERSION).sql

REGRESS      = 00_meta 10_warehouse 20_tabular
REGRESS_OPTS = --inputdir=test --outputdir=test --use-existing

PG_CONFIG ?= pg_config
PGXS      := $(shell $(PG_CONFIG) --pgxs)
include $(PGXS)

$(EXTENSION)--$(EXTVERSION).sql: $(SQL_SRC)
	cat $(SQL_SRC) > $@

repin:
	tools/repin.sh

.PHONY: repin
