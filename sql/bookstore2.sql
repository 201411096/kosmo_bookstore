---------------------------------------- 목차 ----------------------------------------
--1. DB 생성
----1_1. 테이블
----1_2. 시퀀스
--2. 데이터 입력
--3. SQL문 확인
--4. DB 삭제
--5. 시퀀스 초기화
------------------------------1.DB 생성 ------------------------------
--------------------1_1.테이블--------------------
--테이블번호 : 1
--테이블명 : CUSTOMER
--사용하는 시퀀스 : X
--참조하는 테이블 : X
--참조되는 테이블 : QUESTION, TENDENCY, BUYCARTLIST, RENTCARTLIST, BUYLIST, RENTLIST, BUYREVIEW, RENTREVIEW
CREATE TABLE CUSTOMER(
    CUSTOMER_ID VARCHAR2(30),
    CUSTOMER_PASSWORD VARCHAR2(30),
    CUSTOMER_NAME VARCHAR2(30),
    CUSTOMER_TEL VARCHAR2(30),
    CUSTOMER_POINT NUMBER(30),
    CUSTOMER_FLAG NUMBER(30),
    CONSTRAINT CUSTOMER_PK PRIMARY KEY(CUSTOMER_ID)
);
--테이블번호 : 2
--테이블명 : QUESTION
--사용하는 시퀀스 : QUESTION_ID_SEQ, QUESTION_GROUPID_SEQ
--참조하는 테이블 : CUSTOMER
--참조되는 테이블 : X
CREATE TABLE QUESTION(
    QUESTION_ID NUMBER(30),
    CUSTOMER_ID VARCHAR2(30),
    QUESTION_FLAG NUMBER(30),
    QUESTION_TITLE VARCHAR2(30),
    QUESTION_CONTENT VARCHAR2(2048),
    QUESTION_GROUPID NUMBER(30),
    CONSTRAINT QUESTION_PK PRIMARY KEY(QUESTION_ID),
    CONSTRAINT QUESTION_FK_1 FOREIGN KEY(CUSTOMER_ID) REFERENCES CUSTOMER(CUSTOMER_ID)
);
--테이블번호 : 3
--테이블명 : TENDENCY
--사용하는 시퀀스 : TENDENCY_ID_SEQ
--참조하는 테이블 : CUSTOMER
--참조되는 테이블 : X
CREATE TABLE TENDENCY(
    TENDENCY_ID NUMBER(30),
    CUSTOMER_ID VARCHAR2(30),
    ART NUMBER(30),
    SOCIAL NUMBER(30),
    ECONOMIC NUMBER(30),
    TECHNOLOGY NUMBER(30),
    LITERATURE NUMBER(30),
    HISTORY NUMBER(30),
    CONSTRAINT TENDENCY_PK PRIMARY KEY(TENDENCY_ID),
    CONSTRAINT TENDENCY_FK_1 FOREIGN KEY(CUSTOMER_ID) REFERENCES CUSTOMER(CUSTOMER_ID)
);
--테이블번호 : 4
--테이블명 : WRITER
--사용하는 시퀀스 : WRITER_ID_SEQ
--참조하는 테이블 : X
--참조되는 테이블 : BOOK
CREATE TABLE WRITER(
    WRITER_ID NUMBER(30),
    WRITER_NAME VARCHAR2(30),
    CONSTRAINT WRITER_PK PRIMARY KEY(WRITER_ID)
);
--테이블번호 : 5
--테이블명 : STORE
--사용하는 시퀀스 : STORE_ID_SEQ
--참조하는 테이블 : X
--참조되는 테이블 : BOOKSALE
CREATE TABLE STORE(
    STORE_ID NUMBER(30),
    STORE_NAME VARCHAR2(30),
    STORE_ADDR VARCHAR2(256),
    STORE_POINT VARCHAR2(256),
    STORE_TEL VARCHAR2(30),
    CONSTRAINT STORE_PK PRIMARY KEY(STORE_ID)
);
--테이블번호 : 6
--테이블명 : BOOK
--사용하는 시퀀스 : BOOK_ID_SEQ
--참조하는 테이블 : WRITER
--참조되는 테이블 : BOOKSALE, BUY
CREATE TABLE BOOK(
    BOOK_ID NUMBER(30),
    WRITER_ID NUMBER(30),
    BOOK_PRICE NUMBER(30),
    BOOK_NAME VARCHAR2(256),
    BOOK_GENRE VARCHAR2(30),
    BOOK_STORY varchar2(2048),
    BOOK_PDATE VARCHAR2(30),
    BOOK_SALEPRICE NUMBER(30),
    BOOK_CNT NUMBER(30),
    BOOK_SCORE NUMBER(30, 2),
    BOOK_SCORECOUNT NUMBER(30),
    CONSTRAINT BOOK_PK PRIMARY KEY(BOOK_ID),
    CONSTRAINT WRITER_FK_1 FOREIGN KEY(WRITER_ID) REFERENCES WRITER(WRITER_ID)
);
alter table book add(book_scorecount number(30));
alter table book modify(book_score number(30, 2));
--테이블번호 : 7
--테이블명 : BOOKSALE
--사용하는 시퀀스 : BOOKSALE_ID_SEQ
--참조하는 테이블 : BOOK, STORE
--참조되는 테이블 : X
CREATE TABLE BOOKSALE(
    BOOKSALE_ID NUMBER(30),
    BOOK_ID NUMBER(30),
    STORE_ID NUMBER(30),
    CONSTRAINT BOOKSALE_PK PRIMARY KEY(BOOKSALE_ID),
    CONSTRAINT BOOKSALE_FK_1 FOREIGN KEY(BOOK_ID) REFERENCES BOOK(BOOK_ID),
    CONSTRAINT BOOKSALE_FK_2 FOREIGN KEY(STORE_ID) REFERENCES STORE(STORE_ID)
);
--테이블번호 : 8
--테이블명 : BUYLIST
--사용하는 시퀀스 : BUYLIST_ID_SEQ
--참조하는 테이블 : CUSTOMER
--참조되는 테이블 : BUY
CREATE TABLE BUYLIST(
    BUYLIST_ID NUMBER(30),
    CUSTOMER_ID VARCHAR2(30),
    BUY_DATE DATE,
    BUYLIST_SHIPPINGADDRESS varchar2(100),
    CONSTRAINT BUYLIST_PK PRIMARY KEY(BUYLIST_ID),
    CONSTRAINT BUYLIST_FK_1 FOREIGN KEY(CUSTOMER_ID) REFERENCES CUSTOMER(CUSTOMER_ID)
);
--테이블번호 : 9
--테이블명 : BUY
--사용하는 시퀀스 : BUY_ID_SEQ
--참조하는 테이블 : BUYLIST, BOOK
--참조되는 테이블 : X
CREATE TABLE BUY(
    BUY_ID NUMBER(30),
    BUYLIST_ID NUMBER(30),
    BOOK_ID NUMBER(30),
    BUY_CNT NUMBER(30),
    CONSTRAINT BUY_PK PRIMARY KEY(BUY_ID),
    CONSTRAINT BUY_FK_1 FOREIGN KEY(BUYLIST_ID) REFERENCES BUYLIST(BUYLIST_ID),
    CONSTRAINT BUY_FK_2 FOREIGN KEY(BOOK_ID) REFERENCES BOOK(BOOK_ID)
);
--테이블번호 : 10
--테이블명 : BUYCARTLIST
--사용하는 시퀀스 : BUYCARTLIST_ID_SEQ
--참조하는 테이블 : CUSTOMER, BOOK
--참조되는 테이블 : X
CREATE TABLE BUYCARTLIST(
    BUYCARTLIST_ID NUMBER(30),
    CUSTOMER_ID VARCHAR2(30),
    BOOK_ID NUMBER(30),
    BUYCARTLIST_CNT NUMBER(30),
    CONSTRAINT BUYCARTLIST_PK PRIMARY KEY(BUYCARTLIST_ID),
    CONSTRAINT BUYCARTLIST_FK_1 FOREIGN KEY(CUSTOMER_ID) REFERENCES CUSTOMER(CUSTOMER_ID),
    CONSTRAINT BUYCARTLIST_FK_2 FOREIGN KEY(BOOK_ID) REFERENCES BOOK(BOOK_ID)
);
--테이블번호 : 11
--테이블명 : BUYREVIEW
--사용하는 시퀀스 : BUYREVIEW_ID_SEQ
--참조하는 테이블 : CUSTOMER, BOOK
--참조되는 테이블 : X
CREATE TABLE BUYREVIEW(
    BUYREVIEW_ID NUMBER(30),
    CUSTOMER_ID VARCHAR2(30),
    BOOK_ID NUMBER(30),
    BUYREVIEW_CONTENT VARCHAR2(2048),
    BUYREVIEW_SCORE NUMBER(30),
    CONSTRAINT BUYREVIEW_PK PRIMARY KEY(BUYREVIEW_ID),
    CONSTRAINT BUYREVIEW_FK_1 FOREIGN KEY(CUSTOMER_ID) REFERENCES CUSTOMER(CUSTOMER_ID),
    CONSTRAINT BUYREVIEW_FK_2 FOREIGN KEY(BOOK_ID) REFERENCES BOOK(BOOK_ID)
);
--------------------1_2.시퀀스--------------------
--시퀀스번호 : 1
--시퀀스이름 : QUESTION_ID_SEQ
--사용되는 테이블 : QUESTION
CREATE SEQUENCE QUESTION_ID_SEQ
START WITH 1
MAXVALUE 10000
CYCLE;

