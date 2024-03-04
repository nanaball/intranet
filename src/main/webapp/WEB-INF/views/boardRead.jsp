<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "header.jsp" %>
<html>
<head>
</head>
<body>
<!-- 반복문 처리시킬 것 -->
	<table border="1">
	<tr>
		<td>제목</td>
		<td> 
			[${read.category}] ${read.title}
		</td>
	</tr>
	<tr>
		<td>작성자</td>
		<td> 
			${read.writer}
		</td>
	</tr>
	<tr>
		<td>내용</td>
		<td style="width:300px; height:500px"> 
			${read.content}
		</td>
	</tr>

	</table>
	<div>
		<a href="modify?bno=${read.bno}">수정</a> |
		<a href="remove?bno=${read.bno}">삭제</a> |
		<a href="${path}/Board/board">목록으로</a>
	</div>
</body>
</html>