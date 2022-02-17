/* 고객 테이블 생성 */
create table custom(cusid varchar2(16) primary key, cuspw varchar2(16) not null, cusname varchar2(40) not null, cusemail varchar2(40), custel varchar2(13), zipcode varchar(7), addr1 varchar(80), addr2 varchar2(80), cuspoint number(8), visited number(8))
alter table custom add regdate Date;  -- 고객 테이블에 가입일 추가
alter table custom add grade number(1); -- 고객 테이블에 회원등급 추가
insert into custom values ('admin', '1234', '관리자', 'admin@shop.com', '010-0000-0000','111-11', '경기도 고양시 덕양구', '화정동 283', 1, 0, sysdate, 4);
insert into custom values ('kkt09072', '4321', '김기태', 'kkt09072@naver.com', '010-1234-1234','121-10', '경기도 고양시 일산동구', '도내동 20', 1, 0, sysdate, 4);
insert into custom values ('kwak', '1111', '곽규진', 'kwak@naver.com', '010-4321-4321','132-21', '경기도 고양시 일산동구', '화정동 382', 1, 0, sysdate, 4);
insert into custom values ('sin1004', '2222', '신수석', 'sin1004@daum.net', '010-1278-3495','133-24', '경기도 파주시', '야당동 1148', 1, 0, sysdate, 4);
insert into custom values ('daeho', '3333', '이대호', 'daeho@gmail.com', '010-8282-8282','138-81', '경기도 일산서구', '주엽동 324', 1, 0, sysdate, 4);
insert into custom values ('geunhee', '4444', '김근희', 'geunhee@naver.com', '010-2424-2424','124-48', '경기도 고양시 일산동구', '정발산동 992', 1, 0, sysdate, 4);

select * from custom;
update custom set grade=4 where cusid!='admin'
update custom set grade=1 where cusid='admin'
desc custom

