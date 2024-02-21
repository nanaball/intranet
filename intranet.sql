create database intranet;

show tables;


CREATE TABLE model(
	mNo		INT PRIMATY KEY	auto_increment,--�Խñ۹�ȣ
	mName	VARCHAR(150) 	NOT NULL,
	price	INT				NOT NULL,
	stock	INT				DEFAULT 0,
	soldout char(1) DEFAULT	'Y',		--�ֵ�ƿ� ���� -> Y ���źҰ��� ��Ȱ��ȭ
	pay     char(1) DEFAULT	'Y',        --���̵Ȱ�-> Y
	pDate	TIMESTAMP default now()
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
