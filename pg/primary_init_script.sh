#!/bin/bash
set -e

dt=$(date '+%d/%m/%Y %H:%M:%S');
echo "$dt - Running init script the 1st time Primary Kubegres container is created...";

customDatabaseName="mydb"
customUserName="mydbuser"

echo "$dt - Running: psql -v ON_ERROR_STOP=1 --username $POSTGRES_USER --dbname $POSTGRES_DB ...";

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
CREATE DATABASE $customDatabaseName;
CREATE USER $customUserName WITH PASSWORD '$POSTGRES_MYAPP_PASSWORD';
\connect $customDatabaseName;
CREATE TABLE account(user_id serial PRIMARY KEY, username VARCHAR (50) NOT NULL);
INSERT INTO account VALUES (1, 'username1');
INSERT INTO account VALUES (2, 'username2');
GRANT ALL PRIVILEGES ON DATABASE "$customDatabaseName" to $customUserName;
GRANT ALL ON "account" to $customUserName;
EOSQL

echo "$dt - Init script is completed";
