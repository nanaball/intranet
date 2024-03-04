<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>changePass</title>
<style>

body {
	background-image: url("${pageContext.request.contextPath}/resources/img/bg.jpg");
	background-size:cover;
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
    <h2>비밀번호 변경</h2>
    <a>새로 사용하실 비밀번호를 입력해주세요.</a>
		<form name="rePass" method="post" action="changePass" enctype="application/x-www-form-urlencoded">
		<input type="hidden" name="uid" value="${vo.uid}" /> 
		<input type="text" placeholder="비밀번호" name="repw" id="repw" class="in"> 
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
    	 let repw = $("#repw").val();
    
    	 
    	 if(repw == ""){
    	  alert("새로운 비밀번호를 입력해주세요");
    	  $("#repw").focus(); 
    	  return;
    	}
    
    	rePass.submit(); 
    	
	});
	
});

</script>
</html>