--시퀀스번호 : 2
--시퀀스이름 : QUESTION_GROUPID_SEQ
--사용되는 테이블 : QUESTION
CREATE SEQUENCE QUESTION_GROUPID_SEQ
START WITH 1
MAXVALUE 10000
CYCLE;
--시퀀스번호 : 3
--시퀀스이름 : TENDENCY_ID_SEQ
--사용되는 테이블 : TENDENCY
CREATE SEQUENCE TENDENCY_ID_SEQ
START WITH 1
MAXVALUE 10000
CYCLE;

--시퀀스번호 : 4
--시퀀스이름 : WRITER_ID_SEQ
--사용되는 테이블 : WRITER
CREATE SEQUENCE WRITER_ID_SEQ
START WITH 1
MAXVALUE 10000
CYCLE;

--시퀀스번호 : 5
--시퀀스이름 : STORE_ID_SEQ
--사용되는 테이블 : STORE
CREATE SEQUENCE STORE_ID_SEQ
START WITH 1
MAXVALUE 10000
CYCLE;

--시퀀스번호 : 6
--시퀀스이름 : BOOK_ID_SEQ
--사용되는 테이블 : BOOK
CREATE SEQUENCE BOOK_ID_SEQ
START WITH 1
MAXVALUE 10000
CYCLE;

