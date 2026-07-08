--1. 학생들 중에 키가 160~175인 학생들의 학번/이름/아이디 와
-- 교수들 중에 101/102/103/201 학과에 속하면서 보너스를 받지 않는 교수들의
-- 교수번호/이름/아이디 를 모두 취합해서 한번에 보여주시오.


select 
    studno,
    name,
    id
from student
where height between 160 and 175

union all

select 
    profno,
    name,
    id
from professor
where (deptno in (101, 102, 103, 201)) and bonus is null;


--2.학생들의 이름, 아이디, 주민번호를 아래와 같은 형태로 정리해서 보여주시오.

select 
    '이름:'||name "이름",
    '아이디:'||id "아이디",
    '주민번호:'||substr(jumin,1,6)||'-'||substr(jumin,7,7)"주민번호",
    '주민번호:'||substr(jumin,1,6)||'-'||substr(jumin,7)"주민번호",
    '주민번호:'||substr(jumin,1,6)||'-'||substr(jumin,-7,7)"주민번호"
from student;


