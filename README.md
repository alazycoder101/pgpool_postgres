# pgpool + PostgreSQL
## pgpool
### load balancing 

```
select "rental".* from "rental" where "rental"."rental_id"=-22 order by "rental"."rental_id" asc;
```

## PostgreSQL

### Scripts
Copy from [kubegres](https://github.com/reactive-tech/kubegres)
1. init_primary_db
2. create_replication_role
3. copy_primary_data_to_replication

### Data
[sample data](https://www.postgresqltutorial.com/postgresql-getting-started/postgresql-sample-database/)

```bash
wget https://www.postgresqltutorial.com/wp-content/uploads/2019/05/dvdrental.zip
unzip dvdrental.zip
pg_restore --no-acl -d dvdrental dvdrental.tar
```

### Run
```bash
docker compose up -d
docker compose down --volumes
```

