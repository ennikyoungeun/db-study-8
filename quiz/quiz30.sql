--ONLINE_SALE 테이블에서 동인한 회원이 동일한 상품을 재구매한 데이터를 구하여, 
--재구매한 회원 id와 재구매한 상품 id를 출력하는 sql문을 작성해 주세요.
--결과는 회원 id를 기준으로 오름차순 정렬해 주시고, 회원 id가 같다면 상품 id을 기준으로 내림차순
--정렬해주세요.

CREATE TABLE ONLINE_SALE (
ONLINE_SALE_ID NUMBER NOT NULL,
USER_ID NUMBER NOT NULL,
PRODUCT_ID NUMBER NOT NULL,
SALES_AMOUNT NUMBER NOT NULL,
SALES_DATE DATE NOT NULL
);


INSERT INTO ONLINE_SALE (ONLINE_SALE_ID, USER_ID, PRODUCT_ID, SALES_AMOUNT, SALES_DATE)
VALUES (1, 1, 3, 2, TO_DATE('2022-02-25', 'YYYY-MM-DD'));

INSERT INTO ONLINE_SALE (ONLINE_SALE_ID, USER_ID, PRODUCT_ID, SALES_AMOUNT, SALES_DATE)
VALUES (2, 1, 4, 1, TO_DATE('2022-03-01', 'YYYY-MM-DD'));

INSERT INTO ONLINE_SALE (ONLINE_SALE_ID, USER_ID, PRODUCT_ID, SALES_AMOUNT, SALES_DATE)
VALUES (4, 2, 4, 2, TO_DATE('2022-03-12', 'YYYY-MM-DD'));

INSERT INTO ONLINE_SALE (ONLINE_SALE_ID, USER_ID, PRODUCT_ID, SALES_AMOUNT, SALES_DATE)
VALUES (3, 1, 3, 3, TO_DATE('2022-03-31', 'YYYY-MM-DD'));

INSERT INTO ONLINE_SALE (ONLINE_SALE_ID, USER_ID, PRODUCT_ID, SALES_AMOUNT, SALES_DATE)
VALUES (5, 3, 5, 1, TO_DATE('2022-04-03', 'YYYY-MM-DD'));

INSERT INTO ONLINE_SALE (ONLINE_SALE_ID, USER_ID, PRODUCT_ID, SALES_AMOUNT, SALES_DATE)
VALUES (6, 2, 4, 1, TO_DATE('2022-04-06', 'YYYY-MM-DD'));

INSERT INTO ONLINE_SALE (ONLINE_SALE_ID, USER_ID, PRODUCT_ID, SALES_AMOUNT, SALES_DATE)
VALUES (2, 1, 4, 2, TO_DATE('2022-05-11', 'YYYY-MM-DD'));

select * 
from ONLINE_SALE;

/******************
SELECT....
FROM...
where..
group by 컬럼대상 지정(지정된 컬럼을 기준으로 그룹지어서 계산
            group by에 명시한 컬럼은 select 조회에 사용가능
having  -->그룹 바이로 묶인,,,,조건.
order by
;
*********************/

재구매?
구매횟수 1회이상...

--그룹으로
select user_id,product_id,count(*)
from ONLINE_SALE
group by user_id, product_id;

--서브쿼리 버전
select user_id,product_id
from (select user_id,product_id,count(*) count
      from ONLINE_SALE
      group by user_id, product_id)
where count>1
order by user_id, product_id desc;



--답안쿼리
select user_id,product_id
from ONLINE_SALE
group by user_id, product_id 
having count(*) > 1    --그룹화된 데이터의 행개수 ->그룹내의 데이터 개수 = 구매횟수
order by user_id, product_id desc;





