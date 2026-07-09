/*------------------*/
기타 복수행 함수 Rollup

집계
--emp 부서와 직업별 평균 급여와 사원수

select
deptno,job,avg(sal) 평균급여, count(*) 사원수
from emp
group by deptno,job;

--emp 부서별 평균 급여와 사원수
select
deptno,avg(sal) 평균급여, count(*) 사원수
from emp
group by deptno;

--emp 전체 사원의평균 급여와 사원수
select
avg(sal) 평균급여, count(*) 사원수
from emp;

--위 세개의 집계 내역을 하나로 통합
select
deptno,job,avg(sal) 평균급여, count(*) 사원수
from emp
group by deptno,job
union all
select
deptno,null,avg(sal) 평균급여, count(*) 사원수
from emp
group by deptno
union all
select
null,null,avg(sal) 평균급여, count(*) 사원수
from emp
order by deptno,2;

**rollup

select deptno,job,avg(sal) 평균급여, count(*) 사원수
from emp
--group by rollup(deptno,job);
--group by rollup(job,deptno);
group by rollup( (deptno,job) ); --하나의 덩치로 묶인다...

----   -> 뒤에서 부터 하나씩.. 처리..
group by rollup(deptno,job)
1)group by deptno,job 그룹화 데이터 집계
2)group by deptno 그룹화 데이터 집계
3) () 그룹화 데이터 집계 -> 전체 집계

group by rollup(deptno,job)
group by job,deptno
group by job
()

group by rollup( (deptno,job) )
group by (deptno,job)
()

group by rollup(empno,deptno,job)
1) empno,deptno,job
2)empno,deptno
3)empno
4)()

group by rollup(empno,(deptno,job))
1) empno,(deptno,job)
2)empno
3)()

;


select deptno,job,avg(sal) 평균급여, count(*) 사원수
from emp
--group by rollup(deptno,job);
group by cube(deptno,job);

1)group by rollup(deptno,job)
2)group by job,deptno
3)group by job
4)()

cube
1)deptno,job
2)deptno
3)job
4) ()

/*-------------------------------------------------------------------------*/

순위 rank() over (order by 정렬 기준 대상)
그룹단위 순위 Rank() over( partition by 그룹기준 order by 정렬기준대상)
dense_Rank() over(order by 정렬 기준 대상) --데이터에 중복 순위가 발생하더라도 건너뛰지 않고 연속적인 순위를 부여

ex) rank()       ->100점 :1위, 100점:1위,90점:3위(2위 건너뜀),80점:4위
    dense_Rank() ->100점 :1위, 100점:1위,90점:2위(순위유지),80점:3위
    
/*--------------------------------------------------------------------------*/
    
SELECT  
ename,
sal
FROM emp
order by sal;

SELECT  
ename,
sal,
rank() over(order by sal) 낮은급여순위,
rank() over(order by sal desc) 높은급여순위,
dense_rank() over(order by sal desc) 높은급여순위
FROM emp;

SELECT  
name,
height,
rank() over(order by height), 
rank() over(order by height desc) 키순위,
dense_rank() over(order by height desc)  키순위,
grade,
height,
Rank() over( partition by grade order by height desc) 학년별키순위,
dense_rank() over( partition by grade order by height desc) 학년별키순위
FROM student
order by grade;