--시퀀스번호 : 7
--시퀀스이름 : BOOKSALE_ID_SEQ
--사용되는 테이블 : BOOKSALE
CREATE SEQUENCE BOOKSALE_ID_SEQ
START WITH 1
MAXVALUE 10000
CYCLE;

--시퀀스번호 : 8
--시퀀스이름 : BUYLIST_ID_SEQ
--사용되는 테이블 : BUYLIST
CREATE SEQUENCE BUYLIST_ID_SEQ
START WITH 1
MAXVALUE 10000
CYCLE;

--시퀀스번호 : 9
--시퀀스이름 : BUY_ID_SEQ
--사용되는 테이블 : BUY
CREATE SEQUENCE BUY_ID_SEQ
START WITH 1
MAXVALUE 10000
CYCLE;

--시퀀스번호 : 10
--시퀀스이름 : BUYCARTLIST_ID_SEQ
--사용되는 테이블 : BUYCARTLIST
CREATE SEQUENCE BUYCARTLIST_ID_SEQ
START WITH 1
MAXVALUE 10000
CYCLE;

--시퀀스번호 : 11
--시퀀스이름 : BUYREVIEW_ID_SEQ
--사용되는 테이블 : BUYREVIEW
CREATE SEQUENCE BUYREVIEW_ID_SEQ
START WITH 1
MAXVALUE 10000
CYCLE;

