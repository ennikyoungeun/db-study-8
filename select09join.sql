/*--------------------*/
join 조인

--join 기준-> 어떤것(컬럼/값)을 기준으로 테이블 데이터를 합쳐서 (연결)조회

SELECT * FROM emp;  --dept 컬럼 부서번호
SELECT * FROM dept; --부서정보테이블 deptno 컬럼(식별자)

select e.empno,e.ename,d.dname,d.loc,e.deptno,d.deptno
--select empno,ename,dname,loc,e.deptno,d.deptno
--SELECT *
--FROM emp A,dept B
FROM emp e,dept d
where e.deptno=d.deptno; -- join 기준

select e.empno,e.ename,d.dname,d.loc,e.deptno,d.deptno
FROM emp e inner join dept d
on e.deptno=d.deptno; -- join 기준

--emp,dept 조인 + 부서번호 20,30 부서만 조회

--오라클 방식,(비 ANSIJOIN 쿼리)
SELECT e.empno,e.ename, e.deptno,d.dname,d.loc
--SELECT *
FROM emp e, dept d
where e. deptno =d.deptno
and e. deptno in (20,30);

--ANSIJOIN 쿼리
SELECT e.empno,e.ename, e.deptno,d.dname,d.loc
FROM emp e inner join dept d
on e.deptno=d.deptno -- join 기준
where e. deptno in (20,30);

/*-----------------------------*/
SELECT * 
FROM EMP E, DEPT D; --조인조건 누락 -> 카티션 곱 : 모든 경우를 다곱함..;

----------------------------------------------------------

SELECT * FROM STUDENT;
SELECT * FROM PROFESSOR;

--ORACLE
SELECT S.NAME 학생명, P.NAME 교수명, S.STUDNO, P.PROFNO,P.EMAIL
FROM STUDENT S,PROFESSOR P
WHERE S.PROFNO = P.PROFNO;

--ANSI
SELECT S.NAME 학생명, P.NAME 교수명, S.STUDNO, P.PROFNO,P.EMAIL
FROM STUDENT S INNER JOIN PROFESSOR P
ON S.PROFNO = P.PROFNO;



/*---------------------------------------------------------*/
INNER JOIN vs OUTER JOIN

--1)INNER JOIN
SELECT S.NAME 학생명, P.NAME 교수명, S.STUDNO, P.PROFNO,P.EMAIL
FROM STUDENT S,PROFESSOR P
WHERE S.PROFNO = P.PROFNO;
--학생&교수 ->15개

SELECT COUNT(*) FROM STUDENT;      --COUTN :20
SELECT COUNT(*) FROM PROFESSOR;    --COUNT :16
--INNER JOIN 수행 -> 조인기준에 따라서 합침 (PROFNO가 같은가?)
--                                     STUDENT테이블에->PROFNO NULL 존재 -> 비교불가-> 제외

--2)OUTER JOIN

select *
from student s, professor p
where s.PROFNO = P.PROFNO(+);
--where P.PROFNO(+) = S.PROFNO;
--where s.PROFNO(+) = P.PROFNO;
--where P.PROFNO) = S.PROFNO(+);

select s.studno,s.name,nvl2(s.profno,'지도교수배정완료','배정요망'),  --decode, case when ...
s.profno, p.profno, p.name
--select *
from student s left outer join professor p
--from professor p left outer join student s     --from 쪽 기준으로 / 왼쪽에다 오른쪽 조인
--from student s right outer join professor p
--from professor p right outer join student s       --right -> 오른쪽에 왼쪽조인
on s.PROFNO = P.PROFNO;


/*-----------------------*/
JOIN 결과갯수
--INNER JOIN
SELECT COUNT(*)
FROM STUDENT S,PROFESSOR P
WHERE S.PROFNO = P.PROFNO;
--학생&교수 ->15개 학생 20,교수16 학생에 교수배정NULL 5개 ->제외
--                      이너조인으로 연결가능한 대상 15개->결과15개

--OUTER
SELECT COUNT(*)
FROM STUDENT S,PROFESSOR P
WHERE S.PROFNO= P.PROFNO(+);
--20개 학생기준 OUTERJOIN
--      학생20기준 -> NULL 이어도 유지  -> 결과 20개

SELECT COUNT(*)
--SELECT *
FROM PROFESSOR P, STUDENT S
WHERE P.PROFNO = S.PROFNO(+); 
--22개     교수16개 -> 학생20개 학생NULL ->교수기준을 남기고,, 교수가 같은 학생이 있어서, 교수가 중복으로 생성가능,,

--지도학생이 없는 교수는?
SELECT COUNT(*)
--SELECT *
FROM PROFESSOR P, STUDENT S
WHERE P.PROFNO = S.PROFNO(+)
AND S.STUDNO IS NULL; 

