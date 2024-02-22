<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
        width:96%;
        height:600px;
        margin:0 auto;
        display:flex;
        flex-direction:column;
        justify-content:space-between;
    }
    #menus{
        display:flex;
        flex-wrap:wrap;
        justify-content:space-between;
        height:620px;
    }
    #menus div:last-child{
        width:66.5%
    }
    #menus div{
        width:33%;
        height:300px;
        border:1px solid black;
        box-sizing:border-box;
        background-size:cover;
    }
</style>
</head>
<body>
	<div class="member">
		<img src="resources/img/profile.jpg" height="100px"/><br/>
		<img src="resources/img/mail.jpg" height="30px" /><br/>
		<h3>부서명/이름</h3>
	</div>
	<div id ="wrap">
		<article>
			<div id="borders">
				<div id="border1">게시판1
				</div>
				<div id="border2">게시판2
				</div>
				<div id="border3">게시판3
				</div>
				<div id="border4">게시판4
				</div>
				<div id="border5">게시판5
				</div>
			</div>
		</article>
	</div>

4545
</body>
</html>