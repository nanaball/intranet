<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="header.jsp" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사원 정보 수정</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<style>
	
	body{
		background-image : url("resources/img/bg.jpg"); 
		background-repeat: no-repeat;
	}
	
	table{
		margin : auto;
		padding : auto;
		background-color: white;
	  	border-collapse: collapse;
	  	border-radius: 10px;
	  	border-style: hidden;
	  	box-shadow: 0 0 0 1px #000;
	  	text-align: center;
	}
  
	table td{
		text-align:center;
		padding:10px;
	}
	
	input[type='button']{
		color: white;
		background-color: #1BBC9B;
		border : 1px;
		border-radius : 10px;
		padding : 10px;
		margin-left : 20px;
		margin-right : 20px;
	}
	
	input[type='button']:hover{
	    color: black;
	    cursor: pointer;
	}
	
	table tr {
		height: 50px;
	}
	
	table tr td,
	table tr th {
		border: 1px solid #ccc;
		text-align: center;
	}
	
	table tr .a:first-child{
		padding:10px;
	}
	
	table tr td input[type='text'],
	table tr td input[type='password'],
	table tr td input[type='number'] {
		width: 200px;
		outline: none;
		border: none;
		padding: 10px;
		font-size: 15px;
	}
	
	.btn{
		text-align:center;
	}
	
</style>
</head>
<body>
		<form method="POST" name="edit">
		<table class="memberUpdate">
		<br/><br/>
			<tr>
				<td colspan="2">🙍‍♂️ 사원 정보 수정 </td>
			</tr>
			<tr>
				<td class="a">아이디</td>
				<td><input type="text" id="uid" name="uid" value="${loginMember.getUid()}" placeholder="아이디를 입력하세요." readonly="readonly"/></td>
		  	</tr>
		  	<tr>
			  	<td class="a">기존 비밀번호</td>
				<td> <input type="password" id="upw" name="upw" value="" required placeholder="기존 비밀번호를 입력하세요."/> </td>
			 </tr>
			 <tr>
				 <td class="a">새 비밀번호</td> 
				 <td><input type="password" class="rePw" name="rePw" value="" required placeholder="새 비밀번호를 입력하세요."/></td>
		 	</tr>
		 	<tr>
				<td class="a">이름</td>
				<td><input type="text" class="uname" name="uname" value="${loginMember.getUname()}" required placeholder="이름을 입력하세요."/></td>
			</tr>
			<tr>
				<td class="a">이메일</td>
				<td><input type="text" class="uemail" name="uemail" value="${loginMember.getUemail()}" required placeholder="이메일을 입력하세요."/></td>
			</tr>
			<tr>
				<td class="a">전화번호</td>
				<td><input type="text" class="uphone"  name="uphone" value="${loginMember.getUphone()}" required placeholder="전화번호를 입력하세요."/></td>
			</tr>
			<tr>
				<td colspan="2">
					<div class="btn">
						<!-- onclick 뒤로가기는 나중에 바꿀 예정 -->
						<input type="button" id="done" class="done1" value="사원정보 수정 확인"/>
						<input type="button" id="cancel" class="cancel1" value="취소"/>
					</div>
				</td>
			</tr>
		</table>
		</form>
		
	<script>
		// 진짜 큰일났다
		// 진짜 어떡하지
		
	$(function(){
    	
    	$("#done").click(function(){
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
	    	
   	</script>
</body>
</html>