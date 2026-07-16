/************************************/
DDL 제약조건 KEY

PK(PRIMARY KEY )기본키  (테이블에 한개만 설정가능)
FK(FOREIGN KEY ) 외래키

CREATE TABLE T3
(
no number(3) primary key, --기본키 설정 (not null, unique 포함)
name varchar2(16),
birth date
);

select * from t3;

insert into t3 values (1,'n1',sysdate);
insert into t3 values (1,'n1',sysdate); --no 컬럼 (pk) 중복 불가
insert into t3 values (null,'n1',sysdate); --no 컬럼 (pk) not null 제약

--테이블에는 하나의 기본키만 가질수 있습니다.->생성안됨
create table t4
(
no number(3) primary key,  --기본키(pk) 설정
id varchar2(32)  primary key,  --기본키(pk) 설정
name varchar2(16) not null,
birth date default sysdate
);

--(n개)두 개의 컬럼을 조합해서 pk로 설정

create table t4
(
no number(3),  
id varchar2(32),  
name varchar2(16) not null,
birth date default sysdate,
constraint t4_pk  primary key (no,id) --no,id 두개 컬럼을 조합으로 pk 설정
);

--------------------------------------------------
















