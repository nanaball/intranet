create database intranet;


-- 공문 db
CREATE TABLE IF NOT EXISTS official(
	ono	INT	PRIMARY KEY  AUTO_INCREMENT,			-- 공문번호
	dep	VARCHAR(20) NOT NULL,						-- 부서
	job	VARCHAR(20) NOT NULL,						-- 직책
	title	VARCHAR(50) NOT NULL, 					-- 공문제목
	content TEXT NOT NULL, 							-- 공문내용
	writer  VARCHAR(20) NOT NULL, 					-- 작성자
	approve	VARCHAR(20) NOT NULL,					-- 결재/승인 여부 
	date datestamp not null DEFAULT now(),			-- 작성시간
	FOREIGN KEY (id) REFERENCES members(id)
);


