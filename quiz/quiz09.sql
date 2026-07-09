1.
Professor 테이블에서 201번 학과 교수들의 이름과 급여, bonus , 총 연봉을 아래와 같이 출력하세요.
단 총 연봉은 (pay*12+bonus) 로 계산하고 bonus 가 없는 교수는 0으로 계산하세요.

SELECT 
profno,
name,
pay,
bonus,
CASE
    WHEN bonus is null THEN to_char((pay*12+0),'999,999')
    WHEN bonus is not null THEN to_char((pay*12+bonus),'999,999')
END TOTAL,

to_char((pay*12+NVL2(bonus, bonus, 0)),'999,999') total1,

to_char(NVL2(bonus, pay*12+bonus, pay*12) ,'999,999') total2,

to_char(pay*12 + DECODE(bonus, null, 0, bonus),'999,999') total3

FROM professor
where deptno =201;

2.
아래 화면과 같이 emp 테이블에서 deptno 가 30 번인 사원들을 조회하여
comm 값이 있을 경우 'Exist' 을 출력하고 comm 값이 null 일 경우 'NULL' 을 출력하세요.

select
    empno,
    ename,
    comm,
    NVL2(comm,'Exist','null'),
    DECODE(comm,null,'NULL','Exist') "NVL2",
    
    case
    when comm is null then 'NULL'
    when comm is not null then 'Exist'
    end AS nvl2
    
from emp
where deptno =30;

