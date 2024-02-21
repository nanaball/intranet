create database intranet;



CREATE TABLE model(
	mNo		INT PRIMATY KEY	auto_increment,--게시글번호
	mName	VARCHAR(150) 	NOT NULL,
	price	INT				NOT NULL,
	stock	INT				DEFAULT 0,
	soldout char(1) DEFAULT	'Y',		--솔드아웃 여부 -> Y 구매불가능 비활성화
	pay     char(1) DEFAULT	'Y',        --페이된것-> Y
	pDate	TIMESTAMP default now()
);


