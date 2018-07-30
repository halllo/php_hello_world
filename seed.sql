create database test;
use test;
create table posts(id INT AUTO_INCREMENT, text VARCHAR(250) NOT NULL, primary key (id));
insert into posts(text) values('Hello World');
insert into posts(text) values('Hello Manuel');
select * from posts;