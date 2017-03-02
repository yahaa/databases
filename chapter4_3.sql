
create database school;
use school;

create table institue(
	institue_id varchar(10) not null,
	institue_name varchar(100),
	location varchar(100),
	phone varchar(11),
	primary key (institue_id)
)default charset=utf8;

create table student(
	student_id varchar(15) not null,
	name varchar(10),
	sex varchar(4),
	brithday date,
	home varchar(100),
	cellphone varchar(11),
	institue_id varchar(100),
	primary key (student_id),
	foreign key (institue_id) references institue(institue_id)
)default charset=utf8;

create table teacher(
	work_id varchar(100) not null,
	name varchar(10),
	sex varchar(4),
	brithday date,
	degree varchar(100),
	salary float,
	institue_id varchar(100),
	primary key (work_id),
	foreign key (institue_id) references institue(institue_id)
)default charset=utf8;


create table crouse(
	crouse_id varchar(100) not null,
	crouse_name varchar(10),
	credit int,
	hour int,
	institue_id varchar(100),
	primary key (crouse_id)
)default charset=utf8;

create table open_crouse(
	season varchar(100) not null,
	crouse_id varchar(100) not null,
	work_id varchar(100) not null,
	crouse_time varchar(100),
	primary key (season,crouse_id,work_id),
	foreign key (crouse_id) references crouse(crouse_id),
	foreign key (work_id) references teacher(work_id) 
)default charset=utf8;

create table select_table(
	student_id varchar(15) not null,
	season varchar(100),
	crouse_id varchar(100),
	work_id varchar(10),
	score_p int,
	score_k int,
	score_f int,
	primary key (student_id,season,crouse_id,work_id),
	foreign key (student_id) references student(student_id),
	foreign key (crouse_id) references crouse(crouse_id),
	foreign key (work_id) references teacher(work_id)
)default charset=utf8;


//


//
alter table student add index index1(institue_id asc,name desc);

alter table crouse add index2(crouse_name);


//第三次实验
第一问
先用Java 生成 1000万条记录保存到 本地 命名为 data.csv

用如下命令导数数据到学生表
load data infile '/var/log/test.csv' into table `s` 
fields terminated by ',' optionally enclosed by '"' escaped by '"' 
lines terminated by '\n'; 


第二问
select student.student_id, crouse_id
from student left join select_table on student.student_id = select_table.student_id
第三问
select student_id from student where not exists 
(select select_table.student_id from  open_crouse left join select_table  on open_crouse.crouse_id=select_table.crouse_id 
where open_crouse.crouse_id in (select crouse_id from open_crouse) and open_crouse.crouse_id 
not in (select crouse_id from select_table where student_id=select_table.student_id))


实验三

select s.xh ,s.xm,e.kh,e.xq from s left outer join e on s.xh=e.xh;

select xh,xm from s where not exists(
	select * from o where not exists(select * from e where s.xh=e.xh and o.kh=e.kh)
);

select xh,xm from s where xh!='1106' and not 
exists(select * from e x where x.xh='1106' and not 
	exists(select * from e y where s.xh=y.xh and x.kh=y.kh));


select e.kh,s.xh,s.xm,e.zpcj from s,e where s.xh=e.xh and e.zpcj in (select max(zpcj) from e group by kh);

select s.xh,s.xm,e.zpcj from s,e ,(select kh,avg(zpcj) as 'pj' from e group by kh ) tmp
where e.xh=s.xh and tmp.kh=e.kh and e.zpcj>tmp.pj and 
year(2016)-year(s.csrq)<(select avg(year(2016)-year(s.csrq)) from s) order by s.csrq desc;








