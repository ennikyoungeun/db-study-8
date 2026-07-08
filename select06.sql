/*---------------------------------*/
단일행 함수

NVL함수
값이null 일때 기본값 처리
NVR(대상,null일때 기본값)

select
    sal,
    comm,
    (sal*12) + comm,  --(800*12)+null ->null
    NVL(comm, 123), -- comm이 null 일때 null->123으로 바꿈..
    NVL(comm, 0),    
    (sal*12) + NVL(comm, 0)
from emp;


SELECT 
    sal,
    comm,
    sal*12+comm "연봉"
FROM emp
where comm is not null
union all
SELECT 
    sal,
    comm,
    sal*12
FROM emp
where comm is null;

NVL2함수
NVL2(대상값,있을,없을)

select
NVL(null,10),
NVL(20,10),
NVL2(null,'있다,','없다'),
NVL2(1234,'있다,','없다')
,NVL2(1234,'1234','없다')
from dual;

select
    sal,
    comm,
    (sal*12) + NVL(comm, 0),
    NVL2(comm,comm,0),
    (sal*12) + NVL2(comm,comm, 0),
    NVL2(comm,(sal*12)+comm,(sal*12) )
from emp;

****DECODE

DECODE (대상,비교값,'같다','다르다')
DECODE (대상,비교값,'같다',(DECODE (대상,비교값,'같다','다르다')))
DECODE (대상,비교값1,'같다1',비교값2,'같다2',비교값3,'같다3','다르다')
DECODE (대상,비교값1,'같다1',비교값2,'같다2',비교값3,'같다3') -> 마지막 다르다 생략 ->NULL

select
DECODE (10,10,'같다','다르다'),
DECODE (10,20,'같다','다르다'),
DECODE (10,10,'같다'),
DECODE (10,20,'같다'),         --다르다 생략 -> null
DECODE (10,20,'같다','null'),
DECODE (10,10,'10이다',20,'20이다',30,'30이다',40,'40이다','아니다'),
DECODE (30,10,'10이다',20,'20이다',30,'30이다',40,'40이다'),
DECODE (40,10,'10이다',20,'20이다',30,'30이다',40,'40이다',null),
DECODE (99,10,'10이다',20,'20이다',30,'30이다',40,'40이다','null')

from dual;

swith(20):
case20:'20dlek'
case30:..

SELECT 
name,
deptno,
DECODE(deptno,101,'컴공',102,'전기',103,'기계',201,'물리',202,'화학',203,'수학','기타전공') "학과이름",
'전공학과:'||DECODE(deptno,101,'컴공',102,'전기',103,'기계',201,'물리',202,'화학',203,'수학','기타전공') "학과이름"
FROM professor;


****CASE 문
SELECT
* 
FROM student;
--학년 1 2 3 4
--학년구분->컬럼
--12 저학년
--34 고학년

SELECT 
grade,
decode(grade,1,'저학년',2,'저학년',3,'고학년',4,'고학년','범위 벗어남') 구분,
case grade
    when 1 then '저학년'
    when 2 then '저학년'
    when 3 then '고학년'
    when 4 then '고학년'
    else '범위벗어남'
end as "구분CASE",
case
when grade in(1,2)then'저학년'
when grade between 3 and 4 then '고학년'
    else'어쩌구.'
    end " 구분case2"
FROM student;

------------------
연봉계산


select
    sal,
    comm,
    sal*12 + comm 연봉1,
    sal*12 + NVL(comm, 0) 연봉2,
    sal*12 + NVL2(comm, comm, 0) 연봉3,
    NVL2(comm, sal*12+comm, sal*12) 연봉4,
    sal*12 + DECODE(comm, null, 0, comm) 연봉5,
    CASE comm
        WHEN null THEN (sal*12)  -- comm = null    comm is null
        ELSE (sal*12 + comm)
    END 연봉6, --안되는 케이스
    CASE
        WHEN comm is null THEN (sal*12)
        WHEN comm is not null THEN (sal*12 + comm)
    END 연봉7
from emp;



