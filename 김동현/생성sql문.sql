-- ����
CREATE TABLE users (
	username VARCHAR2(10 char) NOT NULL,
	name VARCHAR2(15 char) NOT NULL,
	tel VARCHAR2(20 char) NOT NULL,
	password VARCHAR2(50 char) NOT NULL,
	nation VARCHAR2(10 char) NOT NULL,
	email VARCHAR2(70 char) NOT NULL,
	birthDay DATE NOT NULL,
	personalId VARCHAR2(50 char) NOT NULL,
	loginFailCount number(1) DEFAULT '0',
	disabled number(1) DEFAULT '0',
	userLevel VARCHAR2(10 char) NOT NULL,
	role VARCHAR2(20 char) NOT NULL
);

-- ����
ALTER TABLE users
	ADD CONSTRAINT PK_users -- ���� �⺻Ű
	PRIMARY KEY (
	username -- ���̵�
	);

-- ���ǰԽ���
CREATE TABLE board (
	boardNo number(4) NOT NULL,
	username VARCHAR2(10 char) NOT NULL,
	replyNo number(1) NOT NULL,
	writeDay DATE NOT NULL,
	title VARCHAR2(20 char) NOT NULL,
	content VARCHAR2(500 char) NOT NULL
);

-- ���ǰԽ���
ALTER TABLE board
	ADD CONSTRAINT PK_board -- ���ǰԽ��� �⺻Ű
	PRIMARY KEY (
	boardNo -- �۹�ȣ
	);

-- ī��
CREATE TABLE card (
	cardNo VARCHAR2(20 char) NOT NULL,
	username VARCHAR2(10 char) NOT NULL,
	cardVendor VARCHAR2(10 char) NOT NULL,
	expiryDate DATE NOT NULL,
	cardPassword varchar2(10 char) NOT NULL,
	cardCVC VARCHAR2(3 char) NOT NULL
);

-- ī��
ALTER TABLE card
	ADD CONSTRAINT PK_card -- ī�� �⺻Ű
	PRIMARY KEY (
	cardNo -- ī���ȣ
	);

-- ����
CREATE TABLE book (
	bookNo number(8) NOT NULL,
	username VARCHAR2(10 char) NOT NULL,
	totalCount number(1) NOT NULL
);

-- ����
ALTER TABLE book
	ADD CONSTRAINT PK_book -- ���� �⺻Ű
	PRIMARY KEY (
	bookNo,   -- �����ȣ
	username  -- ���̵�
	);

-- �濹��
CREATE TABLE roomBooking (
	bookNo number(8) NOT NULL,
	username VARCHAR2(10 char) NOT NULL,
	booker VARCHAR2(20 char) NOT NULL,
	bookDate DATE NOT NULL,
	checkIn DATE NOT NULL,
	checkOut DATE NOT NULL
);

-- �濹��
ALTER TABLE roomBooking
	ADD CONSTRAINT PK_roomBooking -- �濹�� �⺻Ű
	PRIMARY KEY (
	bookNo,   -- �����ȣ
	username, -- ���̵�
	booker    -- ������
	);

-- �Ļ翹��
CREATE TABLE restaurant (
	resNo number(8) NOT NULL,
	username VARCHAR2(10 char) NOT NULL,
	resName VARCHAR2(20 char) NOT NULL,
	resDate DATE NULL
);

-- �Ļ翹��
ALTER TABLE restaurant
	ADD CONSTRAINT PK_restaurant -- �Ļ翹�� �⺻Ű
	PRIMARY KEY (
	resNo,    -- �����ȣ
	username, -- ���̵�
	resName   -- ������
	);

-- ��
CREATE TABLE room (
	booker VARCHAR2(20 char) NOT NULL,
	username VARCHAR2(10 char) NOT NULL,
	bookNo number(8) NULL,
	gradeName VARCHAR2(15 char) NOT NULL
);

-- ��
ALTER TABLE room
	ADD CONSTRAINT PK_room -- �� �⺻Ű
	PRIMARY KEY (
	booker -- ������
	);

-- ����
CREATE TABLE roomGrade (
	gradeName VARCHAR2(15 char) NOT NULL,
	gradePrice number(8) NOT NULL
);

