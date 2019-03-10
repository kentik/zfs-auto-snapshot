#!/bin/sh


for mysql_dataset in `zfs list | grep -v docker/ | grep -i mysql | cut -f1 -d' '`; 
do
  echo "$0: Enabling auto-snapshot for MySQL '$mysql_dataset'" 
  zfs set com.sun:auto-snapshot=true $mysql_dataset
  echo "$0: Enabling hourly auto-snapshot for MySQL '$mysql_dataset'" 
  zfs set com.sun:auto-snapshot:hourly=true $mysql_dataset
  echo "$0: Enabling daily auto-snapshot for MySQL '$mysql_dataset'"
  zfs set com.sun:auto-snapshot:daily=true $mysql_dataset
done

for postgres_dataset in `zfs list | grep -v docker/ | grep -i postgres | cut -f1 -d' '`; 
do
  echo "$0: Enabling auto-snapshot for Postgres '$postgres_dataset'" 
  zfs set com.sun:auto-snapshot=true $postgres_dataset
  echo "$0: Enabling hourly auto-snapshot for Postgres '$postgres_dataset'" 
  zfs set com.sun:auto-snapshot:hourly=true $postgres_dataset
  echo "$0: Enabling daily auto-snapshot for Postgres '$postgres_dataset'"
  zfs set com.sun:auto-snapshot:daily=true $postgres_dataset
done



