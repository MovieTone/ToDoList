create database todo;
use todo;
create table todo 
(
	id int primary key auto_increment not null,
    description varchar(500) not null,
    status varchar(20) not null
);