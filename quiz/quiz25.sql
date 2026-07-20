※ 과정에 따라 수행한 전체 쿼리 모아서 제출
1. 테이블 생성 쿼리
2. 데이터 저장 쿼리
3. 데이터 수정 쿼리
4. 데이터 삭제 쿼리
5. 데이터 조회 쿼리

* 다음 조건에 맞는 테이블을 생성하시오.
* 테이블명 : T_MENU_12
;
* 내부 컬럼 (컬럼명은 적절하게 지을 것!)
메뉴 아이디 : 숫자형, 기본키
메뉴 이름 : 128바이트 문자형, Null 이면 안됨!
가격 : 10자리 숫자형
종류 : 64바이트 문자형, Null 가능
메뉴개발일자 : 날짜타입

CREATE TABLE T_MENU_12(
 MENU_ID NUMBER PRIMARY KEY,
 MENU_NAME VARCHAR2(128) NOT NULL,
 PRICE NUMBER(10),
 TYPE VARCHAR2(64),
 M_DATE DATE
 );


* 아래 데이터를 테이블에 저장하시오.
SELECT * FROM T_MENU_12;
1 싸이버거 6000 완전식품 저장시점
INSERT INTO T_MENU_12 (MENU_ID,MENU_NAME,PRICE,TYPE,M_DATE)
VALUES (1,'싸이버거',6000,'완전식품',SYSDATE);

2 콩나물비빔밥 7000 탄수화물 저장시점
INSERT INTO T_MENU_12 (MENU_ID,MENU_NAME,PRICE,TYPE,M_DATE)
VALUES (2,'콩나물비빔밥',7000,'탄수화물',SYSDATE);

3 닭가슴살 3000 단백질 저장시점
INSERT INTO T_MENU_12 (MENU_ID,MENU_NAME,PRICE,TYPE,M_DATE)
VALUES (3,'닭가슴살',3000,'단백질',SYSDATE);
4 베트남쌀국수 8000 탄수화물 저장시점
INSERT INTO T_MENU_12 (MENU_ID,MENU_NAME,PRICE,TYPE,M_DATE)
VALUES (4,'베트남쌀국수',8000,'탄수화물',SYSDATE);
5 라면 2000 밀가루 저장시점
INSERT INTO T_MENU_12 (MENU_ID,MENU_NAME,PRICE,TYPE,M_DATE)
VALUES (5,'라면',2000,'밀가루',SYSDATE);
* 생성한 해당 데이터를 조회하시오.
SELECT * FROM T_MENU_12;
* 베트남쌀국수의 가격을 8500원으로 변경하시오.
UPDATE T_MENU_12
SET PRICE = 8500
WHERE MENU_NAME = '베트남쌀국수';

* 메뉴에서 라면을 삭제하시오.

DELETE FROM T_MENU_12
where MENU_NAME = '라면';

SELECT * FROM T_MENU_12;

COMMIT;
