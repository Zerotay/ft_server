create database Wordpress;
create user 'server'@'%' identified by '1234';
grant all privileges on *.* to 'server'@'%' with grant option;
flush privileges;