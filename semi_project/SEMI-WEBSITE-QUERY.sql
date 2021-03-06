DROP TABLE NOTICE;
DROP TABLE ACCOUNT_INFO;
DROP TABLE ACCUMULATED_INFO;
DROP TABLE DELIVERY_INFO;
DROP TABLE TRANSACTIONS;
DROP TABLE BASKETS;
DROP TABLE INTERESTS;
DROP TABLE INQUIRES;
DROP TABLE REVIEWS;
DROP TABLE ACCUMULATED;
DROP TABLE MEMBERS;
DROP TABLE PHOTOS;
DROP TABLE OPTIONS;
DROP TABLE STOCKS;
DROP TABLE SCATEGORIES;
DROP TABLE LCATEGORIES;

CREATE TABLE NOTICE (
	NOTICE_NUM         NUMBER(5)      NOT NULL, -- 공지사항번호
	NOTICE_TITLE       VARCHAR2(100)  NOT NULL, -- 공지사항제목
	NOTICE_CONTENT     VARCHAR2(1000) NOT NULL, -- 공지사항내용
	NOTICE_DATE        DATE           DEFAULT SYSDATE, -- 작성일
	NODICE_MODIFY_DATE DATE           NULL,      -- 수정일
    CONSTRAINT PK_NOTICE PRIMARY KEY(NOTICE_NUM)
);

CREATE TABLE ACCOUNT_INFO (
	ACCOUNT_INFO_NUM NUMBER(5)     NOT NULL, -- 가상계좌번호
	ACCOUNT_NAME     VARCHAR2(100) NOT NULL, -- 은행
	ACCOUNT_NUMBER   VARCHAR2(100) NOT NULL,  -- 계좌번호
    CONSTRAINT PK_ACCOUNT_INFO PRIMARY KEY(ACCOUNT_INFO_NUM)
);

CREATE TABLE ACCUMULATED_INFO (
	ACCUMULATED_INFO_NUM NUMBER(5)  NOT NULL, -- 적립금번호
	ACCUMULATED_PERCENT  NUMBER(20) NOT NULL,  -- 적립금퍼센트
    CONSTRAINT PK_ACCUMULATED_INFO PRIMARY KEY(ACCUMULATED_INFO_NUM)
);

CREATE TABLE DELIVERY_INFO (
	DELIVERY_INFO_NUM NUMBER(5)  NOT NULL, -- 배송비번호
	DELIVERY_PRICE    NUMBER(20) NOT NULL,  -- 배송비
    CONSTRAINT PK_DELIVERY_INFO PRIMARY KEY(DELIVERY_INFO_NUM)
);

CREATE TABLE LCATEGORIES (
	LCATEGORIES_NUM  NUMBER(5)     NOT NULL, -- 카테고리대분류번호
	LCATEGORIES_NAME VARCHAR2(100) NOT NULL, -- 대분류이름
	LCATEGORIES_DATE DATE          DEFAULT SYSDATE,  -- 추가일
    CONSTRAINT PK_LCATEGORIES PRIMARY KEY(LCATEGORIES_NUM)
);

CREATE TABLE SCATEGORIES (
	SCATEGORIES_NUM  NUMBER(5)     NOT NULL, -- 카테고리소분류번호
	LCATEGORIES_NUM  NUMBER(5)     NOT NULL, -- 카테고리대분류번호
	SCATEGORIES_NAME VARCHAR2(100) NOT NULL, -- 소분류이름
	SCATEGORIES_DATE DATE          DEFAULT SYSDATE,  -- 추가일
    CONSTRAINT SCATEGORIES_NUM_PK PRIMARY KEY(SCATEGORIES_NUM),
    CONSTRAINT FK_LCATEGORIES_TO_SCATEGORIES FOREIGN KEY (LCATEGORIES_NUM) REFERENCES LCATEGORIES(LCATEGORIES_NUM)    
);

CREATE TABLE STOCKS (
	STOCK_NUM       NUMBER(5)      NOT NULL, -- 상품번호
	SCATEGORIES_NUM NUMBER(5)      NOT NULL, -- 카테고리소분류번호
	STOCK_CODE      VARCHAR2(100)  NOT NULL, -- 상품코드
	STOCK_NAME      VARCHAR2(100)  NOT NULL, -- 상품이름
    STOCK_PHOTO     VARCHAR2(100)  NOT NULL, -- 상품사진(추가된내용)
	STOCK_PRICE     NUMBER(20)     NOT NULL, -- 상품가격
	STOCK_INFO      VARCHAR2(1000) NULL,     -- 상품정보
	STOCK_DATE      DATE           DEFAULT SYSDATE, -- 상품등록일
    CONSTRAINT PK_STOCKS PRIMARY KEY(STOCK_NUM),
    CONSTRAINT FK_SCATEGORIES_TO_STOCK FOREIGN KEY (SCATEGORIES_NUM) REFERENCES SCATEGORIES(SCATEGORIES_NUM),
    CONSTRAINT UQ_STOCK_CODE UNIQUE(STOCK_CODE)
);

CREATE TABLE PHOTOS (
	PHOTO_NUM      NUMBER(5) NOT NULL, -- 상품사진번호
	STOCK_NUM      NUMBER(5)          NULL,     -- 상품번호
	PHOTO_LOCATION VARCHAR2(100)      NULL,      -- 상품사진
    CONSTRAINT PK_PHOTOS PRIMARY KEY(PHOTO_NUM),
    CONSTRAINT FK_STOCKS_TO_PHOTO FOREIGN KEY (STOCK_NUM) REFERENCES STOCKS(STOCK_NUM)
);

CREATE TABLE OPTIONS (
	OPTION_NUM    NUMBER(5)    NOT NULL, -- 옵션번호
	STOCK_NUM     NUMBER(5)    NOT NULL, -- 상품번호
	OPTION_SIZE   VARCHAR2(10) NOT NULL, -- 사이즈
	OPTION_COLOR  VARCHAR2(10) NOT NULL, -- 색상
	OPTION_AMOUNT NUMBER(5)    NOT NULL,  -- 옵션개수
    CONSTRAINT PK_OPTIONS PRIMARY KEY(OPTION_NUM),
    CONSTRAINT FK_STOCKS_TO_OPTION FOREIGN KEY (STOCK_NUM) REFERENCES STOCKS(STOCK_NUM)
);

CREATE TABLE MEMBERS (
	MEMBER_NUM     NUMBER(5)     NOT NULL, -- 회원번호
	MEMBER_NAME    VARCHAR2(20)  NOT NULL, -- 이름
	MEMBER_ID      VARCHAR2(20)  NOT NULL, -- 아이디
	MEMBER_PASS    VARCHAR2(20)  NOT NULL, -- 비밀번호
	MEMBER_TEL     VARCHAR2(20)  NOT NULL, -- 전화번호
	MEMBER_EMAIL   VARCHAR2(20)  NOT NULL, -- 이메일
	MEMBER_BIRTH   CHAR(8)       NOT NULL, -- 생년월일
	MEMBER_ADDRESS VARCHAR2(100) NOT NULL, -- 주소
	MEMBER_AGREE   CHAR(1)       NOT NULL, -- 동의확인
	MEMBER_DATE    DATE          DEFAULT SYSDATE,  -- 가입일
    CONSTRAINT PK_MEMBERS PRIMARY KEY(MEMBER_NUM),
    CONSTRAINT CK_MEMBERS_IN_MEMBER_AGREE CHECK(MEMBER_AGREE IN('Y','N')),
    CONSTRAINT UQ_MEMBER_ID UNIQUE(MEMBER_ID)
);

CREATE TABLE ACCUMULATED (
	ACCUMULATED_NUM     NUMBER(5)     NOT NULL, -- 적립내역번호
	MEMBER_NUM          NUMBER(5)     NOT NULL, -- 회원번호
	ACCUMULATED_HISTORY VARCHAR2(100) NOT NULL, -- 적립내역
	ACCUMULATED_MONEY   NUMBER(20)    NOT NULL, -- 적립금
	ACCUMULATED_USE     VARCHAR2(10)  NOT NULL, -- 추가/사용
	ACCUMULATED_DATE    DATE          DEFAULT SYSDATE,  -- 적립일
    CONSTRAINT PK_ACCUMULATED PRIMARY KEY(ACCUMULATED_NUM),
    CONSTRAINT FK_MEMBERS_TO_ACCUMULATED FOREIGN KEY (MEMBER_NUM) REFERENCES MEMBERS(MEMBER_NUM)
);

