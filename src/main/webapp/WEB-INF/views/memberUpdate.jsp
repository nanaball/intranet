<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="header.jsp" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사원 정보 수정</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
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
	
	.done,.cancel{
		color: white;
		background-color: #1BBC9B;
		border : 1px;
		border-radius : 10px;
		padding : 10px;
		margin-left : 20px;
		margin-right : 20px;
	}
	
	.done:hover,.cancel:hover{
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
			<c:if test="${loginMember != null}">
			<tr>
				<td class="a">아이디</td>
				<td><input type="text" class="uid" name="uid" value="${loginMember.getUid()}" placeholder="아이디를 입력하세요." readonly="readonly"/></td>
		  	</tr>
		  	<tr>
			  	<td class="a">기존 비밀번호</td>
				<td> <input type="password" class="upw" name="upw" required placeholder="기존 비밀번호를 입력하세요."/> </td>
			 </tr>
			 <tr>
				 <td class="a">새 비밀번호</td> 
				 <td><input type="password" class="rePw" name="rePw" required placeholder="새 비밀번호를 입력하세요."/></td>
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
				</c:if>
			<tr>
				<td colspan="2">
					<div class="btn">
						<!-- onclick 뒤로가기는 나중에 바꿀 예정 -->
						<input type="button" id="done" class="done" value="사원정보 수정 확인"/>
						<input type="button" id="cancel" class="cancel" value="취소"/>
					</div>
				</td>
			</tr>
		</table>
		</form>
		
	<script>
		// 진짜 큰일났다
		// 진짜 어떡하지
   	</script>
</body>
</html>