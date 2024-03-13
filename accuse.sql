CREATE TABLE IF NOT EXISTS accuse(
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
	CONSTRAINT fk_accuse_uno
	FOREIGN KEY(uno) REFERENCES member(uno),
	INDEX(origin)
);

select * from accuse;

drop table accuse;

show tables;

select * from model;

desc model;

-- 게시글 작성 했을 시 회원 탈퇴 불가로 조건 추가 

ALTER TABLE accuse
DROP FOREIGN KEY fk_accuse_uno,   -- 기존 외래 키 제약 조건 삭제
ADD CONSTRAINT fk_accuse_member
FOREIGN KEY (uno)
REFERENCES member(uno)
ON DELETE SET NULL; -- 새로운 외래 키 제약 조건 설정




ALTER TABLE free
DROP FOREIGN KEY fk_free_uno,   -- 기존 외래 키 제약 조건 삭제
ADD CONSTRAINT fk_free_member
FOREIGN KEY (uno)
REFERENCES member(uno)
ON DELETE CASCADE; -- 새로운 외래 키 제약 조건 설정
