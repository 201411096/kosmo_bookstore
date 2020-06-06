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
--INSERT INTO WRITER(WRITER_ID, WRITER_NAME) VALUES(WRITER_ID_SEQ.NEXTVAL, '이서윤');
--INSERT INTO WRITER(WRITER_ID, WRITER_NAME) VALUES(WRITER_ID_SEQ.NEXTVAL, '정채진');
--INSERT INTO WRITER(WRITER_ID, WRITER_NAME) VALUES(WRITER_ID_SEQ.NEXTVAL, '김수현');
--INSERT INTO WRITER(WRITER_ID, WRITER_NAME) VALUES(WRITER_ID_SEQ.NEXTVAL, '박근호');
--INSERT INTO WRITER(WRITER_ID, WRITER_NAME) VALUES(WRITER_ID_SEQ.NEXTVAL, '칼 세이건');
--INSERT INTO WRITER(WRITER_ID, WRITER_NAME) VALUES(WRITER_ID_SEQ.NEXTVAL, '조원재');
Insert into TEAMPROJECT.WRITER (WRITER_ID,WRITER_NAME) values (6,'칼 세이건');
Insert into TEAMPROJECT.WRITER (WRITER_ID,WRITER_NAME) values (7,'조원재');
Insert into TEAMPROJECT.WRITER (WRITER_ID,WRITER_NAME) values (2,'이서윤');
Insert into TEAMPROJECT.WRITER (WRITER_ID,WRITER_NAME) values (3,'정채진');
Insert into TEAMPROJECT.WRITER (WRITER_ID,WRITER_NAME) values (4,'김수현');
Insert into TEAMPROJECT.WRITER (WRITER_ID,WRITER_NAME) values (5,'박근호');
Insert into TEAMPROJECT.WRITER (WRITER_ID,WRITER_NAME) values (9,'최혜진');
Insert into TEAMPROJECT.WRITER (WRITER_ID,WRITER_NAME) values (10,'김지혜');
Insert into TEAMPROJECT.WRITER (WRITER_ID,WRITER_NAME) values (11,'김누리');
Insert into TEAMPROJECT.WRITER (WRITER_ID,WRITER_NAME) values (12,'정혜승');
Insert into TEAMPROJECT.WRITER (WRITER_ID,WRITER_NAME) values (13,'사피 바칼');
Insert into TEAMPROJECT.WRITER (WRITER_ID,WRITER_NAME) values (14,'레이첼 카슨');
Insert into TEAMPROJECT.WRITER (WRITER_ID,WRITER_NAME) values (15,'진상윤');
Insert into TEAMPROJECT.WRITER (WRITER_ID,WRITER_NAME) values (16,'사토 겐타로');
Insert into TEAMPROJECT.WRITER (WRITER_ID,WRITER_NAME) values (17,'설민석');
Insert into TEAMPROJECT.WRITER (WRITER_ID,WRITER_NAME) values (18,'류성룡');
Insert into TEAMPROJECT.WRITER (WRITER_ID,WRITER_NAME) values (19,'필름로그');
Insert into TEAMPROJECT.WRITER (WRITER_ID,WRITER_NAME) values (21,'이정일');

