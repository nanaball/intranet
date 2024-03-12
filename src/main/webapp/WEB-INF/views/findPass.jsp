<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>findPass</title>
<style>

body {
	background-image: url("${pageContext.request.contextPath}/resources/img/bg.jpg");
	background-size:cover;
	background-repeat: no-repeat;
/* 	background-position: center; */
}
div {
	transform: translate(-50%, -50%);
	position: absolute;
	top: 50%;
    left: 50%;
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
	/* margin-bottom: 10px; */
	margin-top: 10px;
}
#btn {
	background-color: #1BBC9B;
	margin-top: 20px;
	color: white;
}
a {
	text-decoration: none; 
	color: #1BBC9B;
	font-size: 12px;
}

h2 {
	color: #1BBC9B;
}
a {
	/* text-decoration: none;  */
	color: #1BBC9B;
	font-size: 12px;
	padding-bottom: 20px;
}

</style>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
</head>

<body>
	<div>
    <h2>비밀번호 찾기</h2>
    <a>회원가입 시 등록한 아이디,이름,이메일을 입력해주세요.</a>
		<form name="info" method="post" action="findPass" enctype="application/x-www-form-urlencoded">
		<input type="text" placeholder="아이디" name="uid" id="uid" class="in"> 
			<input type="text" placeholder="이름" name="uname"  id="uname" class="in"> 
			<input type="text" placeholder="Email" name="uemail"  id="uemail" class="in"> 
			<input type="button" id="btn" value="확인"><br/>
			<!-- <tr>
				<th>
					<input type="button" id="btn" value="확인"
					onclick="location.href='changePass.jsp'" />
				</th>
			</tr>
		</table> -->
	</form>
	</div>
</body>
<script>
$(function(){
	
	$("#btn").click(function(){
    	 let uid = $("#uid").val();
    	 let uname = $("#uname").val();
    	 let uemail = $("#uemail").val();
    	 
    	 if(uid == ""){
    	  alert("아이디를 입력하세요");
    	  $("#uid").focus(); 
    	  return;
    	}
    	if(uname == ""){
    	 alert("이름을 입력하세요"); 
    	 $("#uname").focus();
    	  return;
    	}
    	if(uemail == ""){
    		alert("이메일을 입력하세요")
    	 $("#email").focus();
    	  return;
    	}
    	
    	info.submit(); 
    	
	});
	
});

</script>
</html>