CREATE TABLE REVIEWS (
	REVIEW_NUM     NUMBER(5)      NOT NULL, -- 리뷰게시판번호
	MEMBER_NUM     NUMBER(5)      NOT NULL, -- 회원번호
	STOCK_NUM      NUMBER(5)      NOT NULL, -- 상품번호
	REVIEW_CONTENT VARCHAR2(1000) NOT NULL, -- 내용
	REVIEW_DATE    DATE           DEFAULT SYSDATE, -- 작성일
	REVIEW_GRADE   NUMBER(1)      NOT NULL,  -- 평점
    CONSTRAINT PK_REVIEWS PRIMARY KEY(REVIEW_NUM),
    CONSTRAINT FK_MEMBERS_TO_REVIEW FOREIGN KEY (MEMBER_NUM) REFERENCES MEMBERS(MEMBER_NUM),
    CONSTRAINT FK_STOCKS_TO_REVIEW FOREIGN KEY (STOCK_NUM) REFERENCES STOCKS(STOCK_NUM),
    CONSTRAINT CK_REVIEW_GRADE CHECK(0 <= REVIEW_GRADE AND REVIEW_GRADE <= 5)
);

CREATE TABLE INQUIRES (
	INQUIRE_NUM         NUMBER(5)      NOT NULL, -- 게시판번호
	STOCK_NUM           NUMBER(5)      NULL,     -- 상품번호
	MEMBER_NUM          NUMBER(5)      NOT NULL, -- 회원번호
	INQUIRE_TITLE       VARCHAR2(100)  NOT NULL, -- 문의제목
	INQUIRE_CONTENT     VARCHAR2(1000) NOT NULL, -- 문의내용
	INQUIRE_DATE        DATE           DEFAULT SYSDATE, -- 문의작성일
	INQUIRE_MODIFY_DATE DATE           NULL, -- 문의수정일
	REPLY_STATUS        CHAR(1)        DEFAULT 'N', -- 답변여부
	REPLY_CONTENT       VARCHAR2(1000) NULL,     -- 답변내용
	REPLY_DATE          DATE           NULL,     -- 답변작성일
	REPLY_MODIFY_DATE   DATE           NULL,     -- 답변수정일
    CONSTRAINT PK_INQUIRE PRIMARY KEY(INQUIRE_NUM),
    CONSTRAINT FK_MEMBERS_TO_INQUIRE FOREIGN KEY (MEMBER_NUM) REFERENCES MEMBERS(MEMBER_NUM),
    CONSTRAINT FK_STOCK_TO_INQUIRE FOREIGN KEY (STOCK_NUM) REFERENCES STOCKS(STOCK_NUM),
    CONSTRAINT CK_REPLY_STATUS CHECK(REPLY_STATUS IN('Y','N'))
);

CREATE TABLE INTERESTS (
	INTEREST_NUM  NUMBER(5) NOT NULL, -- 관심상품번호
	MEMBER_NUM    NUMBER(5) NOT NULL, -- 회원번호
	OPTION_NUM    NUMBER(5) NOT NULL, -- 옵션번호
	INTEREST_DATE DATE      DEFAULT SYSDATE,  -- 관심등록일
    CONSTRAINT PK_INTEREST PRIMARY KEY(INTEREST_NUM),
    CONSTRAINT FK_MEMBERS_TO_INTEREST FOREIGN KEY (MEMBER_NUM) REFERENCES MEMBERS(MEMBER_NUM),
    CONSTRAINT FK_OPTIONS_TO_INTEREST FOREIGN KEY (OPTION_NUM) REFERENCES OPTIONS(OPTION_NUM)
);

CREATE TABLE BASKETS (
	BASKET_NUM    NUMBER(5) NOT NULL, -- 장바구니번호
	MEMBER_NUM    NUMBER(5) NOT NULL, -- 회원번호
	OPTION_NUM    NUMBER(5) NOT NULL, -- 옵션번호
	BASKET_AMOUNT NUMBER(3) NOT NULL, -- 수량
	BASKET_DATE   DATE      DEFAULT SYSDATE,  -- 장바구니등록일
    CONSTRAINT PK_BASKETS PRIMARY KEY(BASKET_NUM),
    CONSTRAINT FK_MEMBERS_TO_BASKET FOREIGN KEY (MEMBER_NUM) REFERENCES MEMBERS(MEMBER_NUM),
    CONSTRAINT FK_OPTIONS_TO_BASKET FOREIGN KEY (OPTION_NUM) REFERENCES OPTIONS(OPTION_NUM)
);

CREATE TABLE TRANSACTIONS (
	TRANSACTION_NUM    NUMBER(5)     NOT NULL, -- 거래번호
	MEMBER_NUM         NUMBER(5)     NOT NULL, -- 회원번호
	OPTION_NUM         NUMBER(5)     NOT NULL, -- 옵션번호
	DELIVERY_MESSAGE   VARCHAR2(100) NULL,     -- 배송메세지
	DELIVERY_ADDRESS   VARCHAR2(100) NOT NULL, -- 배송지
	AMOUNT             NUMBER(3)     NOT NULL, -- 구매수량
	PAYMENT            NUMBER(20)    NOT NULL, -- 결재금액
	ACCUMULATED_MONEY  NUMBER(20)    NOT NULL, -- 적립금
	TRANSACTION_STATUS CHAR(1)       NOT NULL, -- 입금현황
	REFUND_STATUS      CHAR(1)       NOT NULL, -- 환불여부
	DELIVERY_STATUS    CHAR(1)       NOT NULL, -- 배송상태
	TRANSACTION_DATE   DATE          DEFAULT SYSDATE, -- 거래일
    DEPOSIT_DATE       DATE          NULL,      -- 입금일(추가된내용)
	DELIVERY_DATE      DATE          NULL,      -- 배송일
    CONSTRAINT PK_TRANSACTIONS PRIMARY KEY(TRANSACTION_NUM),
    CONSTRAINT FK_MEMBERS_TO_TRANSACTIONS FOREIGN KEY (MEMBER_NUM) REFERENCES MEMBERS(MEMBER_NUM),
    CONSTRAINT FK_OPTIONS_TO_TRANSACTIONS FOREIGN KEY (OPTION_NUM) REFERENCES OPTIONS(OPTION_NUM),
    CONSTRAINT CK_DELIVERY_STATUS CHECK(DELIVERY_STATUS IN('Y','N')),
    CONSTRAINT CK_REFUND_STATUS CHECK(REFUND_STATUS IN('Y','N')),
    CONSTRAINT CK_TRANSACTION_STATUS CHECK(TRANSACTION_STATUS IN('Y','N'))
);


-- 적립금 상세
INSERT INTO ACCUMULATED_INFO VALUES((SELECT NVL(MAX(ACCUMULATED_INFO_NUM),0)+1 FROM ACCUMULATED_INFO),10);
SELECT * FROM ACCUMULATED_INFO;

-- 배송비
INSERT INTO DELIVERY_INFO VALUES((SELECT NVL(MAX(DELIVERY_INFO_NUM),0)+1 FROM DELIVERY_INFO),3000);
SELECT * FROM DELIVERY_INFO;

-- 공지사항
INSERT INTO NOTICE(NOTICE_NUM,NOTICE_TITLE, NOTICE_CONTENT)
    VALUES((SELECT NVL(MAX(NOTICE_NUM),0)+1 FROM NOTICE),'TEST01','TEST01내용');
INSERT INTO NOTICE(NOTICE_NUM,NOTICE_TITLE, NOTICE_CONTENT)
    VALUES((SELECT NVL(MAX(NOTICE_NUM),0)+1 FROM NOTICE),'TEST02','TEST02내용');
SELECT * FROM NOTICE;

-- 가상계좌
INSERT INTO ACCOUNT_INFO VALUES((SELECT NVL(MAX(ACCOUNT_INFO_NUM),0)+1 FROM ACCOUNT_INFO),'국민','1234567890');
INSERT INTO ACCOUNT_INFO VALUES((SELECT NVL(MAX(ACCOUNT_INFO_NUM),0)+1 FROM ACCOUNT_INFO),'신한','0987654321');
SELECT * FROM ACCOUNT_INFO;

