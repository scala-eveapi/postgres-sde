FROM postgres:latest
ADD https://www.fuzzwork.co.uk/dump/latest/postgres-20161114-TRANQUILITY.dmp.bz2 sde.bz2
# ADD postgres-20161114-TRANQUILITY.dmp.bz2 sde.bz2
RUN bunzip2 sde.bz2
COPY load-sde.sh /docker-entrypoint-initdb.d/01-load-sde.sh
COPY add-constraints.sql /docker-entrypoint-initdb.d/02-add-constraints.sql