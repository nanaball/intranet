<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
	<meta charset="UTF-8">
	<title>Home</title>
	<style>
		body{
			background-image : url("resources/img/bg.jpg"); 
			background-repeat: no-repeat;
			background-position: center;
		}
		div{
			margin: auto;
            width: 300px;
            background-color: #EEEFF1;
            border-radius: 10px;
            text-align: center;
            padding: 30px;
		}
		input {
            width: 100%;
            padding: 10px;
            box-sizing: border-box;
            border-radius: 7px;
            border: none;
        }
        .in {
            margin-bottom: 10px;
        }

        #btn {
            background-color: #1BBC9B;
            margin-bottom: 30px;
            color: white;
        }
        
        
        #btn2 {
            border :1px solid  #1BBC9B;
            color:  #1BBC9B;
        }
       
	    a {
            text-decoration: none;
            color: #1BBC9B;
            font-size: 12px;
        }
        h2 {
        	color: #1BBC9B;
        }

	</style>
</head>
<body>
	
	
	 <div>
	 	<h2>로 그 인</h2>
        <form action="">
            <input type="text" placeholder="아이디" class="in" >
            <input type="password" placeholder="비밀번호" class="in">
            <input type="submit" id="btn" value="로그인"><br>
            <input type="submit" id="btn2" value="회원가입"><br>
        </form>
 
        <a href="location.href='findPass.jsp';" >비밀번호를 잊어버리셨나요?</a>
    </div>

	
	
</body>
</html>
