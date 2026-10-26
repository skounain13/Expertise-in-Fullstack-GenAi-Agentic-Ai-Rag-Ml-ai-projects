Enter password: ****
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 17
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
| sys                |
+--------------------+

mysql> select 10+20;
+-------+
| 10+20 |
+-------+
|    30 |
+-------+
1 row in set (0.00 sec)

mysql> select 10*30;
+-------+
| 10*30 |
+-------+
|   300 |
+-------+
1 row in set (0.01 sec)

mysql> select 10/5;
+--------+
| 10/5   |
+--------+
| 2.0000 |
+--------+
1 row in set (0.01 sec)

mysql> select 12%5;
+------+
| 12%5 |
+------+
|    2 |
+------+
1 row in set (0.00 sec)

mysql> create database SHOP;
Query OK, 1 row affected (0.02 sec)

mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| information_schema |
| mysql              |
| nit                |
| performance_schema |
| shop               |
| sys                |
+--------------------+
6 rows in set (0.00 sec)

mysql> use SHOP;
Database changed
mysql> create table Customers(Name varchar(30),Age int not null primary key,Address varchar(40),Salary int);
Query OK, 0 rows affected (0.06 sec)

mysql> desc Customers;
+---------+-------------+------+-----+---------+-------+
| Field   | Type        | Null | Key | Default | Extra |
+---------+-------------+------+-----+---------+-------+
| Name    | varchar(30) | YES  |     | NULL    |       |
| Age     | int         | NO   | PRI | NULL    |       |
| Address | varchar(40) | YES  |     | NULL    |       |
| Salary  | int         | YES  |     | NULL    |       |
+---------+-------------+------+-----+---------+-------+
4 rows in set (0.02 sec)

mysql> insert into Customers values('Ramesh',32,'Ahmedabad',2000.00);
Query OK, 1 row affected (0.02 sec)

mysql> select * from Customers;
+--------+-----+-----------+--------+
| Name   | Age | Address   | Salary |
+--------+-----+-----------+--------+
| Ramesh |  32 | Ahmedabad |   2000 |
+--------+-----+-----------+--------+
1 row in set (0.00 sec)

mysql> insert into Customers values('Khilan',25,'Delhi',1500),('Kaushik',23,'Kota',2000),('Chaitali',25,'Mumbai',6500),('Hardik',27,'Bhopal',8500),('Komal',22,'MP',4500),('Muffy',24,'Indore',10000);
ERROR 1062 (23000): Duplicate entry '25' for key 'customers.PRIMARY'

mysql> alter table Customers drop primary key;
Query OK, 1 row affected (0.07 sec)
Records: 1  Duplicates: 0  Warnings: 0

