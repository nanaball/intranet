<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	/* 
	body{
		height : auto;
	}
	 */
	 
	 /* 회원 프로필 */
	.member{
		border : "1";
		padding-left:25px;
		height : "163px";
	}
	
	/* 게시판 모음 */
	#wrap{
    	border:1px solid red;
        width:1730px;
        height:800px;
        margin:10px 0 10px 30px;
        display:flex;
        flex-direction:column;
        justify-content:space-between;
    }
    
    /* 
    각자 게시판들 모음 
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
    */
    
    #borders{
        display:flex;
        flex-wrap:wrap;
        justify-content:space-between;
        height:620px;
    }
    
    #border1{
    	border:1px solid black;
    	height : 150px;
    	width : 300px:
    }
    
     #border2{
    	border:1px solid black;
    	height : 150px;
    	width : 300px:
    }
    
     #border3{
    	border:1px solid black;
    	height : 150px;
    	width : 300px:
    }
    
     #border4{
    	border:1px solid black;
    	height : 150px;
    	width : 300px:
    }
</style>
</head>
<body>
	<div class="wrapper" style="display: flex;">
		<div class="member">
			<img src="resources/img/profile.jpg" height="100px"><br>
			<img src="resources/img/mail.jpg" height="30px"><br>
			<h5> \${udep}/\${uname}</h5>
		</div>
		<div id="wrap">
			<div id="borders">
				<div id="border1" >게시판1</div>
				<div id="border2">게시판2</div>
				<div id="border3">게시판3</div>
				<div id="border4">게시판4</div>
				<div id="border5">게시판5</div>
			</div>
		</div>
	</div>
</body>
</html>