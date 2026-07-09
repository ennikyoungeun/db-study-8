1.
professor 테이블에서 교수의 이름과 부서번호를 출력하고
101 번 부서 중에서 이름이 "Audie Murphy" 교수에게 "BEST!" 라고 출력하고
101번 부서 중에서 이름이 "Audie Murphy" 교수가 아닌 나머지에는 NULL 값을 출력하세요.
만약 101 번 외 다른 학과에 "Audie Murphy" 교수가 있어도 "BEST!" 가 출력되면 안됩니다.

SELECT 
deptno,
name,
 DECODE(deptno,101,decode(name,'Audie Murphy','BEST!',null),NULL) "DECODE"
FROM professor;

--101번 부서 + "Audie Murphy"교수 ->best!
--101 번부서 -> null

--102번 103 "Audie Murphy" best XXX
SELECT 
    deptno,
    name,
    --decode(name,'Audie Murphy','BEST!)
    DECODE(deptno,101,decode(name,'Audie Murphy','BEST!',null),NULL) "DECODE",
    DECODE(deptno,101,(decode(name,'Audie Murphy','BEST!')),NULL) "DECODE",
    DECODE(deptno,101,(decode(name,'Audie Murphy','BEST!'))) "DECODE"
FROM professor;

select 
    deptno,
    name,
    case
    when deptno =101 and name = 'Audie Murphy' then 'best!'
    else null
    end decode
from professor;

select 
    deptno,
    name,
    decode(name,'Audie Murphy','BEST!',null) decode
from professor
where deptno = 101
union all
select 
    deptno,
    name,
    null
from professor
where deptno <> 101;



2.
professor 테이블에서 교수의 이름과 부서번호를 출력하고 101 번 부서 중에서 이름이 "Audie Murphy" 교수에게
비고란에 “BEST!”라고 출력하고 101번 학과의 "Audie Murphy" 교수 외에는 비고란에
“GOOD!”을 출력하고 101번 교수가 아닐 경우는 비고란이 공란이 되도록 출력하세요.
SELECT 
deptno,
name,
 DECODE(deptno,101,decode(name,'Audie Murphy','BEST!','GOOD!'),NULL) "비고"
FROM professor;

select 
    deptno,
    name,
    case
    when deptno =101 and name = 'Audie Murphy' then 'best!'
   when deptno =101 then 'good!'
    else null
    end decode
from professor;

3.
professor 테이블에서 교수의 이름과 부서번호를 출력하고 101 번 부서 중에서
이름이 "Audie Murphy" 교수에게 비고란에 “BEST!” 이라고 출력하고
101번 학과의 "Audie Murphy" 교수 외에는 비고란에 “GOOD!”을 출력하고
101번 교수가 아닐 경우는 비고란에 "N/A" 을 출력하세요.

SELECT 
deptno,
name,
 DECODE(deptno,101,decode(name,'Audie Murphy','BEST!','GOOD!'),'N/A') "비고"
FROM professor;

select 
    deptno,
    name,
    case
    when deptno =101 and name = 'Audie Murphy' then 'best!'
   when deptno =101 then 'good!'
    else 'n/a'
    end decode
from professor;

4.
Student 테이블을 사용하여 제 1 전공 (deptno1) 이 101 번인 학과 학생들의 이름과 주민번호,
성별을 출력하되 성별은 주민번호(jumin) 컬럼을 이용하여 7번째
숫자가 1일 경우 '남자' , 2일 경우 '여자' 로 출력하세요.
SELECT 
    name,
    jumin,
    case
        when substr(jumin,7,1)= '1' then '남자'
        when substr(jumin,7,1)= '2' then '여자'
    end as "성별"
FROM Student
where deptno1 = 101;
-------------t----------
SELECT 
    name,
    jumin,
    substr(jumin,7,1),
    decode(substr(jumin,7,1),'1','남자','2','여자') 성별,
    decode(substr(jumin,7,1),'1','남자','여자') 성별,
    case 
    when substr(jumin,7,1)in ('1','3') then'남자'
    when substr(jumin,7,1)in ('2','4') then '여자'
     end as "성별"
FROM Student
where deptno1 = 101;


5.
Student 테이블에서 1 전공이 (deptno1) 101번인 학생의 이름과 연락처와 지역을 출력하세요.
단,지역번호가 02 는 "SEOUL" , 031 은 "GYEONGGI" , 051 은 "BUSAN" , 052 는 "ULSAN" , 055 는 "GYEONGNAM"입니다.

SELECT 
    name,
    tel,
    case
        when substr(tel,1,instr(tel, ')')-1)='02' then '서울'
        when substr(tel,1,instr(tel, ')')-1)='031' then '경기'
        when substr(tel,1,instr(tel, ')')-1)='051' then '부산'
        when substr(tel,1,instr(tel, ')')-1)='052' then '울산'
        when substr(tel,1,instr(tel, ')')-1)='055' then '경남'
    end as "지역명"
FROM Student
where deptno1 = 101;

-----------------t-----------------------
SELECT
    name,
    tel,
    substr(tel, 1, 3),
    decode(substr(tel,1,3),
           '02)', '서울'),
    substr(tel,1,instr(tel, ')')-1),
    decode(substr(tel,1,instr(tel, ')')-1),
           '02',  'SEOUL',
           '031', 'GYEONGGI',
           '051', 'BUSAN',
           '052', 'ULSAN',
           '055', 'GYEONGNAM',
           '기타') AS area
FROM Student
WHERE deptno1 = 101;






