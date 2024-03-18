<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false" language="java"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="UTF-8">
<title>Home</title>
<style>
body {
	background-image: url("resources/img/bg.jpg");
	background-repeat: no-repeat;
	background-position: center;
}

div {
	margin: auto;
	width: 300px;
	background-color: #EEEFF1;
	border-radius: 10px;
	text-align: center;
	padding: 30px;
	transform: translate(-50%, -50%);
	position: absolute;
	top: 50%;
    left: 50%;
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
	margin-bottom: 20px;
	color: white;
}

#btn2 {
	border: 1px solid #1BBC9B;
	color: #1BBC9B;
	margin-bottom: 10px;
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
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
</head>
<body>

	<div>
		<h2>로 그 인</h2>
		<form name="loginForm" action="member/login" method="POST">
			<input type="text" placeholder="아이디" name="uid" id="uid" class="in" autofocus> 
			<input type="password" placeholder="비밀번호" name="upw"  id="upw" class="in"> 
			<input type="button" id="btn" value="로그인"><br/>
			<input type="button" id="btn2" value="회원가입"><br>
			<a href="member/findPass">비밀번호를 잊어버리셨나요?</a>
		</form>
	</div>

	<script>
	$(function(){
		$("input").keydown(function(event){
			if(event.keyCode === 13){
				$("#btn").click();
			}
		})
	});
    $(function(){
    	
    	$("#btn").click(function(){
	    	 let uid = $("#uid").val();
	    	 let upw = $("#upw").val(); 
	    	 
	    	 if(uid == ""){
	    	  alert("아이디를 입력하세요");
	    	  $("#uid").focus(); 
	    	  return;
	    	}
	    	if(upw == ""){
	    	 alert("비밀번호를 입력하세요"); 
	    	 $("#upw").focus();
	    	  return;
	    	}
	    	
	    	loginForm.submit();
	    	
    	});
    	$("#btn2").on("click",function(){
			if(confirm("회원가입 페이지로 이동합니다.")){		
				location.href = "/intranet/member/join";
			}
	    });
	    
    });
    
    
    // 회원가입 성공시 알림 메세지
	const msg = '${message}';
	if(msg != ''){
		alert(msg);
	}
</script>
    </script>

</body>
</html>
