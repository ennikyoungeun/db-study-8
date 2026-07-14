/*
참조 테이블 : panmae, product, gift
출력 데이터 : 상품명, 상품가, 구매수량, 총금액,
적립포인트, 새해2배적립포인트, 사은품명, 포인트 범위

- panmae 테이블을 기준으로 포인트를 보여준다.
- 포인트는 구매한 금액 1원당 100의 포인트를 부여한다.
(단, 01월 01인 경우는 새해 이벤트로 인해 1원당 200의 포인트를 부여한다.)
- 적립포인트와 새해2배적립포인트를 모두 보여준다.
(이 경우, 이벤트 날인 01월 01일을 제외하고는 포인트가 동일 할 것이다.)
- 새해2배적립포인트를 기준으로 해당 포인트 기준으로 받을수 있는 사은품을 보여준다.
- 사은품 명 옆에 해당 사은품을 받을 수 있는 포인트의 범위를 함께 보여준다.

* 출력 양식과 컬럼 헤더에 표기되는 이름 확인!
*/
select * from panmae;
select * from product;
select * from gift;


SELECT
    pa.p_date "판매일자",
    p.p_code "상품코드",
    p.p_name  "상품명",
    TO_CHAR(p.p_price, '999,999,999') "상품가",
    pa.p_qty  "구매수량",
    TO_CHAR((p.p_price * pa.p_qty),'999,999,999') "총금액",
    TO_CHAR((p.p_price * pa.p_qty * 100),'999,999,999') "적립포인트",
    --총금액 * 100 "적립포인트",
   TO_CHAR( CASE
        WHEN SUBSTR(pa.p_date, 5, 4) = '0101' -->varchar2..type ㅠㅜㅠㅜ
        THEN p.p_price * pa.p_qty * 200
        ELSE p.p_price * pa.p_qty * 100
    END, '999,999,999') AS "새해2배적립포인트",
    g.gname AS "사은품명",
   TO_CHAR(g.g_start,'999,999,999') AS "포인트START",
   TO_CHAR(g.g_end,'999,999,999') AS "포인트END"

FROM panmae pa, product p, gift g
WHERE pa.p_code = p.p_code
and
    CASE
        WHEN SUBSTR(pa.p_date, 5, 4) = '0101'
        THEN p.p_price * pa.p_qty * 200
        ELSE p.p_price * pa.p_qty * 100
    END
 BETWEEN g.g_start AND g.g_end;
 ---------------t-------------------------
 
select * from panmae;
select * from product;
select * from gift;

select 
--    substr(pm.p_date,1,4)||'-'||substr(pm.p_date,5,2)||'-'||substr(pm.p_date,7,2),
to_char(to_date(pm.p_date,'yyyymmdd'),'yyyymmdd') 판매일자,
pm. p_code 상품코드,
pd.p_name 상품명,

TO_CHAR(pd.p_price,'999,999,999') 상품가,
TO_CHAR(pm.p_qty,'999,999,999') 구매수량, 
TO_CHAR(pm.p_total,'999,999,999') 총금액,
--자리수에 상관없이 콤마처리하고 싶으면.. 길게.. -> 앞에 공백이생김
-->'fm999,999,999,999'
to_char((pm.p_total*100),'999,999,999') 적립포인트,
to_char((case substr(pm.p_date,-4,4)
when '0101' then pm.p_total * 200
else pm.p_total * 100
end),'999,999,999') 새해두배적립포인트1,

TO_CHAR((case
when substr(pm.p_date,-4,4) = '0101' then pm.p_total * 200
else pm.p_total * 100
end),'999,999,999') 새해두배적립포인트2,
 
to_char(decode(substr(pm.p_date,-4,4), '0101', pm.p_total *200,pm.p_total * 100),'fm999,999,999,999') 새해적립포인트3,
gf.gname AS "사은품명",
TO_CHAR(gf.g_start,'999,999,999') AS "포인트START",
TO_CHAR(gf.g_end,'999,999,999') AS "포인트END"
--pm.*
from panmae pm, product pd, gift gf
where pm.p_code = pd.p_code
and decode(substr(pm.p_date,-4,4), '0101', pm.p_total *200,pm.p_total * 100) between gf.g_start and gf.g_end
order by pm.p_date;


 