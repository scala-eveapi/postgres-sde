alter table "mapSolarSystems"
alter column "solarSystemName" set not null;

alter table "invTypes"
alter column "typeName" set not null;

alter table "staStations"
alter column "stationName" set not null;

alter table "staStations"
alter column "solarSystemID" set not null;
