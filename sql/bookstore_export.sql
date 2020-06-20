--------------------------------------------------------
--  파일이 생성됨 - 토요일-6월-20-2020   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Sequence BOOKSALE_ID_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "TEAMPROJECT"."BOOKSALE_ID_SEQ"  MINVALUE 1 MAXVALUE 10000 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  CYCLE ;
--------------------------------------------------------
--  DDL for Sequence BOOK_ID_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "TEAMPROJECT"."BOOK_ID_SEQ"  MINVALUE 1 MAXVALUE 10000 INCREMENT BY 11 START WITH 235 CACHE 20 NOORDER  CYCLE ;
--------------------------------------------------------
--  DDL for Sequence BUYCARTLIST_ID_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "TEAMPROJECT"."BUYCARTLIST_ID_SEQ"  MINVALUE 1 MAXVALUE 10000 INCREMENT BY 1 START WITH 41 CACHE 20 NOORDER  CYCLE ;
--------------------------------------------------------
--  DDL for Sequence BUYLIST_ID_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "TEAMPROJECT"."BUYLIST_ID_SEQ"  MINVALUE 1 MAXVALUE 10000 INCREMENT BY 1 START WITH 61 CACHE 20 NOORDER  CYCLE ;
--------------------------------------------------------
--  DDL for Sequence BUYREVIEW_ID_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "TEAMPROJECT"."BUYREVIEW_ID_SEQ"  MINVALUE 1 MAXVALUE 10000 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  CYCLE ;
--------------------------------------------------------
--  DDL for Sequence BUY_ID_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "TEAMPROJECT"."BUY_ID_SEQ"  MINVALUE 1 MAXVALUE 10000 INCREMENT BY 1 START WITH 61 CACHE 20 NOORDER  CYCLE ;
--------------------------------------------------------
--  DDL for Sequence QUESTION_GROUPID_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "TEAMPROJECT"."QUESTION_GROUPID_SEQ"  MINVALUE 1 MAXVALUE 10000 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  CYCLE ;
--------------------------------------------------------
--  DDL for Sequence QUESTION_ID_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "TEAMPROJECT"."QUESTION_ID_SEQ"  MINVALUE 1 MAXVALUE 10000 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  CYCLE ;
--------------------------------------------------------
--  DDL for Sequence STORE_ID_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "TEAMPROJECT"."STORE_ID_SEQ"  MINVALUE 1 MAXVALUE 10000 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  CYCLE ;
--------------------------------------------------------
--  DDL for Sequence TENDENCY_ID_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "TEAMPROJECT"."TENDENCY_ID_SEQ"  MINVALUE 1 MAXVALUE 10000 INCREMENT BY 1 START WITH 21 CACHE 20 NOORDER  CYCLE ;
--------------------------------------------------------
--  DDL for Sequence WRITER_ID_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "TEAMPROJECT"."WRITER_ID_SEQ"  MINVALUE 1 MAXVALUE 10000 INCREMENT BY 11 START WITH 1438 CACHE 20 NOORDER  CYCLE ;
--------------------------------------------------------
--  DDL for Table BOOK
--------------------------------------------------------

  CREATE TABLE "TEAMPROJECT"."BOOK" 
   (	"BOOK_ID" NUMBER(30,0), 
	"WRITER_ID" NUMBER(30,0), 
	"BOOK_PRICE" NUMBER(30,0), 
	"BOOK_NAME" VARCHAR2(256 BYTE), 
	"BOOK_GENRE" VARCHAR2(30 BYTE), 
	"BOOK_STORY" VARCHAR2(2048 BYTE), 
	"BOOK_PDATE" VARCHAR2(30 BYTE), 
	"BOOK_SALEPRICE" NUMBER(30,0), 
	"BOOK_CNT" NUMBER(30,0), 
	"BOOK_SCORE" NUMBER(30,2), 
	"BOOK_SCORECOUNT" NUMBER(30,0)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table BOOKSALE
--------------------------------------------------------

  CREATE TABLE "TEAMPROJECT"."BOOKSALE" 
   (	"BOOKSALE_ID" NUMBER(30,0), 
	"BOOK_ID" NUMBER(30,0), 
	"STORE_ID" NUMBER(30,0)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table BUY
--------------------------------------------------------

  CREATE TABLE "TEAMPROJECT"."BUY" 
   (	"BUY_ID" NUMBER(30,0), 
	"BUYLIST_ID" NUMBER(30,0), 
	"BOOK_ID" NUMBER(30,0), 
	"BUY_CNT" NUMBER(30,0)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table BUYCARTLIST
--------------------------------------------------------

  CREATE TABLE "TEAMPROJECT"."BUYCARTLIST" 
   (	"BUYCARTLIST_ID" NUMBER(30,0), 
	"CUSTOMER_ID" VARCHAR2(30 BYTE), 
	"BOOK_ID" NUMBER(30,0), 
	"BUYCARTLIST_CNT" NUMBER(30,0)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table BUYLIST
--------------------------------------------------------

  CREATE TABLE "TEAMPROJECT"."BUYLIST" 
   (	"BUYLIST_ID" NUMBER(30,0), 
	"CUSTOMER_ID" VARCHAR2(30 BYTE), 
	"BUY_DATE" DATE, 
	"BUYLIST_SHIPPINGADDRESS" VARCHAR2(100 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table BUYREVIEW
--------------------------------------------------------

  CREATE TABLE "TEAMPROJECT"."BUYREVIEW" 
   (	"BUYREVIEW_ID" NUMBER(30,0), 
	"CUSTOMER_ID" VARCHAR2(30 BYTE), 
	"BOOK_ID" NUMBER(30,0), 
	"BUYREVIEW_CONTENT" VARCHAR2(2048 BYTE), 
	"BUYREVIEW_SCORE" NUMBER(30,0)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table CUSTOMER
--------------------------------------------------------

  CREATE TABLE "TEAMPROJECT"."CUSTOMER" 
   (	"CUSTOMER_ID" VARCHAR2(30 BYTE), 
	"CUSTOMER_PASSWORD" VARCHAR2(30 BYTE), 
	"CUSTOMER_NAME" VARCHAR2(30 BYTE), 
	"CUSTOMER_TEL" VARCHAR2(30 BYTE), 
	"CUSTOMER_POINT" NUMBER(30,0), 
	"CUSTOMER_FLAG" NUMBER(30,0), 
	"CUSTOMER_EMAIL" VARCHAR2(60 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table QUESTION
--------------------------------------------------------

  CREATE TABLE "TEAMPROJECT"."QUESTION" 
   (	"QUESTION_ID" NUMBER(30,0), 
	"CUSTOMER_ID" VARCHAR2(30 BYTE), 
	"QUESTION_FLAG" NUMBER(30,0), 
	"QUESTION_TITLE" VARCHAR2(30 BYTE), 
	"QUESTION_CONTENT" VARCHAR2(2048 BYTE), 
	"QUESTION_GROUPID" NUMBER(30,0)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table STORE
--------------------------------------------------------

  CREATE TABLE "TEAMPROJECT"."STORE" 
   (	"STORE_ID" NUMBER(30,0), 
	"STORE_NAME" VARCHAR2(30 BYTE), 
	"STORE_ADDR" VARCHAR2(256 BYTE), 
	"STORE_POINT" VARCHAR2(256 BYTE), 
	"STORE_TEL" VARCHAR2(30 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table TENDENCY
--------------------------------------------------------

  CREATE TABLE "TEAMPROJECT"."TENDENCY" 
   (	"TENDENCY_ID" NUMBER(30,0), 
	"CUSTOMER_ID" VARCHAR2(30 BYTE), 
	"ART" NUMBER(30,0), 
	"SOCIAL" NUMBER(30,0), 
	"ECONOMIC" NUMBER(30,0), 
	"TECHNOLOGY" NUMBER(30,0), 
	"LITERATURE" NUMBER(30,0), 
	"HISTORY" NUMBER(30,0)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table WRITER
--------------------------------------------------------

  CREATE TABLE "TEAMPROJECT"."WRITER" 
   (	"WRITER_ID" NUMBER(30,0), 
	"WRITER_NAME" VARCHAR2(30 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
REM INSERTING into TEAMPROJECT.BOOK
SET DEFINE OFF;
Insert into TEAMPROJECT.BOOK (BOOK_ID,WRITER_ID,BOOK_PRICE,BOOK_NAME,BOOK_GENRE,BOOK_STORY,BOOK_PDATE,BOOK_SALEPRICE,BOOK_CNT,BOOK_SCORE,BOOK_SCORECOUNT) values (33,14,15000,'침묵의 봄','TECHNOLOGY','20세기 환경학 최고의 고전『침묵의 봄』. 50주년 기념 개정판으로 출간 된 이 책은 〈타임〉지가 20세기를 변화시킨 100인 중 한 사람으로 뽑은 레이첼 카슨이 쓴 책으로, 환경 문제의 심각성과 중요성을 독자들에게 일깨워 준 책이다. 저자는 친구로부터 받은 편지 한 통을 계기로 살충제의 사용 실태와 그 위험성을 조사하고, 생물학자로서의 전문지식과 작가로서의 능력을 발휘해 방사능 낙진으로 인해 더욱 절실해지기 시작한 환경 문제의 복잡성을 알기 쉽게 풀어냈다. 더불어 무분별한 살충제 사용으로 파괴되는 야생 생물계의 모습을 적나라하게 공개하여, 생태계의 오염이 어떻게 시작되고 생물과 자연환경에 어떤 영향을 미치지는 지 구체적으로 설명하였다. 이를 통해 정부와 살충제 제조업체의 행태를 지적하고, 환경문제에 대한 대중들의 생각을 환기시킬 수 있는 기회를 제시하였다.','2011-12-30',18000,9,4,1);
Insert into TEAMPROJECT.BOOK (BOOK_ID,WRITER_ID,BOOK_PRICE,BOOK_NAME,BOOK_GENRE,BOOK_STORY,BOOK_PDATE,BOOK_SALEPRICE,BOOK_CNT,BOOK_SCORE,BOOK_SCORECOUNT) values (37,18,19000,'징비록','HISTORY','오늘 이 시대에 필요한 반면교사, 류성룡의 『징비록』은 이 시대가 필요로 하는 책이다. 과연 우리는 지금 징비하고 있는가? 이 책을 쓴 류성룡은 임진왜란을 진두지휘한 선조 시대 최고의 재상으로, 그를 빼놓고는 임진왜란을 이야기할 수 없다. 이순신을 발탁하여 임진왜란을 진두지휘하여 7년 전쟁을 승리로 이끈 장본인이라 할 수 있기 때문이다. 사욕을 채우기 위해 당쟁을 벌이는 대신들과, 권력을 지키고자 일생 동안 신하들을 이용하고 백성에게 고난을 준 선조가 나라를 이끌던 이때에 류성룡과 이순신이 우리에게 있었다는 사실은 가히 천운이라 할 수밖에 없다.','2020-02-20',22000,22,4,1);
Insert into TEAMPROJECT.BOOK (BOOK_ID,WRITER_ID,BOOK_PRICE,BOOK_NAME,BOOK_GENRE,BOOK_STORY,BOOK_PDATE,BOOK_SALEPRICE,BOOK_CNT,BOOK_SCORE,BOOK_SCORECOUNT) values (40,21,11500,'오래된 비밀','HISTORY','저자는 행운과 불운을 만드는 것은 자기 자신이라고 말하며, 운명학에서 중요하게 다루는 인연법의 인간관계도 우리의 운에 많은 영향을 미치는 요소 가운데 하나라고 말한다. 재벌가의 오너, 고위 공직자와 정치인, 유명 연예인 등 우리나라 상위1% 안에 드는 4천여 명의 데이터를 연구 분석하여 운명학적 특징과 삶의 태도를 운명학적 관점에서 해석하고 정리하였다.','2013-02-28',14500,77,4,1);
Insert into TEAMPROJECT.BOOK (BOOK_ID,WRITER_ID,BOOK_PRICE,BOOK_NAME,BOOK_GENRE,BOOK_STORY,BOOK_PDATE,BOOK_SALEPRICE,BOOK_CNT,BOOK_SCORE,BOOK_SCORECOUNT) values (21,6,20000,'코스모스','TECHNOLOGY','과학 교양서의 고전『코스모스』. 이 책에서 저자는 우주의 탄생과 은하계의 진화, 태양의 삶과 죽음, 우주를 떠돌던 먼지가 의식 있는 생명이 되는 과정, 외계 생명의 존재 문제 등에 관한 내용을 수 백장의 사진과 일러스트를 곁들여 흥미롭게 설명한다. 현대 천문학을 대표하는 저명한 과학자인 저자는 이 책에서 사람들의 상상력을 사로잡고, 난해한 개념을 명쾌하게 해설하는 놀라운 능력을 마음껏 발휘한다.','2006-01-20',16000,100,15.15,4);
Insert into TEAMPROJECT.BOOK (BOOK_ID,WRITER_ID,BOOK_PRICE,BOOK_NAME,BOOK_GENRE,BOOK_STORY,BOOK_PDATE,BOOK_SALEPRICE,BOOK_CNT,BOOK_SCORE,BOOK_SCORECOUNT) values (22,7,18000,'방구석 미술관','ART','『방구석 미술관』은 2018년 출간된 이래 미술은 고상하고 우아한 사람들의 전유물이라 여겨왔던 대중들에게 큰 사랑을 받으며, 새로운 미술 교양의 지평을 열었다. 예술 분야의 베스트셀러로 꾸준히 사랑받아 온 『방구석 미술관』이 2년 만에 10만 부 판매 기록을 돌파했다. 이를 기념하기 위해 특별판으로 출간한 이번 책은 ‘프라이빗 미술관 에디션’으로, 프랑스 파리의 3대 미술관 중 하나인 오르세 미술관을 나만의 방에서 편하게 즐길 수 있도록 초대한다.','2020-05-05',14000,100,140,6);
Insert into TEAMPROJECT.BOOK (BOOK_ID,WRITER_ID,BOOK_PRICE,BOOK_NAME,BOOK_GENRE,BOOK_STORY,BOOK_PDATE,BOOK_SALEPRICE,BOOK_CNT,BOOK_SCORE,BOOK_SCORECOUNT) values (95,146,12120,'코로나 투자 전쟁','ECONOMIC','전 국민이 삼성전자를 사려 할 때 경제의 신들은 어떤 주식을 샀을까?
「경제의 신과 함께」하는 시장 분석과 투자 전략','2020-05-25',15120,100,0,1);
Insert into TEAMPROJECT.BOOK (BOOK_ID,WRITER_ID,BOOK_PRICE,BOOK_NAME,BOOK_GENRE,BOOK_STORY,BOOK_PDATE,BOOK_SALEPRICE,BOOK_CNT,BOOK_SCORE,BOOK_SCORECOUNT) values (96,150,13500,'앞으로 3년 대담한 투자','ECONOMIC','당신에게는 이기는 투자 시나리오가 있는가?
한국 대표 미래학자 최윤식 박사가 예측하는
코로나19 팬데믹 이후 시작된 대세상승장의 전개 패턴과 승리 법칙','2020-05-11',15000,100,0,1);
Insert into TEAMPROJECT.BOOK (BOOK_ID,WRITER_ID,BOOK_PRICE,BOOK_NAME,BOOK_GENRE,BOOK_STORY,BOOK_PDATE,BOOK_SALEPRICE,BOOK_CNT,BOOK_SCORE,BOOK_SCORECOUNT) values (97,151,13000,'1일 1클래식 1기쁨','ART','경이로운 클래식 음악으로 한 해를 가득 채우다!','2020-01-15',17800,100,0,1);
Insert into TEAMPROJECT.BOOK (BOOK_ID,WRITER_ID,BOOK_PRICE,BOOK_NAME,BOOK_GENRE,BOOK_STORY,BOOK_PDATE,BOOK_SALEPRICE,BOOK_CNT,BOOK_SCORE,BOOK_SCORECOUNT) values (98,153,30000,'서양미술사','ART','서양미술사 입문의 필독서!
『서양미술사』는 미술이라는 분야에 처음 입문하여 아직은 낯설기만 한 사람들을 위해 이론적 정보를 제공하기 위한 책이다.','2003-07-10',38000,100,0,1);
Insert into TEAMPROJECT.BOOK (BOOK_ID,WRITER_ID,BOOK_PRICE,BOOK_NAME,BOOK_GENRE,BOOK_STORY,BOOK_PDATE,BOOK_SALEPRICE,BOOK_CNT,BOOK_SCORE,BOOK_SCORECOUNT) values (99,154,30000,'냉전의 지구사','HISTORY','현재를 더 잘 이해하기 위하여
옥스퍼드대학교의 고전학자 재스퍼 그리핀은 “우리가 역사를 들여다보는 데에는 두 가지 동기가 있다”고 말한 바 있다. “하나는...','2020-05-25',35550,100,0,1);
Insert into TEAMPROJECT.BOOK (BOOK_ID,WRITER_ID,BOOK_PRICE,BOOK_NAME,BOOK_GENRE,BOOK_STORY,BOOK_PDATE,BOOK_SALEPRICE,BOOK_CNT,BOOK_SCORE,BOOK_SCORECOUNT) values (100,155,31000,'전염병, 역사를 흔들다','HISTORY','풍토병이 팬데믹으로, 격리에서 국제공조로
전염병과 무역이 빚어낸 21세기 세계화
2008년 처음 한국을 방문했을 때 나는 미국산 쇠고기 수입 문제로 촉발된 정치적 위기의 한복판에 있었다.','2020-05-29',35000,100,0,1);
Insert into TEAMPROJECT.BOOK (BOOK_ID,WRITER_ID,BOOK_PRICE,BOOK_NAME,BOOK_GENRE,BOOK_STORY,BOOK_PDATE,BOOK_SALEPRICE,BOOK_CNT,BOOK_SCORE,BOOK_SCORECOUNT) values (101,159,10000,'떠도는 땅','LITERATURE','그리움이 삶의 전부인, 떠도는 땅 위에 부유하는 사람들
시리고 날 선 어둠 새로 스며드는 그들의 이야기
읽는 이의 마음에 자국을 남기는 작가 김숨. 그의 집요함과 세심함이 만들어낸 이야기의 힘과 서사의 밀도는 독자와 평론가들에게 깊은 울림을 준다. ','2020-04-27',12500,100,0,1);
Insert into TEAMPROJECT.BOOK (BOOK_ID,WRITER_ID,BOOK_PRICE,BOOK_NAME,BOOK_GENRE,BOOK_STORY,BOOK_PDATE,BOOK_SALEPRICE,BOOK_CNT,BOOK_SCORE,BOOK_SCORECOUNT) values (102,160,11000,'시절과 기분','LITERATURE','“김봉곤의 소설은 왜 이렇게나 아름다울까”

2020년대 한국문학을 이끌어갈 독보적 감수성
빛나는 문장으로 쓰인 섬세하고도 세련된 마음의 서사
김봉곤의 두번째 소설집 『시절과 기분』. 2018년 봄부터 2019년 여름까지 발표한 작품 6편을 엮은 소설집이다.','2020-05-01',16000,100,0,1);
Insert into TEAMPROJECT.BOOK (BOOK_ID,WRITER_ID,BOOK_PRICE,BOOK_NAME,BOOK_GENRE,BOOK_STORY,BOOK_PDATE,BOOK_SALEPRICE,BOOK_CNT,BOOK_SCORE,BOOK_SCORECOUNT) values (103,161,13000,'지리의 힘','SOCIAL','세계는 왜 ‘지리’를 두고 분쟁하는가?
지리라는 렌즈를 통해 세계를 조망한 책 『지리의 힘』. 25년 이상 30개 이상의 분쟁 지역을 직접 현장에서 취재하며 국제 문제 전문 저널리스트로 활동해온 저자가 중국, 미국, 서유럽, 러시아, 한국과 일본, 아프리카, 라틴 아메리카, 중동, 인도와 파키스탄, 북극 등 전 세계를 10개의 지역으로 나눠 ‘지리의 힘’이 21세기 현대사에 미치는 영향을 집중적으로 파헤친 책이다.','2016-08-10',17000,100,0,1);
Insert into TEAMPROJECT.BOOK (BOOK_ID,WRITER_ID,BOOK_PRICE,BOOK_NAME,BOOK_GENRE,BOOK_STORY,BOOK_PDATE,BOOK_SALEPRICE,BOOK_CNT,BOOK_SCORE,BOOK_SCORECOUNT) values (108,162,14000,'철도원 삼대','SOCIAL','거장 황석영이 더 강력한 이야기로 돌아왔다!
한반도 100년의 역사를 꿰뚫는 방대하고 강렬한 서사의 힘
한반도 백년의 역사를 꿰뚫는 『철도원 삼대』. 이 작품은 철도원 가족을 둘러싼 방대한 서사를 통해 일제강점기부터 해방 전후 그리고 21세기까지 이어지는 노동자와 민중의 삶을 실감나게 다루고...','2020-06-05',20000,100,0,1);
Insert into TEAMPROJECT.BOOK (BOOK_ID,WRITER_ID,BOOK_PRICE,BOOK_NAME,BOOK_GENRE,BOOK_STORY,BOOK_PDATE,BOOK_SALEPRICE,BOOK_CNT,BOOK_SCORE,BOOK_SCORECOUNT) values (109,163,15000,'이기적 유전자','TECHNOLOGY','독특한 발상과 놀라운 주장으로 40여 년간 수많은 찬사와 논쟁의 중심에 선 과학 교양서의 바이블!
1976년, 처음 출간되었을 당시 과학계와 일반 대중들에게 폭발적인 반향을 불러일으키며 세기의 문제작으로 떠오른 『이기적 유전자』는 40년이라는 세월의 검증을 거치며 그 중요성과 깊이를 더욱더 확고하게 인정받았고, 25개 이상의 언어로 번역되었으며 젊은이들이 꼭 읽어야 할 과학계의 고전으로 자리 잡았다.','2018-10-20',20000,100,0,1);
Insert into TEAMPROJECT.BOOK (BOOK_ID,WRITER_ID,BOOK_PRICE,BOOK_NAME,BOOK_GENRE,BOOK_STORY,BOOK_PDATE,BOOK_SALEPRICE,BOOK_CNT,BOOK_SCORE,BOOK_SCORECOUNT) values (110,164,11000,'떨림과 울림','TECHNOLOGY','물리라는 언어를 통해 세계와 우리 존재를 바라보는 다른 눈을 뜨게 하다!
‘물리’라는 과학의 언어를 통해 세계를 읽고 생각하는 또 다른 방법을 안내하는 『떨림과 울림』. 빛, 시공간, 원자, 전자부터 최소작용의 원리, 카오스, 엔트로피, 양자역학, 단진동까지 물리에서 다루는 핵심 개념들을 차분히 소개하면서 물리라는 새로운 언어를 통해 우리 존재와 삶, 죽음의 문제부터 타자와의 관계, 세계에 관한 생각까지 새로운 틀에서 바라볼 수 있게 안내한다.','2018-11-07',15000,100,0,1);
Insert into TEAMPROJECT.BOOK (BOOK_ID,WRITER_ID,BOOK_PRICE,BOOK_NAME,BOOK_GENRE,BOOK_STORY,BOOK_PDATE,BOOK_SALEPRICE,BOOK_CNT,BOOK_SCORE,BOOK_SCORECOUNT) values (2,2,3000,'더 해빙','ECONOMIC','부와 행운을 만나는 출발점, 마법의 감정 Having! 국내 최초로 미국에서 선(先)출간되어 세계가 먼저 찾아 읽은 『더 해빙(The Having)』.','2020-03-01',12000,100,4,1);
Insert into TEAMPROJECT.BOOK (BOOK_ID,WRITER_ID,BOOK_PRICE,BOOK_NAME,BOOK_GENRE,BOOK_STORY,BOOK_PDATE,BOOK_SALEPRICE,BOOK_CNT,BOOK_SCORE,BOOK_SCORECOUNT) values (3,2,4000,'오래된 비밀2','ECONOMIC','대한민국 상위 1%의 멘토가 말하는 운의 원리『오래된 비밀』. 이 책은 ‘운명학은 과학이다’라는 전제를 바탕으로 운의 세계를 풀어가고, 우리의 운명을 가르는 행운과 불운의 실체가 무엇인지 들여다본다.','2013-02-28',14000,100,9,2);
Insert into TEAMPROJECT.BOOK (BOOK_ID,WRITER_ID,BOOK_PRICE,BOOK_NAME,BOOK_GENRE,BOOK_STORY,BOOK_PDATE,BOOK_SALEPRICE,BOOK_CNT,BOOK_SCORE,BOOK_SCORECOUNT) values (4,3,5000,'애쓰지 않고 편안하게','LITERATURE','“어떤 순간에도 만만하지 않은 평화주의자가 될 것!”《나는 나로 살기로 했다》 김수현 작가 4년 만의 신작','2020-06-05',16000,100,4,1);
Insert into TEAMPROJECT.BOOK (BOOK_ID,WRITER_ID,BOOK_PRICE,BOOK_NAME,BOOK_GENRE,BOOK_STORY,BOOK_PDATE,BOOK_SALEPRICE,BOOK_CNT,BOOK_SCORE,BOOK_SCORECOUNT) values (5,4,6000,'전부였던 사람이 떠나갔을 때 태연히 밥을 먹기도 했다','LITERATURE','베스트 셀러 《비밀편지》 저자 박근호의 첫 번째 문집《전부였던 사람이 떠나갔을 때 태연히 밥을 먹기도 했다》) 출간!','2020-05-14',13000,100,5,1);
Insert into TEAMPROJECT.BOOK (BOOK_ID,WRITER_ID,BOOK_PRICE,BOOK_NAME,BOOK_GENRE,BOOK_STORY,BOOK_PDATE,BOOK_SALEPRICE,BOOK_CNT,BOOK_SCORE,BOOK_SCORECOUNT) values (6,4,6000,'비밀편지','LITERATURE','누구에게나 있는 마음속 기억을 담은, 비밀편지 감정을 표현하지 못해 괴로워하다 ‘비밀편지’라는 이름의 삐뚤빼뚤 손글씨를 들고 신촌의 골목으로 무작정 나가 3년 동안 이름 모를 이들에게 5,000통의 편지를 보냈던 박근호. 13만 SNS 구독자들의 마음을 울린 그의 이야기를 담은『비밀편지』. 2017년 출간 이후 꾸준히 독자들의 마음을 위로해온 『비밀편지』가 새로운 문장과 사진들을 가득 담은 4장을 더한 개정증보판으로 독자들과 다시 만난다.','2019-09-09',17000,100,132.9,4);
Insert into TEAMPROJECT.BOOK (BOOK_ID,WRITER_ID,BOOK_PRICE,BOOK_NAME,BOOK_GENRE,BOOK_STORY,BOOK_PDATE,BOOK_SALEPRICE,BOOK_CNT,BOOK_SCORE,BOOK_SCORECOUNT) values (23,19,11500,'당신의 좋은 순간, 필름 사진','ART','스마트폰으로 얼마든지 쉽고 간편하게 고해상도 사진을 찍을 수 있는 요즘, 오히려 필름 사진을 찍는 사람들이 늘고 있다. 가벼운 일회용 카메라부터 SLR 카메라까지 취향에 맞는 카메라로 자신만의 감성을 담아 SNS에 올리고 열광적인 반응을 얻는다. 이 책은 필름 카메라의 기본 사용법은 물론 일회용 카메라를 업사이클링하는 방법, 필름 사진으로 멋진 작업을 보여주는 세 사람의 인터뷰까지 필름 사진에 대한 다양한 즐거움을 선사한다.','2020-06-01',14500,50,4,1);
Insert into TEAMPROJECT.BOOK (BOOK_ID,WRITER_ID,BOOK_PRICE,BOOK_NAME,BOOK_GENRE,BOOK_STORY,BOOK_PDATE,BOOK_SALEPRICE,BOOK_CNT,BOOK_SCORE,BOOK_SCORECOUNT) values (24,9,12000,'우리 각자의 미술관','ART','『우리 각자의 미술관』은 지식 없이도 그림과 깊이 만나도록 안내하는 ‘그림 감상 실용서’다. 미술관과 미술 애호가인 최혜진 작가가 수년간 실천해온 그림 감상법을 담았다. 〈그림에게 묻고 답하기〉라 이름 붙인 이 감상법은 지식과 이론으로 이해하는 감상이 아닌, 작품과 순수하게 교감하며 즐기는 길을 알려준다. 그림 앞에서 무엇을 어떻게 감상해야 할지 막막했던 이들에게 든든한 감상 노하우를 제공할 것이다.','2020-04-28',15000,13,4,1);
Insert into TEAMPROJECT.BOOK (BOOK_ID,WRITER_ID,BOOK_PRICE,BOOK_NAME,BOOK_GENRE,BOOK_STORY,BOOK_PDATE,BOOK_SALEPRICE,BOOK_CNT,BOOK_SCORE,BOOK_SCORECOUNT) values (25,10,12000,'선량한 차별주의자','SOCIAL','은밀하고 사소하며 일상적이고 자연스럽게 벌어지는 일들 속에서 선량한 우리가 놓치고 있던 차별과 혐오의 순간을 날카롭게 포착하는 『선량한 차별주의자』. 차별의 사각지대에 놓인 이들을 직접 찾아가는 현장 활동가이자, 통계학·사회복지학·법학을 넘나드는 통합적인 시각을 바탕으로 국내의 열악한 혐오·차별 문제의 이론적 토대를 구축하는 데 전념해온 연구자인 김지혜 교수가 인간 심리에 대한 국내외의 최신 연구, 현장에서 기록한 생생한 사례, 학생들과 꾸준히 진행해온 토론수업과 전문가들의 학술포럼에서의 다양한 논쟁을 버무려 우리 일상에 숨겨진 혐오와 차별의 순간들을 생생하게 담아냈다.','2019-07-17',15000,5,4,1);
Insert into TEAMPROJECT.BOOK (BOOK_ID,WRITER_ID,BOOK_PRICE,BOOK_NAME,BOOK_GENRE,BOOK_STORY,BOOK_PDATE,BOOK_SALEPRICE,BOOK_CNT,BOOK_SCORE,BOOK_SCORECOUNT) values (26,11,13500,'우리의 불행은 당연하지 않습니다','SOCIAL','“우린 지금 이상한 나라에 살고 있다.” 2018년 비인간적인 노동 환경에 아들을 잃은 故 김용균 씨 어머니의 이 한마디는 많은 의미를 담고 있다. 한국은 이제 국민소득 3만 불대에 진입할 만큼 부유해졌고 민주적인 촛불 혁명을 통해 정권도 교체했지만 왜 여전히 수많은 사람들이 고통 속에서 신음할까? 중앙대 독문학과 교수이자 독일유럽연구센터 소장인 김누리 교수가 ‘이상한 나라’ 대한민국의 불편한 진실을 파헤친『우리의 불행은 당연하지 않습니다』. 주요 포털사이트 실시간 검색어에 오르며 폭발적인 반응을 일으킨 JTBC 〈차이나는 클라스〉의 ‘독일 2부작’ 강연부터 인기 팟캐스트 정영진, 최욱의 〈매불쇼〉 강력 추천 에피소드까지, 많은 이들에게 놀랄 만한 통찰과 충격을 안겨주었던 김누리 교수의 비판적 분석과 전망을 보충 정리하여 이 한 권의 책에 담았다.','2020-03-06',16500,23,4,1);
Insert into TEAMPROJECT.BOOK (BOOK_ID,WRITER_ID,BOOK_PRICE,BOOK_NAME,BOOK_GENRE,BOOK_STORY,BOOK_PDATE,BOOK_SALEPRICE,BOOK_CNT,BOOK_SCORE,BOOK_SCORECOUNT) values (35,17,19000,'설민석의 조선왕조실록','HISTORY','다수의 방송에 출연해 화제를 모은 바 있는 스타강사 설민석의 재미있고 깊이 있는 한국사 책 『설민석의 조선왕조실록』. 27명의 조선의 왕들을 한 권으로 불러 모아 핵심적인 주요 사건들을 풀어쓴 책으로, 설민석 특유의 흡입력 있는 간결함과 재치 있는 말투를 구어체 그대로 책에다 담았다.
나아가, 이 책의 백미는 고리타분하고 어렵다는 역사의 고정관념을 과감히 깨트린데 있다. 왕이기 이전에 아들로서, 남편으로서, 아버지로서의 인간적인 삶이 낱낱이 드러난 모습들은 남다른 재미를 선사한다. 조선사의 큰 줄기와 핵심을 알고 싶지만, 쉽게 도전하지 못했던 독자들에게 편안하고 즐길 수 있는 역사 이야기를 들려줄 것이다.','2016-07-20',22000,13,4,1);
Insert into TEAMPROJECT.BOOK (BOOK_ID,WRITER_ID,BOOK_PRICE,BOOK_NAME,BOOK_GENRE,BOOK_STORY,BOOK_PDATE,BOOK_SALEPRICE,BOOK_CNT,BOOK_SCORE,BOOK_SCORECOUNT) values (28,13,15000,'룬샷','ECONOMIC','어떻게 미국은 제2차 세계대전을 계기로 세계 패권을 잡았는가? 애플을 세운 스티브 잡스부터 영화〈스타워즈〉시리즈, 바이오테크 산업의 문을 연 제넨테크까지 이들은 무엇이 달랐기에 결정적 순간에 폭발적 성장을 할 수 있었을까? 비슷한 점이 전혀 없어 보이는 이들 국가, 기업, 리더에게는 한 가지 공통점이 있었다. 바로 외면 받던 아이디어를 발 빠르게 육성해 성장의 동력으로 만드는 시스템을 갖추었던 것. 이들은 창의성과 효율성의 선순환 시스템을 통해 세계의 패권을 잡고, 질병과의 전쟁에서 승리했으며, 쟁쟁한 경쟁자들을 물리치고 위대한 기업으로 거듭났다.','2020-04-28',18000,11,4,1);
Insert into TEAMPROJECT.BOOK (BOOK_ID,WRITER_ID,BOOK_PRICE,BOOK_NAME,BOOK_GENRE,BOOK_STORY,BOOK_PDATE,BOOK_SALEPRICE,BOOK_CNT,BOOK_SCORE,BOOK_SCORECOUNT) values (36,16,13000,'세계사를 바꾼 10가지 약','HISTORY','많은 국가와 사회를 치명적 위기에 빠뜨렸던 10가지 질병과 결정적 고비마다 인류를 무서운 질병의 위협에서 구한 10가지 약에 관한 흥미진진하고도 유익한 이야기를 통해 인류 역사를 살펴보는 『세계사를 바꾼 10가지 약』. 인류 역사는 질병과 약의 투쟁 역사다. 괴혈병, 말라리아, 매독, 에이즈 같은 치명적인 질병이 역사의 무대에 나타나 날카로운 창처럼 인류를 위협하면 비타민C, 퀴닌, 살바르산, AZT 같은 약이 기적적으로 등장하여 든든한 방패가 되어주었다. 저자는 역사에 만약은 없다고들 말하지만, 그때 만약 이랬더라면 하는 식으로 상상의 나래를 펴면 역사는 좀 더 흥미진진하고 생동감 있게 다가온다고 이야기하면서 인류 역사의 몇 가지 장면에 ‘만약’을 대입하고, 몇 가지 질환으로 압축해 역사와 의약품의 관계를 이야기한다.','2018-05-10',16000,50,4,1);
Insert into TEAMPROJECT.BOOK (BOOK_ID,WRITER_ID,BOOK_PRICE,BOOK_NAME,BOOK_GENRE,BOOK_STORY,BOOK_PDATE,BOOK_SALEPRICE,BOOK_CNT,BOOK_SCORE,BOOK_SCORECOUNT) values (30,15,19000,'스토리텔링 BIM','TECHNOLOGY','BIM(Building Information Modeling)이란 컴퓨터 하드웨어와 소프트웨어를 십분 활용하여 다양한 분야의 참여자들 간 협업을 기반으로 공간, 에너지, 디자인 등 여러 가지 측면에서 설계안을 최적화하고 시공에 앞서 가상공간에서 리스크를 확인하고 해소함으로써 최적화된 시공 프로세스를 구현하며, 유지관리단계 동안 에너지, 비용, 관리 등 다양한 측면에서 시설물 활용을 최적화하는 것에 목적을 둔 개념이다.','2020-05-25',22000,8,4,1);
Insert into TEAMPROJECT.BOOK (BOOK_ID,WRITER_ID,BOOK_PRICE,BOOK_NAME,BOOK_GENRE,BOOK_STORY,BOOK_PDATE,BOOK_SALEPRICE,BOOK_CNT,BOOK_SCORE,BOOK_SCORECOUNT) values (31,12,14000,'홍보가 아니라 소통입니다','SOCIAL','국민청원을 만든 전 청와대 디지털소통센터장 정혜승의 『홍보가 아니라 소통입니다』. 신문사 기자에서 인터넷 포털의 대외협력 책임자, 청와대 디지털소통센터장까지 올드미디어와 뉴미디어를 넘나들며 끊임없이 소통을 혁신해온 ‘소통 전문가’ 정혜승은 기업·언론·정부 모두 이제는 일방적인 홍보가 아닌 ‘소통’을 해야 한다고 말한다. 그는 미디어 생태계의 변화에 따라 소통이 어떻게 달라져왔으며, 그럼에도 변하지 않는 소통의 핵심은 무엇인지 풍부한 현장 경험과 날카로운 혜안으로 짚는다.','2020-05-25',17000,13,4,1);
Insert into TEAMPROJECT.BOOK (BOOK_ID,WRITER_ID,BOOK_PRICE,BOOK_NAME,BOOK_GENRE,BOOK_STORY,BOOK_PDATE,BOOK_SALEPRICE,BOOK_CNT,BOOK_SCORE,BOOK_SCORECOUNT) values (1,1816,12,'테스트','ECONOMIC','11','2020-06-16',13,1,0,1);
Insert into TEAMPROJECT.BOOK (BOOK_ID,WRITER_ID,BOOK_PRICE,BOOK_NAME,BOOK_GENRE,BOOK_STORY,BOOK_PDATE,BOOK_SALEPRICE,BOOK_CNT,BOOK_SCORE,BOOK_SCORECOUNT) values (15,1816,12,'테스트22','LITERATURE','1','2020-06-14',13,1,0,1);
Insert into TEAMPROJECT.BOOK (BOOK_ID,WRITER_ID,BOOK_PRICE,BOOK_NAME,BOOK_GENRE,BOOK_STORY,BOOK_PDATE,BOOK_SALEPRICE,BOOK_CNT,BOOK_SCORE,BOOK_SCORECOUNT) values (48,1816,12,'테스트22222','LITERATURE','11','2020-06-25',13,1,0,1);
REM INSERTING into TEAMPROJECT.BOOKSALE
SET DEFINE OFF;
REM INSERTING into TEAMPROJECT.BUY
SET DEFINE OFF;
Insert into TEAMPROJECT.BUY (BUY_ID,BUYLIST_ID,BOOK_ID,BUY_CNT) values (1,1,2,3);
Insert into TEAMPROJECT.BUY (BUY_ID,BUYLIST_ID,BOOK_ID,BUY_CNT) values (2,1,3,2);
Insert into TEAMPROJECT.BUY (BUY_ID,BUYLIST_ID,BOOK_ID,BUY_CNT) values (3,1,6,1);
Insert into TEAMPROJECT.BUY (BUY_ID,BUYLIST_ID,BOOK_ID,BUY_CNT) values (4,1,22,1);
Insert into TEAMPROJECT.BUY (BUY_ID,BUYLIST_ID,BOOK_ID,BUY_CNT) values (5,1,31,2);
Insert into TEAMPROJECT.BUY (BUY_ID,BUYLIST_ID,BOOK_ID,BUY_CNT) values (21,21,22,1);
Insert into TEAMPROJECT.BUY (BUY_ID,BUYLIST_ID,BOOK_ID,BUY_CNT) values (22,22,37,1);
Insert into TEAMPROJECT.BUY (BUY_ID,BUYLIST_ID,BOOK_ID,BUY_CNT) values (23,23,37,1);
Insert into TEAMPROJECT.BUY (BUY_ID,BUYLIST_ID,BOOK_ID,BUY_CNT) values (24,24,2,1);
Insert into TEAMPROJECT.BUY (BUY_ID,BUYLIST_ID,BOOK_ID,BUY_CNT) values (25,25,2,1);
Insert into TEAMPROJECT.BUY (BUY_ID,BUYLIST_ID,BOOK_ID,BUY_CNT) values (26,26,2,1);
Insert into TEAMPROJECT.BUY (BUY_ID,BUYLIST_ID,BOOK_ID,BUY_CNT) values (27,27,2,1);
Insert into TEAMPROJECT.BUY (BUY_ID,BUYLIST_ID,BOOK_ID,BUY_CNT) values (28,28,2,1);
Insert into TEAMPROJECT.BUY (BUY_ID,BUYLIST_ID,BOOK_ID,BUY_CNT) values (29,29,2,1);
Insert into TEAMPROJECT.BUY (BUY_ID,BUYLIST_ID,BOOK_ID,BUY_CNT) values (30,30,2,1);
Insert into TEAMPROJECT.BUY (BUY_ID,BUYLIST_ID,BOOK_ID,BUY_CNT) values (31,31,2,1);
Insert into TEAMPROJECT.BUY (BUY_ID,BUYLIST_ID,BOOK_ID,BUY_CNT) values (32,32,2,1);
Insert into TEAMPROJECT.BUY (BUY_ID,BUYLIST_ID,BOOK_ID,BUY_CNT) values (33,33,2,20);
Insert into TEAMPROJECT.BUY (BUY_ID,BUYLIST_ID,BOOK_ID,BUY_CNT) values (34,34,2,20);
Insert into TEAMPROJECT.BUY (BUY_ID,BUYLIST_ID,BOOK_ID,BUY_CNT) values (35,35,2,20);
Insert into TEAMPROJECT.BUY (BUY_ID,BUYLIST_ID,BOOK_ID,BUY_CNT) values (36,36,2,10);
Insert into TEAMPROJECT.BUY (BUY_ID,BUYLIST_ID,BOOK_ID,BUY_CNT) values (37,37,2,15);
Insert into TEAMPROJECT.BUY (BUY_ID,BUYLIST_ID,BOOK_ID,BUY_CNT) values (38,38,2,15);
Insert into TEAMPROJECT.BUY (BUY_ID,BUYLIST_ID,BOOK_ID,BUY_CNT) values (39,39,2,15);
Insert into TEAMPROJECT.BUY (BUY_ID,BUYLIST_ID,BOOK_ID,BUY_CNT) values (40,40,2,15);
Insert into TEAMPROJECT.BUY (BUY_ID,BUYLIST_ID,BOOK_ID,BUY_CNT) values (41,41,2,40);
Insert into TEAMPROJECT.BUY (BUY_ID,BUYLIST_ID,BOOK_ID,BUY_CNT) values (42,42,2,40);
Insert into TEAMPROJECT.BUY (BUY_ID,BUYLIST_ID,BOOK_ID,BUY_CNT) values (43,43,2,40);
Insert into TEAMPROJECT.BUY (BUY_ID,BUYLIST_ID,BOOK_ID,BUY_CNT) values (44,44,2,30);
Insert into TEAMPROJECT.BUY (BUY_ID,BUYLIST_ID,BOOK_ID,BUY_CNT) values (45,45,2,30);
Insert into TEAMPROJECT.BUY (BUY_ID,BUYLIST_ID,BOOK_ID,BUY_CNT) values (46,46,2,30);
Insert into TEAMPROJECT.BUY (BUY_ID,BUYLIST_ID,BOOK_ID,BUY_CNT) values (47,47,2,30);
Insert into TEAMPROJECT.BUY (BUY_ID,BUYLIST_ID,BOOK_ID,BUY_CNT) values (48,48,2,30);
Insert into TEAMPROJECT.BUY (BUY_ID,BUYLIST_ID,BOOK_ID,BUY_CNT) values (49,49,2,30);
Insert into TEAMPROJECT.BUY (BUY_ID,BUYLIST_ID,BOOK_ID,BUY_CNT) values (50,50,3,30);
Insert into TEAMPROJECT.BUY (BUY_ID,BUYLIST_ID,BOOK_ID,BUY_CNT) values (51,51,3,30);
Insert into TEAMPROJECT.BUY (BUY_ID,BUYLIST_ID,BOOK_ID,BUY_CNT) values (52,52,3,50);
REM INSERTING into TEAMPROJECT.BUYCARTLIST
SET DEFINE OFF;
Insert into TEAMPROJECT.BUYCARTLIST (BUYCARTLIST_ID,CUSTOMER_ID,BOOK_ID,BUYCARTLIST_CNT) values (4,'bbb',2,2);
REM INSERTING into TEAMPROJECT.BUYLIST
SET DEFINE OFF;
Insert into TEAMPROJECT.BUYLIST (BUYLIST_ID,CUSTOMER_ID,BUY_DATE,BUYLIST_SHIPPINGADDRESS) values (1,'aaa',to_date('20/06/11','RR/MM/DD'),'양천구 중앙로 34가길 51');
Insert into TEAMPROJECT.BUYLIST (BUYLIST_ID,CUSTOMER_ID,BUY_DATE,BUYLIST_SHIPPINGADDRESS) values (21,'admin',to_date('20/06/13','RR/MM/DD'),'양천구 중앙로 34가길 5d');
Insert into TEAMPROJECT.BUYLIST (BUYLIST_ID,CUSTOMER_ID,BUY_DATE,BUYLIST_SHIPPINGADDRESS) values (22,'admin',to_date('20/06/13','RR/MM/DD'),'양천구 중앙로 34가길 5s');
Insert into TEAMPROJECT.BUYLIST (BUYLIST_ID,CUSTOMER_ID,BUY_DATE,BUYLIST_SHIPPINGADDRESS) values (23,'admin',to_date('20/06/13','RR/MM/DD'),'양천구 중앙로 34가길 5s');
Insert into TEAMPROJECT.BUYLIST (BUYLIST_ID,CUSTOMER_ID,BUY_DATE,BUYLIST_SHIPPINGADDRESS) values (24,'aaa',to_date('20/06/13','RR/MM/DD'),'양천구');
Insert into TEAMPROJECT.BUYLIST (BUYLIST_ID,CUSTOMER_ID,BUY_DATE,BUYLIST_SHIPPINGADDRESS) values (25,'aaa',to_date('20/06/12','RR/MM/DD'),'양천구');
Insert into TEAMPROJECT.BUYLIST (BUYLIST_ID,CUSTOMER_ID,BUY_DATE,BUYLIST_SHIPPINGADDRESS) values (26,'aaa',to_date('20/06/10','RR/MM/DD'),'양천구');
Insert into TEAMPROJECT.BUYLIST (BUYLIST_ID,CUSTOMER_ID,BUY_DATE,BUYLIST_SHIPPINGADDRESS) values (27,'aaa',to_date('20/06/09','RR/MM/DD'),'양천구');
Insert into TEAMPROJECT.BUYLIST (BUYLIST_ID,CUSTOMER_ID,BUY_DATE,BUYLIST_SHIPPINGADDRESS) values (28,'aaa',to_date('20/06/08','RR/MM/DD'),'양천구');
Insert into TEAMPROJECT.BUYLIST (BUYLIST_ID,CUSTOMER_ID,BUY_DATE,BUYLIST_SHIPPINGADDRESS) values (29,'aaa',to_date('20/06/07','RR/MM/DD'),'양천구');
Insert into TEAMPROJECT.BUYLIST (BUYLIST_ID,CUSTOMER_ID,BUY_DATE,BUYLIST_SHIPPINGADDRESS) values (30,'aaa',to_date('20/06/06','RR/MM/DD'),'양천구');
Insert into TEAMPROJECT.BUYLIST (BUYLIST_ID,CUSTOMER_ID,BUY_DATE,BUYLIST_SHIPPINGADDRESS) values (31,'aaa',to_date('20/06/05','RR/MM/DD'),'양천구');
Insert into TEAMPROJECT.BUYLIST (BUYLIST_ID,CUSTOMER_ID,BUY_DATE,BUYLIST_SHIPPINGADDRESS) values (32,'aaa',to_date('20/06/04','RR/MM/DD'),'양천구');
Insert into TEAMPROJECT.BUYLIST (BUYLIST_ID,CUSTOMER_ID,BUY_DATE,BUYLIST_SHIPPINGADDRESS) values (33,'aaa',to_date('20/06/03','RR/MM/DD'),'양천구');
Insert into TEAMPROJECT.BUYLIST (BUYLIST_ID,CUSTOMER_ID,BUY_DATE,BUYLIST_SHIPPINGADDRESS) values (34,'aaa',to_date('20/06/02','RR/MM/DD'),'양천구');
Insert into TEAMPROJECT.BUYLIST (BUYLIST_ID,CUSTOMER_ID,BUY_DATE,BUYLIST_SHIPPINGADDRESS) values (35,'aaa',to_date('20/06/01','RR/MM/DD'),'양천구');
Insert into TEAMPROJECT.BUYLIST (BUYLIST_ID,CUSTOMER_ID,BUY_DATE,BUYLIST_SHIPPINGADDRESS) values (36,'aaa',to_date('20/05/30','RR/MM/DD'),'양천구');
Insert into TEAMPROJECT.BUYLIST (BUYLIST_ID,CUSTOMER_ID,BUY_DATE,BUYLIST_SHIPPINGADDRESS) values (37,'aaa',to_date('20/05/29','RR/MM/DD'),'양천구');
Insert into TEAMPROJECT.BUYLIST (BUYLIST_ID,CUSTOMER_ID,BUY_DATE,BUYLIST_SHIPPINGADDRESS) values (38,'aaa',to_date('20/05/28','RR/MM/DD'),'양천구');
Insert into TEAMPROJECT.BUYLIST (BUYLIST_ID,CUSTOMER_ID,BUY_DATE,BUYLIST_SHIPPINGADDRESS) values (39,'aaa',to_date('20/05/27','RR/MM/DD'),'양천구');
Insert into TEAMPROJECT.BUYLIST (BUYLIST_ID,CUSTOMER_ID,BUY_DATE,BUYLIST_SHIPPINGADDRESS) values (40,'aaa',to_date('20/05/26','RR/MM/DD'),'양천구');
Insert into TEAMPROJECT.BUYLIST (BUYLIST_ID,CUSTOMER_ID,BUY_DATE,BUYLIST_SHIPPINGADDRESS) values (41,'aaa',to_date('20/05/25','RR/MM/DD'),'양천구');
Insert into TEAMPROJECT.BUYLIST (BUYLIST_ID,CUSTOMER_ID,BUY_DATE,BUYLIST_SHIPPINGADDRESS) values (42,'aaa',to_date('20/05/24','RR/MM/DD'),'양천구');
Insert into TEAMPROJECT.BUYLIST (BUYLIST_ID,CUSTOMER_ID,BUY_DATE,BUYLIST_SHIPPINGADDRESS) values (43,'aaa',to_date('20/05/23','RR/MM/DD'),'양천구');
Insert into TEAMPROJECT.BUYLIST (BUYLIST_ID,CUSTOMER_ID,BUY_DATE,BUYLIST_SHIPPINGADDRESS) values (44,'aaa',to_date('20/05/22','RR/MM/DD'),'양천구');
Insert into TEAMPROJECT.BUYLIST (BUYLIST_ID,CUSTOMER_ID,BUY_DATE,BUYLIST_SHIPPINGADDRESS) values (45,'aaa',to_date('20/05/21','RR/MM/DD'),'양천구');
Insert into TEAMPROJECT.BUYLIST (BUYLIST_ID,CUSTOMER_ID,BUY_DATE,BUYLIST_SHIPPINGADDRESS) values (46,'aaa',to_date('20/05/20','RR/MM/DD'),'양천구');
Insert into TEAMPROJECT.BUYLIST (BUYLIST_ID,CUSTOMER_ID,BUY_DATE,BUYLIST_SHIPPINGADDRESS) values (47,'aaa',to_date('19/05/20','RR/MM/DD'),'양천구');
Insert into TEAMPROJECT.BUYLIST (BUYLIST_ID,CUSTOMER_ID,BUY_DATE,BUYLIST_SHIPPINGADDRESS) values (48,'aaa',to_date('19/04/20','RR/MM/DD'),'양천구');
Insert into TEAMPROJECT.BUYLIST (BUYLIST_ID,CUSTOMER_ID,BUY_DATE,BUYLIST_SHIPPINGADDRESS) values (49,'aaa',to_date('19/03/20','RR/MM/DD'),'양천구');
Insert into TEAMPROJECT.BUYLIST (BUYLIST_ID,CUSTOMER_ID,BUY_DATE,BUYLIST_SHIPPINGADDRESS) values (50,'aaa',to_date('19/02/20','RR/MM/DD'),'양천구');
Insert into TEAMPROJECT.BUYLIST (BUYLIST_ID,CUSTOMER_ID,BUY_DATE,BUYLIST_SHIPPINGADDRESS) values (51,'aaa',to_date('19/01/20','RR/MM/DD'),'양천구');
Insert into TEAMPROJECT.BUYLIST (BUYLIST_ID,CUSTOMER_ID,BUY_DATE,BUYLIST_SHIPPINGADDRESS) values (52,'aaa',to_date('18/01/20','RR/MM/DD'),'양천구');
REM INSERTING into TEAMPROJECT.BUYREVIEW
SET DEFINE OFF;
REM INSERTING into TEAMPROJECT.CUSTOMER
SET DEFINE OFF;
Insert into TEAMPROJECT.CUSTOMER (CUSTOMER_ID,CUSTOMER_PASSWORD,CUSTOMER_NAME,CUSTOMER_TEL,CUSTOMER_POINT,CUSTOMER_FLAG,CUSTOMER_EMAIL) values ('admin','1234','adminname','010-1131-2222',0,0,null);
Insert into TEAMPROJECT.CUSTOMER (CUSTOMER_ID,CUSTOMER_PASSWORD,CUSTOMER_NAME,CUSTOMER_TEL,CUSTOMER_POINT,CUSTOMER_FLAG,CUSTOMER_EMAIL) values ('aaa','1234','aaaname','010-1111-2222',0,1,'lovepizza132@gmail.com');
Insert into TEAMPROJECT.CUSTOMER (CUSTOMER_ID,CUSTOMER_PASSWORD,CUSTOMER_NAME,CUSTOMER_TEL,CUSTOMER_POINT,CUSTOMER_FLAG,CUSTOMER_EMAIL) values ('bbb','1234','bbbname','010-2222-3333',0,1,null);
Insert into TEAMPROJECT.CUSTOMER (CUSTOMER_ID,CUSTOMER_PASSWORD,CUSTOMER_NAME,CUSTOMER_TEL,CUSTOMER_POINT,CUSTOMER_FLAG,CUSTOMER_EMAIL) values ('ccc','1234','cccname','010-3333-4444',0,1,null);
REM INSERTING into TEAMPROJECT.QUESTION
SET DEFINE OFF;
REM INSERTING into TEAMPROJECT.STORE
SET DEFINE OFF;
Insert into TEAMPROJECT.STORE (STORE_ID,STORE_NAME,STORE_ADDR,STORE_POINT,STORE_TEL) values (7,'종로점','서울특별시 종로구 종로1가','37.5615512, 126.9733249','02-123-4567');
Insert into TEAMPROJECT.STORE (STORE_ID,STORE_NAME,STORE_ADDR,STORE_POINT,STORE_TEL) values (8,'노원점','서울특별시 노원구 상계6.7동 동일로 1414','37.6558348, 127.0628463','02-333-5555');
Insert into TEAMPROJECT.STORE (STORE_ID,STORE_NAME,STORE_ADDR,STORE_POINT,STORE_TEL) values (9,'가로수점','서울특별시 신사동 압구정로12길 46','37.5190935, 127.021955','02-777-8888');
Insert into TEAMPROJECT.STORE (STORE_ID,STORE_NAME,STORE_ADDR,STORE_POINT,STORE_TEL) values (10,'남산점','서울특별시 용산구 용산2가동 남산공원길 105','37.5511789, 126.9856882','02-233-1234');
REM INSERTING into TEAMPROJECT.TENDENCY
SET DEFINE OFF;
Insert into TEAMPROJECT.TENDENCY (TENDENCY_ID,CUSTOMER_ID,ART,SOCIAL,ECONOMIC,TECHNOLOGY,LITERATURE,HISTORY) values (1,'admin',11,0,0,0,0,23);
Insert into TEAMPROJECT.TENDENCY (TENDENCY_ID,CUSTOMER_ID,ART,SOCIAL,ECONOMIC,TECHNOLOGY,LITERATURE,HISTORY) values (2,'aaa',11,12,20,0,11,0);
Insert into TEAMPROJECT.TENDENCY (TENDENCY_ID,CUSTOMER_ID,ART,SOCIAL,ECONOMIC,TECHNOLOGY,LITERATURE,HISTORY) values (3,'bbb',0,0,0,0,0,0);
Insert into TEAMPROJECT.TENDENCY (TENDENCY_ID,CUSTOMER_ID,ART,SOCIAL,ECONOMIC,TECHNOLOGY,LITERATURE,HISTORY) values (4,'ccc',0,0,0,0,0,0);
REM INSERTING into TEAMPROJECT.WRITER
SET DEFINE OFF;
Insert into TEAMPROJECT.WRITER (WRITER_ID,WRITER_NAME) values (157,'세영');
Insert into TEAMPROJECT.WRITER (WRITER_ID,WRITER_NAME) values (6,'칼 세이건');
Insert into TEAMPROJECT.WRITER (WRITER_ID,WRITER_NAME) values (7,'조원재');
Insert into TEAMPROJECT.WRITER (WRITER_ID,WRITER_NAME) values (151,'클레먼시 버턴힐');
Insert into TEAMPROJECT.WRITER (WRITER_ID,WRITER_NAME) values (153,'E. H. 곰브리치');
Insert into TEAMPROJECT.WRITER (WRITER_ID,WRITER_NAME) values (146,'정채진');
Insert into TEAMPROJECT.WRITER (WRITER_ID,WRITER_NAME) values (150,'최윤식');
Insert into TEAMPROJECT.WRITER (WRITER_ID,WRITER_NAME) values (154,'오드 아르네 베스타');
Insert into TEAMPROJECT.WRITER (WRITER_ID,WRITER_NAME) values (155,'마크 해리슨');
Insert into TEAMPROJECT.WRITER (WRITER_ID,WRITER_NAME) values (159,'김숨');
Insert into TEAMPROJECT.WRITER (WRITER_ID,WRITER_NAME) values (160,'김봉곤');
Insert into TEAMPROJECT.WRITER (WRITER_ID,WRITER_NAME) values (161,'팀 마샬');
Insert into TEAMPROJECT.WRITER (WRITER_ID,WRITER_NAME) values (162,'황석영');
Insert into TEAMPROJECT.WRITER (WRITER_ID,WRITER_NAME) values (163,'리처드 도킨스');
Insert into TEAMPROJECT.WRITER (WRITER_ID,WRITER_NAME) values (164,'김상욱');
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
Insert into TEAMPROJECT.WRITER (WRITER_ID,WRITER_NAME) values (1218,'999999');
Insert into TEAMPROJECT.WRITER (WRITER_ID,WRITER_NAME) values (208,'더미데이터');
Insert into TEAMPROJECT.WRITER (WRITER_ID,WRITER_NAME) values (409,'더미데이터');
Insert into TEAMPROJECT.WRITER (WRITER_ID,WRITER_NAME) values (610,'더미데이터');
Insert into TEAMPROJECT.WRITER (WRITER_ID,WRITER_NAME) values (811,'더미데이터');
Insert into TEAMPROJECT.WRITER (WRITER_ID,WRITER_NAME) values (1012,'더미데이터');
Insert into TEAMPROJECT.WRITER (WRITER_ID,WRITER_NAME) values (1213,'더미데이터');
Insert into TEAMPROJECT.WRITER (WRITER_ID,WRITER_NAME) values (1414,'더미데이터');
Insert into TEAMPROJECT.WRITER (WRITER_ID,WRITER_NAME) values (1615,'더미데이터');
Insert into TEAMPROJECT.WRITER (WRITER_ID,WRITER_NAME) values (1816,'더미데이터');
Insert into TEAMPROJECT.WRITER (WRITER_ID,WRITER_NAME) values (2017,'더미데이터');
Insert into TEAMPROJECT.WRITER (WRITER_ID,WRITER_NAME) values (2218,'더미데이터');
Insert into TEAMPROJECT.WRITER (WRITER_ID,WRITER_NAME) values (2419,'더미데이터');
Insert into TEAMPROJECT.WRITER (WRITER_ID,WRITER_NAME) values (2620,'더미데이터');
Insert into TEAMPROJECT.WRITER (WRITER_ID,WRITER_NAME) values (2821,'더미데이터');
Insert into TEAMPROJECT.WRITER (WRITER_ID,WRITER_NAME) values (3022,'더미데이터');
Insert into TEAMPROJECT.WRITER (WRITER_ID,WRITER_NAME) values (3223,'더미데이터');
Insert into TEAMPROJECT.WRITER (WRITER_ID,WRITER_NAME) values (3424,'더미데이터');
Insert into TEAMPROJECT.WRITER (WRITER_ID,WRITER_NAME) values (3625,'더미데이터');
Insert into TEAMPROJECT.WRITER (WRITER_ID,WRITER_NAME) values (3826,'더미데이터');
Insert into TEAMPROJECT.WRITER (WRITER_ID,WRITER_NAME) values (4027,'더미데이터');
Insert into TEAMPROJECT.WRITER (WRITER_ID,WRITER_NAME) values (4228,'더미데이터');
Insert into TEAMPROJECT.WRITER (WRITER_ID,WRITER_NAME) values (4429,'더미데이터');
Insert into TEAMPROJECT.WRITER (WRITER_ID,WRITER_NAME) values (4630,'더미데이터');
Insert into TEAMPROJECT.WRITER (WRITER_ID,WRITER_NAME) values (4831,'더미데이터');
Insert into TEAMPROJECT.WRITER (WRITER_ID,WRITER_NAME) values (5032,'더미데이터');
Insert into TEAMPROJECT.WRITER (WRITER_ID,WRITER_NAME) values (5233,'더미데이터');
Insert into TEAMPROJECT.WRITER (WRITER_ID,WRITER_NAME) values (5434,'더미데이터');
Insert into TEAMPROJECT.WRITER (WRITER_ID,WRITER_NAME) values (5635,'더미데이터');
Insert into TEAMPROJECT.WRITER (WRITER_ID,WRITER_NAME) values (5836,'더미데이터');
Insert into TEAMPROJECT.WRITER (WRITER_ID,WRITER_NAME) values (6037,'더미데이터');
Insert into TEAMPROJECT.WRITER (WRITER_ID,WRITER_NAME) values (6238,'더미데이터');
Insert into TEAMPROJECT.WRITER (WRITER_ID,WRITER_NAME) values (6439,'더미데이터');
Insert into TEAMPROJECT.WRITER (WRITER_ID,WRITER_NAME) values (6640,'더미데이터');
Insert into TEAMPROJECT.WRITER (WRITER_ID,WRITER_NAME) values (6841,'더미데이터');
Insert into TEAMPROJECT.WRITER (WRITER_ID,WRITER_NAME) values (7042,'더미데이터');
Insert into TEAMPROJECT.WRITER (WRITER_ID,WRITER_NAME) values (7243,'더미데이터');
Insert into TEAMPROJECT.WRITER (WRITER_ID,WRITER_NAME) values (7444,'더미데이터');
Insert into TEAMPROJECT.WRITER (WRITER_ID,WRITER_NAME) values (7645,'더미데이터');
Insert into TEAMPROJECT.WRITER (WRITER_ID,WRITER_NAME) values (7846,'더미데이터');
Insert into TEAMPROJECT.WRITER (WRITER_ID,WRITER_NAME) values (8047,'더미데이터');
Insert into TEAMPROJECT.WRITER (WRITER_ID,WRITER_NAME) values (8248,'더미데이터');
Insert into TEAMPROJECT.WRITER (WRITER_ID,WRITER_NAME) values (8449,'더미데이터');
Insert into TEAMPROJECT.WRITER (WRITER_ID,WRITER_NAME) values (8650,'더미데이터');
Insert into TEAMPROJECT.WRITER (WRITER_ID,WRITER_NAME) values (8851,'더미데이터');
Insert into TEAMPROJECT.WRITER (WRITER_ID,WRITER_NAME) values (9052,'더미데이터');
Insert into TEAMPROJECT.WRITER (WRITER_ID,WRITER_NAME) values (9253,'더미데이터');
Insert into TEAMPROJECT.WRITER (WRITER_ID,WRITER_NAME) values (9454,'더미데이터');
Insert into TEAMPROJECT.WRITER (WRITER_ID,WRITER_NAME) values (9655,'더미데이터');
Insert into TEAMPROJECT.WRITER (WRITER_ID,WRITER_NAME) values (9856,'더미데이터');
Insert into TEAMPROJECT.WRITER (WRITER_ID,WRITER_NAME) values (403,'더미데이터');
Insert into TEAMPROJECT.WRITER (WRITER_ID,WRITER_NAME) values (604,'더미데이터');
Insert into TEAMPROJECT.WRITER (WRITER_ID,WRITER_NAME) values (805,'더미데이터');
Insert into TEAMPROJECT.WRITER (WRITER_ID,WRITER_NAME) values (1006,'더미데이터');
Insert into TEAMPROJECT.WRITER (WRITER_ID,WRITER_NAME) values (1207,'더미데이터');
Insert into TEAMPROJECT.WRITER (WRITER_ID,WRITER_NAME) values (1408,'더미데이터');
Insert into TEAMPROJECT.WRITER (WRITER_ID,WRITER_NAME) values (1609,'더미데이터');
Insert into TEAMPROJECT.WRITER (WRITER_ID,WRITER_NAME) values (1810,'더미데이터');
Insert into TEAMPROJECT.WRITER (WRITER_ID,WRITER_NAME) values (2011,'더미데이터');
Insert into TEAMPROJECT.WRITER (WRITER_ID,WRITER_NAME) values (2212,'더미데이터');
Insert into TEAMPROJECT.WRITER (WRITER_ID,WRITER_NAME) values (2413,'더미데이터');
Insert into TEAMPROJECT.WRITER (WRITER_ID,WRITER_NAME) values (2614,'더미데이터');
Insert into TEAMPROJECT.WRITER (WRITER_ID,WRITER_NAME) values (2815,'더미데이터');
Insert into TEAMPROJECT.WRITER (WRITER_ID,WRITER_NAME) values (3016,'더미데이터');
Insert into TEAMPROJECT.WRITER (WRITER_ID,WRITER_NAME) values (3217,'더미데이터');
Insert into TEAMPROJECT.WRITER (WRITER_ID,WRITER_NAME) values (3418,'더미데이터');
Insert into TEAMPROJECT.WRITER (WRITER_ID,WRITER_NAME) values (3619,'더미데이터');
Insert into TEAMPROJECT.WRITER (WRITER_ID,WRITER_NAME) values (3820,'더미데이터');
Insert into TEAMPROJECT.WRITER (WRITER_ID,WRITER_NAME) values (4021,'더미데이터');
Insert into TEAMPROJECT.WRITER (WRITER_ID,WRITER_NAME) values (4222,'더미데이터');
Insert into TEAMPROJECT.WRITER (WRITER_ID,WRITER_NAME) values (4423,'더미데이터');
Insert into TEAMPROJECT.WRITER (WRITER_ID,WRITER_NAME) values (4624,'더미데이터');
Insert into TEAMPROJECT.WRITER (WRITER_ID,WRITER_NAME) values (4825,'더미데이터');
Insert into TEAMPROJECT.WRITER (WRITER_ID,WRITER_NAME) values (5026,'더미데이터');
Insert into TEAMPROJECT.WRITER (WRITER_ID,WRITER_NAME) values (5227,'더미데이터');
Insert into TEAMPROJECT.WRITER (WRITER_ID,WRITER_NAME) values (5428,'더미데이터');
Insert into TEAMPROJECT.WRITER (WRITER_ID,WRITER_NAME) values (5629,'더미데이터');
Insert into TEAMPROJECT.WRITER (WRITER_ID,WRITER_NAME) values (5830,'더미데이터');
Insert into TEAMPROJECT.WRITER (WRITER_ID,WRITER_NAME) values (6031,'더미데이터');
Insert into TEAMPROJECT.WRITER (WRITER_ID,WRITER_NAME) values (6232,'더미데이터');
Insert into TEAMPROJECT.WRITER (WRITER_ID,WRITER_NAME) values (6433,'더미데이터');
Insert into TEAMPROJECT.WRITER (WRITER_ID,WRITER_NAME) values (6634,'더미데이터');
Insert into TEAMPROJECT.WRITER (WRITER_ID,WRITER_NAME) values (6835,'더미데이터');
Insert into TEAMPROJECT.WRITER (WRITER_ID,WRITER_NAME) values (7036,'더미데이터');
Insert into TEAMPROJECT.WRITER (WRITER_ID,WRITER_NAME) values (7237,'더미데이터');
Insert into TEAMPROJECT.WRITER (WRITER_ID,WRITER_NAME) values (7438,'더미데이터');
Insert into TEAMPROJECT.WRITER (WRITER_ID,WRITER_NAME) values (7639,'더미데이터');
Insert into TEAMPROJECT.WRITER (WRITER_ID,WRITER_NAME) values (7840,'더미데이터');
Insert into TEAMPROJECT.WRITER (WRITER_ID,WRITER_NAME) values (8041,'더미데이터');
Insert into TEAMPROJECT.WRITER (WRITER_ID,WRITER_NAME) values (8242,'더미데이터');
Insert into TEAMPROJECT.WRITER (WRITER_ID,WRITER_NAME) values (8443,'더미데이터');
Insert into TEAMPROJECT.WRITER (WRITER_ID,WRITER_NAME) values (8644,'더미데이터');
Insert into TEAMPROJECT.WRITER (WRITER_ID,WRITER_NAME) values (8845,'더미데이터');
Insert into TEAMPROJECT.WRITER (WRITER_ID,WRITER_NAME) values (9046,'더미데이터');
Insert into TEAMPROJECT.WRITER (WRITER_ID,WRITER_NAME) values (9247,'더미데이터');
Insert into TEAMPROJECT.WRITER (WRITER_ID,WRITER_NAME) values (9448,'더미데이터');
Insert into TEAMPROJECT.WRITER (WRITER_ID,WRITER_NAME) values (9649,'더미데이터');
Insert into TEAMPROJECT.WRITER (WRITER_ID,WRITER_NAME) values (9850,'더미데이터');
Insert into TEAMPROJECT.WRITER (WRITER_ID,WRITER_NAME) values (1229,'99');
--------------------------------------------------------
--  DDL for Index BUYCARTLIST_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "TEAMPROJECT"."BUYCARTLIST_PK" ON "TEAMPROJECT"."BUYCARTLIST" ("BUYCARTLIST_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index QUESTION_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "TEAMPROJECT"."QUESTION_PK" ON "TEAMPROJECT"."QUESTION" ("QUESTION_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index BUYREVIEW_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "TEAMPROJECT"."BUYREVIEW_PK" ON "TEAMPROJECT"."BUYREVIEW" ("BUYREVIEW_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index BOOK_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "TEAMPROJECT"."BOOK_PK" ON "TEAMPROJECT"."BOOK" ("BOOK_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index BUY_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "TEAMPROJECT"."BUY_PK" ON "TEAMPROJECT"."BUY" ("BUY_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index TENDENCY_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "TEAMPROJECT"."TENDENCY_PK" ON "TEAMPROJECT"."TENDENCY" ("TENDENCY_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index BOOKSALE_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "TEAMPROJECT"."BOOKSALE_PK" ON "TEAMPROJECT"."BOOKSALE" ("BOOKSALE_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index CUSTOMER_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "TEAMPROJECT"."CUSTOMER_PK" ON "TEAMPROJECT"."CUSTOMER" ("CUSTOMER_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index STORE_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "TEAMPROJECT"."STORE_PK" ON "TEAMPROJECT"."STORE" ("STORE_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index BUYLIST_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "TEAMPROJECT"."BUYLIST_PK" ON "TEAMPROJECT"."BUYLIST" ("BUYLIST_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index WRITER_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "TEAMPROJECT"."WRITER_PK" ON "TEAMPROJECT"."WRITER" ("WRITER_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  Constraints for Table STORE
--------------------------------------------------------

  ALTER TABLE "TEAMPROJECT"."STORE" ADD CONSTRAINT "STORE_PK" PRIMARY KEY ("STORE_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
--------------------------------------------------------
--  Constraints for Table TENDENCY
--------------------------------------------------------

  ALTER TABLE "TEAMPROJECT"."TENDENCY" ADD CONSTRAINT "TENDENCY_PK" PRIMARY KEY ("TENDENCY_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
--------------------------------------------------------
--  Constraints for Table WRITER
--------------------------------------------------------

  ALTER TABLE "TEAMPROJECT"."WRITER" ADD CONSTRAINT "WRITER_PK" PRIMARY KEY ("WRITER_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
--------------------------------------------------------
--  Constraints for Table BOOKSALE
--------------------------------------------------------

  ALTER TABLE "TEAMPROJECT"."BOOKSALE" ADD CONSTRAINT "BOOKSALE_PK" PRIMARY KEY ("BOOKSALE_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
--------------------------------------------------------
--  Constraints for Table BUY
--------------------------------------------------------

  ALTER TABLE "TEAMPROJECT"."BUY" ADD CONSTRAINT "BUY_PK" PRIMARY KEY ("BUY_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
--------------------------------------------------------
--  Constraints for Table BUYLIST
--------------------------------------------------------

  ALTER TABLE "TEAMPROJECT"."BUYLIST" ADD CONSTRAINT "BUYLIST_PK" PRIMARY KEY ("BUYLIST_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
--------------------------------------------------------
--  Constraints for Table QUESTION
--------------------------------------------------------

  ALTER TABLE "TEAMPROJECT"."QUESTION" ADD CONSTRAINT "QUESTION_PK" PRIMARY KEY ("QUESTION_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
--------------------------------------------------------
--  Constraints for Table BOOK
--------------------------------------------------------

  ALTER TABLE "TEAMPROJECT"."BOOK" ADD CONSTRAINT "BOOK_PK" PRIMARY KEY ("BOOK_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CUSTOMER
--------------------------------------------------------

  ALTER TABLE "TEAMPROJECT"."CUSTOMER" ADD CONSTRAINT "CUSTOMER_PK" PRIMARY KEY ("CUSTOMER_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
--------------------------------------------------------
--  Constraints for Table BUYREVIEW
--------------------------------------------------------

  ALTER TABLE "TEAMPROJECT"."BUYREVIEW" ADD CONSTRAINT "BUYREVIEW_PK" PRIMARY KEY ("BUYREVIEW_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
--------------------------------------------------------
--  Constraints for Table BUYCARTLIST
--------------------------------------------------------

  ALTER TABLE "TEAMPROJECT"."BUYCARTLIST" ADD CONSTRAINT "BUYCARTLIST_PK" PRIMARY KEY ("BUYCARTLIST_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table BOOK
--------------------------------------------------------

  ALTER TABLE "TEAMPROJECT"."BOOK" ADD CONSTRAINT "WRITER_FK_1" FOREIGN KEY ("WRITER_ID")
	  REFERENCES "TEAMPROJECT"."WRITER" ("WRITER_ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table BOOKSALE
--------------------------------------------------------

  ALTER TABLE "TEAMPROJECT"."BOOKSALE" ADD CONSTRAINT "BOOKSALE_FK_1" FOREIGN KEY ("BOOK_ID")
	  REFERENCES "TEAMPROJECT"."BOOK" ("BOOK_ID") ENABLE;
  ALTER TABLE "TEAMPROJECT"."BOOKSALE" ADD CONSTRAINT "BOOKSALE_FK_2" FOREIGN KEY ("STORE_ID")
	  REFERENCES "TEAMPROJECT"."STORE" ("STORE_ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table BUY
--------------------------------------------------------

  ALTER TABLE "TEAMPROJECT"."BUY" ADD CONSTRAINT "BUY_FK_1" FOREIGN KEY ("BUYLIST_ID")
	  REFERENCES "TEAMPROJECT"."BUYLIST" ("BUYLIST_ID") ENABLE;
  ALTER TABLE "TEAMPROJECT"."BUY" ADD CONSTRAINT "BUY_FK_2" FOREIGN KEY ("BOOK_ID")
	  REFERENCES "TEAMPROJECT"."BOOK" ("BOOK_ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table BUYCARTLIST
--------------------------------------------------------

  ALTER TABLE "TEAMPROJECT"."BUYCARTLIST" ADD CONSTRAINT "BUYCARTLIST_FK_1" FOREIGN KEY ("CUSTOMER_ID")
	  REFERENCES "TEAMPROJECT"."CUSTOMER" ("CUSTOMER_ID") ENABLE;
  ALTER TABLE "TEAMPROJECT"."BUYCARTLIST" ADD CONSTRAINT "BUYCARTLIST_FK_2" FOREIGN KEY ("BOOK_ID")
	  REFERENCES "TEAMPROJECT"."BOOK" ("BOOK_ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table BUYLIST
--------------------------------------------------------

  ALTER TABLE "TEAMPROJECT"."BUYLIST" ADD CONSTRAINT "BUYLIST_FK_1" FOREIGN KEY ("CUSTOMER_ID")
	  REFERENCES "TEAMPROJECT"."CUSTOMER" ("CUSTOMER_ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table BUYREVIEW
--------------------------------------------------------

  ALTER TABLE "TEAMPROJECT"."BUYREVIEW" ADD CONSTRAINT "BUYREVIEW_FK_1" FOREIGN KEY ("CUSTOMER_ID")
	  REFERENCES "TEAMPROJECT"."CUSTOMER" ("CUSTOMER_ID") ENABLE;
  ALTER TABLE "TEAMPROJECT"."BUYREVIEW" ADD CONSTRAINT "BUYREVIEW_FK_2" FOREIGN KEY ("BOOK_ID")
	  REFERENCES "TEAMPROJECT"."BOOK" ("BOOK_ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table QUESTION
--------------------------------------------------------

  ALTER TABLE "TEAMPROJECT"."QUESTION" ADD CONSTRAINT "QUESTION_FK_1" FOREIGN KEY ("CUSTOMER_ID")
	  REFERENCES "TEAMPROJECT"."CUSTOMER" ("CUSTOMER_ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table TENDENCY
--------------------------------------------------------

  ALTER TABLE "TEAMPROJECT"."TENDENCY" ADD CONSTRAINT "TENDENCY_FK_1" FOREIGN KEY ("CUSTOMER_ID")
	  REFERENCES "TEAMPROJECT"."CUSTOMER" ("CUSTOMER_ID") ENABLE;
