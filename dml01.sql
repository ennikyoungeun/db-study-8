/***********************************/

DML 테이블 내부의 데이터 조작

데이터 (행) 컬럼 값들 .. 
저장  INSERT
수정  UPDATE 
삭제  DELETE
병합  MERGE

INSERT INTO 테이블 (컬럼명,컬럼명,...)
VALUES (데이터값,데이터값..)

전체 컬럼에 데이터 저장+컬럼순서 맞춰서 저장 ---> 컬럼명 생략가능
INSERT INTO 테이블명
VALUES (데이터값,데이터값..)
;

SELECT *
FROM NEW_TABLE1;

INSERT INTO NEW_TABLE1 (NO, NAME, BIRTH)
VALUES (1,'이름1',SYSDATE);      -->1 행 이(가) 삽입되었습니다.

--DML 커밋 롤백 실행가능..

COMMIT;
ROLLBACK;

INSERT INTO NEW_TABLE1 (NO, NAME, BIRTH)
VALUES ('이름1',2,SYSDATE);   --순서다름, 컬럼 타입 달라서 저장안됨.


INSERT INTO NEW_TABLE1 ( NAME, NO, BIRTH)
VALUES ('이름2',2,SYSDATE);

INSERT INTO NEW_TABLE1 ( NAME, NO, BIRTH)
VALUES ('이름3',3,TO_DATE('2020-01-30'));

SELECT * FROM NEW_TABLE1;

INSERT INTO NEW_TABLE1
VALUES (4,'이름4',SYSDATE); 

INSERT INTO NEW_TABLE1 (NO,NAME)
VALUES (5,'이름5');

INSERT INTO NEW_TABLE1
VALUES (6,'이름6',NULL); 

INSERT ALL
INTO NEW_TABLE1 VALUES (7,'이름7',NULL)
INTO NEW_TABLE1 VALUES (8,'이름8',SYSDATE)
INTO NEW_TABLE1 VALUES (9,'이름9',TO_DATE('2025-12-11'))
SELECT * FROM DUAL;

--TRUNCATE TABLE NEW_TABLE1;
/*------------------------------------*/

다른 테이블 데이터 조회 -> 복사 저장

SELECT * FROM NEW_TABLE1;
SELECT * FROM NEW_TABLE2;

--복사할때 타입 순서 맞춰서.
INSERT INTO NEW_TABLE2
SELECT NO,NAME,BIRTH FROM NEW_TABLE1;

--데이터 4개만 복사.
INSERT INTO NEW_TABLE2
SELECT NO,NAME,BIRTH FROM NEW_TABLE1
WHERE NO<5;

--내가 지정하고 싶은 .. 것
INSERT INTO NEW_TABLE2
SELECT 10,'이름10',SYSDATE FROM DUAL;

/*--------------------------------------*/
수정 UPDATE

UPDATE 테이블명
SET 컬럼명 = 값,
    컬럼명 = 값,
    컬럼명 = 값
WHERE 조건;

SELECT * FROM DEPT3;

Seoul Branch Office -> Icheon Branch Office

update dept3
set area = 'Icheon Branch Office'
--select * from dept3
where area = 'Seoul Branch Office';

commit;

sales1 team-> Sales first Team
update dept3
set dname = 'Sales first Team'
--select * from dept3
--where dname = 'Sales1 Team';
where dcode =1008;  --update에 조건을 누락하면 테이블내의 전체 데이터가 수정됨 주의!!

create table professor2
as
select * from professor;

select * from professor2;
>보너스 받는 교수들 보너스금액 +100 인상

update professor2
set bonus = 200
where profno =1001;

update professor2
set bonus = bonus +100
--select * from professor2
where bonus is not null;

--------------------------------
transaction
TCL

commit; 확정
rollback; 취소 (되돌리기)

DML (insert, update,delete)-> commit or rollback 수행


select * from new_table2;

insert into new_table2 values( 11,'이름11',sysdate);
commit;
rollback;

/*-------------------------*/
DELETE 데이터 삭제
(DB tool 에서 delete 쿼리 수행시 rollback 기능: 단,자동commit 설정이 아닌 상태일 경우)

DELETE FROM 테이블명
WHERE 조건;

SELECT * FROM DEPT3;

select *
--delete
from dept3
where dcode = '0001';

DELETE FROM dept3
where dcode ='0001';

commit;




 




