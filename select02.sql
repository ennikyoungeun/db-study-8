/*---------------*/
조건 WHERE 절
필터링기능, 원하는 조건에 따라서 조회

select .. 
from...
where...;

SELECT * 
FROM emp; --전체 데이터 조회


SELECT * 
FROM emp
WHERE sal > 2500;
--emp 테이블에서 sal 커럼값이 2500을 초과하는 모든 테이터 조회

SELECT ename
FROM emp
WHERE sal > 2500;
--emp 테이블에서 sal 커럼값이 2500을 초과하는 직원들의 이름을 조회

SELECT * 
FROM emp
WHERE job = 'SALESMAN';
--emp 테이블에서 job(직업)이 salesman인 직원들만 전체컬럼조회

--부서번호가 10번인 사원들 정보 조회( 10번 부서에 속한)
SELECT * 
FROM emp
WHERE DEPTNO=10;



--부서 번호가 10번이 아닌 사원정보
SELECT * 
FROM emp
--WHERE DEPETNO != 10;
WHERE DEPTNO <> 10;

select * from student
--where weight >=55; --55kg이상
--where weight >=55 and  weight <=70;       --and  or
where weight between 55 and 70;

select * from student; --1~3학년만 조회

select * from student
--where grade >=1 and grade <=3;
--where grade betwwen 1 and 3;
--where grade=1 or grade=2 or grade =3;
--where grade !=4;
--where grade <> 4;
where grade in(1,2,3); --in(...)속한 것들을 찾는다. 

--NOT
--2,4 학년만 조회
select * from student
--where grade in (2,4);
--where grade =2 0r grade = 4;
--where grade != 1 and grade <> 3;
where grade not in (1,3);


like 패턴검색(문자)
    %: 0~n개 아무 갯수나 가능
    _: 해당 위치에 한개
    
SELECT * 
FROM emp
--where ename='SMITH';
--where ename LIKE '%M%'; -앞뒤 상관 없이 m이 들어있는지 ..
--where ename LIKE 'M%'; --m으로 시작
--where ename LIKE '%N'; --n으로 끝나는..
--where ename LIKE '_M%';--앞에 문자가 하나 있고, m이들어가고 뒤에는 문자수상관없이 .
where ename LIKE '__M%'; -- 앞에 문자 두개 


--null값 비교 -> comm = nill; -> 조회 안됨, 
SELECT * 
FROM emp
--where comm is null; --null찾기
where comm is not null; --null이 아닌것 찾기

날짜비교
1201
1221
미래일수록 큰 값
과거일수록 작은 값

SELECT * 
FROM emp                      --(테이블 팝업 설명 정보 -> shift+f4)
--where hiredate='80/12/17'; --yy/mm/dd
--where hiredate='1980-12-17'; --yyyy-mm-dd
--where hiredate > '80/08/20'; --80년 8월 20일 이후
where hiredate <= '1981-04-05'; --81년 4월 5일 포함 이전

desc emp;


/*---------------*/
정렬 order by
단순조회 -> 정렬을 명시하지 않으면 순서보장X
ORDER BY 정렬 기준 컬럼명[ASC |DESC] [오름차순|내림차순]

select ..
from..
where..
order by..
;

select ..
from..
order by..
;

select *
from student
order by name; --asc 기본값 오름차순


--내림차순 정렬 desc
select *
from student
order by name desc;

--학생들 학년기준으로 내림차순 정렬 -> 이름과 학년을 조회
select name, grade
from student
order by grade desc;

--학생테이블 기준 1,2,3 학년 학생들을 키 내림차순 순서로 조회
select *
from student
where grade in (1,2,3)
order by height desc;

select *
from student
where grade in (1,2,3)
--order by grade, height desc;
order by grade desc, height ;

select *
from student
where grade in (1,2,3)
order by height,grade desc;

select *
from student
--order by birthday ; -- 오름차순 작은->큰 과거->미래
order by birthday desc;

