-- 대분류
INSERT INTO LCATEGORIES(LCATEGORIES_NUM,LCATEGORIES_NAME) VALUES((SELECT NVL(MAX(LCATEGORIES_NUM),0)+1 FROM LCATEGORIES), '하의');
INSERT INTO LCATEGORIES(LCATEGORIES_NUM,LCATEGORIES_NAME) VALUES((SELECT NVL(MAX(LCATEGORIES_NUM),0)+1 FROM LCATEGORIES), '상의');
INSERT INTO LCATEGORIES(LCATEGORIES_NUM,LCATEGORIES_NAME) VALUES((SELECT NVL(MAX(LCATEGORIES_NUM),0)+1 FROM LCATEGORIES), '아우터');
INSERT INTO LCATEGORIES(LCATEGORIES_NUM,LCATEGORIES_NAME) VALUES((SELECT NVL(MAX(LCATEGORIES_NUM),0)+1 FROM LCATEGORIES), '신발');
INSERT INTO LCATEGORIES(LCATEGORIES_NUM,LCATEGORIES_NAME) VALUES((SELECT NVL(MAX(LCATEGORIES_NUM),0)+1 FROM LCATEGORIES), '악세사리');
SELECT * FROM LCATEGORIES;

--소분류
INSERT INTO SCATEGORIES(SCATEGORIES_NUM,LCATEGORIES_NUM,SCATEGORIES_NAME) VALUES((SELECT NVL(MAX(SCATEGORIES_NUM),0)+1 FROM SCATEGORIES),1, '반바지'); --1
INSERT INTO SCATEGORIES(SCATEGORIES_NUM,LCATEGORIES_NUM,SCATEGORIES_NAME) VALUES((SELECT NVL(MAX(SCATEGORIES_NUM),0)+1 FROM SCATEGORIES),1, '청바지'); --2
INSERT INTO SCATEGORIES(SCATEGORIES_NUM,LCATEGORIES_NUM,SCATEGORIES_NAME) VALUES((SELECT NVL(MAX(SCATEGORIES_NUM),0)+1 FROM SCATEGORIES),1, '면바지'); --3
INSERT INTO SCATEGORIES(SCATEGORIES_NUM,LCATEGORIES_NUM,SCATEGORIES_NAME) VALUES((SELECT NVL(MAX(SCATEGORIES_NUM),0)+1 FROM SCATEGORIES),1, '8부바지'); --4
INSERT INTO SCATEGORIES(SCATEGORIES_NUM,LCATEGORIES_NUM,SCATEGORIES_NAME) VALUES((SELECT NVL(MAX(SCATEGORIES_NUM),0)+1 FROM SCATEGORIES),1, '트레이닝'); --5
INSERT INTO SCATEGORIES(SCATEGORIES_NUM,LCATEGORIES_NUM,SCATEGORIES_NAME) VALUES((SELECT NVL(MAX(SCATEGORIES_NUM),0)+1 FROM SCATEGORIES),2, '반팔티셔츠'); --6
INSERT INTO SCATEGORIES(SCATEGORIES_NUM,LCATEGORIES_NUM,SCATEGORIES_NAME) VALUES((SELECT NVL(MAX(SCATEGORIES_NUM),0)+1 FROM SCATEGORIES),2, '긴팔티셔츠'); --7
INSERT INTO SCATEGORIES(SCATEGORIES_NUM,LCATEGORIES_NUM,SCATEGORIES_NAME) VALUES((SELECT NVL(MAX(SCATEGORIES_NUM),0)+1 FROM SCATEGORIES),2, '와이셔츠'); --8
INSERT INTO SCATEGORIES(SCATEGORIES_NUM,LCATEGORIES_NUM,SCATEGORIES_NAME) VALUES((SELECT NVL(MAX(SCATEGORIES_NUM),0)+1 FROM SCATEGORIES),2, '맨투맨'); --9
INSERT INTO SCATEGORIES(SCATEGORIES_NUM,LCATEGORIES_NUM,SCATEGORIES_NAME) VALUES((SELECT NVL(MAX(SCATEGORIES_NUM),0)+1 FROM SCATEGORIES),2, '트레이닝'); --10
INSERT INTO SCATEGORIES(SCATEGORIES_NUM,LCATEGORIES_NUM,SCATEGORIES_NAME) VALUES((SELECT NVL(MAX(SCATEGORIES_NUM),0)+1 FROM SCATEGORIES),3, '숏패딩'); --11
INSERT INTO SCATEGORIES(SCATEGORIES_NUM,LCATEGORIES_NUM,SCATEGORIES_NAME) VALUES((SELECT NVL(MAX(SCATEGORIES_NUM),0)+1 FROM SCATEGORIES),3, '롱패딩'); --12
INSERT INTO SCATEGORIES(SCATEGORIES_NUM,LCATEGORIES_NUM,SCATEGORIES_NAME) VALUES((SELECT NVL(MAX(SCATEGORIES_NUM),0)+1 FROM SCATEGORIES),3, '점퍼'); --13
INSERT INTO SCATEGORIES(SCATEGORIES_NUM,LCATEGORIES_NUM,SCATEGORIES_NAME) VALUES((SELECT NVL(MAX(SCATEGORIES_NUM),0)+1 FROM SCATEGORIES),3, '자켓'); --14
INSERT INTO SCATEGORIES(SCATEGORIES_NUM,LCATEGORIES_NUM,SCATEGORIES_NAME) VALUES((SELECT NVL(MAX(SCATEGORIES_NUM),0)+1 FROM SCATEGORIES),4, '슬리퍼'); --15
INSERT INTO SCATEGORIES(SCATEGORIES_NUM,LCATEGORIES_NUM,SCATEGORIES_NAME) VALUES((SELECT NVL(MAX(SCATEGORIES_NUM),0)+1 FROM SCATEGORIES),4, '로퍼'); --16
INSERT INTO SCATEGORIES(SCATEGORIES_NUM,LCATEGORIES_NUM,SCATEGORIES_NAME) VALUES((SELECT NVL(MAX(SCATEGORIES_NUM),0)+1 FROM SCATEGORIES),4, '운동화'); --17
INSERT INTO SCATEGORIES(SCATEGORIES_NUM,LCATEGORIES_NUM,SCATEGORIES_NAME) VALUES((SELECT NVL(MAX(SCATEGORIES_NUM),0)+1 FROM SCATEGORIES),4, '부츠'); --18
INSERT INTO SCATEGORIES(SCATEGORIES_NUM,LCATEGORIES_NUM,SCATEGORIES_NAME) VALUES((SELECT NVL(MAX(SCATEGORIES_NUM),0)+1 FROM SCATEGORIES),5, '반지'); --19
INSERT INTO SCATEGORIES(SCATEGORIES_NUM,LCATEGORIES_NUM,SCATEGORIES_NAME) VALUES((SELECT NVL(MAX(SCATEGORIES_NUM),0)+1 FROM SCATEGORIES),5, '귀걸이'); --20
INSERT INTO SCATEGORIES(SCATEGORIES_NUM,LCATEGORIES_NUM,SCATEGORIES_NAME) VALUES((SELECT NVL(MAX(SCATEGORIES_NUM),0)+1 FROM SCATEGORIES),5, '목걸이'); --21
INSERT INTO SCATEGORIES(SCATEGORIES_NUM,LCATEGORIES_NUM,SCATEGORIES_NAME) VALUES((SELECT NVL(MAX(SCATEGORIES_NUM),0)+1 FROM SCATEGORIES),5, '가방'); --22
SELECT * FROM SCATEGORIES;

-- 물품
INSERT INTO STOCKS(STOCK_NUM,SCATEGORIES_NUM,STOCK_CODE,STOCK_NAME,STOCK_PHOTO,STOCK_PRICE,STOCK_INFO) 
    VALUES((SELECT NVL(MAX(STOCK_NUM),0)+1 FROM STOCKS),1, 'T123SSDG134', '에잇세컨즈반바지','/images/cottonShorts.jpg',40000,'시원한 소재 신축성 좋은');
INSERT INTO STOCKS(STOCK_NUM,SCATEGORIES_NUM,STOCK_CODE,STOCK_NAME,STOCK_PHOTO,STOCK_PRICE,STOCK_INFO) 
    VALUES((SELECT NVL(MAX(STOCK_NUM),0)+1 FROM STOCKS),1, 'T123SSDG135', '니트반바지','/images/knitShorts.jpg',30000,'땀흡수 잘되고 빨리 달릴 수 있는'); 
