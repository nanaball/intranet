<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.bitc.intranet.vo.MemberVO, java.sql.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${pageContext.request.contextPath}" scope="page" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Main</title>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<style>

	* {
		padding: 0;
		margin: 0;
	}
	
	/* 회원 프로필 */
	.selfinfo{
		border : 1px black;
		margin-top:15px;
		padding-left:100px;
		height : 200px;
		width: 200px;	
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
		font-size:15px;
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
		color: white;
		cursor: pointer;
		font-weight:bolder;	
		/* font-style:italic; */
		text-decoration: underline;
	}

</style>

</head>
<body>
	<header>
		<div>
			<ul>
				<li><a href="${path}/main">회사명</a></li>	
				<li> </li>	
				<li> </li>				

				<li><a href="${path}/Board/board">공지사항</a></li>
				<li><a href="${path}/messages/message">결재</a></li>
				<li><a href="${path}/free/free">자유게시판</a></li>
				<li><a href="${path}/accuse/accuse">사내고발</a></li>
				<li><a href="${path}/Welfare/welfare">직원복지몰</a></li>
			</ul>
		</div>	
		<div>
		
			<ul>
				<li><a href="${path}/memberUpdate">회원정보관리</a></li>
				<li onclick="confirm('로그아웃 하시겠습니까')"><a href="${path}" >로그아웃</a>	</li>
			</ul>
		</div>		
	</header>
	<div class="wrapper" style="display: flex;">
		<div class="selfinfo">
			<img src="${path}/resources/img/profile.jpg" height="100px"><br/>
			<img src="${path}/resources/img/mail.jpg" height="30px"><br/>
				<!-- 부서 이름 / 사원명 -->
				<c:if test="${not empty loginMember}">					
  		  			<h5>${loginMember.getUdep()} / ${loginMember.getUname()}</h5>
				</c:if>
				<c:if test="${empty loginMember}">
					없음 
				</c:if>		
		</div>