-- ����
ALTER TABLE roomGrade
	ADD CONSTRAINT PK_roomGrade -- ���� �⺻Ű
	PRIMARY KEY (
	gradeName -- ��޸�
	);

-- ���
CREATE TABLE roomDetail (
	roomNo number(3) NOT NULL,
	roomStatus VARCHAR2(10 char) NOT NULL,
	booker VARCHAR2(20 char) NULL
);

-- ���
ALTER TABLE roomDetail
	ADD CONSTRAINT PK_roomDetail -- ��� �⺻Ű
	PRIMARY KEY (
	roomNo -- ��ȣ��
	);

-- ����
CREATE TABLE breakfast (
	resNo number(8) NULL,
	username VARCHAR2(10 char) NULL,
	breakfastTime DATE NULL,
	resName VARCHAR2(20 char) NULL
);

-- ����
CREATE TABLE dinner (
	resNo number(8) NULL,
	username VARCHAR2(10 char) NULL,
	dinnerTime DATE NULL,
	resName VARCHAR2(20 char) NULL
);

-- ��ǰ��
CREATE TABLE mall (
	mallName VARCHAR2(10 char) NOT NULL
);

-- ��ǰ��
ALTER TABLE mall
	ADD CONSTRAINT PK_mall -- ��ǰ�� �⺻Ű
	PRIMARY KEY (
	mallName -- ��ǰ���̸�
	);

-- ��ǰ
CREATE TABLE item (
	itemNo number(8) NOT NULL,
	itemName VARCHAR2(20 char) NULL,
	itemPrice number(8) NULL,
	itemEA number(3) NULL,
	mallName VARCHAR2(10 char) NULL
);

-- ��ǰ
ALTER TABLE item
	ADD CONSTRAINT PK_item -- ��ǰ �⺻Ű
	PRIMARY KEY (
	itemNo -- ��ǰ�ڵ�
	);

-- �ֹ�
CREATE TABLE orders (
	orderNo number(8) NOT NULL,
	username VARCHAR2(10 char) NULL,
	itemNo number(8) NULL
);

-- �ֹ�
ALTER TABLE orders
	ADD CONSTRAINT PK_orders -- �ֹ� �⺻Ű
	PRIMARY KEY (
	orderNo -- �ֹ��ڵ�
	);

-- ������
CREATE TABLE admins (
	adminname VARCHAR(10) NULL,
	adminpassword VARCHAR(20) NULL
);

-- �ֹ���
CREATE TABLE orderDetail (
	orderNo number(8) NULL,
	orderDate DATE NULL,
	contactDate DATE NULL,
	orderPrice number(8) NULL,
	orderEA number(3) NULL
);

-- ��ٱ���
CREATE TABLE cart (
	cartNo number(8) NOT NULL,
	itemNo number(8) NOT NULL,
	username VARCHAR2(10 char) NOT NULL
);

-- ��ٱ���
ALTER TABLE cart
	ADD CONSTRAINT PK_cart -- ��ٱ��� �⺻Ű
	PRIMARY KEY (
	cartNo,   -- ��ٱ��Ϲ�ȣ
	itemNo,   -- ��ǰ�ڵ�
	username  -- ���̵�
	);

-- ȯ��
CREATE TABLE refund (
	orderNo number(8) NOT NULL,
	refundNo number(8) NOT NULL,
	refundReason VARCHAR2(100 char) NULL
);

-- ȯ��
ALTER TABLE refund
	ADD CONSTRAINT PK_refund -- ȯ�� �⺻Ű
	PRIMARY KEY (
	orderNo,  -- �ֹ��ڵ�
	refundNo  -- ȯ���ڵ�
	);

-- ����ȯ��
CREATE TABLE restaurantRefund (
	bookNo number(8) NOT NULL,
	username VARCHAR2(10 char) NOT NULL,
	refundno number(8) NOT NULL,
	refundreason VARCHAR2(100 char) NULL,
	refunddate DATE NULL
);