INSERT INTO STOCKS(STOCK_NUM,SCATEGORIES_NUM,STOCK_CODE,STOCK_NAME,STOCK_PHOTO,STOCK_PRICE,STOCK_INFO) 
    VALUES((SELECT NVL(MAX(STOCK_NUM),0)+1 FROM STOCKS),2, 'T123SSDA137', '나이키긴바지','/images/nikepants.jpg',14000,'시원한 소재 신축성 좋은');
INSERT INTO STOCKS(STOCK_NUM,SCATEGORIES_NUM,STOCK_CODE,STOCK_NAME,STOCK_PHOTO,STOCK_PRICE,STOCK_INFO) 
    VALUES((SELECT NVL(MAX(STOCK_NUM),0)+1 FROM STOCKS),2, 'T133S1DG134', '통긴바지','/images/pants.jpg',15000,'남심을 사로잡을 수 있는 옷');
INSERT INTO STOCKS(STOCK_NUM,SCATEGORIES_NUM,STOCK_CODE,STOCK_NAME,STOCK_PHOTO,STOCK_PRICE,STOCK_INFO) 
    VALUES((SELECT NVL(MAX(STOCK_NUM),0)+1 FROM STOCKS),6, 'Z123SDDG134', '유니클로반팔','/images/uniqT.jpg',4000,'오늘 하루를 기분좋게 만드는 옷');
INSERT INTO STOCKS(STOCK_NUM,SCATEGORIES_NUM,STOCK_CODE,STOCK_NAME,STOCK_PHOTO,STOCK_PRICE,STOCK_INFO) 
    VALUES((SELECT NVL(MAX(STOCK_NUM),0)+1 FROM STOCKS),6, 'T1211SDG134', '커버낫반팔','/images/ShortT.jpg',5000,'땀흡수 잘되고 빨리 달릴 수 있는');
INSERT INTO STOCKS(STOCK_NUM,SCATEGORIES_NUM,STOCK_CODE,STOCK_NAME,STOCK_PHOTO,STOCK_PRICE,STOCK_INFO) 
    VALUES((SELECT NVL(MAX(STOCK_NUM),0)+1 FROM STOCKS),7, 'T1212SDG134', '사랑스러운니트','/images/knit.jpg',18000,'시원한 소재 신축성 좋은');
INSERT INTO STOCKS(STOCK_NUM,SCATEGORIES_NUM,STOCK_CODE,STOCK_NAME,STOCK_PHOTO,STOCK_PRICE,STOCK_INFO) 
    VALUES((SELECT NVL(MAX(STOCK_NUM),0)+1 FROM STOCKS),7, 'T1237ASDG134', '박스후드티','/images/ivoryhood.jpg',20000,'오늘 하루를 기분좋게 만드는 옷');
INSERT INTO STOCKS(STOCK_NUM,SCATEGORIES_NUM,STOCK_CODE,STOCK_NAME,STOCK_PHOTO,STOCK_PRICE,STOCK_INFO) 
    VALUES((SELECT NVL(MAX(STOCK_NUM),0)+1 FROM STOCKS),8, 'T1237768434', '폴로와이셔츠','/images/Y-shirt.jpg',18000,'남심을 사로잡을 수 있는 옷');
INSERT INTO STOCKS(STOCK_NUM,SCATEGORIES_NUM,STOCK_CODE,STOCK_NAME,STOCK_PHOTO,STOCK_PRICE,STOCK_INFO) 
    VALUES((SELECT NVL(MAX(STOCK_NUM),0)+1 FROM STOCKS),8, 'T1233134134', '라코스테와이셔츠','/images/Y-shirt.jpg',22000,'시원한 소재 신축성 좋은');
INSERT INTO STOCKS(STOCK_NUM,SCATEGORIES_NUM,STOCK_CODE,STOCK_NAME,STOCK_PHOTO,STOCK_PRICE,STOCK_INFO) 
    VALUES((SELECT NVL(MAX(STOCK_NUM),0)+1 FROM STOCKS),8, 'T1281235134', '비비안웨스트우드와이셔츠','/images/Y-shirt.jpg',37000,'오늘 하루를 기분좋게 만드는 옷');
    
INSERT INTO STOCKS(STOCK_NUM,SCATEGORIES_NUM,STOCK_CODE,STOCK_NAME,STOCK_PHOTO,STOCK_PRICE,STOCK_INFO) 
    VALUES((SELECT NVL(MAX(STOCK_NUM),0)+1 FROM STOCKS),11, 'T1184235134', '아이다스숏패딩','/images/shotpadding.jpg',87000,'땀흡수 잘되고 빨리 달릴 수 있는');
INSERT INTO STOCKS(STOCK_NUM,SCATEGORIES_NUM,STOCK_CODE,STOCK_NAME,STOCK_PHOTO,STOCK_PRICE,STOCK_INFO) 
    VALUES((SELECT NVL(MAX(STOCK_NUM),0)+1 FROM STOCKS),12, 'T1281231334', '네파롱패딩','/images/longpadding.jpg',307000,'오늘 하루를 기분좋게 만드는 옷');
INSERT INTO STOCKS(STOCK_NUM,SCATEGORIES_NUM,STOCK_CODE,STOCK_NAME,STOCK_PHOTO,STOCK_PRICE,STOCK_INFO) 
    VALUES((SELECT NVL(MAX(STOCK_NUM),0)+1 FROM STOCKS),15, 'T42812sd35134', '귀여운슬리퍼','/images/slipper.jpg',7000,'시원한 소재 신축성 좋은');
INSERT INTO STOCKS(STOCK_NUM,SCATEGORIES_NUM,STOCK_CODE,STOCK_NAME,STOCK_PHOTO,STOCK_PRICE,STOCK_INFO) 
    VALUES((SELECT NVL(MAX(STOCK_NUM),0)+1 FROM STOCKS),18, 'T42812sd35133', '레더부츠','/images/Boots.jpg',17000,'남심을 사로잡을 수 있는 옷');
INSERT INTO STOCKS(STOCK_NUM,SCATEGORIES_NUM,STOCK_CODE,STOCK_NAME,STOCK_PHOTO,STOCK_PRICE,STOCK_INFO) 
    VALUES((SELECT NVL(MAX(STOCK_NUM),0)+1 FROM STOCKS),19, 'T42112sd35134', '하트반지','/images/hartring.jpg',27000,'땀흡수 잘되고 빨리 달릴 수 있는');
INSERT INTO STOCKS(STOCK_NUM,SCATEGORIES_NUM,STOCK_CODE,STOCK_NAME,STOCK_PHOTO,STOCK_PRICE,STOCK_INFO) 
    VALUES((SELECT NVL(MAX(STOCK_NUM),0)+1 FROM STOCKS),22, 'T40812sd35034', '방탄소년단에코백','/images/bangtanechoback.jpg',37000,'오늘 하루를 기분좋게 만드는 옷');

INSERT INTO STOCKS(STOCK_NUM,SCATEGORIES_NUM,STOCK_CODE,STOCK_NAME,STOCK_PHOTO,STOCK_PRICE,STOCK_INFO) 
    VALUES((SELECT NVL(MAX(STOCK_NUM),0)+1 FROM STOCKS),3, 'T42812sd35034', '슬랙스면바지','/images/Slacks.jpg',27000,'남심을 사로잡을 수 있는 옷');
INSERT INTO STOCKS(STOCK_NUM,SCATEGORIES_NUM,STOCK_CODE,STOCK_NAME,STOCK_PHOTO,STOCK_PRICE,STOCK_INFO) 
    VALUES((SELECT NVL(MAX(STOCK_NUM),0)+1 FROM STOCKS),4, 'T40812sd33031', '카고8부바지','/images/8pants.jpg',87000,'땀흡수 잘되고 빨리 달릴 수 있는');
INSERT INTO STOCKS(STOCK_NUM,SCATEGORIES_NUM,STOCK_CODE,STOCK_NAME,STOCK_PHOTO,STOCK_PRICE,STOCK_INFO) 
    VALUES((SELECT NVL(MAX(STOCK_NUM),0)+1 FROM STOCKS),5, 'T40822sd35039', '데상트트레이닝바지','/images/Training2.jpg',97000,'오늘 하루를 기분좋게 만드는 옷');    
