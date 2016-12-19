```sh
$ pip install --upgrade pip
$ pip install django
$ pip install mysqlclient
```

see [https://docs.djangoproject.com/ja/1.9/intro/tutorial01/](https://docs.djangoproject.com/ja/1.9/intro/tutorial01/)

create mysql user
```sql
$ mysql -u root -p

> create user 'django'@'localhost' identified by 'XXXXX';
> select User, Host from mysql.user;
```

create database && grant
```sql
> create database polls character set utf8;
> grant all on polls.* to 'django'@'localhost';
> grant all on test_polls.* to 'django'@'localhost';
> \q
```

```sql
$ mysql -u django -p

> show databases;
```

