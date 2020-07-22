/*회원 테이블과 권한 데이블*/
CREATE TABLE member (
	userId VARCHAR(50) NOT NULL, 
	userPw VARCHAR(100) NOT NULL, 
	userName VARCHAR(5) NOT NULL DEFAULT '00',
	coin INT(10) DEFAULT 0, 
    email VARCHAR(50) NOT NULL,
	phone VARCHAR(50) NOT NULL,
	regDate TIMESTAMP DEFAULT now(), 
	updDate TIMESTAMP DEFAULT now(), 
	enabled CHAR(1) DEFAULT '1', /*enabled : 계정의 활성화, 비활성화의 여부를 알려준다. */
	PRIMARY KEY (userId)
);

CREATE TABLE  member_auth (
	userId VARCHAR(50) NOT NULL, /*아이디*/
	auth VARCHAR(50) NOT NULL /*권한*/
);

ALTER TABLE member_auth ADD CONSTRAINT fk_member_auth_userId FOREIGN KEY (userId) REFERENCES member(userId) ON DELETE CASCADE;

/*로그인 상태 유지 테이블*/
CREATE TABLE persistent_logins (
	username VARCHAR(64) NOT NULL,
    series VARCHAR(64) NOT NULL,
    token VARCHAR(64) NOT NULL,
    last_used TIMESTAMP NOT NULL,
    PRIMARY KEY (series)
);

/*회원 게시판 테이블*/
CREATE TABLE board (
	boardNo INT NOT NULL AUTO_INCREMENT,
	title VARCHAR(200) NOT NULL,
	content TEXT,
	writer VARCHAR(50) NOT NULL,
	regDate TIMESTAMP NOT NULL DEFAULT now(),
	PRIMARY KEY (boardNo)
);

/*공지사항 테이블*/
CREATE TABLE notice (
	noticeNo INT NOT NULL AUTO_INCREMENT,
    title VARCHAR(200) NOT NULL,
    content TEXT,
    regDate TIMESTAMP NOT NULL DEFAULT now(),
    PRIMARY KEY (noticeNo)
);

/*상품 테이블*/
CREATE TABLE item(
	itemId INT(5) AUTO_INCREMENT,
    itemName VARCHAR(20),
    price INT(6),
    description VARCHAR(50),
    pictureUrl varchar(200),
    previewUrl varchar(200),
	PRIMARY KEY (itemId)
);

/*사용자 상품 테이블*/
CREATE TABLE user_item (
	userItemNo INT AUTO_INCREMENT,
	userId VARCHAR(50) NOT NULL,
	itemId INT(5) NOT NULL,
	regDate TIMESTAMP DEFAULT now(),
	PRIMARY KEY (userItemNo)
);

/*충전 내역 테이블*/
CREATE TABLE charge_coin_history (
	historyNo INT AUTO_INCREMENT,
	userId VARCHAR(50) NOT NULL,
    amount INT(5) NOT NULL,
    regDate TIMESTAMP DEFAULT now(),
    PRIMARY KEY (historyNo)
);

/*지급 내역 테이블*/
CREATE TABLE pay_coin_history (
	historyNo INT AUTO_INCREMENT,
	userId VARCHAR(50) NOT NULL, /*아이디*/
    itemId INT(5) NOT NULL,
    amount INT(5) NOT NULL,
    regDate TIMESTAMP DEFAULT now(),
    PRIMARY KEY (historyNo)
);

/*로그인 로그 테이블*/
CREATE TABLE login_log (
	log_no INT NOT NULL AUTO_INCREMENT,
    user_id VARCHAR(50) NOT NULL,
    remote_addr VARCHAR(50) NOT NULL,
    reg_date TIMESTAMP NOT NULL DEFAULT now(),
    PRIMARY KEY (log_no)
);

/*접근 로그 테이블*/
CREATE TABLE access_log (
	log_no INT NOT NULL AUTO_INCREMENT,
    request_uri VARCHAR(200) NOT NULL,
    class_name VARCHAR(100) NOT NULL,
    class_simple_name VARCHAR(50) NOT NULL,
    method_name VARCHAR(100) NOT NULL,
    remote_addr VARCHAR(50) NOT NULL,
    reg_date TIMESTAMP NOT NULL DEFAULT now(),
    PRIMARY KEY (log_no)
);

/*서비스 성능 로그 테이블*/
CREATE TABLE performance_log (
	log_no INT NOT NULL AUTO_INCREMENT,
	signature_name VARCHAR(50) NOT NULL,
	signature_type_name VARCHAR(100) NOT NULL,
	duration_time INT DEFAULT 0,
	reg_date TIMESTAMP NOT NULL DEFAULT now(),
	PRIMARY KEY (log_no)
);

CREATE TABLE cart (
	cartNo INT(5) NOT NULL AUTO_INCREMENT,
	userId VARCHAR(50) NOT NULL, 
	itemId INT(5) NOT NULL, 
    amount INT(5) NOT NULL DEFAULT 1,
	PRIMARY KEY (cartNo, userId)
);

ALTER TABLE cart ADD CONSTRAINT fk_cart_itemId FOREIGN KEY (itemId) REFERENCES item(itemId) ON DELETE CASCADE;
ALTER TABLE cart ADD CONSTRAINT fk_cart_userId FOREIGN KEY (userId) REFERENCES member(userId) ON DELETE CASCADE;

CREATE TABLE reply (
	replyNo INT(5) NOT NULL AUTO_INCREMENT,
    boardNo INT NOT NULL,
	replyContent VARCHAR(150) NOT NULL,
	replyWriter VARCHAR(50) NOT NULL,
	regDate TIMESTAMP DEFAULT now(),
	PRIMARY KEY (replyNo, boardNo)
);

ALTER TABLE reply ADD CONSTRAINT fk_reply_boardNo FOREIGN KEY (boardNo) REFERENCES board(boardNo) ON DELETE CASCADE;

CREATE TABLE review (
	reviewNo INT(5) NOT NULL AUTO_INCREMENT,
    itemId INT(5) NOT NULL,
    reviewContent VARCHAR(150) NOT NULL,
    reviewWriter VARCHAR(50) NOT NULL,
    regDate TIMESTAMP DEFAULT now(),
    PRIMARY KEY (reviewNo, itemId)
);

ALTER TABLE review ADD CONSTRAINT fk_review_itemId FOREIGN KEY (itemId) REFERENCES item(itemId) ON DELETE CASCADE;

CREATE TABLE banner(
	bannerNo INT(5) AUTO_INCREMENT,
    itemId INT(5) NOT NULL,
    bannerName VARCHAR(30) NOT NULL,
    bannerPictureUrl varchar(200),
	PRIMARY KEY (bannerNo)
);

ALTER TABLE banner ADD CONSTRAINT fk_banner_itemId FOREIGN KEY (itemId) REFERENCES item(itemId) ON DELETE CASCADE;

