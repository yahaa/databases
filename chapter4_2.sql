//创建数据库和删除数据库
show databases;
use 'database_name';
create database 'zihua';
drop database 'zihua';
show databases;

//创建删除数据表
create table chapter4_2(
	student_id int not null,
	name varchar(1000) not null,
	gdp int,
	alexa int,
	update_time date,
	primary key (student_id)
)default charset=utf8;

show tables;
drop table 'chapter4_2';

//向数据表中插入数据

insert chapter4_2 (student_id,name,gdp,alexa,update_time)
	values (123,"zihua",99,66666,now());

insert chapter4_2 (student_id,name,gdp,alexa,update_time)
	values (123,"gogo",70,6,now());
insert into chapter4_2 values (456,"huang",67,35,now());


//有关查询的语句

select student_id from chapter4_2 where gdd>70 and alexa>1000;

select * from chapter4_27 where gdp>70 or alexa >1000;

select * from chapter4_2 order by gdp;   //默认是  以gdp 升序排序
select * from chapter4_2 order by gdp asc;  //也是升序

select * from chapter4_2 order by gdp desc;//下降排序  



//数据库试验 2
//第一问
select student_id,name from student where brithday-2011>=20;

//第二问
select crouse_id from select_table where student_id!=(select student_id from student where name='刘晓明');

//第三问
select season ,crouse_id,crouse_time from open_crouse where work_id=(select work_id from teacher where name='马小红');
//第四问

select crouse_id,crouse_name,from crouse where crouse_id  in (select crouse_id, work_id from select_table where score_f>=60 and student_id in (select student_id from student where sex='男'));

