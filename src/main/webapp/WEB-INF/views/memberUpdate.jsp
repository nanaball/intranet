<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보 수정</title>
<link href="resources/css/css.css" rel="stylesheet"/>
<style>
	

	table{
		background-color: white;
	  	border-collapse: collapse;
	  	border-radius: 10px;
	  	border-style: hidden;
	  	box-shadow: 0 0 0 1px #000;
	}
  
	th,td{
		padding:10px;
	}
	
	.done,.cancel{
		background-color: #1BBC9B;
		border : 1px;
		border-radius : 10px;
		padding : 10px;
		margin-left : 20px;
		margin-right : 20px;
	}
	
	.done:hover,.cancel:hover{
	  	animation-name: fadeIn;
	    animation-duration: 0.4s;
	    color: white;
	    background-color : gray;
	    cursor: pointer;
	}
	
	body{
		background-image:url(resources/img/bg.jpg);
	}
</style>
</head>
<body>
		<form method="POST" name="edit">
		<table class="memberUpdate">
			<tr>
				<td colspan="2">사원 정보 수정</td>
			</tr>
			<tr>
				<td>아이디</td>
				<td><input type="text" name="uid" value="DB에서 데이터 불러올 값" readonly="readonly"/></td>
		  	</tr>
		  	<tr>
			  	<td>기존 비밀번호</td>
				<td> <input type="password" name="password" required placeholder="기존 비밀번호를 입력하세요."/> </td>
			 </tr>
			 <tr>
				 <td>새 비밀번호</td> 
				 <td><input type="password" name="newPassword" required placeholder="새 비밀번호를 입력하세요."/></td>
		 	</tr>
		 	<tr>
				<td>이름</td>
				<td><input type="text" name="uname" value="DB에서 데이터 불러올 값" required placeholder="이름을 입력하세요."/></td>
			</tr>
			<tr>
				<td>이메일</td>
				<td><input type="text" name="uemail" value="DB에서 데이터 불러올 값" required placeholder="이메일을 입력하세요."/></td>
			</tr>
			<tr>
				<td>전화번호</td>
				<td><input type="text" name="uphone" value="DB에서 데이터 불러올 값" required placeholder="전화번호를 입력하세요."/></td>
			</tr>
			<tr>
				<td colspan="2">
				<input type="button" class="done" value="사원정보 수정 완료"/>
				<input type="button" class="cancel" value="취소"/>
				</td>
			</tr>
			
		</table>
		</form>
</body>
</html>