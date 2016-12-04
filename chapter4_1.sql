//创建数据库和删除数据库
show databases;
use 'database_name';
create database 'zihua';
drop database 'zihua';
show databases;


//创建数据表和删除数据表


create table chapter4_1(
	id 	int not null auto_increment,
	name varchar(100) not null,
	url varchar(1000) not null,
	alexa int not null,
	country varchar(100) not null,
	update_time date not null,
	primary key (id)
)default charset=utf8;



//在数据表中插入数据

insert chapter4_1 (name,url,alexa,country,update_time)
	values ("zihua","www.zihua.com",12222,"china",now());

insert chapter4_1 (name,url,alexa,country,update_time)
	values ("小明","www.xiaomin.com",122,"japan",now());


insert chapter4_1 (name,url,alexa,country,update_time)
	values ("小红","www.xiao红.com",12,"英国",now());



//在数据表中查询
select * from chapter4_1;

select distinct country from chapter4_1;   //结果为 表中去重后的国家

select name from chapter4_1 where alexa>100;  //条件查询



