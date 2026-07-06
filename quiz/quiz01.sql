
--연결 연산자 1번
SELECT 
    name||q'['s ID : ]' ||id||', weight is '||weight ||'kg' "ID AND WEIGHT"
FROM student;

--연결 연산자 2번

SELECT 
    ename||q'[(]'||job||q'[),]'||ename||q'[']'||job||q'[']' "Name And JOB"
FROM emp;


--연결 연산자 3번
SELECT 
    ename||q'['s sal is $]'||sal "Name and Sal"
FROM emp;

