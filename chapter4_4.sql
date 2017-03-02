 INSERT INTO e VALUES('1101', '2012-2013冬季', '08305002', '0101', null, null, null);
 INSERT INTO e VALUES('1101', '2012-2013冬季', '08305002', '0102', null, null, null);
 INSERT INTO e VALUES('1101', '2012-2013冬季', '08305002', '0103', null, null, null);
 INSERT INTO e VALUES('1101', '2012-2013冬季', '08305003', '0102', null, null, null);
 INSERT INTO e VALUES('1101', '2012-2013秋季', '08305001', '0103', '63', '60', '60');
 INSERT INTO e VALUES('1101', '2013-2014冬季', '08302001', '0201', null, null, null);
 INSERT INTO e VALUES('1101', '2013-2014秋季', '08305004', '0101', null, null, null);
 INSERT INTO e VALUES('1102', '2012-2013冬季', '08305002', '0101', '82', '82', '82');
 INSERT INTO e VALUES('1102', '2012-2013冬季', '08305003', '0102', null, null, null);
 INSERT INTO e VALUES('1102', '2012-2013秋季', '08305001', '0103', '90', '87', '87');
 INSERT INTO e VALUES('1102', '2013-2014冬季', '08302001', '0201', null, null, null);
 INSERT INTO e VALUES('1102', '2013-2014秋季', '08305004', '0101', '0', '0', '0');
 INSERT INTO e VALUES('1103', '2012-2013冬季', '08305002', '0102', '75', '75', '75');
 INSERT INTO e VALUES('1103', '2012-2013冬季', '08305003', '0102', '84', '84', '84');
 INSERT INTO e VALUES('1103', '2012-2013秋季', '08305001', '0103', '59', '56', '56');
 INSERT INTO e VALUES('1103', '2013-2014冬季', '08302001', '0201', null, null, null);
 INSERT INTO e VALUES('1103', '2013-2014秋季', '08305001', '0102', '0', '0', '0');
 INSERT INTO e VALUES('1103', '2013-2014秋季', '08305004', '0101', '0', '0', '0');
 INSERT INTO e VALUES('1104', '2012-2013冬季', '08305002', '0101', null, null, null);
 INSERT INTO e VALUES('1104', '2012-2013冬季', '08305002', '0102', null, null, null);
 INSERT INTO e VALUES('1104', '2012-2013冬季', '08305002', '0103', null, null, null);
 INSERT INTO e VALUES('1104', '2012-2013冬季', '08305003', '0102', null, null, null);
 INSERT INTO e VALUES('1104', '2012-2013秋季', '08305001', '0103', '78', '74', '74');
 INSERT INTO e VALUES('1104', '2013-2014冬季', '08302001', '0201', '0', '0', '0');
 INSERT INTO e VALUES('1104', '2013-2014秋季', '08305004', '0101', null, null, null);
 INSERT INTO e VALUES('1105', '2012-2013冬季', '08305002', '0101', null, null, null);
 INSERT INTO e VALUES('1105', '2012-2013冬季', '08305002', '0102', null, null, null);
 INSERT INTO e VALUES('1105', '2012-2013冬季', '08305002', '0103', null, null, null);
 INSERT INTO e VALUES('1105', '2012-2013冬季', '08305003', '0102', null, null, null);
 INSERT INTO e VALUES('1105', '2012-2013秋季', '08305001', '0103', null, null, null);
 INSERT INTO e VALUES('1105', '2013-2014冬季', '08302001', '0201', null, null, null);
 INSERT INTO e VALUES('1105', '2013-2014秋季', '08305001', '0102', null, null, null);
 INSERT INTO e VALUES('1105', '2013-2014秋季', '08305004', '0101', null, null, null);
 INSERT INTO e VALUES('1106', '2012-2013冬季', '08305002', '0103', '66', '66', '66');
 INSERT INTO e VALUES('1106', '2012-2013冬季', '08305003', '0102', null, null, null);
 INSERT INTO e VALUES('1106', '2012-2013秋季', '08305001', '0103', '88', '85', '85');
 INSERT INTO e VALUES('1106', '2013-2014冬季', '08302001', '0201', null, null, null);
 INSERT INTO e VALUES('1106', '2013-2014秋季', '08305004', '0101', null, null, null);
 INSERT INTO e VALUES('1107', '2012-2013冬季', '08305002', '0101', null, null, null);
 INSERT INTO e VALUES('1107', '2012-2013冬季', '08305002', '0102', null, null, null);
 INSERT INTO e VALUES('1107', '2012-2013冬季', '08305002', '0103', null, null, null);
 INSERT INTO e VALUES('1107', '2012-2013冬季', '08305003', '0102', '79', '79', '79');
 INSERT INTO e VALUES('1107', '2012-2013秋季', '08305001', '0103', '94', '90', '90');
 INSERT INTO e VALUES('1107', '2013-2014冬季', '08302001', '0201', null, null, null);
 INSERT INTO e VALUES('1107', '2013-2014秋季', '08305004', '0101', '0', '0', '0');



 实验四

 create view fs (xh,xm,xb,sjhm,kh,cj)
 	as select s.xh,s.xm,s.xb,s.sjhm,e.kh,e.zpcj
 	from s,e where s.xh=e.xh and e.zpcj <60 and s.yxh in (select yxh from d where d.mc='计算机学院');


insert into e select distinct s.xh,o.xq,o.kh,o.gh,null,null,null from s,o where not 
	exists( select * from e where e.xh=s.xh and e.kh=o.kh); 


select xm,year(now()) -year(csrq) as age from s where xb='男' and year(now())-year(csrq)>(
select max(year(now())-year(csrq)) from s where xb='女');

update e set pscj =pscj*1.04
	where kh='08305001' and pscj>75;
update e set pscj=pscj*1.05 
	where kh='08305001' and pscj<=75;



delete from t where yxh not in (select yxh from c);
delete from s where yxh not in (select yxh from c);
delete from d where yxh not in (select yxh from c);
delete from c where yxh not in (select yxh from c,o where c.kh=o.kh);


select kh ,count(*) 优秀人数 from e where zpcj>=90 group by kh;
select kh ,count(*) 良好人数 from e where zpcj>=80 group by kh;
select kh ,count(*) 中等人数 from e where zpcj>=70 group by kh;
select kh ,count(*) 及格人数 from e where zpcj>=60 group by kh;
select kh ,count(*) 不及格人数 from e where zpcj<60 group by kh;