INSERT INTO STOCKS(STOCK_NUM,SCATEGORIES_NUM,STOCK_CODE,STOCK_NAME,STOCK_PHOTO,STOCK_PRICE,STOCK_INFO) 
    VALUES((SELECT NVL(MAX(STOCK_NUM),0)+1 FROM STOCKS),10, 'T40812rd35034', '트레이닝상의','/images/Training.jpg',137000,'남심을 사로잡을 수 있는 옷');
INSERT INTO STOCKS(STOCK_NUM,SCATEGORIES_NUM,STOCK_CODE,STOCK_NAME,STOCK_PHOTO,STOCK_PRICE,STOCK_INFO) 
    VALUES((SELECT NVL(MAX(STOCK_NUM),0)+1 FROM STOCKS),13, 'T20812sd35031', '항공점퍼','/images/flight jacket.jpg',88000,'오늘 하루를 기분좋게 만드는 옷');
INSERT INTO STOCKS(STOCK_NUM,SCATEGORIES_NUM,STOCK_CODE,STOCK_NAME,STOCK_PHOTO,STOCK_PRICE,STOCK_INFO) 
    VALUES((SELECT NVL(MAX(STOCK_NUM),0)+1 FROM STOCKS),14, 'T40612sd35034', '청자켓','/images/denim jacket.jpg',57000,'땀흡수 잘되고 빨리 달릴 수 있는');
INSERT INTO STOCKS(STOCK_NUM,SCATEGORIES_NUM,STOCK_CODE,STOCK_NAME,STOCK_PHOTO,STOCK_PRICE,STOCK_INFO) 
    VALUES((SELECT NVL(MAX(STOCK_NUM),0)+1 FROM STOCKS),16, 'T40892sd35034', '로퍼','/images/Loafers.jpg',97000,'남심을 사로잡을 수 있는 옷');   
INSERT INTO STOCKS(STOCK_NUM,SCATEGORIES_NUM,STOCK_CODE,STOCK_NAME,STOCK_PHOTO,STOCK_PRICE,STOCK_INFO) 
    VALUES((SELECT NVL(MAX(STOCK_NUM),0)+1 FROM STOCKS),17, 'T40112sd35031', '나이키운동화','/images/Sneakers.jpg',50000,'오늘 하루를 기분좋게 만드는 옷');    
INSERT INTO STOCKS(STOCK_NUM,SCATEGORIES_NUM,STOCK_CODE,STOCK_NAME,STOCK_PHOTO,STOCK_PRICE,STOCK_INFO) 
    VALUES((SELECT NVL(MAX(STOCK_NUM),0)+1 FROM STOCKS),20, 'T30812sd35034', '링귀걸이','/images/ringearing.jpg',40000,'오늘 하루를 기분좋게 만드는 옷');
INSERT INTO STOCKS(STOCK_NUM,SCATEGORIES_NUM,STOCK_CODE,STOCK_NAME,STOCK_PHOTO,STOCK_PRICE,STOCK_INFO) 
    VALUES((SELECT NVL(MAX(STOCK_NUM),0)+1 FROM STOCKS),21, 'T90212sd35031', '스와로브스키목걸이','/images/swaro.jpg',110000,'땀흡수 잘되고 빨리 달릴 수 있는');   
INSERT INTO STOCKS(STOCK_NUM,SCATEGORIES_NUM,STOCK_CODE,STOCK_NAME,STOCK_PHOTO,STOCK_PRICE,STOCK_INFO) 
    VALUES((SELECT NVL(MAX(STOCK_NUM),0)+1 FROM STOCKS),9, 'T30252sd35035', '곰돌이맨투맨','/images/bears.gif',30000,'남심을 사로잡을 수 있는 옷');        
SELECT * FROM STOCKS;    

    
-- 옵션
INSERT INTO OPTIONS(OPTION_NUM,STOCK_NUM,OPTION_SIZE,OPTION_COLOR,OPTION_AMOUNT) 
    VALUES((SELECT NVL(MAX(OPTION_NUM),0)+1 FROM OPTIONS),1, 'L', '빨강',35);
INSERT INTO OPTIONS(OPTION_NUM,STOCK_NUM,OPTION_SIZE,OPTION_COLOR,OPTION_AMOUNT) 
    VALUES((SELECT NVL(MAX(OPTION_NUM),0)+1 FROM OPTIONS),1, 'XL', '빨강',3);
INSERT INTO OPTIONS(OPTION_NUM,STOCK_NUM,OPTION_SIZE,OPTION_COLOR,OPTION_AMOUNT) 
    VALUES((SELECT NVL(MAX(OPTION_NUM),0)+1 FROM OPTIONS),1, 'M', '빨강',0);
INSERT INTO OPTIONS(OPTION_NUM,STOCK_NUM,OPTION_SIZE,OPTION_COLOR,OPTION_AMOUNT) 
    VALUES((SELECT NVL(MAX(OPTION_NUM),0)+1 FROM OPTIONS),1, 'L', '파랑',100);
INSERT INTO OPTIONS(OPTION_NUM,STOCK_NUM,OPTION_SIZE,OPTION_COLOR,OPTION_AMOUNT) 
    VALUES((SELECT NVL(MAX(OPTION_NUM),0)+1 FROM OPTIONS),1, 'XL', '파랑',50);
INSERT INTO OPTIONS(OPTION_NUM,STOCK_NUM,OPTION_SIZE,OPTION_COLOR,OPTION_AMOUNT) 
    VALUES((SELECT NVL(MAX(OPTION_NUM),0)+1 FROM OPTIONS),1, 'M', '파랑',1);
INSERT INTO OPTIONS(OPTION_NUM,STOCK_NUM,OPTION_SIZE,OPTION_COLOR,OPTION_AMOUNT) 
    VALUES((SELECT NVL(MAX(OPTION_NUM),0)+1 FROM OPTIONS),2, 'FREE', '빨강',35);
INSERT INTO OPTIONS(OPTION_NUM,STOCK_NUM,OPTION_SIZE,OPTION_COLOR,OPTION_AMOUNT) 
    VALUES((SELECT NVL(MAX(OPTION_NUM),0)+1 FROM OPTIONS),2, 'FREE', '노랑',3);
INSERT INTO OPTIONS(OPTION_NUM,STOCK_NUM,OPTION_SIZE,OPTION_COLOR,OPTION_AMOUNT) 
    VALUES((SELECT NVL(MAX(OPTION_NUM),0)+1 FROM OPTIONS),2, 'FREE', '파랑',0);
INSERT INTO OPTIONS(OPTION_NUM,STOCK_NUM,OPTION_SIZE,OPTION_COLOR,OPTION_AMOUNT) 
    VALUES((SELECT NVL(MAX(OPTION_NUM),0)+1 FROM OPTIONS),2, 'FREE', '초록',100);
INSERT INTO OPTIONS(OPTION_NUM,STOCK_NUM,OPTION_SIZE,OPTION_COLOR,OPTION_AMOUNT) 
    VALUES((SELECT NVL(MAX(OPTION_NUM),0)+1 FROM OPTIONS),3, 'FREE', '빨강',35);
INSERT INTO OPTIONS(OPTION_NUM,STOCK_NUM,OPTION_SIZE,OPTION_COLOR,OPTION_AMOUNT) 
    VALUES((SELECT NVL(MAX(OPTION_NUM),0)+1 FROM OPTIONS),4, 'S', '노랑',3);
INSERT INTO OPTIONS(OPTION_NUM,STOCK_NUM,OPTION_SIZE,OPTION_COLOR,OPTION_AMOUNT) 
    VALUES((SELECT NVL(MAX(OPTION_NUM),0)+1 FROM OPTIONS),4, 'L', '파랑',1);
INSERT INTO OPTIONS(OPTION_NUM,STOCK_NUM,OPTION_SIZE,OPTION_COLOR,OPTION_AMOUNT) 
    VALUES((SELECT NVL(MAX(OPTION_NUM),0)+1 FROM OPTIONS),5, 'S', '빨강',0);
INSERT INTO OPTIONS(OPTION_NUM,STOCK_NUM,OPTION_SIZE,OPTION_COLOR,OPTION_AMOUNT) 
    VALUES((SELECT NVL(MAX(OPTION_NUM),0)+1 FROM OPTIONS),5, 'M', '빨강',0);
INSERT INTO OPTIONS(OPTION_NUM,STOCK_NUM,OPTION_SIZE,OPTION_COLOR,OPTION_AMOUNT) 
    VALUES((SELECT NVL(MAX(OPTION_NUM),0)+1 FROM OPTIONS),5, 'L', '빨강',0);
