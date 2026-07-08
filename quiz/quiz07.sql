1.
Student 테이블의 birthday 컬럼을 사용하여 생일이 1월인 학생의 이름과 birthday 를 출력하세요.
사용자가 올린 이미지

SELECT
studno,
name,
to_char(BIRTHDAY,'yyyy-mm-dd') "BIRTHDAY"
FROM student
where to_char ( birthday, 'mm')= '01'; 


2.
emp 테이블의 hiredate 컬럼을 사용하여 입사일이 1,2,3 월인 사람들의 사번과 이름, 입사일을 출력하세요.
SELECT
EMPNO,
ENAME,
HIREDATE
FROM EMP
where to_char ( HIREDATE, 'mm') in ('01','02','03');

