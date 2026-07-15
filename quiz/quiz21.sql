--1.
--student, department 테이블 활용
--학과 이름, 학과별 최대키, 학과별 최대키를 가진 학생들의 이름과 키를 출력 하세요.


--학과별 최대키
SELECT deptno1, MAX(height) AS max_h 
     FROM student 
     GROUP BY deptno1;

SELECT 
    d.dname,
    s.height AS max_height,
    s.name,
    s.height
FROM 
    student s,
    department d,
    (SELECT deptno1, MAX(height) AS max_h 
     FROM student 
     GROUP BY deptno1) s2
WHERE 
    s.deptno1 = d.deptno
    AND s.deptno1 = s2.deptno1
    AND s.height = s2.max_h;



--2.
--student 테이블에서 학생의 키가 동일 학년의 평균 키 보다 큰 학생들의 학년과 이름과 키,
--해당 학년의 평균 키를 출력 하세요.
--(학년 컬럼으로 오름차순 정렬해서 출력하세요)

SELECT 
    s.grade,
    s.name,
    s.height,
    ROUND(a.avg_height, 1) AS avg_height
FROM 
    student s,
    (SELECT grade, AVG(height) AS avg_height 
     FROM student 
     GROUP BY grade) a
WHERE 
    s.grade = a.grade
    AND s.height > a.avg_height
ORDER BY 
    s.grade ;
    
    ---------------------------t-----------------
    
    1.
student, department 테이블 활용
학과 이름, 학과별 최대키, 학과별 최대키를 가진 학생들의 이름과 키를 출력 하세요.


select d.dname, s.height max_height, s.name, s.height
from student s, department d
where (s.deptno1, s.height) IN (select deptno1, MAX(height)
                                from student
                                group by deptno1)
and s.deptno1 = d.deptno;


select C.dname, A.max_height, B.name, B.height
from 
(select deptno1, MAX(height) max_height
    from student
    group by deptno1) A, student B, department C
where A.deptno1 = B.deptno1
AND A.max_height = B.height
AND A.deptno1 = C.deptno;





2.
student 테이블에서 학생의 키가 동일 학년의 평균 키 보다 큰 학생들의 학년과 이름과 키,
해당 학년의 평균 키를 출력 하세요.
(학년 컬럼으로 오름차순 정렬해서 출력하세요)
;


 select grade, AVG(height)
    from student
    group by grade;
    
select
    s1.grade,
    s1.name,
    s1.height,
    (select AVG(height)
        from student s2
        where s2.grade = s1.grade
        ) AVG_HEIGHT
from student s1
where s1.height >  (select AVG(height)
                    from student s2
                    where s2.grade = s1.grade
                    )
order by s1.grade;

select s1.grade, s1.name, s1.height, s2.avg_height
from student s1,
     (select grade, AVG(height) avg_height
        from student
        group by grade) s2
where s1.grade = s2.grade
AND s1.height > s2.avg_height
order by s1.grade;
    



