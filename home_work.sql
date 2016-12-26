第一步创建数据库

create database spring_user default character set utf8 collate utf8_general_ci;

create table s(
	sno int not null,
	sname varchar(100) not null,
	age int,
	sex varchar(100),
	sdept varchar(100),
	primary key(sno)
)default charset=utf8;

create table c(
	cno int not null,
	cname varchar(100) not null,
	cdept varchar(100) not null,
	teacher varchar(100) not null,
	primary key(cno)
)default charset=utf8;

create table sc(
	sno int not null,
	cno int not null,
	grade int not null,
	primary key(sno,cno),
	foreign key(sno) references s(sno),
	foreign key(cno) references c(cno)
)default charset=utf8;

第二步 插入数据
insert into s (sno,sname,age,sex,sdept) value(1008,'kgy',23,'f','cs');

insert into c value(2000,'数据库','cs','LIU');
insert into c value(2001,'模式识别','cs','hua');
insert into c value(2002,'软件工程','cs','hua');
insert into c value(2003,'大数据','cs','LIU');
insert into c value(2004,'高数','math','mrt');

insert into sc value(1000,2000,99);
insert into sc value(1000,2001,98);
insert into sc value(1000,2002,90);
insert into sc value(1000,2003,87);
insert into sc value(1000,2004,80);
insert into sc value(1001,2000,90);
insert into sc value(1001,2001,87);
insert into sc value(1000,2002,77);
insert into sc value(1002,2000,81);
insert into sc value(1002,2001,70);
insert into sc value(1002,2002,55);
insert into sc value(1002,2003,57);
insert into sc value(1002,2004,60);
insert into sc value(1006,2002,90);
insert into sc value(1006,2003,87);
insert into sc value(1006,2004,80);

数据表如下所

s table;
+------+-------+------+------+--------+
| sno  | sname | age  | sex  | sdept  |
+------+-------+------+------+--------+
| 1000 | zi    |   20 | 女   | cs     |
| 1001 | zihua |   20 | 女   | cs     |
| 1002 | zihua |   22 | 男   | math   |
| 1003 | qiang |   19 | 女   | movice |
| 1004 | gou   |   25 | 男   | th     |
| 1005 | wang  |   16 | 男   | th     |
| 1006 | wang  |   16 | 男   | th     |
| 1007 | kgy   |   23 | 女   | cs     |
| 1008 | kgy   |   23 | 女   | cs     |
| 1009 | wu    |   18 | NULL | NULL   |
+------+-------+------+------+--------+



c table;
+------+--------------+-------+---------+
| cno  | cname        | cdept | teacher |
+------+--------------+-------+---------+
| 2000 | 数据库       | cs    | LIU     |
| 2001 | 模式识别     | cs    | hua     |
| 2002 | 软件工程     | cs    | hua     |
| 2003 | 大数据       | cs    | LIU     |
| 2004 | 高数         | math  | mrt     |
+------+--------------+-------+---------+

sc table
+------+------+-------+
| sno  | cno  | grade |
+------+------+-------+
| 1000 | 2000 |    99 |
| 1000 | 2001 |    70 |
| 1000 | 2002 |    90 |
| 1000 | 2003 |    87 |
| 1000 | 2004 |    80 |
| 1001 | 2000 |    90 |
| 1001 | 2001 |    87 |
| 1002 | 2000 |    81 |
| 1002 | 2001 |    70 |
| 1002 | 2002 |    55 |
| 1002 | 2003 |    57 |
| 1002 | 2004 |    60 |
| 1004 | 2003 |    90 |
| 1006 | 2002 |    90 |
| 1006 | 2003 |    87 |
| 1006 | 2004 |    80 |
+------+------+-------+

4.2 解答
1.
select cno,cname from c where teacher='LIU';
2.
select sno,sname from s where age>23;
3.
select cname,teacher from c where cno in 
(select cno from sc where sno=1000);

4.
select sname from s where sex='女' and sno in (select distinct sno from sc where
cno in (select cno from c where teacher='LIU'));
5.
select cno,cname from c where cno not in 
(select cno from sc where sno in(select sno from s where sname='wang'));

6.
create view s_crous(sno,cou) as select sno,count(cno) from sc group by sno;
select sno from s_crous where cou>=2;

7.
select cno,cname from c where not exists
( select * from s where not exists
(select * from sc where sc.sno=s.sno and sc.cno=c.cno));

8.
select sno from sc where cno in 
(select sno from s where s.sno=sc.sno and cno in 
(select cno from c where teacher='LIU'));


4.6解答
1.
select count(distinct cno) from sc;
2.
select avg(age) from s where sno in
(select sno from sc where cno in
(select cno from c where cname='高数'));
3.
select avg(grade) from sc where cno in (
select cno from c where teacher='LIU') group by cno;

4. 自己创建的数据库人数 没有超过 10 ，用 2 来代替
select cno,count(sno) c_sno from sc group by cno having c_sno>=2 order by c_sno asc,cno desc;

5.
select sname age from s as x where x.sno>some 
(select sno from s as y where y.sname='zihua' and x.age<y.age);
6.
select sname,age from s where sname like 'wang%';
7.
select sno ,cno from sc where grade is null;
8.
select sname,age from s as x where x.sex='男' and x.age>
(select avg(age) from s where sex='女')；

9.
select sname,age from s as x where x.sex='男' and x.age>
(select max(age) from s where sex='女');

select sname,age from s as x where x.sex='男' and x.age>
all (select age from s where sex='女');

4.7解答
1.
insert into s (sno,sname,age)
value(1009,'wu',18);

2.
insert into student select sno,sname,sex from s where sno in 
(select sno in (select sno from sc group by sno having min(grade)>=80));
3.