create table inform(seq number(8) primary key, nickname varchar2(40) not null, title varchar2(100) not null, incontent varchar2(500) not null, regdate Date not null, grade number(1), userid varchar(16));
select * from inform;
desc inform
/* 공지사항 및 게시판에 데이터 삽입 전에 시퀀스 생성 */
create sequence system.inform_seq increment by 1 start with 1 minvalue 1 maxvalue 999999 nocycle nocache;
/* 공지사항 및 게시판에 데이터 삽입 후 현재 번호 조회 */
select inform_seq.curval from dual;
insert into inform values (inform_seq.nextval, '관리자', '처음 작성해보는 글', '여기는 처음글에 대한 내용입니다. 잘 읽으시고 독후감을 써주세요', sysdate, 2, 'admin');
insert into inform values (inform_seq.nextval, '관리자', '2작성해보는 글', '여기는 2글에 대한 내용입니다. 잘 읽으시고 독후감을 써주세요', sysdate, 1, 'admin');
insert into inform values (inform_seq.nextval, '관리자', '3 작성해보는 글', '여기는 3글에 대한 내용입니다. 잘 읽으시고 독후감을 써주세요', sysdate, 3, 'admin');
insert into inform values (inform_seq.nextval, '관리자', '4 작성해보는 글', '여기는 4글에 대한 내용입니다. 잘 읽으시고 독후감을 써주세요', sysdate, 3, 'admin');
insert into inform values (inform_seq.nextval, '관리자', '5 작성해보는 글', '여기는 5글에 대한 내용입니다. 잘 읽으시고 독후감을 써주세요', sysdate, 2, 'admin');
insert into inform values (inform_seq.nextval, '관리자', '6 작성해보는 글', '여기는 6글에 대한 내용입니다. 잘 읽으시고 독후감을 써주세요', sysdate, 1, 'admin');
insert into inform values (inform_seq.nextval, '관리자', '7 작성해보는 글', '여기는 7글에 대한 내용입니다. 잘 읽으시고 독후감을 써주세요', sysdate, 1, 'admin');
insert into inform values (inform_seq.nextval, '관리자', '8 작성해보는 글', '여기는 8글에 대한 내용입니다. 잘 읽으시고 독후감을 써주세요', sysdate, 3, 'admin');
insert into inform values (inform_seq.nextval, '관리자', '9 작성해보는 글', '여기는 9글에 대한 내용입니다. 잘 읽으시고 독후감을 써주세요', sysdate, 2, 'admin');
insert into inform values (inform_seq.nextval, '관리자', '10 작성해보는 글', '여기는 10글에 대한 내용입니다. 잘 읽으시고 독후감을 써주세요', sysdate, 3, 'admin');
insert into inform values (inform_seq.nextval, '관리자', '11 작성해보는 글', '여기는 11글에 대한 내용입니다. 잘 읽으시고 독후감을 써주세요', sysdate, 2, 'admin');
insert into inform values (inform_seq.nextval, '관리자', '12 작성해보는 글', '여기는 12글에 대한 내용입니다. 잘 읽으시고 독후감을 써주세요', sysdate, 1, 'admin');
insert into inform values (inform_seq.nextval, '관리자', '13 작성해보는 글', '여기는 13글에 대한 내용입니다. 잘 읽으시고 독후감을 써주세요', sysdate, 2, 'admin');
insert into inform values (inform_seq.nextval, '관리자', '14 작성해보는 글', '여기는 14글에 대한 내용입니다. 잘 읽으시고 독후감을 써주세요', sysdate, 3, 'admin');
insert into inform values (inform_seq.nextval, '관리자', '15 작성해보는 글', '여기는 15글에 대한 내용입니다. 잘 읽으시고 독후감을 써주세요', sysdate, 1, 'admin');
insert into inform values (inform_seq.nextval, '관리자', '16 작성해보는 글', '여기는 16글에 대한 내용입니다. 잘 읽으시고 독후감을 써주세요', sysdate, 2, 'admin');
insert into inform values (inform_seq.nextval, '관리자', '17 작성해보는 글', '여기는 17글에 대한 내용입니다. 잘 읽으시고 독후감을 써주세요', sysdate, 2, 'admin');
insert into inform values (inform_seq.nextval, '관리자', '18 작성해보는 글', '여기는 18글에 대한 내용입니다. 잘 읽으시고 독후감을 써주세요', sysdate, 3, 'admin');
insert into inform values (inform_seq.nextval, '관리자', '19 작성해보는 글', '여기는 19글에 대한 내용입니다. 잘 읽으시고 독후감을 써주세요', sysdate, 2, 'admin');
insert into inform values (inform_seq.nextval, '관리자', '20 작성해보는 글', '여기는 20글에 대한 내용입니다. 잘 읽으시고 독후감을 써주세요', sysdate, 2, 'admin');
insert into inform values (inform_seq.nextval, '관리자', '21 작성해보는 글', '여기는 21글에 대한 내용입니다. 잘 읽으시고 독후감을 써주세요', sysdate, 1, 'admin');
commit;
alter table inform add visited number(8);
update inform set visited=0;

/* 상품 테이블 생성 */
create table prolist2(proid number(8) primary key, protype varchar2(20) not null, proname varchar2(20) not null, procom varchar2(80), price number(8), cnt number(4))
/* 상품 테이블에 데이터 삽입 전에 시퀀스 생성 */
create sequence system.prolist2_seq increment by 1 start with 1 minvalue 1 maxvalue 999999 nocycle nocache;
insert into prolist2 values (prolist2_seq.nextval,'신발 270','나이키 에어','신규 브랜드 론칭 이벤트 상품',270000,5)
insert into prolist2 values (prolist2_seq.nextval,'니트 XL','베이직','베스트 셀러 이벤트 상품',80000,4)
insert into prolist2 values (prolist2_seq.nextval,'롱넥 L','티셔츠','시즌 마감 이벤트 상품',60000,2)
insert into prolist2 values (prolist2_seq.nextval,'스커트 XL','미니스커트','시즌 마감 이벤트 상품',110000,6)
insert into prolist2 values (prolist2_seq.nextval,'모자 T','야구 모자','시즌 마감 이벤트 상품',40000,4)
insert into prolist2 values (prolist2_seq.nextval,'벨트 남성용','가죽 벨트','베스트 셀러 이벤트 상품',50000,3)
insert into prolist2 values (prolist2_seq.nextval,'스타킹 L','일반 스타킹','신규 브랜드 론칭 이벤트 상품',10000,10)
insert into prolist2 values (prolist2_seq.nextval,'블라우스 M','블라우스','뉴시즌 오픈 이벤트 상품',90000,5)
insert into prolist2 values (prolist2_seq.nextval,'점퍼 55','여성용 봄점퍼','뉴시즌 오픈 이벤트 상품',140000,4)
alter table prolist2 add imgdata varchar2(100)
alter table prolist2 add visited number(8)
alter table prolist2 drop column visited
alter table prolist2 modify protype varchar2(100) 
alter table prolist2 modify proname varchar2(100)
alter table prolist2 modify procom varchar2(500)
update prolist2 set visited=0;
select * from prolist2;


