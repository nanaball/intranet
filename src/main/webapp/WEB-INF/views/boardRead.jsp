<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "header.jsp" %>
<html>
<head>
</head>
<body>
<!-- 반복문 처리시킬 것 -->
	<div>
		<label>제목</label>
		<input type="text" name="title" value="${read.title}" readonly/>
	</div>
	<div>
		<label>내용</label>
		<textarea name="content" readonly rows=3>${read.content}</textarea>
	</div>
	<div>
		<label>작성자</label>
		<input type="text" name="writer" value="${read.writer}" readonly/>
	</div>
	<div>
		<a href="modify?bno=${read.bno}">수정</a> |
		<a href="remove?bno=${read.bno}">삭제</a> |
	</div>
</body>
</html>