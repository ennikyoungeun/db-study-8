emp 테이블을 조회하여 이름이 'ALLEN' 인 사원의 사번과 이름과 연봉을
출력하세요. 단 연봉은 (sal * 12)+comm 로 계산하고 천 단위 구분기호로
표시하세요.

SELECT
empno,
ename,
TO_CHAR((sal*12)+comm , '999,999') "SALARY"
FROM EMP
WHERE ENAME = 'ALLEN' ;

emp 테이블을 조회하여 comm 값을 가지고 있는 사람들의 empno , ename , hiredate,
총연봉,15% 인상 후 연봉을 아래 화면처럼 출력하세요.
단 총연봉은 (sal*12)+comm 으로 계산하고
아래 화면에서는 SAL 로 출력되었으며
15% 인상한 값은 총연봉의 15% 인상 값입니다.

SELECT
EMPNO,
ENAME,
to_char(HIREDATE,'yyyy-mm-dd') "HIREDATE",
TO_CHAR((sal*12)+comm , '$999,999') "SAL",
TO_CHAR(((sal*12)+comm)*1.15 , '$999,999') "15%인상"
FROM EMP
WHERE COMM IS NOT NULL;

