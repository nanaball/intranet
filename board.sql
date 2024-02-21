
CREATE TABLE IF NOT EXISTS notice(
	bno int PRIMARY KEY auto_increment,			-- 글번호
	title VARCHAR(200) NOT NULL,				-- 글 제목
	category VARCHAR(20) NOT NULL,				-- 공지 분류
	content TEXT null,							-- 공지 내용
	writer VARCHAR(20) NOT NULL,				-- 작성자	
	regdate TIMESTAMP NOT NULL default now(),	-- 작성시간
	viewcnt INT default 0						-- 조회수
);

CREATE TABLE IF NOT EXISTS notice_comment(
	noti_cno INT PRIMARY KEY AUTO_INCREMENT,						-- 댓글 번호
	bno INT NOT NULL,												-- 댓글이 작성된 게시글 번호
    noti_content TEXT NOT NULL,										-- 댓글내용
    author VARCHAR(50) NOT NULL,									-- 작성자
    noti_regdate TIMESTAMP NOT NULL DEFAULT now(),					-- 작성 시간
    noti_updatedate TIMESTAMP NOT NULL DEFAULT now(),				-- 수정 시간
	CONSTRAINT fk_tbl_bno FOREIGN KEY(bno) REFERENCES notice(bno),	-- 제약조건 생성
	REFERENCES notice(bno) ON DELETE CASCADE,						-- 게시글 삭제시 댓글 삭제
    INDEX(bno)														-- 인덱스 정렬. 꼭 필요한 값에만 사용할 것
);