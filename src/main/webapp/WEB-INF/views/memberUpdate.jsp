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
	<form name="memberUpdate" method="post" action="memberUpdate" enctype="application/x-www-form-urlencoded">
	<br/><br/><br/>
		<table align="center">
			<tr>
				<th colspan="3"><h3>👨 회원 정보 수정 👩<h3></th>
			</tr>
			<tr>
				<td>아이디</td>
				<td><input type="text" id="uid" name="uid" value="${loginMember.getUid()}" placeholder="아이디를 입력해주세요" readonly required /></td>			
			</tr>
				<tr>
					<td>기존 비밀번호</td>
					<td>
						<input type="password" id="upw" name="upw" data-msg="비밀번호" placeholder="비밀번호를 입력해주세요" required />
					</td>
				</tr>
				<tr>
					<td>새 비밀번호</td>
					<td>
						<input type="password" id="newUpw" name="newUpw" data-msg="비밀번호" placeholder="비밀번호를 입력해주세요"  />
					</td>
				</tr>
				<tr>
					<td>이름</td>
					<td>
						<input type="text" id="uname" name="uname" value="${loginMember.getUname()}" data-msg="이름" placeholder="이름을 입력해주세요" />
					</td>
				</tr>
				<tr>
					<td>주소</td>
					<td>
						<input type="text" id="uaddr" name="uaddr" value="${loginMember.getUaddr()}" data-msg="주소" placeholder="주소를 입력해주세요"/>
					</td>
				</tr>
				<tr>
				
					<td>전화번호</td>
					<td>
						<input type="text" id="uphone" name="uphone" value="${loginMember.getUphone()}" data-msg="전화번호" placeholder="전화번호를 입력해주세요"/>
					</td>
				</tr>
				<tr>
					<td>이메일</td>
					<td>
						<input type="email" id="uemail" name="uemail" value="${loginMember.getUemail()}" data-msg="이메일" placeholder="이메일을 입력해주세요"/>
					</td>
				</tr>
				<tr>
					<th colspan="3" >
						<input type="button" id="done" value="수정 완료" />
						<input type="button" id="cancel" value="수정 취소" />
						<input type="button" id="bye" value="회원 탈퇴" />
					</th>
				</tr>
			</table>
	</form>

	<script>
	
	$("#done").on("click",function() {
			
			// 회원가입 빈칸시 알람
			if($("#uid").val().length <= 0){
				alert("사용자아이디를 입력해주세요");
				$("#uid").val("");
				$("#uid").focus();
				return ;
			}
			
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
			
			if($("#uemail").val().length <= 0){
				alert("이메일을 입력해주세요");
				$("#uemail").val("");
				$("#uemail").focus();
				return;
			}
			
			if($("#uphone").val().length <= 0){
				alert("휴대폰 번호를 입력해주세요");
				$("#uphone").val("");
				$("#uphone").focus();
				return;
			}
			
			// 비밀번호 중복 확인 
			if($("#upw").val() == $("#newUpw").val()){
				alert("새 비밀번호가 기존 비밀번호와 일치합니다.");
				$("#newUpw").focus();
				return;				
			}		
			
			// 로그인한 비밀번호와 입력한 비밀번호의 일치 확인
			if($("#upw").val() !== "${loginMember.getUpw()}"){
				alert("기존 비밀번호가 일치하지 않습니다.");
				$("#upw").val("");
				$("#newUpw").val("");
				return;
			}
			
			memberUpdate.submit();
			
			alert("정보가 수정되었습니다.");
			location.href = "${pageContext.request.contextPath}/main";
			
		}); 
		
		// 수정 취소 버튼 		
		$("#cancel").on("click",function(){
			var result = confirm('회원 수정을 취소하시겠습니까?');
			
			if(result){
				location.href = "${pageContext.request.contextPath}/main";
			}
			
		});
		
		// 회원 탈퇴 버튼 		
		$("#bye").on("click",function(){
			
			location.href = "${pageContext.request.contextPath}/memberDelete";
			
			/*
			var result = confirm('정말 회원을 탈퇴하시겠습니까?');	
			
			if(result){
				alert("탈퇴 되었습니다.");			
				location.href = "${pageContext.request.contextPath}";
			}
			*/
			
		});
		
		
		
		
	</script>

</body>
</html>