INSERT INTO OPTIONS(OPTION_NUM,STOCK_NUM,OPTION_SIZE,OPTION_COLOR,OPTION_AMOUNT) 
    VALUES((SELECT NVL(MAX(OPTION_NUM),0)+1 FROM OPTIONS),5, 'S', '파랑',100);
INSERT INTO OPTIONS(OPTION_NUM,STOCK_NUM,OPTION_SIZE,OPTION_COLOR,OPTION_AMOUNT) 
    VALUES((SELECT NVL(MAX(OPTION_NUM),0)+1 FROM OPTIONS),5, 'M', '파랑',50);
INSERT INTO OPTIONS(OPTION_NUM,STOCK_NUM,OPTION_SIZE,OPTION_COLOR,OPTION_AMOUNT) 
    VALUES((SELECT NVL(MAX(OPTION_NUM),0)+1 FROM OPTIONS),5, 'L', '파랑',1);
INSERT INTO OPTIONS(OPTION_NUM,STOCK_NUM,OPTION_SIZE,OPTION_COLOR,OPTION_AMOUNT) 
    VALUES((SELECT NVL(MAX(OPTION_NUM),0)+1 FROM OPTIONS),5, 'S', '노랑',100);
INSERT INTO OPTIONS(OPTION_NUM,STOCK_NUM,OPTION_SIZE,OPTION_COLOR,OPTION_AMOUNT) 
    VALUES((SELECT NVL(MAX(OPTION_NUM),0)+1 FROM OPTIONS),5, 'M', '노랑',50);
INSERT INTO OPTIONS(OPTION_NUM,STOCK_NUM,OPTION_SIZE,OPTION_COLOR,OPTION_AMOUNT) 
    VALUES((SELECT NVL(MAX(OPTION_NUM),0)+1 FROM OPTIONS),5, 'L', '노랑',0);
    
INSERT INTO OPTIONS(OPTION_NUM,STOCK_NUM,OPTION_SIZE,OPTION_COLOR,OPTION_AMOUNT) 
    VALUES((SELECT NVL(MAX(OPTION_NUM),0)+1 FROM OPTIONS),12, 'L', '하양',10); 
INSERT INTO OPTIONS(OPTION_NUM,STOCK_NUM,OPTION_SIZE,OPTION_COLOR,OPTION_AMOUNT) 
    VALUES((SELECT NVL(MAX(OPTION_NUM),0)+1 FROM OPTIONS),12, 'L', '검정',10); 
INSERT INTO OPTIONS(OPTION_NUM,STOCK_NUM,OPTION_SIZE,OPTION_COLOR,OPTION_AMOUNT) 
    VALUES((SELECT NVL(MAX(OPTION_NUM),0)+1 FROM OPTIONS),12, 'M', '하양',10);
INSERT INTO OPTIONS(OPTION_NUM,STOCK_NUM,OPTION_SIZE,OPTION_COLOR,OPTION_AMOUNT) 
    VALUES((SELECT NVL(MAX(OPTION_NUM),0)+1 FROM OPTIONS),12, 'M', '검정',20);
INSERT INTO OPTIONS(OPTION_NUM,STOCK_NUM,OPTION_SIZE,OPTION_COLOR,OPTION_AMOUNT) 
    VALUES((SELECT NVL(MAX(OPTION_NUM),0)+1 FROM OPTIONS),13, 'L', '하양',10);  
INSERT INTO OPTIONS(OPTION_NUM,STOCK_NUM,OPTION_SIZE,OPTION_COLOR,OPTION_AMOUNT) 
    VALUES((SELECT NVL(MAX(OPTION_NUM),0)+1 FROM OPTIONS),13, 'L', '검정',10);     
SELECT * FROM OPTIONS;


--회원
INSERT INTO MEMBERS (MEMBER_NUM,MEMBER_NAME,MEMBER_ID,MEMBER_PASS,MEMBER_TEL,MEMBER_EMAIL,MEMBER_BIRTH,MEMBER_ADDRESS,MEMBER_AGREE)
    VALUES((SELECT NVL(MAX(MEMBER_NUM),0)+1 FROM MEMBERS),'홍길동', 'honggildong1234', '1111','01012341234','hong@naver.com','19550812','서울시중구','Y');
INSERT INTO MEMBERS (MEMBER_NUM,MEMBER_NAME,MEMBER_ID,MEMBER_PASS,MEMBER_TEL,MEMBER_EMAIL,MEMBER_BIRTH,MEMBER_ADDRESS,MEMBER_AGREE)
    VALUES((SELECT NVL(MAX(MEMBER_NUM),0)+1 FROM MEMBERS),'이순신', 'leesoonsin456', '1111','01012344567','lee@naver.com','19850115','서울시마포구','Y');
INSERT INTO MEMBERS (MEMBER_NUM,MEMBER_NAME,MEMBER_ID,MEMBER_PASS,MEMBER_TEL,MEMBER_EMAIL,MEMBER_BIRTH,MEMBER_ADDRESS,MEMBER_AGREE)
    VALUES((SELECT NVL(MAX(MEMBER_NUM),0)+1 FROM MEMBERS),'이순신', 'leesoonsin457', '1111','01012344567','lee@naver.com','19950116','서울시마포구','Y');
INSERT INTO MEMBERS (MEMBER_NUM,MEMBER_NAME,MEMBER_ID,MEMBER_PASS,MEMBER_TEL,MEMBER_EMAIL,MEMBER_BIRTH,MEMBER_ADDRESS,MEMBER_AGREE)
    VALUES((SELECT NVL(MAX(MEMBER_NUM),0)+1 FROM MEMBERS),'이순신', 'leesoonsin458', '1111','01012344567','lee@naver.com','19950117','서울시마포구','Y');
INSERT INTO MEMBERS (MEMBER_NUM,MEMBER_NAME,MEMBER_ID,MEMBER_PASS,MEMBER_TEL,MEMBER_EMAIL,MEMBER_BIRTH,MEMBER_ADDRESS,MEMBER_AGREE)
    VALUES((SELECT NVL(MAX(MEMBER_NUM),0)+1 FROM MEMBERS),'이순신', 'leesoonsin459', '1111','01012344567','lee@naver.com','19950118','서울시마포구','Y');
INSERT INTO MEMBERS (MEMBER_NUM,MEMBER_NAME,MEMBER_ID,MEMBER_PASS,MEMBER_TEL,MEMBER_EMAIL,MEMBER_BIRTH,MEMBER_ADDRESS,MEMBER_AGREE)
    VALUES((SELECT NVL(MAX(MEMBER_NUM),0)+1 FROM MEMBERS),'이순신', 'leesoonsin460', '1111','01012344567','lee@naver.com','19750118','서울시마포구','Y');
INSERT INTO MEMBERS (MEMBER_NUM,MEMBER_NAME,MEMBER_ID,MEMBER_PASS,MEMBER_TEL,MEMBER_EMAIL,MEMBER_BIRTH,MEMBER_ADDRESS,MEMBER_AGREE)
    VALUES((SELECT NVL(MAX(MEMBER_NUM),0)+1 FROM MEMBERS),'이순신', 'leesoonsin461', '1111','01012344567','lee@naver.com','19750119','서울시마포구','Y');



INSERT INTO MEMBERS (MEMBER_NUM,MEMBER_NAME,MEMBER_ID,MEMBER_PASS,MEMBER_TEL,MEMBER_EMAIL,MEMBER_BIRTH,MEMBER_ADDRESS,MEMBER_AGREE)
    VALUES(0,'admin', 'admin', 'admin','01011111111','admin@admin.com','19000101','서울시','Y');
SELECT * FROM MEMBERS;

commit;

--적립금
INSERT INTO ACCUMULATED (ACCUMULATED_NUM,MEMBER_NUM,ACCUMULATED_HISTORY,ACCUMULATED_MONEY,ACCUMULATED_USE)
    VALUES((SELECT NVL(MAX(ACCUMULATED_NUM),0)+1 FROM ACCUMULATED),1, '회원가입 적립금', '5000','ADD');
INSERT INTO ACCUMULATED (ACCUMULATED_NUM,MEMBER_NUM,ACCUMULATED_HISTORY,ACCUMULATED_MONEY,ACCUMULATED_USE)
    VALUES((SELECT NVL(MAX(ACCUMULATED_NUM),0)+1 FROM ACCUMULATED),1, '물품구매 적립', '3000','ADD');
