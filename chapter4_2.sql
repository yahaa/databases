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

//第五问
select student_id,name from student where student_id >(select student_id from student where name='张颖') and brithday > (select brithday from student where name='张颖');

//第六问

select student_id ,name from student where student_id in (select distinct student_id from select_table where student_id in (select student_id from select_table where crouse_id='8305001') and student_id in (select student_id from select_table where crouse_id='8305002'));




//实验二
select xh,xm from s where xh like '11%' and (2016-year(csrq))>20 and xb='男';

select distinct kh from c where kh not in(select kh from e,s where s.xm='刘晓明' and s.xh=e.xh);

select distinct xq,kh,sksj from o,t where t.xm='马小红' and t.gh=o.gh;

select c.kh,km ,t.xm from t,c,e,s,d where e.kh=c.kh and e.gh=t.gh and e.xh=s.xh and d.yxh=s.yxh and x.xb='男' and mc='计算机学院' and zpcj>60 and xl='教授';

select x.xh,x.xm from s x,s y,s z where x.xh=y.xh and x.xh>z.xh and y.csrq >z.csrq and z.xh in
(select xh from s where xm='张颖') and z.csrq in (select csrq from s where xm='张颖');

select distinct s.xh,s.xm from s,e x,e y where x.xh=y.xh and x.kh='08305001' and y.kh='08305002' and s.xh=x.xh; 