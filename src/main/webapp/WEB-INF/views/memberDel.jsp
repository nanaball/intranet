<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file = "header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
/*
	body{
		background-image : url("resources/img/bg.jpg"); 
		background-repeat: no-repeat;
	}
*/
	
	table{
		margin : auto;
		padding : auto;
		background-color: white;
	  	border-collapse: collapse;
	  	border-radius: 10px;
	  	border-style: hidden;
	  	box-shadow: 0 0 0 1px #000;
	  	text-align: center;
	  	transform: translate(-50%, -50%);
		position: absolute;
		top: 50%;
  		 left: 50%;
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
		width : 80px;
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
	table tr td input[type='number'],
	table tr td input[type='email'] {
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
 
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
</head>
<body>
	<form method="post" action="joinsuc" enctype="application/x-www-form-urlencoded">
	<br/><br/><br/>
		<table align="center">
			<tr>
				<th colspan="3"><h3>😪 회원 등록 삭제 😥<h3></th>
			</tr>
			<tr>
				<td>아이디</td>
				<td><input type="text" id="uid" name="uid" value="${Member.uid}"  readonly required /></td>			
			</tr>
			<tr>
				<td>이름</td>
				<td>
					<input type="text" id="uname" name="uname" value="${Member.uname}" readonly />
				</td>
			</tr>
			<tr>
				<th colspan="3" >
					<input type="button" id="cancel" value="탈퇴 취소" />
					<input type="button" id="bye" value="회원 탈퇴" />
				</th>
			</tr>
		</table>
	</form>
	<form id="readForm">
 		<input type="hidden" name="uno" value="${Member.uno}"/>
 	</form>	

	<script>
	
	$("#bye").on("click",function() {
					
		var result = confirm('정말 회원을 탈퇴하시겠습니까?');	
			
		if(result){
			alert("탈퇴 되었습니다.");			
			location.href = "${pageContext.request.contextPath}";
		}			
	}); 
		
	// 수정 취소 버튼 		
	$("#cancel").on("click",function(){
		var result = confirm('탈퇴를 취소하시겠습니까?');
			
		if(result){
			location.href = "${pageContext.request.contextPath}/main";
		}			
	});		
	</script>

</body>
</html>