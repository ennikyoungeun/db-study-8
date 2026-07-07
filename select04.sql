/*-----------------------------------*/
단일행 함수

select * from dual;
dual : 더미데이터가 있는 임시테이블

SELECT INITCAP ('abc') from dual; -- INITCAP :맨앞글자만 대문자
select ename, initcap(ename) from emp;

select name, lower(name),upper(name) --lower(소문자변환),upper(대문자변환)
from student;

-- length('글자수'), lengthb('바이트기준'),
select name, length(name)
from student;

select 
length('abcd'), lengthb('abcd'),
length('한글'), lengthb('한글') --한글 한글자에 3byte.
from dual;

--이름이 5글자 이상인 사람만 조회
select *
from emp
where length(ename) >= 5;

select 
'아침'||'점심'||'저녁',
concat('아침','점심'), --  concat연결함수 매개변수 2개만.
concat(concat('아침','점심'),'저녁') --중첩으로 이어붙..
from dual;

--substr(대상값 |컬럼명, 시작지점(1~), 자릿수)
select
substr('abcdefg',1,3),  -- 처음부터 3개
substr('abcdefg',3,5),  --3부터5개
substr('abcdefg',-4,2), --뒤에서 4번째 부터 2개
substr('abcdefg',-3,3)
from dual;

--instr(대상값 |컬럼명, 찾는값)
--instr(대상값 |컬럼명, 찾는값, 시작위치)
--instr(대상값 |컬럼명, 찾는값,시작위치, 몇번째값)

select
'2026-01-02 10:11:33',
instr('2026-01-02 10:11:33','-'),
instr('2026-01-02 10:11:33','-',6),
instr('2026-01-02 10:11:33',':',15),
instr('2026-01-02 10:11:33','-',1,2)
from dual;

select
    tel,
    instr(tel, ')'),
    instr(tel, '-')
from student;

--lpad rpad 왼쪽 오른쪽 채우기
select
    lpad('문자',10,'-'),
    rpad('13ab',8, '*'),
    lpad(5,2,0),
    lpad(5,3,0),
    lpad(77,2,0)
from dual;
--trim 빈칸 (띄어쓰기칸) 처리
select
    '*'||' abcd '||'*',
    '*'||ltrim(' abcd ')||'*',
    '*'||rtrim(' abcd ')||'*',
    '*'||trim(' abcd ')||'*',
    ltrim('**abcd**','*'), --왼쪽 * 삭제
    rtrim('**abcd**','*')  --오른쪽* 삭제
from dual;

--replace : 대체, 변경
-- replace( 기준값, 찾는대상, 바꿀값)
select
    replace('abcde','c','/')
from dual;

select
    birthday,
    replace(birthday,'/','$')
from student;

/*------------------------------*/
숫자

select
    round(1.123), --반올림
    round(1.789),
    round(1.789, 1),--소수점 1번째 자리수까지
    round(1.788613, 3),
    round(1.789613, 0), --1의 자리수까지
    round(3561.4564, -1),
    trunc(1.12244), --버림
    trunc(1.167844, 2),
    mod(15,4),  --나머지 연산 15%4
    ceil(123.123), --인접한 큰 정수
    floor(123.123), -- 인접한 작은 정수
    power(6, 3) --6의 3 제곱 6*6*6
from dual; 

--그룹화 ceil 함수 활용
select
    rownum,    --조회 결과에 대해서 행번호
    ceil (rownum/3) 그룹번호,
    ceil(rownum/4) 팀번호,
    empno,
    ename
from emp;

--1/3 =0.33 2/3 =0.66 3/3 =1
--      1          1       1
--4/3 =1.33 5/3 -1.66 6/3=2   ------->2


/*---------------------------------*/
--날짜

select 
    SYSDATE, --현재날짜
    SYSTIMESTAMP, --현재 날짜시간
    MONTHS_BETWEEN('2024-01-05','2024-03-05'),
    MONTHS_BETWEEN('2024-11-05','2024-04-20')
    --앞날짜 -뒷날짜 -> 월단위 환산
from dual;

select
    ADD_MONTHS(SYSDATE, 3),  --3달뒤
    ADD_MONTHS(SYSDATE, 6),
    ADD_MONTHS(SYSDATE, -4), --4개월전
    LAST_DAY(SYSDATE), --해달 날짜 (월) 기준 마지막 일자  28,29,30,31
    NEXT_DAY(SYSDATE,'월'), -- 돌아오는 날짜지정
    NEXT_DAY(SYSDATE,'화')
FROM DUAL;

select
    sysdate,
    round(sysdate),  --반올림
    trunc(sysdate),  --버림
    trunc(sysdate, 'YY'),  --연도단위로 버림
    trunc(sysdate, 'MM'),
    trunc(sysdate, 'DD'),
    ADD_MONTHS(SYSDATE,1),  --월단위 계산 +1월
    sysdate +3,        --일단위 계산 +3일
    sysdate+7,
    --다음달 첫날
    last_day(sysdate)+1,
    trunc(add_months(sysdate, 1),'MM'),
    --전월의 마지막날
    LAST_DAY(ADD_MONTHS(SYSDATE, -1)),
    TRUNC(SYSDATE,'MM')-1
from dual;





