----1.
----emp 테이블에서 20 번 부서에 소속된 직원들의 이름과 3-4 번째
----글자만 '-' 으로 변경해서 출력하세요 .
--
SELECT  
ename,
substr(ename,3,2),
replace(ename,substr(ename,3,2),'--') "REPLACE",
substr(ename,1,2)||'--'||substr(ename,5)
FROM emp
where deptno=20;

----2.
--Student 테이블에서 1전공(deptno1)이 101 번인 학생들의 이름과
--주민등록번호를 출력하되 주민등록번호의 뒤 7자리는 ‘-’ 과 '/' 로 표시되게
--출력하세요.
select 
    name,
    substr(jumin,1,6)||'-/-/-/-' "주민뒷자리숨김"
from student
where deptno1 =101;
----3,
--Student 테이블에서 아래 그림과 같이 1 전공이 102 번인 학생들의 이름과 전화번호, 전화번호에서 국번 부분만 ‘*’ 처리하여 출력하세요.
--단 모든 국번은 3자리로 간주합니다.

select 
    name,
    tel,
    -- replace( 기준값, 찾는대상, 바꿀값)
    substr(tel,1,4)||'***'||substr(tel,8,5) "replace1",
    substr(tel,1,4)||'***'||substr(tel,8) "replace2",
    replace(tel,substr(tel,5,3),'***'),
    replace(tel,substr(tel,instr(tel,')')+1,3),'***') "REPLACE",
    -------------*------------------
    instr(tel,')') 괄호위치,
    instr(tel,'-') "-표시위치",
    substr(tel,instr(tel,')')+1,3) 국번3자리
from student
where deptno1 =102;

--++Option
--응용) 가운데 자리 숫자의 자리수에 맞춰서 *로 바꾸기
--   3자리 -> ***
--   4자리 -> ****
가운데 자리수가 몇개냐? 3개 *** 4개 ****
select
    RPAD(1, 5, 0),
    LPAD('*', 3, '*'),
    RPAD('*', 4, '*')
from dual;

select 
    tel,
    INSTR(tel, ')') 괄호위치,
    INSTR(tel, '-') "-표시위치",
    SUBSTR(tel, INSTR(tel, ')')+1),
    SUBSTR( SUBSTR(tel, INSTR(tel, ')')+1), 1, INSTR(SUBSTR(tel, INSTR(tel, ')')+1), '-')-1) 가운데자리,
    LENGTH(SUBSTR( SUBSTR(tel, INSTR(tel, ')')+1), 1, INSTR(SUBSTR(tel, INSTR(tel, ')')+1), '-')-1)) 가운데자리수길이,
    INSTR(tel, '-') - INSTR(tel, ')') - 1 가운데자리수
from student;

select
    tel, 
    SUBSTR(tel, 1, INSTR(tel, ')')),
    LPAD('*',  (INSTR(tel, '-') - INSTR(tel, ')') - 1), '*'),
    SUBSTR(tel, -5, 5),
    SUBSTR(tel, 1, INSTR(tel, ')')) 
    || LPAD('*',  (INSTR(tel, '-') - INSTR(tel, ')') - 1), '*') 
    || SUBSTR(tel, -5, 5)
from student;

select 
    RPAD('02)', 7, '*')
from dual;
--02)6255    -9875      
--02)****

select 
    SUBSTR(tel, 1, INSTR(tel, ')')),
    LENGTH(SUBSTR(tel, 1, INSTR(tel, '-') - 1)), 
    SUBSTR(tel, INSTR(tel, '-')),
    RPAD( SUBSTR(tel, 1, INSTR(tel, ')')),  LENGTH(SUBSTR(tel, 1, INSTR(tel, '-') - 1)), '*')
    || SUBSTR(tel, INSTR(tel, '-'))
from student;

----4.
--Student 테이블에서 아래와 같이 deptno1 이
--101 번인 학과 학생들의 이름과 전화번호와 전화번호에서
--지역번호와 국번을 제외한 나머지 번호(끝 4자리 번호)를 * 로 표시해서 출력하세요.
select 
    name,
    tel,
    substr(tel,-4,4) 뒷자리네자리,
    -- replace( 기준값, 찾는대상, 바꿀값)
    replace(tel,substr(tel,-4,4),'****') "REPLACE",
    substr(tel,1,instr(tel,'-') ) || '****' replace,
    replace(tel,substr(tel,instr(tel,'-')+1),'****') "REPLACE-s"
from student
where deptno1 =101;



