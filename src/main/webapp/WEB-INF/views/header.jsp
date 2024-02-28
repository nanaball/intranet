<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.bitc.intranet.vo.MemberVO, java.sql.*" %>
<c:set var="path" value="${pageContext.request.contextPath}" scope="page" />
<%
	MemberVO loginMember = (MemberVO)session.getAttribute("login");
	Cookie[] cookies = request.getCookies();
	if(loginMember == null && cookies != null){
		
	}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Main</title>
<style>
	* {
		padding: 0;
		margin: 0;
	}
	
	body {
		width: auto;
		margin: auto;
	}
	
	header {
		background-color:#1BBC9B;
		height: 100px;
		border-bottom: 1px solid #ccc;
		display:flex;
		font-size:18px;
		align-items:center;
		justify-content: space-between;
	}
	
	header div {
		overflow: hidden;
		
	}
	
	ul {
		list-style: none;
		float: right;
		height: 50px;
		line-height: 50px;
		margin-left : 40px;
		margin-right : 30px;
	}
	
	ul li {
		float: left;
		padding: 10px;
		padding-top: 15px;
	}
	
	ul li a {
		text-decoration: none;
		color:white;	
		font-weight:500;	
	}
	
	ul li a:hover {
		color: #ccc;
		cursor: pointer;
	}
	

</style>

</head>
<body>
	<header>
		<div>
			<ul>
				<li><a href="${path}/intranet/main">회사명</a>
				<li><a href="${path}/intranet/Board">공지사항</a>
				<li><a href="${path}/intranet/">결재</a>
				<li><a href="${path}/intranet/">자유게시판</a>
				<li><a href="${path}/intranet/welfare">직원복지몰</a>
			</ul>
		</div>
		<div>
			<ul>
				<li><a href="${path}/intranet/memberUpdate">회원정보수정</a>
				<li><a href="">로그아웃</a>	
			</ul>
		</div>
		
	</header>
</body>