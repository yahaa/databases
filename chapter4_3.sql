//院系表  


create table institue(
	institue_id varchar(100) not null,
	institue_name varchar(100),
	location varchar(100),
	phone varchar(11),
	primary key (institue_id)
)default charset=utf8;

//学生表
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



//教师表
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

//课程表
create table crouse(
	crouse_id varchar(100) not null,
	crouse_name varchar(10),
	credit int,
	hour int,
	institue_id varchar(100),
	primary key (crouse_id)
)default charset=utf8;




//开课表
create table open_crouse(
	season varchar(100) not null,
	crouse_id varchar(10),
	work_id varchar(10),
	crouse_time time,
	primary key (season,crouse_id,work_id),
	foreign key (crouse_id) references crouse(crouse_id),
	foreign key (work_id) references teacher(work_id) 
)default charset=utf8;

//选课表
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