------------------------------2.데이터 입력 ------------------------------
--------------------2_1.CUSTOMER--------------------
INSERT INTO CUSTOMER(CUSTOMER_ID, CUSTOMER_PASSWORD, CUSTOMER_NAME, CUSTOMER_TEL, CUSTOMER_POINT, CUSTOMER_FLAG) VALUES('admin', '1234', 'adminname', '010-1131-2222', 0, 0); -- 관리자 계정?..
INSERT INTO CUSTOMER(CUSTOMER_ID, CUSTOMER_PASSWORD, CUSTOMER_NAME, CUSTOMER_TEL, CUSTOMER_POINT, CUSTOMER_FLAG) VALUES('aaa', '1234', 'aaaname', '010-1111-2222', 0, 1);
INSERT INTO CUSTOMER(CUSTOMER_ID, CUSTOMER_PASSWORD, CUSTOMER_NAME, CUSTOMER_TEL, CUSTOMER_POINT, CUSTOMER_FLAG) VALUES('bbb', '1234', 'bbbname', '010-2222-3333', 0, 1);
INSERT INTO CUSTOMER(CUSTOMER_ID, CUSTOMER_PASSWORD, CUSTOMER_NAME, CUSTOMER_TEL, CUSTOMER_POINT, CUSTOMER_FLAG) VALUES('ccc', '1234', 'cccname', '010-3333-4444', 0, 1);
--------------------2_3.TENDENCY-------------------
INSERT INTO TENDENCY(TENDENCY_ID, CUSTOMER_ID, ART, SOCIAL, ECONOMIC, TECHNOLOGY, LITERATURE, HISTORY) VALUES(TENDENCY_ID_SEQ.NEXTVAL, 'aaa', 0, 0, 0, 0, 0, 0);
INSERT INTO TENDENCY(TENDENCY_ID, CUSTOMER_ID, ART, SOCIAL, ECONOMIC, TECHNOLOGY, LITERATURE, HISTORY) VALUES(TENDENCY_ID_SEQ.NEXTVAL, 'bbb', 0, 0, 0, 0, 0, 0);
INSERT INTO TENDENCY(TENDENCY_ID, CUSTOMER_ID, ART, SOCIAL, ECONOMIC, TECHNOLOGY, LITERATURE, HISTORY) VALUES(TENDENCY_ID_SEQ.NEXTVAL, 'ccc', 0, 0, 0, 0, 0, 0);
--------------------2_4.WRITER--------------------
INSERT INTO WRITER(WRITER_ID, WRITER_NAME) VALUES(WRITER_ID_SEQ.NEXTVAL, '이서윤');
INSERT INTO WRITER(WRITER_ID, WRITER_NAME) VALUES(WRITER_ID_SEQ.NEXTVAL, '정채진');
INSERT INTO WRITER(WRITER_ID, WRITER_NAME) VALUES(WRITER_ID_SEQ.NEXTVAL, '김수현');
INSERT INTO WRITER(WRITER_ID, WRITER_NAME) VALUES(WRITER_ID_SEQ.NEXTVAL, '박근호');
INSERT INTO WRITER(WRITER_ID, WRITER_NAME) VALUES(WRITER_ID_SEQ.NEXTVAL, '칼 세이건');
--------------------2_6.BOOK--------------------
INSERT INTO BOOK(BOOK_ID, WRITER_ID, BOOK_PRICE, BOOK_NAME, BOOK_GENRE, BOOK_STORY, BOOK_PDATE, BOOK_SALEPRICE, BOOK_CNT, BOOK_SCORE, BOOK_SCORECOUNT)
VALUES(BOOK_ID_SEQ.NEXTVAL, 2, 15000, '더 해빙', 'ECONOMIC', '부와 행운을 만나는 출발점, 마법의 감정 Having! 국내 최초로 미국에서 선(先)출간되어 세계가 먼저 찾아 읽은 『더 해빙(The Having)』.', '2020-03-01', 12000, 100, 0, 1);
INSERT INTO BOOK(BOOK_ID, WRITER_ID, BOOK_PRICE, BOOK_NAME, BOOK_GENRE, BOOK_STORY, BOOK_PDATE, BOOK_SALEPRICE, BOOK_CNT, BOOK_SCORE, BOOK_SCORECOUNT)
VALUES(BOOK_ID_SEQ.NEXTVAL, 2, 16000, '오래된 비밀', 'ECONOMIC', '대한민국 상위 1%의 멘토가 말하는 운의 원리『오래된 비밀』. 이 책은 ‘운명학은 과학이다’라는 전제를 바탕으로 운의 세계를 풀어가고, 우리의 운명을 가르는 행운과 불운의 실체가 무엇인지 들여다본다.', '2013-02-28', 14000, 100, 0, 1);
INSERT INTO BOOK(BOOK_ID, WRITER_ID, BOOK_PRICE, BOOK_NAME, BOOK_GENRE, BOOK_STORY, BOOK_PDATE, BOOK_SALEPRICE, BOOK_CNT, BOOK_SCORE, BOOK_SCORECOUNT)
VALUES(BOOK_ID_SEQ.NEXTVAL, 4, 18000, '애쓰지 않고 편안하게', 'LITERATURE', '“어떤 순간에도 만만하지 않은 평화주의자가 될 것!”《나는 나로 살기로 했다》 김수현 작가 4년 만의 신작', '2020-06-05', 16000, 100, 0 , 1);
INSERT INTO BOOK(BOOK_ID, WRITER_ID, BOOK_PRICE, BOOK_NAME, BOOK_GENRE, BOOK_STORY, BOOK_PDATE, BOOK_SALEPRICE, BOOK_CNT, BOOK_SCORE, BOOK_SCORECOUNT)
VALUES(BOOK_ID_SEQ.NEXTVAL, 5, 15000, '전부였던 사람이 떠나갔을 때 태연히 밥을 먹기도 했다', 'LITERATURE', '베스트 셀러 《비밀편지》 저자 박근호의 첫 번째 문집《전부였던 사람이 떠나갔을 때 태연히 밥을 먹기도 했다》) 출간!', '2020-05-14', 13000, 100, 5 ,1);
INSERT INTO BOOK(BOOK_ID, WRITER_ID, BOOK_PRICE, BOOK_NAME, BOOK_GENRE, BOOK_STORY, BOOK_PDATE, BOOK_SALEPRICE, BOOK_CNT, BOOK_SCORE, BOOK_SCORECOUNT)
VALUES(BOOK_ID_SEQ.NEXTVAL, 5, 20000, '비밀편지', 'LITERATURE', '누구에게나 있는 마음속 기억을 담은, 비밀편지 감정을 표현하지 못해 괴로워하다 ‘비밀편지’라는 이름의 삐뚤빼뚤 손글씨를 들고 신촌의 골목으로 무작정 나가 3년 동안 이름 모를 이들에게 5,000통의 편지를 보냈던 박근호. 13만 SNS 구독자들의 마음을 울린 그의 이야기를 담은『비밀편지』. 2017년 출간 이후 꾸준히 독자들의 마음을 위로해온 『비밀편지』가 새로운 문장과 사진들을 가득 담은 4장을 더한 개정증보판으로 독자들과 다시 만난다.', '2019-09-09', 17000, 100, 9.9, 3);
INSERT INTO BOOK(BOOK_ID, WRITER_ID, BOOK_PRICE, BOOK_NAME, BOOK_GENRE, BOOK_STORY, BOOK_PDATE, BOOK_SALEPRICE, BOOK_CNT, BOOK_SCORE, BOOK_SCORECOUNT)
VALUES(BOOK_ID_SEQ.NEXTVAL, 6, 20000, '코스모스', 'TECHNOLOGY', '과학 교양서의 고전『코스모스』. 이 책에서 저자는 우주의 탄생과 은하계의 진화, 태양의 삶과 죽음, 우주를 떠돌던 먼지가 의식 있는 생명이 되는 과정, 외계 생명의 존재 문제 등에 관한 내용을 수 백장의 사진과 일러스트를 곁들여 흥미롭게 설명한다. 현대 천문학을 대표하는 저명한 과학자인 저자는 이 책에서 사람들의 상상력을 사로잡고, 난해한 개념을 명쾌하게 해설하는 놀라운 능력을 마음껏 발휘한다.', '2006-01-20', 16000, 100, 15.15, 4);
--------------------2_10.BUYCARTLIST--------------------
INSERT INTO BUYCARTLIST(BUYCARTLIST_ID, CUSTOMER_ID, BOOK_ID, BUYCARTLIST_CNT) VALUES(BUYCARTLIST_ID_SEQ.NEXTVAL, 'aaa', 2, 3);
INSERT INTO BUYCARTLIST(BUYCARTLIST_ID, CUSTOMER_ID, BOOK_ID, BUYCARTLIST_CNT) VALUES(BUYCARTLIST_ID_SEQ.NEXTVAL, 'aaa', 3, 2);
INSERT INTO BUYCARTLIST(BUYCARTLIST_ID, CUSTOMER_ID, BOOK_ID, BUYCARTLIST_CNT) VALUES(BUYCARTLIST_ID_SEQ.NEXTVAL, 'aaa', 1, 1);
INSERT INTO BUYCARTLIST(BUYCARTLIST_ID, CUSTOMER_ID, BOOK_ID, BUYCARTLIST_CNT) VALUES(BUYCARTLIST_ID_SEQ.NEXTVAL, 'bbb', 2, 2);
------------------------------3.SQL문 확인 ------------------------------
--------------------2_1.CUSTOMER--------------------
select * from customer;
--------------------2_6.BOOK--------------------
select * from book;
SELECT b.BOOK_ID AS BOOK_ID, b.WRITER_ID AS WRITER_ID, b.BOOK_PRICE AS BOOK_PRICE, 
b.BOOK_NAME AS BOOK_NAME, b.BOOK_GENRE AS BOOK_GENRE, b.BOOK_STORY AS BOOK_STORY, 
b.BOOK_PDATE AS BOOK_PDATE, b.BOOK_SALEPRICE AS BOOK_SALEPRICE, b.BOOK_CNT AS BOOK_CNT, TO_CHAR(b.BOOK_SCORE, '999.00' ) AS BOOK_SCORE,
w.WRITER_ID AS WRITER_ID, w.WRITER_NAME AS WRITER_NAME
FROM BOOK b JOIN WRITER w 
ON b.WRITER_ID = w.WRITER_ID
WHERE REGEXP_LIKE (BOOK_NAME, '(*)오(*)') OR REGEXP_LIKE (WRITER_NAME, '(*)김(*)');
--WHERE BOOK_NAME = '오래된 비밀';
select b.BOOK_ID AS BOOK_ID, b.WRITER_ID AS WRITER_ID, b.BOOK_PRICE AS BOOK_PRICE, b.BOOK_NAME AS BOOK_NAME, b.BOOK_GENRE AS BOOK_GENRE, b.BOOK_STORY AS BOOK_STORY, b.BOOK_PDATE AS BOOK_PDATE, b.BOOK_SALEPRICE AS BOOK_SALEPRICE, b.BOOK_CNT AS BOOK_CNT, b.BOOK_SCORE AS BOOK_SCORE, b.BOOK_SCORECOUNT AS BOOK_SCORECOUNT from (select * from book where book_genre = 'LITERATURE' order by book_score/book_scorecount desc) b where rownum=1;
--------------------2_13.BUYCARTLIST--------------------
ALTER TABLE BUYCARTLIST ADD (BUYCARTLIST_CNT NUMBER(30));
select SUM(BOOK_SALEPRICE) from book where book_id in ( select book_id from buycartlist WHERE customer_id='aaa' );
select SUM(BOOK_SALEPRICE) from book where book_id in ( select book_id from buycartlist WHERE customer_id='aaa' );
select book_id from buycartlist WHERE customer_id='aaa';
select b.book_id as book_id, b.book_name as book_name, l.buycartlist_cnt as book_cnt, b.book_price as book_price,(b.book_price*l.buycartlist_cnt) as book_totalprice
from book b 
inner join buycartlist l
on b.book_id = l.book_id
where customer_id='aaa';
------------------------------4.DB 삭제 ------------------------------
----- 테이블1 및 관련 시퀀스 삭제 -----
DROP TABLE CUSTOMER;
----- 테이블2 및 관련 시퀀스 삭제 -----
DROP TABLE QUESTION;
DROP SEQUENCE QUESTION_ID_SEQ;
DROP SEQUENCE QUESTION_GROUPID_SEQ;
----- 테이블3 및 관련 시퀀스 삭제 -----
DROP TABLE TENDENCY;
DROP SEQUENCE TENDENCY_ID_SEQ;
----- 테이블4 및 관련 시퀀스 삭제 -----
DROP TABLE WRITER;
DROP SEQUENCE WRITER_ID_SEQ;
----- 테이블5 및 관련 시퀀스 삭제 -----
DROP TABLE STORE;
DROP SEQUENCE STORE_ID_SEQ;
----- 테이블6 및 관련 시퀀스 삭제 -----
DROP TABLE BOOK;
DROP SEQUENCE BOOK_ID_SEQ;
----- 테이블7 및 관련 시퀀스 삭제 -----
DROP TABLE BOOKSALE;
DROP SEQUENCE BOOKSALE_ID_SEQ;
----- 테이블8 및 관련 시퀀스 삭제 -----
DROP TABLE BUYLIST;
DROP SEQUENCE BUYLIST_ID_SEQ;
----- 테이블9 및 관련 시퀀스 삭제 -----
DROP TABLE BUY;
DROP SEQUENCE BUY_ID_SEQ;
----- 테이블10 및 관련 시퀀스 삭제 -----
DROP TABLE BUYCARTLIST;
DROP SEQUENCE BUYCARTLIST_ID_SEQ;
----- 테이블11 및 관련 시퀀스 삭제 -----
DROP TABLE BUYREVIEW;
DROP SEQUENCE BUYREVIEW_ID_SEQ;
------------------------------5. 시퀀스 초기화------------------------------
-------------------------5_1. Template -------------------------
SELECT SEQUENCE_NAME FROM USER_SEQUENCES WHERE SEQUENCE_NAME='SEQUENCE_NAME';
SELECT SEQNENCE_NAME.CURRVAL FROM UDAL;
ALTER SEQUENCE SEQUENCE_NAME INCREMENT BY NUMBER;
-------------------------5_2. Example -------------------------
SELECT SEQUENCE_NAME FROM USER_SEQUENCES;
SELECT WRITER_ID_SEQ.NEXTVAL FROM UDAL;
ALTER SEQUENCE WRITER_ID_SEQ INCREMENT BY -15;
------------------------------6. sample------------------------------
select * from book where book_genre = 'LITERATURE' order by book_score/book_scorecount desc;
select b.* from (select * from book where book_genre = 'LITERATURE' order by book_score/book_scorecount desc) b where rownum=1;