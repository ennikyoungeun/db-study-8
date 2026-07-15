--1.
--emp2 테이블 활용
--직원 중 'Section head' 직급 최소 연봉자 보다 연봉이 높은 사람의 이름, 직급, 연봉을 출력하기.
select * from emp2;

select 
min(pay)
from emp2
WHERE position = 'Section head'; -- 'Section head' 최소연봉

select 
e.name,
e.position,
e.pay
from emp2 e
where pay > ( select 
              min(pay)
              from emp2
              WHERE position = 'Section head')
order by pay desc;


--2.
--Student 테이블.
--전체 학생중에서 체중이 2학년 학생들의 체중에서 가장 적게 나가는 학생보다
--몸무게가 더 적은 학생의 이름, 학년, 몸무게 출력

select * 
from student;

select 
min(weight)
from student
where grade = 2; --2학년중 가장적은 몸무게.

select  
s.name,
s.grade,
s.weight
from student s
where weight < (select 
min(weight)
from student
where grade = 2);


--3.
--emp2, dept2 활용
--각 부서별 평균연봉을 구하고, 그 중에서 가장 작은 평균 연봉보다도 더 적게 받는 직원들의
--부서명, 직원명, 연봉 출력

SELECT 
    d.dname ,
    e.name ,
    e.pay 
FROM emp2 e, dept2 d
WHERE e.deptno = d.dcode
    AND e.pay < ALL (
        SELECT AVG(pay)
        FROM emp2
        GROUP BY deptno
    );
    
 ------------t-----------   

부서별 평균 연봉
select deptno, AVG(pay) --, COUNT(*)
from emp2
group by deptno;

여기서 제일 작은 연봉

select avg_pay
from (
    select deptno, AVG(pay) avg_pay
    from emp2
    group by deptno
    order by avg_pay
)
where rownum=1;

select MIN(avg_pay)
from (
    select deptno, AVG(pay) avg_pay
    from emp2
    group by deptno
    );
    


그거보다도 적게 받는 직원
select d.dname, e.name, e.pay
from emp2 e, dept2 d
where pay < (select MIN(avg_pay)
            from (
                select deptno, AVG(pay) avg_pay
                from emp2
                group by deptno
                ))
AND e.deptno = d.dcode;



<ALL <ANY

select 
    (select dname 
        from dept2 
        where dcode = deptno) dname,
    e.name, e.pay
from emp2 e
where pay <ALL (  select AVG(pay) avg_pay
                    from emp2
                    group by deptno);
 


