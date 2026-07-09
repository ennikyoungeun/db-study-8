/*--------------------------------*/
복수행함수 (집계)

COUNT (대상) 갯수세기

SELECT *
FROM emp;

SELECT COUNT(*)
FROM emp;

-- 갯수 대상식별자 (*, 기본키 Primary Key / PK - 유니크(중복X), 값존재)

select
    count(empno),
    count(ename),
    count(mgr),
    count(comm) --null이 아닌 값의 갯수만 찾음.. null은 카운드하지 않음.     
    --,empno --단일행 함수랑 함께사용 안됨
    ,null
from emp;

--조건: null을 제외하고, ,
SELECT 
count(*) 
FROM emp
where comm is not null;

--조건:null 인것만 카운트
SELECT 
count(*) 
FROM emp
where comm is null;

--student 4학년 몇명?
SELECT 
count(*)
FROM student
where grade=4;


수치 집계
sum/avg/max/min/stddev/variance

--총직원 몇명, 총급여,커미션 얼마?
select
count (*), sum(sal), sum(comm)
from emp;

--10,20번 부서에 다니는 직원 몇명, 총급여

select
count (*), sum(sal)
from emp
where deptno in(10,20);

select
count(height), --총개수
sum (height),  --합계
avg (height),  --평균
max(height),  --최대값
min(height),  --최소값
stddev(height),  --표준편차
variance(height),  --분산값
avg(weight)  --평균
from student;

/*-------------------*/
그룹화하기  group by

SELECT....
FROM...
where..
group by 컬럼대상 지정(지정된 컬럼을 기준으로 그룹지어서 계산
            group by에 명시한 컬럼은 select 조회에 사용가능
having  -->그룹 바이로 묶인,,,,조건.
order by
;
--학생들 각 학년별 평균키

select '1학년',avg(height)
from student
where grade =1
union all
select '2학년',avg(height)
from student
where grade =2
union all
select '3학년',avg(height)
from student
where grade =3
union all
select '4학년',avg(height)
from student
where grade =4;

SELECT 
    grade, avg(height)
FROM student
group by grade;

SELECT 
    grade,count(*), avg(height)
FROM student
group by grade
order by grade; --정렬

SELECT 
    *
FROM student;

SELECT 
   studno,count(*), avg(height)
FROM student
group by studno; --그룹을 지어도 묶이는게 없으면 개별적으로 ..

--1,2,3 학년 학년별 평균키 학년기준 내림차순 정렬

SELECT 
   grade 학년, avg(height) 평균키
FROM student
where grade in(1,2,3)
group by grade
--order by grade desc;
--order by 학년 desc;  -- ->별칭 지정되어서 별칭으로 가능.
order by 1 desc;

1)급여가 2000이상인 직원들을 대상으로 부서별 평균급여
    select 
        deptno,
        avg(sal)
    from emp
    where sal>=2000
    group by deptno;

2) 부서별 평균 급여가 2000 이상인 부서별 평균급여
    select 
        deptno,
        avg(sal)
    from emp
    group by deptno
    having avg(sal) >= 2000;
    
student
학생 각 학년별 평균 몸무게, 
평균 몸무게가 65키로 이상 경우만

select
    grade, avg(weight)
from student
group by grade
having avg(weight) >=65;

학생 각 학년별 평균 몸무게, 
4학년을 제외
평균 몸무게가 65키로 이상 경우만
학년별 오름차순 정렬

select
    grade, avg(weight)
from student
where grade !=4
group by grade
having avg(weight) >=65
order by grade;

/*****---------------------------********/
--SELECT....
--FROM...
--where..
--group by 컬럼대상 지정(지정된 컬럼을 기준으로 그룹지어서 계산
--            group by에 명시한 컬럼은 select 조회에 사용가능
--having  -->그룹 바이로 묶인,,,,조건.
--order by
/*****---------------------------********/

--order by grade, heiht

SELECT deptno,AVG(sal)
FROM emp
group by deptno;

SELECT job,AVG(sal)
FROM emp
group by job;

SELECT job,deptno,AVG(sal)
FROM emp
group by job, deptno
order by job,deptno desc;




