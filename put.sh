# This is a script to import dummy values into mysql database. There is already a sql server running as part of docker compose file and we are building a table in it.

#/bin/bash

counter=0

while [ $counter -lt 50 ]; do
  let counter=counter+1

  name=$(nl people.txt | grep -w $counter | awk '{print $2}') ## Here people.txt file is created with random names generated
  lastname=$(nl people.txt | grep -w $counter | awk '{print $3}')
  age=$(shuf -i 20-25 -n 1)  # This gives shuffled values each time

  mysql -u root -p1234 people -e "insert into register values ($counter , '$name' , '$lastname' , $age)"  ## Mysql command
  echo "$counter, $name, $lastname, $age was correctly imported"
done

# This script will be copied to the db docker container and then executed from there
_____________

MYSQL commands:

mysql -u root -p1234 --- to login into the mysql

show databases; -- to list the databases

create database people; -- to create anew database

use people; -- to switch to the new database

create table register (id int(3), name varchar(50), lastname varchar(50), age int(3)); -- to create a table

show tables; -- to show the list of tables

desc register;  -- to describe the register
+----------+-------------+------+-----+---------+-------+
| Field    | Type        | Null | Key | Default | Extra |
+----------+-------------+------+-----+---------+-------+
| id       | int(3)      | YES  |     | NULL    |       |
| name     | varchar(50) | YES  |     | NULL    |       |
| lastname | varchar(50) | YES  |     | NULL    |       |
| age      | int(3)      | YES  |     | NULL    |       |
+----------+-------------+------+-----+---------+-------+


