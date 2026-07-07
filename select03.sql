/*--------------------------*/
집합 연산자
합집합 UNION       (합치면서 중복제거)
      UNION ALL   (전부다 합치기 중복제거X)
교집합 INTERSECT
차집합 MINUS

*제약조건
1. 컬럼갯수동일
2. 컬럼 데이터 타입 동일
3. 컬럼명은 달라도 상관없음


-- 학생 101학과 학생 +102학과 학생정보 총합 조회
SELECT *
FROM STUDENT
WHERE DEPTNO1 IN (101,102);

SELECT *
FROM STUDENT
WHERE DEPTNO1= 101
union all
SELECT *
FROM STUDENT
WHERE DEPTNO1= 102;

--학생들 데이터 
--101번 학과 학생 +102 학과 학생중 키 170 넘는학생
SELECT *
FROM STUDENT
WHERE DEPTNO1= 101
union all
SELECT *
FROM STUDENT
WHERE DEPTNO1= 102 and height >170;

SELECT *
FROM STUDENT
WHERE DEPTNO1= 101 or (deptno1 =102 and height>170);

--101번 학과에 속한 학생들 +101번 학과에 재직중인 교수들 한번에 조회
SELECT *
FROM STUDENT
WHERE DEPTNO1= 101  --12개항목
union all
SELECT *
FROM professor
WHERE deptno= 101; --10개 항목  -> 오류

SELECT studno, name, deptno1
FROM STUDENT
WHERE DEPTNO1= 101  
union all
SELECT profno, name, deptno
FROM professor
WHERE deptno= 101; -- 컬럼갯수동일, 컬럼 데이터 타입 동일

--앞의 헤더기준으로 생성됨.->별칭작성필요
SELECT studno "식별번호", name "이름", deptno1 "학과"
FROM STUDENT
WHERE DEPTNO1= 101  
union all
SELECT profno, name, deptno
FROM professor
WHERE deptno= 101; 

SELECT studno "식별번호", name "이름", deptno1 "학과"
FROM STUDENT
WHERE DEPTNO1= 101  
union all
SELECT profno, name, deptno
FROM professor
WHERE deptno= 101
--order by 이름; --합치고 정렬할때 별칭으로 ..
order by 2; --select 컬럼순서번호 ,권장하지않음..
/*
select..from..where..order by..
*/

SELECT studno "식별번호", name "이름", deptno1 "학과",tel "연락처"
FROM STUDENT
WHERE DEPTNO1= 101  
union all
--SELECT profno, name, deptno, email
SELECT profno, name, deptno, null -- ->갯수맞추기위해.null
FROM professor
WHERE deptno= 101
order by 2;


/*----교집합------*/
SELECT *
FROM STUDENT
where deptno1 =101
INTERSECT
SELECT *
FROM STUDENT
where deptno2 =201;
--where deptn01 = 101 and deptno2 =201

/*----차집합------*/
SELECT *
FROM EMP
WHERE job = 'SALESMAN' and comm>0
minus
--차집합 이전 수상자
SELECT *
FROM EMP
WHERE hiredate < '1982-01-01';

select *
from emp
where( job = 'SALESMAN' and comm>0 ) and (hiredate >= '1982-01-01');

select *
from emp
where( job = 'SALESMAN' and comm>0 ) and not (hiredate < '1982-01-01');




