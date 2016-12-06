FROM postgres:latest
ADD https://www.fuzzwork.co.uk/dump/postgres-latest.dmp.bz2 postgres-latest.dmp.bz2
RUN bunzip2 postgres-latest.dmp.bz2
COPY load-sde.sh /docker-entrypoint-initdb.d/01-load-sde.sh
COPY add-constraints.sql /docker-entrypoint-initdb.d/02-add-constraints.sql