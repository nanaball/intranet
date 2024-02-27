<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "header.jsp" %>
<%
	String strPageNum = request.getParameter("page");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ㅇㅇㅇ 회사 게시판</title>
<style>
	body{
		/* background-image : url("resources/img/bg.jpg"); 
		background-repeat: no-repeat;
		background-position: center; */
		height : 600px;
	}
	.member{
		border : "1";
		height : "163px";
		/* background-color : #FFFFD7; */
	}
	#wrap{
    	border:1px solid red;
        width:1450px;
        height:600px;
        margin:10px 0 10px 30px;
        display:flex;
        flex-direction:column;
        justify-content:space-between;
    }
</style>
</head>
<body>
	<div class="wrapper" style="display: flex;">
		<div class="member">
			<img src="resources/img/profile.jpg" height="100px"><br>
			<img src="resources/img/mail.jpg" height="30px"><br>
			<h3>부서명/이름</h3>
		</div>
	</div>
	<div id="wrap">
		<div id="borders">
			<h2>공지사항</h2>	
		</div>
	</div>
</body>
</html>