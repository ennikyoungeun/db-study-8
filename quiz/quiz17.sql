1. 학생 테이블 (student) 과 학과 테이블 (department) 테이블을 사용하여
학생이름, 1전공학과번호(deptno1) , 1전공 학과 이름을 출력하세요.



select * from student;
select * from department;

select
s.name,
s.deptno1,
d.dname
from student s, department d
where s.deptno1 = d.deptno
order by deptno1; 

--------------t-----

select *
from student;
select *
from department;

select s.name, s.deptno1, d.dname
from student s, department d
where s.deptno1 = d.deptno;   --INNER JOIN




2. emp2 테이블과 p_grade 테이블을 조회하여
현재 직급이 있는 사원의 이름과 직급, 현재 연봉,
해당 직급의 연봉의 하한금액과 상한 금액을
아래 결과 화면과 같이 출력하세요.
=======
--------------------------

2. emp2 테이블과 p_grade 테이블을 조회하여
현재 직급이 있는 사원의 이름과 직급, 현재 연봉,
해당 직급의 연봉의 하한금액과
상한 금액을 아래 결과 화면과 같이 출력하세요.


select * from emp2;
select * from p_grade;

=======
select 
e.name,
e.position,
to_char(e.pay,'999,999,999'),
to_char(p.s_pay,'999,999,999') "low pay",
to_char(p.e_pay,'999,999,999') "high pay"
from emp2 e, p_grade p
where e.pay between p.s_pay and p.e_pay
and e.position is not null;

--------------t----------------
select * from emp2;
select * from p_grade;



select * from emp2
where position is not null;

select 
    e.name, 
    e.position, 
    TO_CHAR(e.pay, '999,999,999') pay,
    TO_CHAR(p.s_pay, '999,999,999') s_pay,
    TO_CHAR(p.e_pay, '999,999,999') e_pay
from emp2 e, p_grade p
where e.position is not null
--and e.position = p.position;  --INNER JOIN
and e.position = p.position(+);  --OUTER JOIN


from emp2 e LEFT OUTER JOIN p_grade p
ON e.position = p.position;  --OUTER JOIN


3. Emp2 테이블과 p_grade 테이블을 조회하여
사원들의 이름과 나이, 현재 직급 , 예상 직급 을 출력하세요.
예상 직급은 나이로 계산하며 해당 나이가 받아야 하는 직급을 의미합니다.
나이는 '2010-05-30'을 기준으로 하되 가능하면 trunc 로 소수점 이하는 절삭해서 계산하세요.

select 
e.name name,
trunc(months_between(
to_date('2010-05-30','yyyy-mm-dd'),e.birthday)/12) "한국나이",
e.position "지금 포지션",
p.position "그나이에 맞는 포지션"
from emp2 e, p_grade p
where trunc(months_between(to_date('2010-05-30','yyyy-mm-dd'),e.birthday)/12)
between p.s_age and p.e_age;


-------------------------------------------t-----------------
------------------심플한국나이
select  e.name,
        birthday,
        2010-to_char(birthday,'yyyy')+1 한국나이,
        e.position  지금포지션,
        p.position 그나이에맞는포지션
        --p.*
from emp2 e, p_grade p
--where 한국나이 between p.s_age and p.e_age;
where (2010-to_char(birthday,'yyyy')+1) between p.s_age and p.e_age;
--조인조건     나이s_age   e_age 사이 포함

--만나이
select
birthday,
to_date('2010-05-30'),
to_date('2010-05-30') - birthday 일단위계산,
(to_date('2010-05-30') - birthday)/365,
trunc((to_date('2010-05-30') - birthday)/365) 일단위계산나이,
months_between(to_date('2010-05-30'),birthday) 월단위차이,
months_between(to_date('2010-05-30'),birthday)/12 월단위차이계산,
trunc(months_between(to_date('2010-05-30'),birthday)/12) 월단위차이계산
from emp2;


=======


4 . customer 테이블과 gift 테이블을 Join하여 
고객이 자기 포인트보다 낮은 포인트의 상품 중 한가지를 선택할 수 있다고 할 때 
Notebook 을 선택할 수 있는 고객명과 포인트, 상품명을 출력하세요.


select * from customer;
select * from gift;
=======
select *
from customer;
select *
from gift;