-- ����ȯ��
ALTER TABLE restaurantRefund
	ADD CONSTRAINT PK_restaurantRefund -- ����ȯ�� �⺻Ű
	PRIMARY KEY (
	bookNo,   -- �����ȣ
	username, -- ���̵�
	refundno  -- ȯ���ڵ�
	);

-- ����
CREATE TABLE payment (
	paycode number(8) NOT NULL,
	orderNo number(8) NOT NULL,
	payType VARCHAR2(10 char) NULL,
	payDate DATE NULL,
	payTotal number(8) NULL,
	deposit number(8) NULL,
	depositName VARCHAR(20 char) NULL,
	depositBank VARCHAR(20 char) NULL,
	bookNo number(8) NULL,
	username VARCHAR2(10 char) NULL
);

-- ����
ALTER TABLE payment
	ADD CONSTRAINT PK_payment -- ���� �⺻Ű
	PRIMARY KEY (
	paycode -- �����ڵ�
	);

-- ���
CREATE TABLE reply (
	replyNo number(1) NOT NULL,
	replyContent VARCHAR2(50) NULL,
	replyWriteDay DATE NULL,
	replyWriter DATE NULL
);

-- ���
ALTER TABLE reply
	ADD CONSTRAINT PK_reply -- ��� �⺻Ű
	PRIMARY KEY (
	replyNo -- ��۹�ȣ
	);

-- ���ǰԽ���
ALTER TABLE board
	ADD CONSTRAINT FK_users_TO_board -- ���� -> ���ǰԽ���
	FOREIGN KEY (
	username -- ���̵�
	)
	REFERENCES users ( -- ����
	username -- ���̵�
	);

-- ���ǰԽ���
ALTER TABLE board
	ADD CONSTRAINT FK_reply_TO_board -- ��� -> ���ǰԽ���
	FOREIGN KEY (
	replyNo -- ��۹�ȣ
	)
	REFERENCES reply ( -- ���
	replyNo -- ��۹�ȣ
	);

-- ī��
ALTER TABLE card
	ADD CONSTRAINT FK_users_TO_card -- ���� -> ī��
	FOREIGN KEY (
	username -- ���̵�
	)
	REFERENCES users ( -- ����
	username -- ���̵�
	);

-- ����
ALTER TABLE book
	ADD CONSTRAINT FK_users_TO_book -- ���� -> ����
	FOREIGN KEY (
	username -- ���̵�
	)
	REFERENCES users ( -- ����
	username -- ���̵�
	);

-- �濹��
ALTER TABLE roomBooking
	ADD CONSTRAINT FK_book_TO_roomBooking -- ���� -> �濹��
	FOREIGN KEY (
	bookNo,   -- �����ȣ
	username  -- ���̵�
	)
	REFERENCES book ( -- ����
	bookNo,   -- �����ȣ
	username  -- ���̵�
	);

-- �Ļ翹��
ALTER TABLE restaurant
	ADD CONSTRAINT FK_book_TO_restaurant -- ���� -> �Ļ翹��
	FOREIGN KEY (
	resNo,    -- �����ȣ
	username  -- ���̵�
	)
	REFERENCES book ( -- ����
	bookNo,   -- �����ȣ
	username  -- ���̵�
	);

-- ��
ALTER TABLE room
	ADD CONSTRAINT FK_roomBooking_TO_room -- �濹�� -> ��
	FOREIGN KEY (
	bookNo,   -- �����ȣ
	username, -- ���̵�
	booker    -- ������
	)
	REFERENCES roomBooking ( -- �濹��
	bookNo,   -- �����ȣ
	username, -- ���̵�
	booker    -- ������
	);

-- ��
ALTER TABLE room
	ADD CONSTRAINT FK_roomGrade_TO_room -- ���� -> ��
	FOREIGN KEY (
	gradeName -- ��޸�
	)
	REFERENCES roomGrade ( -- ����
	gradeName -- ��޸�
	);

-- ���
ALTER TABLE roomDetail
	ADD CONSTRAINT FK_room_TO_roomDetail -- �� -> ���
	FOREIGN KEY (
	booker -- ������
	)
	REFERENCES room ( -- ��
	booker -- ������
	);

