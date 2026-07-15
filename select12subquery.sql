/*----------------------------------------------------------------*/
서브쿼지

rownum 활용

SELECT 
    rownum,
    ceil(rownum/3),
    studno,
    name
FROM student;

 SELECT 
        rownum,
        ceil(rownum/3),
        studno,
        name,
        height
FROM student
order by height;

select
    rownum,rn,
    studno,
    name,
    height
from(
    SELECT 
        rownum rn,
        ceil(rownum/3),
        studno,
        name,
        height
    FROM student
    order by height );
    
    
SELECT * FROM student
where rownum <=5;  --그냥 조회 결과 5명

--키큰사람5명 조회
--정렬전에 rownum -> 정렬후 꼬임.
select *
from student
where rownum <=5 --기존 배정된 rownum 으로 인식 -> 정렬이후 rownum 과 다름
order by height desc;

select rownum, s.*
from student s;

select rownum,s.*
from student s
order by height desc;


select rownum, studno, name,height
from (
    select *
    from student s
    order by height desc
    )
where rownum <=5;

--팀번호로 팀조회

SELECT 
    rownum,
    ceil(rownum/3),
    studno,
    name
FROM student
where ceil(rownum/3) = 3; --- XXX

select *
from(
    SELECT 
        rownum rn,
        ceil(rownum/3) team,
        studno,
         name
    FROM student
)
where team =3;

/*--------------------------*/
group by 집계 -> subquery,   join 

부서별 최대급여


select deptno, MAX(sal), ename  --집계 결과 + 일반 컬럼 값 동시에 표현하기 힘듬
from emp
group by deptno, ename;  -- 집계기준으로 활용여부 -> 목적에 맞는 그룹화가 아님


select deptno, MAX(sal)
from emp
group by deptno;


--직원 테이블 조회 데이터에 옆에 해당 부서의 최대 급여 표시
select *
from emp A, (select deptno, MAX(sal) max_sal
                from emp
                group by deptno) B
where A.deptno = B.deptno;

--부서별 최대 급여 + 부서명
select deptno, MAX(sal)
from emp
group by deptno;

select e.deptno, d.dname, e.max_sal
--select * 
from dept d, (select deptno, MAX(sal) max_sal
                from emp
                group by deptno ) e
where d.deptno = e.deptno;



select deptno, MAX(sal), (select dname from dept where deptno = e.deptno)
from emp e
group by deptno;

select deptno, max_sal, (select dname from dept where deptno = e.deptno)
from 
    (select deptno, MAX(sal) max_sal
    from emp
    group by deptno) e;


select deptno, dname, MAX(sal)
from (
    select e.deptno, e.sal, d.dname
    from emp e, dept d
    where e.deptno = d.deptno
)
group by deptno, dname;




