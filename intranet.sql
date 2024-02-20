create database intranet;

CREATE TABLE member(
	uno 		INT 			PRIMARY KEY 	auto_increment, 	-- 사원번호 ( 1 부터 순차적으로 증가 )
    uid			VARCHAR(20)		UNIQUE KEY,		-- 아이디
    upw			VARCHAR(20)		NOT NULL,		-- 비밀번호
    uemail  	VARCHAR(200) 	NOT NULL,		-- 사원 이메일
    uphone  	VARCHAR(20)  	NOT NULL,		-- 사원 전화번호
    uname   	VARCHAR(20)   	NOT NULL,		-- 사원이름
    udep    	VARCHAR(20)    	NOT NULL,		-- 사원부서
    ujob		VARCHAR(20)		NOT NULL,		-- 직책
    udate		DATE							-- 입사 날짜
);

DROP TABLE member; -- member 테이블 지우기
