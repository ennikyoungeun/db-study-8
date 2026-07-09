SELECT * 
FROM student;

1. student 테이블을 참고해서 진행하세요.
학생들의 이름과 주민번호, 생일 그리고  jumin, birthday 참고해서 태어난 날짜별로 분기를 표시하는 쿼리를 작성하세요.
태어난 월에 따라서 각 분기로 표시
1~3 1분기 /4~6 2분기/ 7~9 3분기/ 10~12 4분기
SELECT 
    name,
    jumin,
    birthday,
    case
        when substr(jumin,3,2)between'01'and'03' then '1분기'
        when substr(jumin,3,2)between'04'and'06' then '2분기'
        when substr(jumin,3,2)between'07'and'09' then '3분기'
        when substr(jumin,3,2)between'10'and'12' then '4분기'
    end as 분기
FROM student;


SELECT 
    name,
    jumin,
    birthday,
    to_char(birthday,'mm'), -- 월
    --ceil(rownum/4)
    ceil( to_number(to_char(birthday,'mm'))/3)|| '분기' "분기"
FROM student;

--------------------------------------------------------------
SELECT * 
FROM emp;
2.
emp 테이블을 조회하여 empno , ename , sal , LEVEL(급여등급)을 출력하세요.
단 급여등급은 sal 을 기준으로
1 - 1000 이면 Level 1,
1001 - 2000 이면 Level 2,
2001 - 3000 이면 Level 3,
3001 - 4000 이면 Level 4 ,
4001 보다 많으면 Level 5 로 출력하세요.

SELECT 
empno , ename , sal ,comm,job,
case
    when sal between 1 and 1000 then 'Level 1'
    when sal between 1001 and 2000 then 'Level 2'
    when sal between 2001 and 3000 then 'Level 3'
    when sal between 3001 and 4000 then 'Level 4'
    when sal > 4001 then 'Level 5'
    --else 'level 5'
end as 급여등급
FROM emp;
