Enter password: ****
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 36
Server version: 8.0.46 MySQL Community Server - GPL

Copyright (c) 2000, 2026, Oracle and/or its affiliates.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| information_schema |
| mysql              |
| nit                |
| performance_schema |
| pythondb           |
| shop               |
| sys                |
+--------------------+
7 rows in set (0.03 sec)

mysql> create database webgui;
Query OK, 1 row affected (0.06 sec)

mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| information_schema |
| mysql              |
| nit                |
| performance_schema |
| pythondb           |
| shop               |
| sys                |
| webgui             |
+--------------------+
8 rows in set (0.00 sec)

mysql> use webgui;
Database changed

mysql> create table registration(
    -> id int AUTO_INCREMENT PRIMARY KEY,
    -> name VARCHAR(100) not null,
    -> course VARCHAR(100) NOT NULL,
    -> fee DECIMAL(10,2) NOT NULL
    -> );
Query OK, 0 rows affected (0.04 sec)

mysql> desc registration;
+--------+---------------+------+-----+---------+----------------+
| Field  | Type          | Null | Key | Default | Extra          |
+--------+---------------+------+-----+---------+----------------+
| id     | int           | NO   | PRI | NULL    | auto_increment |
| name   | varchar(100)  | NO   |     | NULL    |                |
| course | varchar(100)  | NO   |     | NULL    |                |
| fee    | decimal(10,2) | NO   |     | NULL    |                |
+--------+---------------+------+-----+---------+----------------+
4 rows in set (0.01 sec)

mysql> select *from registration;
+----+---------+--------+----------+
| id | name    | course | fee      |
+----+---------+--------+----------+
|  1 | sumayya | python | 30000.00 |
+----+---------+--------+----------+
1 row in set (0.01 sec)

mysql> select *from registration;
+----+---------+--------+-----------+
| id | name    | course | fee       |
+----+---------+--------+-----------+
|  1 | sumayya | python |  30000.00 |
|  2 | kounain | sql    | 250000.00 |
+----+---------+--------+-----------+
2 rows in set (0.02 sec)