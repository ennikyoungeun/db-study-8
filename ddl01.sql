/*****************************************/
DDL
테이블 조작


테이블생성

CREATE TABLE 테이블명
(
    컬럼명 컬럼타입 기타속성/제약,
    컬럼명 컬럼타입 기타속성/제약,
    컬럼명 컬럼타입 기타속성/제약,
    컬럼명 컬럼타입 기타속성/제약,
    컬럼명 컬럼타입 기타속성/제약,
    컬럼명 컬럼타입 기타속성/제약,
    컬럼명 컬럼타입 기타속성/제약
);


create table new_table1  --테이블스키마(Schema)
(
    no NUMBER(3),         --숫자형 3자리수 
    name VARCHAR2(16),    --16바이트
    birth DATE            --날짜형
);

select * from new_table1;

create table new_table2  --테이블스키마(Schema)
(
    no NUMBER(3),         --숫자형 3자리수 
    name VARCHAR2(16),    --16바이트
    birth DATE            --날짜형
);
select * from new_table2;

select *
from tab; --테이블 조회


select *
from tab
where tname LIKE '%NEW%';


-----------------------------------------
테이블 복사


select * from dept2;

> dept2 테이블 구조 + 데이터 -> 복사 -> dept3 새로운 테이블 생성
select * from dept3;

-->
create table dept3
as
select * from dept2;

> dept2 테이블 구조 일부 +데이터 -> 복사 -> dept4 새로운 테이블복사

create table dept4
as
select dcode, dname from dept2;

select * from dept4;

>dept2 테이블 구조만 복사 (데이터 제외) -> 복사 -> dept5 생성

create table dept5
as select * from dept2
where 1=2; -- 데이터 조회 안되도록 거짓조건 추가

select * from dept5;

-----------------------------
테이블 변경(수정)

select * from dept4;

>loc 컬럼추가
alter table dept4
add (loc varchar2(32));
    --컬럼명 컬럼타입 기타속성/제약
    
>lv 컬럼 추가 ->기본값 1
alter table dept4
add (lv number(3)default 1);

> 컬럼삭제
alter table dept4
drop column lv;

> 테이블 삭제
DROP TABLE 테이블명;

> 테이블 내부 데이터 포맷(초기화)
TRUNCATE TABLE 테이블명;

DDL : rollback 불가, 자동 commit 발생

select * from dept4;

TRUNCATE TABLE dept4;
drop table dept4;









