
-- 학과정보
select * from department;
SELECT * from student;
select *from professor;

select
s.name,s.deptno1,d.dname
from student s,department d
where s.deptno1 =d.deptno;


select *
from student s,professor p,department d
where s.profno = p.profno
and s.deptno1=d.deptno;

select s.name, p.name, d.dname
from 
student s inner join professor p
on s.profno = p.profno
inner join department d
on s.deptno1 = d.deptno;

select *
from student s, professor p, department d
where s.profno = p.profno
and s.deptno1 = d.deptno
and s.deptno1 = 101;

-----------------------------------
1)학생명, 학생학과 번호, 학생의 학과명, 교수명, 교수학과번호

select s.name, s.deptno1, d.dname, p.name, p.deptno
from student s, professor p, department d
where s.profno = p.profno
and s.deptno1 = d.deptno;

2)학생명, 학생학과 번호, 교수의 학과명, 교수명, 교수학과번호

select s.name, s.deptno1, d.dname, p.name, p.deptno
from student s, professor p, department d
where s.profno = p.profno
and p.deptno = d.deptno;

3)학생명, 학생학과 번호, 학생의 학과명, 교수명, 교수학과번호,교수의 학과명

select s.name, s.deptno1, ds.dname, p.name, p.deptno, dp.dname
from student s, professor p, department ds, department dp
where s.profno = p.profno       -- 학생 <--> 지도교수 (propno기준)
and s.deptno1 = ds.deptno       -- 학생 <--> 학과정보 (deptno1 |deptno )
and p.deptno = dp.deptno;       -- 교수 <--> 학과 정보 (deptnorlwns)


-----------------------------------------------------------------
inner join
outer join

등가조인 -- > 조인의 연결 같은조건
비등가조인 --> 조인의 연결조건 = 같다가 아닌 다른 조건으로 연결



select * from customer;
select * from gift;

point 점수가 g_start g_end 사이에 들어가면 해당 사은품 수령

select *
from customer c , gift g
where c.point between g.g_start and g.g_end;

self join

--emp 테이블에서 mgr,empno 
한 테이블 내에서 서로 연관이 되어있는 컬럼이 있는경우 self 조인가능,
(똑같은 테이블이 두개 있다고 가정..)
select * from emp; 

select *
from emp e1, emp e2
where e1.mgr = e2.empno;

select * from emp2; 

select a.empno, a.name, a.pempno, b.empno, b.name
from emp2 A, emp2 B
where a.pempno = b.empno;






