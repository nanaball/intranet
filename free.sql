
CREATE TABLE IF NOT EXISTS free(
	bno int PRIMARY KEY auto_increment,			-- 글번호
	title VARCHAR(200) NOT NULL,				-- 글 제목
	category VARCHAR(20) NOT NULL,				-- 공지 분류
	content TEXT null,							-- 공지 내용
	writer VARCHAR(20) NOT NULL,				-- 작성자	
	regdate TIMESTAMP NOT NULL default now(),	-- 작성시간
	viewcnt INT default 0						-- 조회수
);

CREATE TABLE re_free(
	bno INT PRIMARY KEY auto_increment,		-- 게시글 번호
	title VARCHAR(300) NOT NULL,			-- 게시글 제목
	content TEXT NOT NULL,					-- 게시글 내용
	writer VARCHAR(50) NOT NULL, 			-- 작성자 이름 - 표시용
	origin INT NULL DEFAULT 0, 				-- 원본글 번호
	depth INT NULL DEFAULT 0,				-- view 출력용
	seq INT NULL DEFAULT 0, 				-- 그룹 정렬 번호 
	regdate TIMESTAMP NULL DEFAULT now(), 	-- 게시글 작성 시간
	updatedate TIMESTAMP NULL DEFAULT now(), -- 게시글 수정 시간
	viewcnt INT NULL DEFAULT 0, 			-- 조회수
	showboard VARCHAR(10) NULL DEFAULT 'y', -- 삭제 요청 여부
	uno INT NOT NULL, 						-- 게시글 작성자 회원 번호
	CONSTRAINT fk_re_tbl_uno
	FOREIGN KEY(uno) REFERENCES tbl_user(uno),
	INDEX(origin)
);


drop table free_comment;

select * from free;

select * from free_comment;