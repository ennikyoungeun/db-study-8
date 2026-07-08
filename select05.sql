/*----------------------------------------------*/
형변환 (타입변환)

TO_CHAR     ->문자로
TO_DATE     ->날짜로
TO_NUMBER   ->숫자로

select 2 + 2 from dual;
select 2 + '2' from dual; --자동형변환(묵시적형변환)
select 2 || '2' from dual; 
select 2 + TO_NUMBER('2') from dual;--명시적 형변환

SELECT 
    to_char(12341),
    to_char(123.503),
    sysdate,
    to_char(sysdate,'YYYY'),  -- y m d
    to_char(sysdate,'YY'),
    to_char(sysdate,'MM'),
    to_char(sysdate,'DD'),
    to_char(sysdate,'yymmdd'),
    to_char(sysdate,'yy/mm/dd'),
    to_char(sysdate,'yy-mm-dd')
FROM dual;


--jumin 문자 타입 ->substr
--birthday 날짜타입 -> to_char


select
 name,jumin,birthday,
 to_char(birthday, 'yy') "년도",
 to_char(birthday,'mm') "월",
 to_char(birthday,'dd') "일",
 to_char(birthday,'yyyy-mm-dd')
from student;

select --날짜, 시간
    sysdate,
    to_char(sysdate,'yyyy-mm-dd hh24:mi:ss'),
    systimestamp,
    to_char(sysdate,'yyyy-mm-dd hh24:mi:ss')
from dual;

--숫자
select
to_number('12323'),
to_number('123.343')
--to_number('123929adf'),   오류 발생
from dual;

select
    to_char(1234, '999999'),
    to_char(1234, '0999999'),
    to_char(1234, '$999999'),
    '$'||1234, -- 위랑 같은거, 
    to_char(1234, '9999.99'),
    to_char(12345678, '999,999,999')
from dual;

select
    --'2025-12-02' +3
    '2025-12-02' || 3, -- -> 덧셈X, 이어붙음
    to_date('2025-12-02') +3, --날짜계산 ->3일뒤
    to_date('2025/12/02') +5,
    to_date('2025/12/02') +7,
    to_date('20251202') +9,
    last_day('2024-02-03'),
    last_day( to_date('2024-02-03')),
    to_date('205-03-04', 'yyyy-mm-dd'),
    to_date('205/03/04', 'yyyy/mm/dd'),
    to_date('205,03,04', 'yyyy,mm,dd'),
    to_date('205-03-04', 'yyyy-mm-dd')
from dual;

select
    '2026-03-23',
    substr('2026-03-23',6,2), --월
    to_char ( to_date('2026-03-23'), 'mm') "월추출"
from dual;



