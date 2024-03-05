<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>

<div>
	<br />
	<h1>자유게시판</h1>
	<br />
	<hr />
	<br /> 
	<br />
	<!-- 반복문 처리시킬 것 -->
	<table border="1">
		<tr>
			<td>제목</td>
			<td>${read.title}</td>
		</tr>
		<tr>
			<td>카테고리</td>
			<td>${read.category}</td>
		</tr>
		<tr>
			<td>작성자</td>
			<td>${read.writer}</td>
		</tr>
		<tr>
			<td>작성시간</td>
			<td>
				<f:formatDate value="${read.regdate}" pattern="yyyy-MM-dd HH:mm" />
			</td>
		</tr>
		<tr>
			<td >내용 </td>
			<td style="resize:none; width:800px; height:200px;">${read.content}</td>
			
		</tr>
		<tr>
			<td colspan="2" align="center">
				<a href="remove?bno=${read.bno}">삭제</a> | 
				<a href="modify?bno=${read.bno}">수정</a> | 
				<a href="${path}/free/free">목록으로</a>
			</td>
		</tr>
	</table>