INSERT INTO ACCUMULATED (ACCUMULATED_NUM,MEMBER_NUM,ACCUMULATED_HISTORY,ACCUMULATED_MONEY,ACCUMULATED_USE)
    VALUES((SELECT NVL(MAX(ACCUMULATED_NUM),0)+1 FROM ACCUMULATED),1, '리뷰작성 적립', '500','ADD');
INSERT INTO ACCUMULATED (ACCUMULATED_NUM,MEMBER_NUM,ACCUMULATED_HISTORY,ACCUMULATED_MONEY,ACCUMULATED_USE)
    VALUES((SELECT NVL(MAX(ACCUMULATED_NUM),0)+1 FROM ACCUMULATED),1, '물품구매 적립금사용', '4000','USE');
INSERT INTO ACCUMULATED (ACCUMULATED_NUM,MEMBER_NUM,ACCUMULATED_HISTORY,ACCUMULATED_MONEY,ACCUMULATED_USE)
    VALUES((SELECT NVL(MAX(ACCUMULATED_NUM),0)+1 FROM ACCUMULATED),1, '리뷰작성 적립', '500','ADD');
SELECT * FROM ACCUMULATED;

    
-- 관심상품
INSERT INTO INTERESTS (INTEREST_NUM,MEMBER_NUM,OPTION_NUM)
    VALUES((SELECT NVL(MAX(INTEREST_NUM),0)+1 FROM INTERESTS),1,1);
INSERT INTO INTERESTS (INTEREST_NUM,MEMBER_NUM,OPTION_NUM)
    VALUES((SELECT NVL(MAX(INTEREST_NUM),0)+1 FROM INTERESTS),1,10);
SELECT * FROM INTERESTS;
    
-- 장바구니
INSERT INTO BASKETS (BASKET_NUM,MEMBER_NUM,OPTION_NUM,BASKET_AMOUNT)
    VALUES((SELECT NVL(MAX(BASKET_NUM),0)+1 FROM BASKETS),1,2,5);
INSERT INTO BASKETS (BASKET_NUM,MEMBER_NUM,OPTION_NUM,BASKET_AMOUNT)
    VALUES((SELECT NVL(MAX(BASKET_NUM),0)+1 FROM BASKETS),1,5,1);
SELECT * FROM BASKETS;
    
    
    
--거래내역
INSERT INTO TRANSACTIONS(TRANSACTION_NUM,MEMBER_NUM,OPTION_NUM,DELIVERY_MESSAGE, DELIVERY_ADDRESS, AMOUNT, PAYMENT, ACCUMULATED_MONEY, TRANSACTION_STATUS, REFUND_STATUS, DELIVERY_STATUS)
    VALUES((SELECT NVL(MAX(TRANSACTION_NUM),0)+1 FROM TRANSACTIONS),1,2,'부재시문앞에놔주세요','경기도수원',5,50000,500,'N','N','N');
INSERT INTO TRANSACTIONS(TRANSACTION_NUM,MEMBER_NUM,OPTION_NUM,DELIVERY_MESSAGE, DELIVERY_ADDRESS, AMOUNT, PAYMENT, ACCUMULATED_MONEY, TRANSACTION_STATUS, REFUND_STATUS, DELIVERY_STATUS)
    VALUES((SELECT NVL(MAX(TRANSACTION_NUM),0)+1 FROM TRANSACTIONS),1,7,'부재시문앞에놔주세요','부산강서구',1,10000,100,'N','N','N');
INSERT INTO TRANSACTIONS(TRANSACTION_NUM,MEMBER_NUM,OPTION_NUM,DELIVERY_MESSAGE, DELIVERY_ADDRESS, AMOUNT, PAYMENT, ACCUMULATED_MONEY, TRANSACTION_STATUS, REFUND_STATUS, DELIVERY_STATUS,TRANSACTION_DATE,DEPOSIT_DATE,DELIVERY_DATE)
    VALUES((SELECT NVL(MAX(TRANSACTION_NUM),0)+1 FROM TRANSACTIONS),1,7,'부재시문앞에놔주세요','부산강서구',1,400,100,'Y','N','Y',TO_DATE('20211001151212','YYYYMMDDHH24MISS'),TO_DATE('20211001151212','YYYYMMDDHH24MISS'),TO_DATE('20211001151212','YYYYMMDDHH24MISS'));    
INSERT INTO TRANSACTIONS(TRANSACTION_NUM,MEMBER_NUM,OPTION_NUM,DELIVERY_MESSAGE, DELIVERY_ADDRESS, AMOUNT, PAYMENT, ACCUMULATED_MONEY, TRANSACTION_STATUS, REFUND_STATUS, DELIVERY_STATUS,TRANSACTION_DATE,DEPOSIT_DATE,DELIVERY_DATE)
    VALUES((SELECT NVL(MAX(TRANSACTION_NUM),0)+1 FROM TRANSACTIONS),1,7,'부재시문앞에놔주세요','부산강서구',1,400,100,'Y','N','Y',TO_DATE('20211108151212','YYYYMMDDHH24MISS'),TO_DATE('20211108151212','YYYYMMDDHH24MISS'),TO_DATE('20211108151212','YYYYMMDDHH24MISS'));    
SELECT * FROM TRANSACTIONS;   


--문의내역
INSERT INTO INQUIRES(INQUIRE_NUM,MEMBER_NUM,STOCK_NUM, INQUIRE_TITLE, INQUIRE_CONTENT, REPLY_STATUS, REPLY_CONTENT)
    VALUES((SELECT NVL(MAX(INQUIRE_NUM),0)+1 FROM INQUIRES),1,7,'사이즈문의','L사이즈 언제 재입고되나요','N',NULL);
INSERT INTO INQUIRES(INQUIRE_NUM,MEMBER_NUM,STOCK_NUM, INQUIRE_TITLE, INQUIRE_CONTENT, REPLY_STATUS, REPLY_CONTENT,REPLY_DATE)
    VALUES((SELECT NVL(MAX(INQUIRE_NUM),0)+1 FROM INQUIRES),1,4,'색상문의','주황색은없나요','Y','네',SYSDATE+1);
SELECT * FROM INQUIRES; 

--리뷰내역
INSERT INTO REVIEWS(REVIEW_NUM,MEMBER_NUM,STOCK_NUM, REVIEW_CONTENT, REVIEW_GRADE)
    VALUES((SELECT NVL(MAX(REVIEW_NUM),0)+1 FROM REVIEWS),1,1,'좋아요',5);
INSERT INTO REVIEWS(REVIEW_NUM,MEMBER_NUM,STOCK_NUM, REVIEW_CONTENT, REVIEW_GRADE)
    VALUES((SELECT NVL(MAX(REVIEW_NUM),0)+1 FROM REVIEWS),1,1,'싫어요',1);
INSERT INTO REVIEWS(REVIEW_NUM,MEMBER_NUM,STOCK_NUM, REVIEW_CONTENT, REVIEW_GRADE)
    VALUES((SELECT NVL(MAX(REVIEW_NUM),0)+1 FROM REVIEWS),1,1,'그냥그래요',3);
INSERT INTO REVIEWS(REVIEW_NUM,MEMBER_NUM,STOCK_NUM, REVIEW_CONTENT, REVIEW_GRADE)
    VALUES((SELECT NVL(MAX(REVIEW_NUM),0)+1 FROM REVIEWS),2,2,'그냥그래요',3); 
INSERT INTO REVIEWS(REVIEW_NUM,MEMBER_NUM,STOCK_NUM, REVIEW_CONTENT, REVIEW_GRADE)
    VALUES((SELECT NVL(MAX(REVIEW_NUM),0)+1 FROM REVIEWS),2,4,'조금좋아요',4); 
SELECT * FROM REVIEWS; 

--포토
INSERT INTO PHOTOS(PHOTO_NUM,STOCK_NUM,PHOTO_LOCATION)
    VALUES((SELECT NVL(MAX(PHOTO_NUM),0)+1 FROM PHOTOS),1,'/images/detail/test.jpg');
INSERT INTO PHOTOS(PHOTO_NUM,STOCK_NUM,PHOTO_LOCATION)
    VALUES((SELECT NVL(MAX(PHOTO_NUM),0)+1 FROM PHOTOS),2,'/images/detail/test.jpg');
INSERT INTO PHOTOS(PHOTO_NUM,STOCK_NUM,PHOTO_LOCATION)
    VALUES((SELECT NVL(MAX(PHOTO_NUM),0)+1 FROM PHOTOS),3,'/images/detail/test.jpg');
