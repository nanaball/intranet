<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
.fileDrop{
	width:100%;
	height:150px;
	border:1px solid red;
	background-color:lightgray;
	margin:auto;
}

.uploadList{
	border:1px solid skyblue;
	width:100%;
	height:250px;
}

.uploadList li{
	float:left;
	padding:20px;
	list-style:none;
	color:black;
}
</style>
</head>
<body>
<%-- <c:if test="${loginMember.writer() == '작성자'}"> --%>
	<h3>게시글 수정</h3>
		<!-- model boardVO -->
		<!-- board/modify POST -->
		<form id="modifyForm" method="POST">
			<input type="hidden" name="bno" value="${noticeVO.bno}"/>
			<table border="1">
				<tr>
					<th colspan = "2"><h1>공지글 작성</h1></th>
				</tr>
				<tr>
					<td>작성자</td>
					<td>
						<c:if test="${!empty loginMember }">
							<input type="text" name="writer" value="${loginMember.getUname()}" readonly />
						</c:if>
					</td>
				</tr>
				<tr>
					<td>카테고리</td>
					<td>
						<select name="category">
							<option value="${noticeVO.category}"></option>
							<option value="공지">공지</option>
							<option value="알림" >알림</option>
							<option value="이벤트">이벤트</option>
							<option value="당첨">당첨</option>
						</select>
					</td>
				</tr>
				<tr>
					<td>제목</td>
					<td>
						<input type="text" name="title" autofocus required style="width:100%;" value="${noticeVO.title}"/>
					</td>
				</tr>
				<tr>
					<td>내용</td>
					<td>
						<textarea name="content" required style="resize:none; width:700px; height:200px;">${noticeVO.content}</textarea>
					</td>
				</tr>
				<tr>
					<th colspan="2">
						<a href="read?bno=${noticeVO.bno}">
							<input type="button" value="이전으로" />
						</a>
						<input type="submit" id="notiSuccess" value="수정완료" />
						<input type="reset" id="notiReset" value="초기화" />
					</th>
				</tr>
			</table>