select
c.gname,
c.point,
g.gname
from customer c, gift g
where c.point >= g.g_start
and g.gname = 'Notebook';

-------------------------------t--
select
c.gname,
c.point,
g.gname
from customer c, gift g
where c.point between g.g_start and g.g_end 
--and g.gname = 'Notebook';
and g.gno =7; -- 명확하게 지정할수있는 ..

SELECT 
c.gname,
c.point,
g.gname
FROM customer c, gift g
where c.point >= g.g_start
and g.gno = 7 --노트북
order by c.gno,g.gno;

SELECT 
c.gname,
c.point,
'notebook' --g.gname
FROM customer c, gift g
where c.point between g.g_start and g.g_end 
and g.gno >=7;
--gno가 7이상 -> 모두 노트북 수령가능

--서브쿼리 맛보기
--조건 ? 참 : (조건 ? (조건 ? 참:거짓) :거짓)
쿼리안에 쿼리 ->서브쿼리
select (select from  where)
from (select from  where)
where(select from  where)
(select from  where)
;

select *
from customer
where point >= (select g_start
                from gift
                where gno = 7);

select g_start
from gift
where gno = 7;

=======


5. professor 테이블에서 교수의 번호, 교수이름, 입사일, 자신보다 입사일 빠른 사람 인원수를 출력하세요.
단 자신보다 입사일이 빠른 사람수를 오름차순으로 출력하세요.

select * from professor;

select 
p1.profno,
p1.name,
p1.hiredate,
count(p2.profno) as "count"
from professor p1,professor p2
where p1.hiredate > p2.hiredate(+)
group by p1.profno,p1.name,p1.hiredate
order by "count";

-----------------t--------------------
--85/09/18
select 
count(*)
from professor
where hiredate < '85/09/18';

-- COUNT(*) → NULL 포함, 모든 행 개수
-- COUNT(컬럼명) → NULL 제외, 값이 있는 행만 개수


select 
p1.profno,p1.name,p1.hiredate,
p2.profno,p2.name,p2.hiredate
from professor p1,professor p2
where p1.hiredate > p2.hiredate;

select 
p1.profno,p1.name,p1.hiredate,
p2.profno,p2.name,p2.hiredate
from professor p1,professor p2
where p1.hiredate > p2.hiredate(+);

select 
p1.profno,p1.name,p1.hiredate,
count(p2.profno) count -- COUNT(*) → NULL 포함, 모든 행 개수
                       --COUNT(컬럼명) → NULL 제외, 값이 있는 행만 개수
from professor p1,professor p2
--where p1.hiredate > p2.hiredate  --inner join 조인조건에 맞는게 없으면 제외
where p1.hiredate > p2.hiredate(+) -- 제일먼저 입사한 머피가 사라지지 않도록 outer join
group by  p1.profno,p1.name,p1.hiredate
--order by count;
order by 4; --컬럼 순서
--그룹에 명시 -> select  가능

--순위 입사일자 빠른거 기준으로 순위 랭크

select
    profno,name,hiredate,
    rank() over (order by hiredate ) -1 as "count"
from professor;

******************************
ROW_NUMBER() : 무조건 1, 2, 3, 4...
RANK() : 공동 순위가 있으면 다음 순위를 건너뜀
DENSE_RANK() : 공동 순위가 있어도 다음 순위를 건너뛰지 않음
시험에서 한 줄로 외우기
RANK() : 공동 순위 허용, 다음 순위 건너뜀
DENSE_RANK() : 공동 순위 허용, 다음 순위 안 건너뜀
ROW_NUMBER() : 공동 순위 없이 번호를 순서대로 부여
;
******************************************

=======

6. emp 테이블에서 사원번호,
사원이름, 입사일, 자신보다 먼저 입사한 사람 인원수를 출력하세요. 단 자신보다 입사일이 빠른 사람수를 오름차순으로 출력하세요.

select
e1.empno,
e1.ename,
e1.hiredate,
count(e2.empno) as "count"
from emp e1,emp e2
where e1.hiredate > e2.hiredate(+) --outer join
group by e1.empno,e1.ename,e1.hiredate
order by "count";

------------t----------------------------
select
empno,
ename,
hiredate,
rank() over (order by hiredate ) -1 as "count"
from emp;
=======
where e1.hiredate > e2.hiredate(+)
group by e1.empno,e1.ename,e1.hiredate
order by "count";

