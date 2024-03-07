create database intranet;

show tables;

CREATE TABLE member(
	  uno 		INT 			PRIMARY KEY 	auto_increment, 	-- 사원번호 ( 1 부터 순차적으로 증가 )
    uid			VARCHAR(20)		UNIQUE KEY,		-- 아이디
    upw			VARCHAR(20)		NOT NULL,		-- 비밀번호
    repw        VARCHAR(20),       -- 새비밀번호 변경시
    uemail  	VARCHAR(200) 	NOT NULL,		-- 사원 이메일
    uphone  	VARCHAR(20)  	NOT NULL,		-- 사원 전화번호
    uname   	VARCHAR(20)   	NOT NULL,		-- 사원이름
    udep    	VARCHAR(20)    	NOT NULL,		-- 사원부서
    ujob		VARCHAR(20)		NOT NULL,		-- 직책
    udate		DATE							-- 입사 날짜
);

-- 관리자 계정 생성
INSERT INTO member 
VALUES(null,'admin','admin','abc@gmail.com','01011111111','관리자',
	   '인사','관리자',0221);

select * from member;

DROP TABLE member; -- member 테이블 지우기

DESC member;
-- 상품게시판
CREATE TABLE IF NOT EXISTS model(
	mNo		INT PRIMARY KEY	auto_increment,         -- 제품게시번호
	mName	VARCHAR(150) 	NOT NULL,               -- 제품명
	price	INT				NOT NULL,               -- 제품가격             
	stock	INT				DEFAULT 0,              -- 재고수량
	soldout char(1) NOT NULL DEFAULT	'Y',		-- 솔드아웃 Y -> 비활성화
	pay     char(1) NOT NULL DEFAULT	'Y',        -- Y-> 결제완료
	pDate	TIMESTAMP NOT NULL default now()        -- 결제 시간
);

-- 공문 게시판
CREATE TABLE IF NOT EXISTS official(
	ono	INT	PRIMARY KEY  AUTO_INCREMENT,			-- 공문번호
	dep	VARCHAR(20) NOT NULL,						-- 부서
	job	VARCHAR(20) NOT NULL,						-- 직책
	title	VARCHAR(50) NOT NULL, 					-- 공문제목
	content TEXT NOT NULL, 							-- 공문내용
	writer  VARCHAR(20) NOT NULL, 					-- 작성자
	approve	VARCHAR(20) NOT NULL,					-- 결재/승인 여부 
	date TIMESTAMP not null DEFAULT now(),			-- 작성시간
	FOREIGN KEY (writer) REFERENCES member(uid)
);

SELECT * FROM member;


-- 달력/ 일정
CREATE TABLE IF NOT EXISTS calendar(
	cno	INT	PRIMARY KEY  AUTO_INCREMENT,			-- 일정 번호
	schedule TEXT NOT NULL, 						-- 일정 내용
	date date not null 								-- 일정 날짜
);

drop table ;

SELECT * FROM member WHERE uno = 'your_uno_value';

SELECT COUNT(*) FROM member WHERE uno = 'your_uno_value';

SELECT COUNT(*)
FROM member
WHERE 1 = 1;

SELECT COUNT(*)
FROM member
WHERE 28 = 28;

Cannot add or update a child row: a foreign key constraint fails (`intranet`.`accuse`, CONSTRAINT `fk_accuse_uno` FOREIGN KEY (`uno`) REFERENCES `member` (`uno`));

