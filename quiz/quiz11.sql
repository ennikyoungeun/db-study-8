SELECT * FROM emp;
--emp 전체 sal 급여 평균

select
avg(sal)
from emp;

--emp 30번부서사람들 평균급여

select
deptno,
avg(sal)
from emp
where deptno=30
group by deptno;

--emp 각부서별 평균 급여

select
deptno,
round(avg(sal),2),
trunc(avg(sal))
from emp
group by deptno
order by deptno;

--emp 각부서별 인원과 평균 급여

select
deptno "부서",count(ename) "인원",
avg(sal) "평균급여"
from emp
group by deptno
order by deptno;

--emp 각 직업별 평균 급여
select
job "직업",
avg(sal) "평균급여"
from emp
group by job;

--emp 각 직업별 가장 높은 급여 얼마?
select
job,
max(sal) "가장 높은 급여"
from emp
group by job;


--emp 각 부서별 가장 높은 급여 얼마?

select
deptno "부서",
max(sal) "가장 높은 급여"
from emp
group by deptno 
order by deptno;