--------------------2_6.BOOK--------------------
Insert into TEAMPROJECT.BOOK (BOOK_ID,WRITER_ID,BOOK_PRICE,BOOK_NAME,BOOK_GENRE,BOOK_STORY,BOOK_PDATE,BOOK_SALEPRICE,BOOK_CNT,BOOK_SCORE,BOOK_SCORECOUNT) values (33,14,15000,'침묵의 봄','TECHNOLOGY','20세기 환경학 최고의 고전『침묵의 봄』. 50주년 기념 개정판으로 출간 된 이 책은 〈타임〉지가 20세기를 변화시킨 100인 중 한 사람으로 뽑은 레이첼 카슨이 쓴 책으로, 환경 문제의 심각성과 중요성을 독자들에게 일깨워 준 책이다. 저자는 친구로부터 받은 편지 한 통을 계기로 살충제의 사용 실태와 그 위험성을 조사하고, 생물학자로서의 전문지식과 작가로서의 능력을 발휘해 방사능 낙진으로 인해 더욱 절실해지기 시작한 환경 문제의 복잡성을 알기 쉽게 풀어냈다. 더불어 무분별한 살충제 사용으로 파괴되는 야생 생물계의 모습을 적나라하게 공개하여, 생태계의 오염이 어떻게 시작되고 생물과 자연환경에 어떤 영향을 미치지는 지 구체적으로 설명하였다. 이를 통해 정부와 살충제 제조업체의 행태를 지적하고, 환경문제에 대한 대중들의 생각을 환기시킬 수 있는 기회를 제시하였다.','2011-12-30',12000,9,4,1);
Insert into TEAMPROJECT.BOOK (BOOK_ID,WRITER_ID,BOOK_PRICE,BOOK_NAME,BOOK_GENRE,BOOK_STORY,BOOK_PDATE,BOOK_SALEPRICE,BOOK_CNT,BOOK_SCORE,BOOK_SCORECOUNT) values (34,15,19000,'스토리텔링 BIM','TECHNOLOGY','BIM(Building Information Modeling)이란 컴퓨터 하드웨어와 소프트웨어를 십분 활용하여 다양한 분야의 참여자들 간 협업을 기반으로 공간, 에너지, 디자인 등 여러 가지 측면에서 설계안을 최적화하고 시공에 앞서 가상공간에서 리스크를 확인하고 해소함으로써 최적화된 시공 프로세스를 구현하며, 유지관리단계 동안 에너지, 비용, 관리 등 다양한 측면에서 시설물 활용을 최적화하는 것에 목적을 둔 개념이다.','2020-05-25',16000,8,4,1);
Insert into TEAMPROJECT.BOOK (BOOK_ID,WRITER_ID,BOOK_PRICE,BOOK_NAME,BOOK_GENRE,BOOK_STORY,BOOK_PDATE,BOOK_SALEPRICE,BOOK_CNT,BOOK_SCORE,BOOK_SCORECOUNT) values (37,18,19000,'징비록','HISTORY','오늘 이 시대에 필요한 반면교사, 류성룡의 『징비록』은 이 시대가 필요로 하는 책이다. 과연 우리는 지금 징비하고 있는가? 이 책을 쓴 류성룡은 임진왜란을 진두지휘한 선조 시대 최고의 재상으로, 그를 빼놓고는 임진왜란을 이야기할 수 없다. 이순신을 발탁하여 임진왜란을 진두지휘하여 7년 전쟁을 승리로 이끈 장본인이라 할 수 있기 때문이다. 사욕을 채우기 위해 당쟁을 벌이는 대신들과, 권력을 지키고자 일생 동안 신하들을 이용하고 백성에게 고난을 준 선조가 나라를 이끌던 이때에 류성룡과 이순신이 우리에게 있었다는 사실은 가히 천운이라 할 수밖에 없다.','2020-02-20',16000,22,11,3);
Insert into TEAMPROJECT.BOOK (BOOK_ID,WRITER_ID,BOOK_PRICE,BOOK_NAME,BOOK_GENRE,BOOK_STORY,BOOK_PDATE,BOOK_SALEPRICE,BOOK_CNT,BOOK_SCORE,BOOK_SCORECOUNT) values (40,21,11500,'오래된 비밀','HISTORY','저자는 행운과 불운을 만드는 것은 자기 자신이라고 말하며, 운명학에서 중요하게 다루는 인연법의 인간관계도 우리의 운에 많은 영향을 미치는 요소 가운데 하나라고 말한다. 재벌가의 오너, 고위 공직자와 정치인, 유명 연예인 등 우리나라 상위1% 안에 드는 4천여 명의 데이터를 연구 분석하여 운명학적 특징과 삶의 태도를 운명학적 관점에서 해석하고 정리하였다.','2013-02-28',8500,77,4,1);
Insert into TEAMPROJECT.BOOK (BOOK_ID,WRITER_ID,BOOK_PRICE,BOOK_NAME,BOOK_GENRE,BOOK_STORY,BOOK_PDATE,BOOK_SALEPRICE,BOOK_CNT,BOOK_SCORE,BOOK_SCORECOUNT) values (21,6,20000,'코스모스','TECHNOLOGY','과학 교양서의 고전『코스모스』. 이 책에서 저자는 우주의 탄생과 은하계의 진화, 태양의 삶과 죽음, 우주를 떠돌던 먼지가 의식 있는 생명이 되는 과정, 외계 생명의 존재 문제 등에 관한 내용을 수 백장의 사진과 일러스트를 곁들여 흥미롭게 설명한다. 현대 천문학을 대표하는 저명한 과학자인 저자는 이 책에서 사람들의 상상력을 사로잡고, 난해한 개념을 명쾌하게 해설하는 놀라운 능력을 마음껏 발휘한다.','2006-01-20',17000,100,15.15,4);
Insert into TEAMPROJECT.BOOK (BOOK_ID,WRITER_ID,BOOK_PRICE,BOOK_NAME,BOOK_GENRE,BOOK_STORY,BOOK_PDATE,BOOK_SALEPRICE,BOOK_CNT,BOOK_SCORE,BOOK_SCORECOUNT) values (22,7,18000,'방구석 미술관','ART','『방구석 미술관』은 2018년 출간된 이래 미술은 고상하고 우아한 사람들의 전유물이라 여겨왔던 대중들에게 큰 사랑을 받으며, 새로운 미술 교양의 지평을 열었다. 예술 분야의 베스트셀러로 꾸준히 사랑받아 온 『방구석 미술관』이 2년 만에 10만 부 판매 기록을 돌파했다. 이를 기념하기 위해 특별판으로 출간한 이번 책은 ‘프라이빗 미술관 에디션’으로, 프랑스 파리의 3대 미술관 중 하나인 오르세 미술관을 나만의 방에서 편하게 즐길 수 있도록 초대한다.','2020-05-05',15000,100,17,5);
Insert into TEAMPROJECT.BOOK (BOOK_ID,WRITER_ID,BOOK_PRICE,BOOK_NAME,BOOK_GENRE,BOOK_STORY,BOOK_PDATE,BOOK_SALEPRICE,BOOK_CNT,BOOK_SCORE,BOOK_SCORECOUNT) values (2,2,9000,'더 해빙','ECONOMIC','부와 행운을 만나는 출발점, 마법의 감정 Having! 국내 최초로 미국에서 선(先)출간되어 세계가 먼저 찾아 읽은 『더 해빙(The Having)』.','2020-03-01',6000,100,4,1);
Insert into TEAMPROJECT.BOOK (BOOK_ID,WRITER_ID,BOOK_PRICE,BOOK_NAME,BOOK_GENRE,BOOK_STORY,BOOK_PDATE,BOOK_SALEPRICE,BOOK_CNT,BOOK_SCORE,BOOK_SCORECOUNT) values (3,2,11000,'오래된 비밀','ECONOMIC','대한민국 상위 1%의 멘토가 말하는 운의 원리『오래된 비밀』. 이 책은 ‘운명학은 과학이다’라는 전제를 바탕으로 운의 세계를 풀어가고, 우리의 운명을 가르는 행운과 불운의 실체가 무엇인지 들여다본다.','2013-02-28',8000,100,4,1);
Insert into TEAMPROJECT.BOOK (BOOK_ID,WRITER_ID,BOOK_PRICE,BOOK_NAME,BOOK_GENRE,BOOK_STORY,BOOK_PDATE,BOOK_SALEPRICE,BOOK_CNT,BOOK_SCORE,BOOK_SCORECOUNT) values (4,3,13000,'애쓰지 않고 편안하게','LITERATURE','“어떤 순간에도 만만하지 않은 평화주의자가 될 것!”《나는 나로 살기로 했다》 김수현 작가 4년 만의 신작','2020-06-05',10000,100,4,1);
Insert into TEAMPROJECT.BOOK (BOOK_ID,WRITER_ID,BOOK_PRICE,BOOK_NAME,BOOK_GENRE,BOOK_STORY,BOOK_PDATE,BOOK_SALEPRICE,BOOK_CNT,BOOK_SCORE,BOOK_SCORECOUNT) values (5,4,10000,'전부였던 사람이 떠나갔을 때 태연히 밥을 먹기도 했다','LITERATURE','베스트 셀러 《비밀편지》 저자 박근호의 첫 번째 문집《전부였던 사람이 떠나갔을 때 태연히 밥을 먹기도 했다》) 출간!','2020-05-14',7000,100,5,1);
Insert into TEAMPROJECT.BOOK (BOOK_ID,WRITER_ID,BOOK_PRICE,BOOK_NAME,BOOK_GENRE,BOOK_STORY,BOOK_PDATE,BOOK_SALEPRICE,BOOK_CNT,BOOK_SCORE,BOOK_SCORECOUNT) values (6,4,14000,'비밀편지','LITERATURE','누구에게나 있는 마음속 기억을 담은, 비밀편지 감정을 표현하지 못해 괴로워하다 ‘비밀편지’라는 이름의 삐뚤빼뚤 손글씨를 들고 신촌의 골목으로 무작정 나가 3년 동안 이름 모를 이들에게 5,000통의 편지를 보냈던 박근호. 13만 SNS 구독자들의 마음을 울린 그의 이야기를 담은『비밀편지』. 2017년 출간 이후 꾸준히 독자들의 마음을 위로해온 『비밀편지』가 새로운 문장과 사진들을 가득 담은 4장을 더한 개정증보판으로 독자들과 다시 만난다.','2019-09-09',11000,100,9.9,3);
Insert into TEAMPROJECT.BOOK (BOOK_ID,WRITER_ID,BOOK_PRICE,BOOK_NAME,BOOK_GENRE,BOOK_STORY,BOOK_PDATE,BOOK_SALEPRICE,BOOK_CNT,BOOK_SCORE,BOOK_SCORECOUNT) values (23,19,11500,'당신의 좋은 순간, 필름 사진','ART','스마트폰으로 얼마든지 쉽고 간편하게 고해상도 사진을 찍을 수 있는 요즘, 오히려 필름 사진을 찍는 사람들이 늘고 있다. 가벼운 일회용 카메라부터 SLR 카메라까지 취향에 맞는 카메라로 자신만의 감성을 담아 SNS에 올리고 열광적인 반응을 얻는다. 이 책은 필름 카메라의 기본 사용법은 물론 일회용 카메라를 업사이클링하는 방법, 필름 사진으로 멋진 작업을 보여주는 세 사람의 인터뷰까지 필름 사진에 대한 다양한 즐거움을 선사한다.','2020-06-01',8500,50,9,2);
Insert into TEAMPROJECT.BOOK (BOOK_ID,WRITER_ID,BOOK_PRICE,BOOK_NAME,BOOK_GENRE,BOOK_STORY,BOOK_PDATE,BOOK_SALEPRICE,BOOK_CNT,BOOK_SCORE,BOOK_SCORECOUNT) values (24,9,12000,'우리 각자의 미술관','ART','『우리 각자의 미술관』은 지식 없이도 그림과 깊이 만나도록 안내하는 ‘그림 감상 실용서’다. 미술관과 미술 애호가인 최혜진 작가가 수년간 실천해온 그림 감상법을 담았다. 〈그림에게 묻고 답하기〉라 이름 붙인 이 감상법은 지식과 이론으로 이해하는 감상이 아닌, 작품과 순수하게 교감하며 즐기는 길을 알려준다. 그림 앞에서 무엇을 어떻게 감상해야 할지 막막했던 이들에게 든든한 감상 노하우를 제공할 것이다.','2020-04-28',9000,13,4,1);
Insert into TEAMPROJECT.BOOK (BOOK_ID,WRITER_ID,BOOK_PRICE,BOOK_NAME,BOOK_GENRE,BOOK_STORY,BOOK_PDATE,BOOK_SALEPRICE,BOOK_CNT,BOOK_SCORE,BOOK_SCORECOUNT) values (25,10,12000,'선량한 차별주의자','SOCIAL','은밀하고 사소하며 일상적이고 자연스럽게 벌어지는 일들 속에서 선량한 우리가 놓치고 있던 차별과 혐오의 순간을 날카롭게 포착하는 『선량한 차별주의자』. 차별의 사각지대에 놓인 이들을 직접 찾아가는 현장 활동가이자, 통계학·사회복지학·법학을 넘나드는 통합적인 시각을 바탕으로 국내의 열악한 혐오·차별 문제의 이론적 토대를 구축하는 데 전념해온 연구자인 김지혜 교수가 인간 심리에 대한 국내외의 최신 연구, 현장에서 기록한 생생한 사례, 학생들과 꾸준히 진행해온 토론수업과 전문가들의 학술포럼에서의 다양한 논쟁을 버무려 우리 일상에 숨겨진 혐오와 차별의 순간들을 생생하게 담아냈다.','2019-07-17',9000,5,4,1);
Insert into TEAMPROJECT.BOOK (BOOK_ID,WRITER_ID,BOOK_PRICE,BOOK_NAME,BOOK_GENRE,BOOK_STORY,BOOK_PDATE,BOOK_SALEPRICE,BOOK_CNT,BOOK_SCORE,BOOK_SCORECOUNT) values (26,11,13500,'우리의 불행은 당연하지 않습니다','SOCIAL','“우린 지금 이상한 나라에 살고 있다.” 2018년 비인간적인 노동 환경에 아들을 잃은 故 김용균 씨 어머니의 이 한마디는 많은 의미를 담고 있다. 한국은 이제 국민소득 3만 불대에 진입할 만큼 부유해졌고 민주적인 촛불 혁명을 통해 정권도 교체했지만 왜 여전히 수많은 사람들이 고통 속에서 신음할까? 중앙대 독문학과 교수이자 독일유럽연구센터 소장인 김누리 교수가 ‘이상한 나라’ 대한민국의 불편한 진실을 파헤친『우리의 불행은 당연하지 않습니다』. 주요 포털사이트 실시간 검색어에 오르며 폭발적인 반응을 일으킨 JTBC 〈차이나는 클라스〉의 ‘독일 2부작’ 강연부터 인기 팟캐스트 정영진, 최욱의 〈매불쇼〉 강력 추천 에피소드까지, 많은 이들에게 놀랄 만한 통찰과 충격을 안겨주었던 김누리 교수의 비판적 분석과 전망을 보충 정리하여 이 한 권의 책에 담았다.','2020-03-06',10500,23,4,1);
Insert into TEAMPROJECT.BOOK (BOOK_ID,WRITER_ID,BOOK_PRICE,BOOK_NAME,BOOK_GENRE,BOOK_STORY,BOOK_PDATE,BOOK_SALEPRICE,BOOK_CNT,BOOK_SCORE,BOOK_SCORECOUNT) values (35,17,19000,'설민석의 조선왕조실록','HISTORY','다수의 방송에 출연해 화제를 모은 바 있는 스타강사 설민석의 재미있고 깊이 있는 한국사 책 『설민석의 조선왕조실록』. 27명의 조선의 왕들을 한 권으로 불러 모아 핵심적인 주요 사건들을 풀어쓴 책으로, 설민석 특유의 흡입력 있는 간결함과 재치 있는 말투를 구어체 그대로 책에다 담았다.
나아가, 이 책의 백미는 고리타분하고 어렵다는 역사의 고정관념을 과감히 깨트린데 있다. 왕이기 이전에 아들로서, 남편으로서, 아버지로서의 인간적인 삶이 낱낱이 드러난 모습들은 남다른 재미를 선사한다. 조선사의 큰 줄기와 핵심을 알고 싶지만, 쉽게 도전하지 못했던 독자들에게 편안하고 즐길 수 있는 역사 이야기를 들려줄 것이다.','2016-07-20',16000,13,4,1);
Insert into TEAMPROJECT.BOOK (BOOK_ID,WRITER_ID,BOOK_PRICE,BOOK_NAME,BOOK_GENRE,BOOK_STORY,BOOK_PDATE,BOOK_SALEPRICE,BOOK_CNT,BOOK_SCORE,BOOK_SCORECOUNT) values (28,13,15000,'룬샷','ECONOMIC','어떻게 미국은 제2차 세계대전을 계기로 세계 패권을 잡았는가? 애플을 세운 스티브 잡스부터 영화〈스타워즈〉시리즈, 바이오테크 산업의 문을 연 제넨테크까지 이들은 무엇이 달랐기에 결정적 순간에 폭발적 성장을 할 수 있었을까? 비슷한 점이 전혀 없어 보이는 이들 국가, 기업, 리더에게는 한 가지 공통점이 있었다. 바로 외면 받던 아이디어를 발 빠르게 육성해 성장의 동력으로 만드는 시스템을 갖추었던 것. 이들은 창의성과 효율성의 선순환 시스템을 통해 세계의 패권을 잡고, 질병과의 전쟁에서 승리했으며, 쟁쟁한 경쟁자들을 물리치고 위대한 기업으로 거듭났다.','2020-04-28',12000,11,4,1);
Insert into TEAMPROJECT.BOOK (BOOK_ID,WRITER_ID,BOOK_PRICE,BOOK_NAME,BOOK_GENRE,BOOK_STORY,BOOK_PDATE,BOOK_SALEPRICE,BOOK_CNT,BOOK_SCORE,BOOK_SCORECOUNT) values (36,16,13000,'세계사를 바꾼 10가지 약','HISTORY','많은 국가와 사회를 치명적 위기에 빠뜨렸던 10가지 질병과 결정적 고비마다 인류를 무서운 질병의 위협에서 구한 10가지 약에 관한 흥미진진하고도 유익한 이야기를 통해 인류 역사를 살펴보는 『세계사를 바꾼 10가지 약』. 인류 역사는 질병과 약의 투쟁 역사다. 괴혈병, 말라리아, 매독, 에이즈 같은 치명적인 질병이 역사의 무대에 나타나 날카로운 창처럼 인류를 위협하면 비타민C, 퀴닌, 살바르산, AZT 같은 약이 기적적으로 등장하여 든든한 방패가 되어주었다. 저자는 역사에 만약은 없다고들 말하지만, 그때 만약 이랬더라면 하는 식으로 상상의 나래를 펴면 역사는 좀 더 흥미진진하고 생동감 있게 다가온다고 이야기하면서 인류 역사의 몇 가지 장면에 ‘만약’을 대입하고, 몇 가지 질환으로 압축해 역사와 의약품의 관계를 이야기한다.','2018-05-10',10000,50,4,1);
Insert into TEAMPROJECT.BOOK (BOOK_ID,WRITER_ID,BOOK_PRICE,BOOK_NAME,BOOK_GENRE,BOOK_STORY,BOOK_PDATE,BOOK_SALEPRICE,BOOK_CNT,BOOK_SCORE,BOOK_SCORECOUNT) values (30,15,19000,'스토리텔링 BIM','TECHNOLOGY','BIM(Building Information Modeling)이란 컴퓨터 하드웨어와 소프트웨어를 십분 활용하여 다양한 분야의 참여자들 간 협업을 기반으로 공간, 에너지, 디자인 등 여러 가지 측면에서 설계안을 최적화하고 시공에 앞서 가상공간에서 리스크를 확인하고 해소함으로써 최적화된 시공 프로세스를 구현하며, 유지관리단계 동안 에너지, 비용, 관리 등 다양한 측면에서 시설물 활용을 최적화하는 것에 목적을 둔 개념이다.','2020-05-25',16000,8,4,1);
Insert into TEAMPROJECT.BOOK (BOOK_ID,WRITER_ID,BOOK_PRICE,BOOK_NAME,BOOK_GENRE,BOOK_STORY,BOOK_PDATE,BOOK_SALEPRICE,BOOK_CNT,BOOK_SCORE,BOOK_SCORECOUNT) values (31,12,14000,'홍보가 아니라 소통입니다','SOCIAL','국민청원을 만든 전 청와대 디지털소통센터장 정혜승의 『홍보가 아니라 소통입니다』. 신문사 기자에서 인터넷 포털의 대외협력 책임자, 청와대 디지털소통센터장까지 올드미디어와 뉴미디어를 넘나들며 끊임없이 소통을 혁신해온 ‘소통 전문가’ 정혜승은 기업·언론·정부 모두 이제는 일방적인 홍보가 아닌 ‘소통’을 해야 한다고 말한다. 그는 미디어 생태계의 변화에 따라 소통이 어떻게 달라져왔으며, 그럼에도 변하지 않는 소통의 핵심은 무엇인지 풍부한 현장 경험과 날카로운 혜안으로 짚는다.','2020-05-25',11000,13,4,1);

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
SELECT SEQNENCE_NAME.CURRVAL FROM DUAL;
ALTER SEQUENCE SEQUENCE_NAME INCREMENT BY NUMBER;
-------------------------5_2. Example -------------------------
SELECT SEQUENCE_NAME FROM USER_SEQUENCES;
SELECT WRITER_ID_SEQ.NEXTVAL FROM DUAL;
SELECT WRITER_ID_SEQ.CURRVAL FROM DUAL;
ALTER SEQUENCE WRITER_ID_SEQ INCREMENT BY 1;
------------------------------6. sample------------------------------
select * from book where book_genre = 'LITERATURE' order by book_score/book_scorecount desc;
select b.* from (select * from book where book_genre = 'LITERATURE' order by book_score/book_scorecount desc) b where rownum=1;

--베스트샐러 5가지 가져오는 sql문
select b.BOOK_ID AS BOOK_ID, b.WRITER_ID AS WRITER_ID, b.BOOK_PRICE AS BOOK_PRICE, 
      b.BOOK_NAME AS BOOK_NAME, b.BOOK_GENRE AS BOOK_GENRE, b.BOOK_STORY AS BOOK_STORY, 
      b.BOOK_PDATE AS BOOK_PDATE, b.BOOK_SALEPRICE AS BOOK_SALEPRICE, b.BOOK_CNT AS BOOK_CNT, b.BOOK_SCORE AS BOOK_SCORE,
      w.WRITER_ID AS WRITER_ID, w.WRITER_NAME AS WRITER_NAME
from book b
inner join writer w
on b.writer_id = w.writer_id
where book_id in (select book_id
from (
select rownum, book_id
from (select book_id, sum(buy_cnt) as buy_cnt
                            from buy
                            group by book_id
                            order by buy_cnt desc)
where rownum<=5
));

update book
set book_score = book_score + 5,
    book_scorecount = book_scorecount + 1
where book_id = 23;

