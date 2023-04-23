#!/bin/bash
set -e

POSTGRES_MYAPP_PASSWORD="${POSTGRES_MYAPP_PASSWORD:-password}"

dt=$(date '+%d/%m/%Y %H:%M:%S');
echo "$dt - Running: psql -v ON_ERROR_STOP=1 --username $POSTGRES_USER --dbname $POSTGRES_DB ...";

customDatabaseName="dvdrental"
customUserName="dvdrental"

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
CREATE DATABASE $customDatabaseName;
CREATE USER $customUserName WITH PASSWORD '$POSTGRES_MYAPP_PASSWORD';
GRANT ALL PRIVILEGES ON DATABASE "$customDatabaseName" to $customUserName;
EOSQL

cd /tmp/
unzip dvdrental.zip
pg_restore --no-acl -d $customDatabaseName dvdrental.tar

echo "$dt - Init script is completed";
