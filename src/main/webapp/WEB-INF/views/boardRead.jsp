<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "header.jsp" %>
<html>
<head>
</head>
<body>
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
</body>
</html>