mysql> alter table Customers modify column Age int not null;
Query OK, 0 rows affected (0.02 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> insert into Customers values('Khilan',25,'Delhi',1500),('Kaushik',23,'Kota',2000),('Chaitali',25,'Mumbai',6500),('Hardik',27,'Bhopal',8500),('Komal',22,'MP',4500),('Muffy',24,'Indore',10000);
Query OK, 6 rows affected (0.01 sec)
Records: 6  Duplicates: 0  Warnings: 0

mysql> select * from Customers;
+----------+-----+-----------+--------+
| Name     | Age | Address   | Salary |
+----------+-----+-----------+--------+
| Ramesh   |  32 | Ahmedabad |   2000 |
| Khilan   |  25 | Delhi     |   1500 |
| Kaushik  |  23 | Kota      |   2000 |
| Chaitali |  25 | Mumbai    |   6500 |
| Hardik   |  27 | Bhopal    |   8500 |
| Komal    |  22 | MP        |   4500 |
| Muffy    |  24 | Indore    |  10000 |
+----------+-----+-----------+--------+
7 rows in set (0.00 sec)

mysql> alter table Customers modify column Salary float(10,2);
Query OK, 0 rows affected, 1 warning (0.03 sec)
Records: 0  Duplicates: 0  Warnings: 1

mysql> select * from Customers;
+----------+-----+-----------+----------+
| Name     | Age | Address   | Salary   |
+----------+-----+-----------+----------+
| Ramesh   |  32 | Ahmedabad |  2000.00 |
| Khilan   |  25 | Delhi     |  1500.00 |
| Kaushik  |  23 | Kota      |  2000.00 |
| Chaitali |  25 | Mumbai    |  6500.00 |
| Hardik   |  27 | Bhopal    |  8500.00 |
| Komal    |  22 | MP        |  4500.00 |
| Muffy    |  24 | Indore    | 10000.00 |
+----------+-----+-----------+----------+
7 rows in set (0.00 sec)

mysql> select name,salary from customers;
+----------+----------+
| name     | salary   |
+----------+----------+
| Ramesh   |  2000.00 |
| Khilan   |  1500.00 |
| Kaushik  |  2000.00 |
| Chaitali |  6500.00 |
| Hardik   |  8500.00 |
| Komal    |  4500.00 |
| Muffy    | 10000.00 |
+----------+----------+
7 rows in set (0.00 sec)

mysql> select name,salary from customers where salary>2000;
+----------+----------+
| name     | salary   |
+----------+----------+
| Chaitali |  6500.00 |
| Hardik   |  8500.00 |
| Komal    |  4500.00 |
| Muffy    | 10000.00 |
+----------+----------+
4 rows in set (0.00 sec)

mysql> select * from customers where Salary>5000;
+----------+-----+---------+----------+
| Name     | Age | Address | Salary   |
+----------+-----+---------+----------+
| Chaitali |  25 | Mumbai  |  6500.00 |
| Hardik   |  27 | Bhopal  |  8500.00 |
| Muffy    |  24 | Indore  | 10000.00 |
+----------+-----+---------+----------+
3 rows in set (0.00 sec)

mysql> select * from customers where Salary=2000;
+---------+-----+-----------+---------+
| Name    | Age | Address   | Salary  |
+---------+-----+-----------+---------+
| Ramesh  |  32 | Ahmedabad | 2000.00 |
| Kaushik |  23 | Kota      | 2000.00 |
+---------+-----+-----------+---------+
2 rows in set (0.00 sec)

mysql> select * from customers where Salary!=2000;
+----------+-----+---------+----------+
| Name     | Age | Address | Salary   |
+----------+-----+---------+----------+
| Khilan   |  25 | Delhi   |  1500.00 |
| Chaitali |  25 | Mumbai  |  6500.00 |
| Hardik   |  27 | Bhopal  |  8500.00 |
| Komal    |  22 | MP      |  4500.00 |
| Muffy    |  24 | Indore  | 10000.00 |
+----------+-----+---------+----------+
5 rows in set (0.00 sec)

mysql> select * from customers where Salary<>2000;
+----------+-----+---------+----------+
| Name     | Age | Address | Salary   |
+----------+-----+---------+----------+
| Khilan   |  25 | Delhi   |  1500.00 |
| Chaitali |  25 | Mumbai  |  6500.00 |
| Hardik   |  27 | Bhopal  |  8500.00 |
| Komal    |  22 | MP      |  4500.00 |
| Muffy    |  24 | Indore  | 10000.00 |
+----------+-----+---------+----------+
5 rows in set (0.00 sec)

mysql> select * from customers where Salary=6500;
+----------+-----+---------+---------+
| Name     | Age | Address | Salary  |
+----------+-----+---------+---------+
| Chaitali |  25 | Mumbai  | 6500.00 |
+----------+-----+---------+---------+
1 row in set (0.00 sec)

mysql> select * from customers where Salary>=6500;
+----------+-----+---------+----------+
| Name     | Age | Address | Salary   |
+----------+-----+---------+----------+
| Chaitali |  25 | Mumbai  |  6500.00 |
| Hardik   |  27 | Bhopal  |  8500.00 |
| Muffy    |  24 | Indore  | 10000.00 |
+----------+-----+---------+----------+
3 rows in set (0.00 sec)

mysql> select * from customers;
+----------+-----+-----------+----------+
| Name     | Age | Address   | Salary   |
+----------+-----+-----------+----------+
| Ramesh   |  32 | Ahmedabad |  2000.00 |
| Khilan   |  25 | Delhi     |  1500.00 |
| Kaushik  |  23 | Kota      |  2000.00 |
| Chaitali |  25 | Mumbai    |  6500.00 |
| Hardik   |  27 | Bhopal    |  8500.00 |
| Komal    |  22 | MP        |  4500.00 |
| Muffy    |  24 | Indore    | 10000.00 |
+----------+-----+-----------+----------+
7 rows in set (0.00 sec)

mysql> select * from customers where age>=25 and salary>=6500;
+----------+-----+---------+---------+
| Name     | Age | Address | Salary  |
+----------+-----+---------+---------+
| Chaitali |  25 | Mumbai  | 6500.00 |
| Hardik   |  27 | Bhopal  | 8500.00 |
+----------+-----+---------+---------+
2 rows in set (0.00 sec)

mysql> select * from customers where age>=25 or salary>=6500;
+----------+-----+-----------+----------+
| Name     | Age | Address   | Salary   |
+----------+-----+-----------+----------+
| Ramesh   |  32 | Ahmedabad |  2000.00 |
| Khilan   |  25 | Delhi     |  1500.00 |
| Chaitali |  25 | Mumbai    |  6500.00 |
| Hardik   |  27 | Bhopal    |  8500.00 |
| Muffy    |  24 | Indore    | 10000.00 |
+----------+-----+-----------+----------+
5 rows in set (0.00 sec)

mysql> select * from customers where age is not null;
+----------+-----+-----------+----------+
| Name     | Age | Address   | Salary   |
+----------+-----+-----------+----------+
| Ramesh   |  32 | Ahmedabad |  2000.00 |
| Khilan   |  25 | Delhi     |  1500.00 |
| Kaushik  |  23 | Kota      |  2000.00 |
| Chaitali |  25 | Mumbai    |  6500.00 |
| Hardik   |  27 | Bhopal    |  8500.00 |
| Komal    |  22 | MP        |  4500.00 |
| Muffy    |  24 | Indore    | 10000.00 |
+----------+-----+-----------+----------+
7 rows in set (0.00 sec)

mysql> select * from customers where name like 'ko%';
+-------+-----+---------+---------+
| Name  | Age | Address | Salary  |
+-------+-----+---------+---------+
| Komal |  22 | MP      | 4500.00 |
+-------+-----+---------+---------+
1 row in set (0.00 sec)

mysql> select * from customers where age in (25,27);
+----------+-----+---------+---------+
| Name     | Age | Address | Salary  |
+----------+-----+---------+---------+
| Khilan   |  25 | Delhi   | 1500.00 |
| Chaitali |  25 | Mumbai  | 6500.00 |
| Hardik   |  27 | Bhopal  | 8500.00 |
+----------+-----+---------+---------+
3 rows in set (0.00 sec)

mysql> select * from customers where age between 25 and 27;
+----------+-----+---------+---------+
| Name     | Age | Address | Salary  |
+----------+-----+---------+---------+
| Khilan   |  25 | Delhi   | 1500.00 |
| Chaitali |  25 | Mumbai  | 6500.00 |
| Hardik   |  27 | Bhopal  | 8500.00 |
+----------+-----+---------+---------+
3 rows in set (0.00 sec)

mysql> select age from customers where exists(select age from customers where salary>6500);
+-----+
| age |
+-----+
|  32 |
|  25 |
|  23 |
|  25 |
|  27 |
|  22 |
|  24 |
+-----+
7 rows in set (0.00 sec)

mysql> select * from customers where age>all(select age from customers where salary>6500);
+--------+-----+-----------+---------+
| Name   | Age | Address   | Salary  |
+--------+-----+-----------+---------+
| Ramesh |  32 | Ahmedabad | 2000.00 |
+--------+-----+-----------+---------+
1 row in set (0.01 sec)

mysql> select * from customers where age>any(select age from customers where salary>6500);
+----------+-----+-----------+---------+
| Name     | Age | Address   | Salary  |
+----------+-----+-----------+---------+
| Ramesh   |  32 | Ahmedabad | 2000.00 |
| Khilan   |  25 | Delhi     | 1500.00 |
| Chaitali |  25 | Mumbai    | 6500.00 |
| Hardik   |  27 | Bhopal    | 8500.00 |
+----------+-----+-----------+---------+
4 rows in set (0.00 sec)

mysql> select * from customers;
+----------+-----+-----------+----------+
| Name     | Age | Address   | Salary   |
+----------+-----+-----------+----------+
| Ramesh   |  32 | Ahmedabad |  2000.00 |
| Khilan   |  25 | Delhi     |  1500.00 |
| Kaushik  |  23 | Kota      |  2000.00 |
| Chaitali |  25 | Mumbai    |  6500.00 |
| Hardik   |  27 | Bhopal    |  8500.00 |
| Komal    |  22 | MP        |  4500.00 |
| Muffy    |  24 | Indore    | 10000.00 |
+----------+-----+-----------+----------+
7 rows in set (0.00 sec)

mysql> select * from customers where salary=10000;
+-------+-----+---------+----------+
| Name  | Age | Address | Salary   |
+-------+-----+---------+----------+
| Muffy |  24 | Indore  | 10000.00 |
+-------+-----+---------+----------+
1 row in set (0.00 sec)

mysql> select (15+6) as addition;
+----------+
| addition |
+----------+
|       21 |
+----------+
1 row in set (0.00 sec)

mysql> select count(*) as 'RECORDS' from customers;
+---------+
| RECORDS |
+---------+
|       7 |
+---------+
1 row in set (0.02 sec)

mysql> select current_timestamp;
+---------------------+
| current_timestamp   |
+---------------------+
| 2026-09-10 22:56:34 |
+---------------------+
1 row in set (0.00 sec)

mysql> select current_date;
+--------------+
| current_date |
+--------------+
| 2026-09-10   |
+--------------+
1 row in set (0.01 sec)

mysql> alter table customers add id int;
Query OK, 0 rows affected (0.06 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> select * from customers;
+----------+-----+-----------+----------+------+
| Name     | Age | Address   | Salary   | id   |
+----------+-----+-----------+----------+------+
| Ramesh   |  32 | Ahmedabad |  2000.00 | NULL |
| Khilan   |  25 | Delhi     |  1500.00 | NULL |
| Kaushik  |  23 | Kota      |  2000.00 | NULL |
| Chaitali |  25 | Mumbai    |  6500.00 | NULL |
| Hardik   |  27 | Bhopal    |  8500.00 | NULL |
| Komal    |  22 | MP        |  4500.00 | NULL |
| Muffy    |  24 | Indore    | 10000.00 | NULL |
+----------+-----+-----------+----------+------+
7 rows in set (0.00 sec)

mysql> update customers set id=1 where salary=2000.00 limit 1;
Query OK, 1 row affected (0.01 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> select * from customers;
+----------+-----+-----------+----------+------+
| Name     | Age | Address   | Salary   | id   |
+----------+-----+-----------+----------+------+
| Ramesh   |  32 | Ahmedabad |  2000.00 |    1 |
| Khilan   |  25 | Delhi     |  1500.00 | NULL |
| Kaushik  |  23 | Kota      |  2000.00 | NULL |
| Chaitali |  25 | Mumbai    |  6500.00 | NULL |
| Hardik   |  27 | Bhopal    |  8500.00 | NULL |
| Komal    |  22 | MP        |  4500.00 | NULL |
| Muffy    |  24 | Indore    | 10000.00 | NULL |
+----------+-----+-----------+----------+------+
7 rows in set (0.00 sec)

mysql> update customers set id=2 where salary=1500.00;
Query OK, 1 row affected (0.01 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> update customers set id=3 where salary=2000.00 and id is null;
Query OK, 1 row affected (0.01 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> select * from customers;
+----------+-----+-----------+----------+------+
| Name     | Age | Address   | Salary   | id   |
+----------+-----+-----------+----------+------+
| Ramesh   |  32 | Ahmedabad |  2000.00 |    1 |
| Khilan   |  25 | Delhi     |  1500.00 |    2 |
| Kaushik  |  23 | Kota      |  2000.00 |    3 |
| Chaitali |  25 | Mumbai    |  6500.00 | NULL |
| Hardik   |  27 | Bhopal    |  8500.00 | NULL |
| Komal    |  22 | MP        |  4500.00 | NULL |
| Muffy    |  24 | Indore    | 10000.00 | NULL |
+----------+-----+-----------+----------+------+
7 rows in set (0.00 sec)

mysql> update customers set id=4 where salary=6500.00;
Query OK, 1 row affected (0.01 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> update customers set id=5 where salary=8500.00;
Query OK, 1 row affected (0.01 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> update customers set id=6 where salary=4500.00;
Query OK, 1 row affected (0.01 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> update customers set id=7 where salary=10000.00;
Query OK, 1 row affected (0.01 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> select * from customers;
+----------+-----+-----------+----------+------+
| Name     | Age | Address   | Salary   | id   |
+----------+-----+-----------+----------+------+
| Ramesh   |  32 | Ahmedabad |  2000.00 |    1 |
| Khilan   |  25 | Delhi     |  1500.00 |    2 |
| Kaushik  |  23 | Kota      |  2000.00 |    3 |
| Chaitali |  25 | Mumbai    |  6500.00 |    4 |
| Hardik   |  27 | Bhopal    |  8500.00 |    5 |
| Komal    |  22 | MP        |  4500.00 |    6 |
| Muffy    |  24 | Indore    | 10000.00 |    7 |
+----------+-----+-----------+----------+------+
7 rows in set (0.00 sec)

mysql> select id,name,salary from customers where salary>2000;
+------+----------+----------+
| id   | name     | salary   |
+------+----------+----------+
|    4 | Chaitali |  6500.00 |
|    5 | Hardik   |  8500.00 |
|    6 | Komal    |  4500.00 |
|    7 | Muffy    | 10000.00 |
+------+----------+----------+
4 rows in set (0.01 sec)

mysql> select id,name,salary from customers where name='Hardik';
+------+--------+---------+
| id   | name   | salary  |
+------+--------+---------+
|    5 | Hardik | 8500.00 |
+------+--------+---------+
1 row in set (0.01 sec)

mysql> select id,name,salary from customers where salary>2000 and age<25;
+------+-------+----------+
| id   | name  | salary   |
+------+-------+----------+
|    6 | Komal |  4500.00 |
|    7 | Muffy | 10000.00 |
+------+-------+----------+
2 rows in set (0.00 sec)

mysql> select id,name,salary from customers where salary>2000 or age<25;
+------+----------+----------+
| id   | name     | salary   |
+------+----------+----------+
|    3 | Kaushik  |  2000.00 |
|    4 | Chaitali |  6500.00 |
|    5 | Hardik   |  8500.00 |
|    6 | Komal    |  4500.00 |
|    7 | Muffy    | 10000.00 |
+------+----------+----------+
5 rows in set (0.00 sec)

mysql> select * from customers;
+----------+-----+-----------+----------+------+
| Name     | Age | Address   | Salary   | id   |
+----------+-----+-----------+----------+------+
| Ramesh   |  32 | Ahmedabad |  2000.00 |    1 |
| Khilan   |  25 | Delhi     |  1500.00 |    2 |
| Kaushik  |  23 | Kota      |  2000.00 |    3 |
| Chaitali |  25 | Mumbai    |  6500.00 |    4 |
| Hardik   |  27 | Bhopal    |  8500.00 |    5 |
| Komal    |  22 | MP        |  4500.00 |    6 |
| Muffy    |  24 | Indore    | 10000.00 |    7 |
+----------+-----+-----------+----------+------+
7 rows in set (0.00 sec)

mysql> update customers set address='Pune' where id=6;
Query OK, 1 row affected (0.01 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> select *from customers;
+----------+-----+-----------+----------+------+
| Name     | Age | Address   | Salary   | id   |
+----------+-----+-----------+----------+------+
| Ramesh   |  32 | Ahmedabad |  2000.00 |    1 |
| Khilan   |  25 | Delhi     |  1500.00 |    2 |
| Kaushik  |  23 | Kota      |  2000.00 |    3 |
| Chaitali |  25 | Mumbai    |  6500.00 |    4 |
| Hardik   |  27 | Bhopal    |  8500.00 |    5 |
| Komal    |  22 | Pune      |  4500.00 |    6 |
| Muffy    |  24 | Indore    | 10000.00 |    7 |
+----------+-----+-----------+----------+------+
7 rows in set (0.00 sec)

mysql> update customers set address='Hyd' where id=7;
Query OK, 1 row affected (0.01 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> select * from customers;
+----------+-----+-----------+----------+------+
| Name     | Age | Address   | Salary   | id   |
+----------+-----+-----------+----------+------+
| Ramesh   |  32 | Ahmedabad |  2000.00 |    1 |
| Khilan   |  25 | Delhi     |  1500.00 |    2 |
| Kaushik  |  23 | Kota      |  2000.00 |    3 |
| Chaitali |  25 | Mumbai    |  6500.00 |    4 |
| Hardik   |  27 | Bhopal    |  8500.00 |    5 |
| Komal    |  22 | Pune      |  4500.00 |    6 |
| Muffy    |  24 | Hyd       | 10000.00 |    7 |
+----------+-----+-----------+----------+------+
7 rows in set (0.00 sec)

mysql> delete from customers where id=6;
Query OK, 1 row affected (0.01 sec)

mysql> select*from customers;
+----------+-----+-----------+----------+------+
| Name     | Age | Address   | Salary   | id   |
+----------+-----+-----------+----------+------+
| Ramesh   |  32 | Ahmedabad |  2000.00 |    1 |
| Khilan   |  25 | Delhi     |  1500.00 |    2 |
| Kaushik  |  23 | Kota      |  2000.00 |    3 |
| Chaitali |  25 | Mumbai    |  6500.00 |    4 |
| Hardik   |  27 | Bhopal    |  8500.00 |    5 |
| Muffy    |  24 | Hyd       | 10000.00 |    7 |
+----------+-----+-----------+----------+------+
6 rows in set (0.00 sec)

mysql> create database testdb;
Query OK, 1 row affected (0.01 sec)

mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| information_schema |
| mysql              |
| nit                |
| performance_schema |
| shop               |
| sys                |
| testdb             |
+--------------------+
7 rows in set (0.00 sec)

mysql> drop database testdb;
Query OK, 0 rows affected (0.03 sec)

mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| information_schema |
| mysql              |
| nit                |
| performance_schema |
| shop               |
| sys                |
+--------------------+
6 rows in set (0.00 sec)
