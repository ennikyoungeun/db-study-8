/************************************************/
fk(외래키)

student (profno컬럼)-> professor (profno)

외래키 fk : 다른테이블에 있는 키값 참조하는 컬럼
-참조하는 테이블(부모테이블)에 존재하는 값만 사용가능 (+null가능)
-외래키 대상으로 설정된 부모테이블 입장에서 
자신을 참조하는 자식테이블의 데이터가 존재하면 ,삭제 불가.(설정에 따라 )

외래키 삭제 조건
ON DELETE CASCADE; 부모데이터 삭제시 -> 해당값을 참조하는 자식데이터도 같이 삭제
ON DELETE SET NULL; 부모데이터 삭제시 -> 해당값을 참조하는 자식데이터를 NULL 값으로 변경

;

CREATE TABLE T_CLUB
(
    ID NUMBER(3) PRIMARY KEY,
    NAME VARCHAR2(32)
);

-- T_TABLE명
-- V_VIEW명

DROP TABLE T_MEMBER;

CREATE TABLE T_MEMBER
(
    ID NUMBER(3) PRIMARY KEY,
    NAME VARCHAR2(32),
    -- CLUB_ID REFERENCES T_CLUB(ID) --외래키 FK 설정
    --CLUB_ID REFERENCES T_CLUB(ID) ON DELETE CASCADE  --외래키 FK 설정
     CLUB_ID REFERENCES T_CLUB(ID) ON DELETE SET NULL --외래키 FK 설정
);

SELECT *FROM T_CLUB;
SELECT *FROM T_MEMBER;

select * from T_CLUB;

INSERT INTO T_CLUB VALUES(1, '독서');
INSERT INTO T_CLUB VALUES(2, '게임');
INSERT INTO T_CLUB VALUES(3, '등산');
INSERT INTO T_CLUB VALUES(4, '낚시');

select * from T_MEMBER;

INSERT INTO T_MEMBER VALUES(1, '이름1', 2);
INSERT INTO T_MEMBER VALUES(2, '이름2', 1);
INSERT INTO T_MEMBER VALUES(3, '이름3', 1);

SELECT *
FROM T_MEMBER M, T_CLUB C
WHERE M.CLUB_ID = C.ID;

INSERT INTO T_MEMBER VALUES(1, '이름4', 3); --MEMBER PK ID 중복
INSERT INTO T_MEMBER VALUES(NULL, '이름4', 3);--MEMBER PK ID NOT NULL

INSERT INTO T_MEMBER VALUES(4, '이름4', 5); --부모키가 없습니다??
--FK 참조 부모테이블에 ID값 참조 -> ID 값 존재범위 1~4까지만 존재 5는 존재하지 않음
INSERT INTO T_MEMBER VALUES(4, '이름4', NULL);
INSERT INTO T_MEMBER VALUES(5, '이름5', 3);

SELECT *
FROM T_MEMBER M, T_CLUB C
WHERE M.CLUB_ID = C.ID(+);

SELECT *
--DELETE
FROM T_CLUB
WHERE ID =3;
--자식 레코드가 발견되었습니다.
--ID 3 인 데이터를 외부 자식 테이블에서 참조하고 있는상태-> 삭제불가

참조가 잇으면 삭제불가
삭제하고 싶으면? 참조하는 자식테이블 먼저 삭제

SELECT *
--DELETE
FROM T_MEMBER
WHERE ID = 5; --자식 테이블 데이터 먼저 삭제.

SELECT *
--DELETE
FROM T_CLUB     --참조하는 외부 테이블 데이터가 없으면 삭제가능
WHERE ID = 3;

--------------------------
ON DELETE CASCADE

SELECT *
--DELETE
FROM T_CLUB
WHERE ID = 1;

SELECT * FROM T_MEMBER;
-----------------------

ON DELETE SET NULL

SELECT *
--DELETE
FROM T_CLUB
WHERE ID = 1;

SELECT * FROM T_MEMBER;























