<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
				<th colspan="3"><h3>😪 회원 탈퇴 😥<h3></th>
			</tr>
			<tr>
				<td>아이디</td>
				<td><input type="text" id="uid" name="uid" value="${loginMember.getUid()}" placeholder="아이디를 입력해주세요" readonly required /></td>			
			</tr>
				<tr>
					<td>비밀번호</td>
					<td>
						<input type="password" id="upw" name="upw" data-msg="비밀번호" placeholder="비밀번호를 입력해주세요" required />
					</td>
				</tr>
				<tr>
					<td>이름</td>
					<td>
						<input type="text" id="uname" name="uname" value="${loginMember.getUname()}" data-msg="이름" placeholder="이름을 입력해주세요" required />
					</td>
				</tr>
				<tr>
					<td>탈퇴 사유</td>
					<td>
						<input type="text" id="reason" />
					</td>
				</tr>
				<tr>
					<th colspan="3" >
						<input type="button" id="bye" value="회원 탈퇴" />
						<input type="button" id="cancel" value="탈퇴 취소" />
					</th>
				</tr>
			</table>
	</form>

	<script>
	
	$("#bye").on("click",function() {
			
			
			if($("#upw").val().length <= 0){
				alert("비밀번호를 입력해주세요");
				$("#upw").val("");
				$("#upw").focus();
				return;
			}
			
			if($("#uname").val().length <= 0){
				alert("이름을 입력해주세요");
				$("#uname").val("");
				$("#uname").focus();
				return;
			}
			
			// 로그인한 비밀번호와 입력한 비밀번호의 일치 확인
			if($("#upw").val() !== "${loginMember.getUpw()}"){
				alert("비밀번호가 일치하지 않습니다.");
				$("#upw").val("");
				return;
			}
			
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