INSERT INTO PHOTOS(PHOTO_NUM,STOCK_NUM,PHOTO_LOCATION)
    VALUES((SELECT NVL(MAX(PHOTO_NUM),0)+1 FROM PHOTOS),4,'/images/detail/test.jpg');
INSERT INTO PHOTOS(PHOTO_NUM,STOCK_NUM,PHOTO_LOCATION)
    VALUES((SELECT NVL(MAX(PHOTO_NUM),0)+1 FROM PHOTOS),5,'/images/detail/test.jpg');
INSERT INTO PHOTOS(PHOTO_NUM,STOCK_NUM,PHOTO_LOCATION)
    VALUES((SELECT NVL(MAX(PHOTO_NUM),0)+1 FROM PHOTOS),6,'/images/detail/test.jpg');
INSERT INTO PHOTOS(PHOTO_NUM,STOCK_NUM,PHOTO_LOCATION)
    VALUES((SELECT NVL(MAX(PHOTO_NUM),0)+1 FROM PHOTOS),7,'/images/detail/test.jpg');
INSERT INTO PHOTOS(PHOTO_NUM,STOCK_NUM,PHOTO_LOCATION)
    VALUES((SELECT NVL(MAX(PHOTO_NUM),0)+1 FROM PHOTOS),8,'/images/detail/test.jpg');
INSERT INTO PHOTOS(PHOTO_NUM,STOCK_NUM,PHOTO_LOCATION)
    VALUES((SELECT NVL(MAX(PHOTO_NUM),0)+1 FROM PHOTOS),9,'/images/detail/test.jpg');
INSERT INTO PHOTOS(PHOTO_NUM,STOCK_NUM,PHOTO_LOCATION)
    VALUES((SELECT NVL(MAX(PHOTO_NUM),0)+1 FROM PHOTOS),10,'/images/detail/test.jpg');
INSERT INTO PHOTOS(PHOTO_NUM,STOCK_NUM,PHOTO_LOCATION)
    VALUES((SELECT NVL(MAX(PHOTO_NUM),0)+1 FROM PHOTOS),11,'/images/detail/test.jpg');
INSERT INTO PHOTOS(PHOTO_NUM,STOCK_NUM,PHOTO_LOCATION)
    VALUES((SELECT NVL(MAX(PHOTO_NUM),0)+1 FROM PHOTOS),12,'/images/detail/test.jpg');
INSERT INTO PHOTOS(PHOTO_NUM,STOCK_NUM,PHOTO_LOCATION)
    VALUES((SELECT NVL(MAX(PHOTO_NUM),0)+1 FROM PHOTOS),13,'/images/detail/test.jpg');
INSERT INTO PHOTOS(PHOTO_NUM,STOCK_NUM,PHOTO_LOCATION)
    VALUES((SELECT NVL(MAX(PHOTO_NUM),0)+1 FROM PHOTOS),14,'/images/detail/test.jpg');
INSERT INTO PHOTOS(PHOTO_NUM,STOCK_NUM,PHOTO_LOCATION)
    VALUES((SELECT NVL(MAX(PHOTO_NUM),0)+1 FROM PHOTOS),15,'/images/detail/test.jpg');
INSERT INTO PHOTOS(PHOTO_NUM,STOCK_NUM,PHOTO_LOCATION)
    VALUES((SELECT NVL(MAX(PHOTO_NUM),0)+1 FROM PHOTOS),16,'/images/detail/test.jpg');
INSERT INTO PHOTOS(PHOTO_NUM,STOCK_NUM,PHOTO_LOCATION)
    VALUES((SELECT NVL(MAX(PHOTO_NUM),0)+1 FROM PHOTOS),17,'/images/detail/test.jpg');
INSERT INTO PHOTOS(PHOTO_NUM,STOCK_NUM,PHOTO_LOCATION)
    VALUES((SELECT NVL(MAX(PHOTO_NUM),0)+1 FROM PHOTOS),18,'/images/detail/test.jpg');
INSERT INTO PHOTOS(PHOTO_NUM,STOCK_NUM,PHOTO_LOCATION)
    VALUES((SELECT NVL(MAX(PHOTO_NUM),0)+1 FROM PHOTOS),19,'/images/detail/test.jpg');
INSERT INTO PHOTOS(PHOTO_NUM,STOCK_NUM,PHOTO_LOCATION)
    VALUES((SELECT NVL(MAX(PHOTO_NUM),0)+1 FROM PHOTOS),20,'/images/detail/test.jpg');
INSERT INTO PHOTOS(PHOTO_NUM,STOCK_NUM,PHOTO_LOCATION)
    VALUES((SELECT NVL(MAX(PHOTO_NUM),0)+1 FROM PHOTOS),21,'/images/detail/test.jpg');
INSERT INTO PHOTOS(PHOTO_NUM,STOCK_NUM,PHOTO_LOCATION)
    VALUES((SELECT NVL(MAX(PHOTO_NUM),0)+1 FROM PHOTOS),22,'/images/detail/test.jpg');    
INSERT INTO PHOTOS(PHOTO_NUM,STOCK_NUM,PHOTO_LOCATION)
    VALUES((SELECT NVL(MAX(PHOTO_NUM),0)+1 FROM PHOTOS),23,'/images/detail/test.jpg');
INSERT INTO PHOTOS(PHOTO_NUM,STOCK_NUM,PHOTO_LOCATION)
    VALUES((SELECT NVL(MAX(PHOTO_NUM),0)+1 FROM PHOTOS),24,'/images/detail/test.jpg');
INSERT INTO PHOTOS(PHOTO_NUM,STOCK_NUM,PHOTO_LOCATION)
    VALUES((SELECT NVL(MAX(PHOTO_NUM),0)+1 FROM PHOTOS),25,'/images/detail/test.jpg');
INSERT INTO PHOTOS(PHOTO_NUM,STOCK_NUM,PHOTO_LOCATION)
    VALUES((SELECT NVL(MAX(PHOTO_NUM),0)+1 FROM PHOTOS),26,'/images/detail/test.jpg');
INSERT INTO PHOTOS(PHOTO_NUM,STOCK_NUM,PHOTO_LOCATION)
    VALUES((SELECT NVL(MAX(PHOTO_NUM),0)+1 FROM PHOTOS),27,'/images/detail/test.jpg');
INSERT INTO PHOTOS(PHOTO_NUM,STOCK_NUM,PHOTO_LOCATION)
    VALUES((SELECT NVL(MAX(PHOTO_NUM),0)+1 FROM PHOTOS),28,'/images/detail/test.jpg');
 
select * from PHOTOS;




INSERT INTO TRANSACTIONS(TRANSACTION_NUM,MEMBER_NUM,OPTION_NUM,DELIVERY_MESSAGE, DELIVERY_ADDRESS, AMOUNT, PAYMENT, ACCUMULATED_MONEY, TRANSACTION_STATUS, REFUND_STATUS, DELIVERY_STATUS,TRANSACTION_DATE,DEPOSIT_DATE,DELIVERY_DATE)
    VALUES((SELECT NVL(MAX(TRANSACTION_NUM),0)+1 FROM TRANSACTIONS),1,7,'부재시문앞에놔주세요','부산강서구',1,400,100,'Y','N','Y',TO_DATE('20211001151212','YYYYMMDDHH24MISS'),TO_DATE('20211001151212','YYYYMMDDHH24MISS'),TO_DATE('20211001151212','YYYYMMDDHH24MISS'));    
INSERT INTO TRANSACTIONS(TRANSACTION_NUM,MEMBER_NUM,OPTION_NUM,DELIVERY_MESSAGE, DELIVERY_ADDRESS, AMOUNT, PAYMENT, ACCUMULATED_MONEY, TRANSACTION_STATUS, REFUND_STATUS, DELIVERY_STATUS,TRANSACTION_DATE,DEPOSIT_DATE,DELIVERY_DATE)
    VALUES((SELECT NVL(MAX(TRANSACTION_NUM),0)+1 FROM TRANSACTIONS),1,7,'부재시문앞에놔주세요','부산강서구',1,400,100,'Y','N','Y',TO_DATE('20211108151212','YYYYMMDDHH24MISS'),TO_DATE('20211108151212','YYYYMMDDHH24MISS'),TO_DATE('20211108151212','YYYYMMDDHH24MISS'));    

commit