-- ����
ALTER TABLE breakfast
	ADD CONSTRAINT FK_restaurant_TO_breakfast -- �Ļ翹�� -> ����
	FOREIGN KEY (
	resNo,    -- �����ȣ
	username, -- ���̵�
	resName   -- ������
	)
	REFERENCES restaurant ( -- �Ļ翹��
	resNo,    -- �����ȣ
	username, -- ���̵�
	resName   -- ������
	);

-- ����
ALTER TABLE dinner
	ADD CONSTRAINT FK_restaurant_TO_dinner -- �Ļ翹�� -> ����
	FOREIGN KEY (
	resNo,    -- �����ȣ
	username, -- ���̵�
	resName   -- ������
	)
	REFERENCES restaurant ( -- �Ļ翹��
	resNo,    -- �����ȣ
	username, -- ���̵�
	resName   -- ������
	);

-- ��ǰ
ALTER TABLE item
	ADD CONSTRAINT FK_mall_TO_item -- ��ǰ�� -> ��ǰ
	FOREIGN KEY (
	mallName -- ��ǰ���̸�
	)
	REFERENCES mall ( -- ��ǰ��
	mallName -- ��ǰ���̸�
	);

-- �ֹ�
ALTER TABLE orders
	ADD CONSTRAINT FK_users_TO_orders -- ���� -> �ֹ�
	FOREIGN KEY (
	username -- ���̵�
	)
	REFERENCES users ( -- ����
	username -- ���̵�
	);

-- �ֹ�
ALTER TABLE orders
	ADD CONSTRAINT FK_item_TO_orders -- ��ǰ -> �ֹ�
	FOREIGN KEY (
	itemNo -- ��ǰ�ڵ�
	)
	REFERENCES item ( -- ��ǰ
	itemNo -- ��ǰ�ڵ�
	);

-- �ֹ���
ALTER TABLE orderDetail
	ADD CONSTRAINT FK_orders_TO_orderDetail -- �ֹ� -> �ֹ���
	FOREIGN KEY (
	orderNo -- �ֹ��ڵ�
	)
	REFERENCES orders ( -- �ֹ�
	orderNo -- �ֹ��ڵ�
	);

-- ��ٱ���
ALTER TABLE cart
	ADD CONSTRAINT FK_item_TO_cart -- ��ǰ -> ��ٱ���
	FOREIGN KEY (
	itemNo -- ��ǰ�ڵ�
	)
	REFERENCES item ( -- ��ǰ
	itemNo -- ��ǰ�ڵ�
	);

-- ��ٱ���
ALTER TABLE cart
	ADD CONSTRAINT FK_users_TO_cart -- ���� -> ��ٱ���
	FOREIGN KEY (
	username -- ���̵�
	)
	REFERENCES users ( -- ����
	username -- ���̵�
	);

-- ȯ��
ALTER TABLE refund
	ADD CONSTRAINT FK_orders_TO_refund -- �ֹ� -> ȯ��
	FOREIGN KEY (
	orderNo -- �ֹ��ڵ�
	)
	REFERENCES orders ( -- �ֹ�
	orderNo -- �ֹ��ڵ�
	);

-- ����ȯ��
ALTER TABLE restaurantRefund
	ADD CONSTRAINT FK_book_TO_restaurantRefund -- ���� -> ����ȯ��
	FOREIGN KEY (
	bookNo,   -- �����ȣ
	username  -- ���̵�
	)
	REFERENCES book ( -- ����
	bookNo,   -- �����ȣ
	username  -- ���̵�
	);

-- ����
ALTER TABLE payment
	ADD CONSTRAINT FK_orders_TO_payment -- �ֹ� -> ����
	FOREIGN KEY (
	orderNo -- �ֹ��ڵ�
	)
	REFERENCES orders ( -- �ֹ�
	orderNo -- �ֹ��ڵ�
	);

-- ����
ALTER TABLE payment
	ADD CONSTRAINT FK_book_TO_payment -- ���� -> ����
	FOREIGN KEY (
	bookNo,   -- �����ȣ
	username  -- ���̵�
	)
	REFERENCES book ( -- ����
	bookNo,   -- �����ȣ
	username  -- ���̵�
	);