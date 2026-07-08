--1.Student 테이블에서 모든 학생들의 이름과 태어난 생일 년도, 생일 월, 생일 일 을 구분해서 출력하세요.

select name,birthday
from student;

select
--    name "이름",
--    substr(birthday, 1,2) "년도",
--    substr(birthday,4,2) "월",
--    substr(birthday,7,2) "일",
    --date 타입
    substr(jumin, 1,2) "년도",
    substr(jumin, 3,2) "월",
    substr(jumin, 5,2) "일"
from student;


--2.
--Student 테이블의 tel 컬럼을 사용하여 1 전공번호(deptno1)가 201번인
--학생의 이름과 전화번호, ‘)‘ 가 나오는 위치를 출력하세요.

select name,tel
,instr(tel, ')') "괄호위치"
from student
WHERE DEPTNO1 IN (201);
--where deptno1 = 201;

--3.
--Student 테이블에서 1 전공이 101번인 학생들의 tel 컬럼을 조회하여
-- 3 이 첫 번째로 나오는 위치를 이름과 전화번호와 함께 출력하세요.

select name,tel
,instr(tel, '3') "첫3위치" --instr(tel,3,1,1)
from student
where deptno1 = 101;

--4.Student 테이블을 참조해서 아래 화면과 같이
--1 전공이(deptno1 컬럼) 201번인 학생의 이름과 전화번호와 지역번호를 출력하세요.
--단 지역번호는 숫자만 나와야 합니다.

select
    name,tel,
    substr(tel,1,instr(tel,')')-1) "지역번호"
--substr->글자 잘라내기->(대상값 |컬럼명, 시작지점(1~), 자릿수)->
--자릿수 위치에 (instr->주어진 문자열 내에서 특정 부분 문자열(또는 문자)이 처음으로 나타나는 시작 위치(인덱스)를 반환하는 문자열 검색 함수
--instr(대상값 |컬럼명, 찾는값)=>자리수..위치까지-> )빼고 출력-> -1
from student
where deptno1 = 201;



