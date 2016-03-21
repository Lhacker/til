参考: [http://lets.postgresql.jp/documents/tutorial/centos/2](http://lets.postgresql.jp/documents/tutorial/centos/2)

```
user1@...% sudo apt-get install postgresql
user1@...% update-rc.d postgresql defaults
user1@...% /etc/init.d/postgresql start

# change `postgres` user
user1@...% id postgres
user1@...% sudo su postgres

postgres@...% psql -l
postgres@...% createuser user1
postgres@...% createdb mydb -U user1 # <- by default, "Peer" authentication will run and then fail

# edit /etc/postgresql/`version`/main/pg_hba.conf
postgres@...% cp /etc/postgresql/9.3/main/pg_hba.conf{,.bak}
postgres@...% vi /etc/postgresql/9.3/main/pg_hba.conf
# local   all             all                                     peer
-> local   all             all                                     trust

postgres@...% /etc/init.d/postgresql reload
postgres@...% createdb mydb -U user1

postgres@...% psql template1
template1=# alter role postgres with password '...';
template1=# alter role user1 with password '...';
template1=# ¥q

postgres@...% exit
user1@...% psql mydb
```