/* 장바구니 테이블 생성 */
create table basket(basketid number(8) primary key, userid varchar2(16), proid number(8), cnt number(8), validity number(1))
/* 장바구니 테이블에 데이터 삽입 전에 시퀀스 생성 */
create sequence system.basket_seq increment by 1 start with 1 minvalue 1 maxvalue 999999 nocycle nocache;

/* 결제 테이블 생성 */
create table payment(payid number(8) primary key, userid varchar2(16), proid number(8), cnt number(8), addr1 varchar2(100), contact varchar2(40), paytype number(2), creditnum varchar2(30), credipw varchar2(10));
alter table payment modify paytype number(4);
/* 결제 테이블에 데이터 삽입 전에 시퀀스 생성 */
create sequence system.payment_seq increment by 1 start with 1 minvalue 1 maxvalue 999999 nocycle nocache;

/* 결제 방식 테이블 */
create table paytype(paymethod number(4) primary key, paytype varchar2(20), acccomp varchar2(30), accnum varchar2(30));
create sequence system.paytype_seq increment by 1 start with 1 minvalue 1 maxvalue 999999 nocycle nocache;
insert into paytype values (paytype_seq.nextval, '카드', '신한카드', '000-000-000');
insert into paytype values (paytype_seq.nextval, '카드', '농협카드', '000-000-000');
insert into paytype values (paytype_seq.nextval, '카드', '우리카드', '000-000-000');
insert into paytype values (paytype_seq.nextval, '카드', '롯데카드', '000-000-000');
insert into paytype values (paytype_seq.nextval, '카드', '현대카드', '000-000-000');
insert into paytype values (paytype_seq.nextval, '카드', '아메리칸익스프레스', '000-000-000');
insert into paytype values (paytype_seq.nextval, '카드', '하나카드', '000-000-000');

insert into paytype values (paytype_seq.nextval, '계좌이체', '우리은행', '002-279121-18-311');
insert into paytype values (paytype_seq.nextval, '계좌이체', '국민은행', '119590-12-799819');
insert into paytype values (paytype_seq.nextval, '계좌이체', '하나은행', '464-908739-14037');
insert into paytype values (paytype_seq.nextval, '계좌이체', '외환은행', '921-043726-639');
insert into paytype values (paytype_seq.nextval, '계좌이체', '시티은행', '453-57359-926-04');
insert into paytype values (paytype_seq.nextval, '계좌이체', '신한은행', '249-90128-912310');
insert into paytype values (paytype_seq.nextval, '계좌이체', '농협은행', '108207-64-391366');
insert into paytype values (paytype_seq.nextval, '계좌이체', '기업은행', '594-166721-97-361');
insert into paytype values (paytype_seq.nextval, '계좌이체', '우체국', '820833-80-633870');
insert into paytype values (paytype_seq.nextval, '계좌이체', '카카오뱅크', '3333-1234-4321-12');
insert into paytype values (paytype_seq.nextval, '계좌이체', '토스뱅크', '272-3421-3723-927');

insert into paytype values (paytype_seq.nextval, '포인트결제', 'OK캐시백', '123-1234-123456');

insert into paytype values (paytype_seq.nextval, '지역화폐', '경기도', '');
insert into paytype values (paytype_seq.nextval, '지역화폐', '서울시', ' ');
insert into paytype values (paytype_seq.nextval, '지역화폐', '고양시', ' ');
insert into paytype values (paytype_seq.nextval, '지역화폐', '일산동구', ' ');

select paymethod as 결제방식번호, paytype as 결제방식, acccomp as 결제기관, accnum as 결제계좌번호 from paytype;  

commit;