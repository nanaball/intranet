<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	h3{
		text-align:center;
		color: #1BBC9B;

	}
	
	body{
		background-image:url(${pageContext.request.contextPath}/resources/img/bg.jpg);
		background-repeat:no-repeat; 
		background-size:cover;
		/* background-height:100px; */
	}
	
	table{
		background-color:#EEEFF1;
		background-radius:30px;
		padding : 20px;
		margin : auto;
		height:auto;
		border-radius:10px;
		transform: translate(-50%, -50%);
	position: absolute;
	top: 50%;
    left: 50%;
		
	}
	
	table td{
		padding: 10px;
		margin : 10px;
	}
	
	table tr td input[type='text'],
	table tr td input[type='password'],
	table tr td input[type='email'],
	table tr td input[type='date'],
	table tr td select{
	outline: none;
	border: none;
	border-radius: 10px;
	padding: 10px;
	font-size: 14px;
}
	button {
		padding: 5px;
		margin: 5px
}
	div{
		font-size:11px;
		color:red;
		margin:0;
		padding:0;
}

#joinsuc {
	background-color: #1BBC9B;
	margin-bottom: 10px;
	color: white;
	border: none;
	border-radius: 7px;
}

#joincan {
	border: 1px solid #1BBC9B;
	color: #1BBC9B;
	margin-bottom: 10px;
	border-radius: 7px;
}



#checkId {
	background-color: #1BBC9B;
	margin-bottom: 10px;
	color: white;
	border: none;
	border-radius: 7px;
}

td{
	color:#1BBC9B;
	font-weight:bold;
}


</style>
 
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
</head>
<body>
	<form method="post" action="joinsuc" enctype="application/x-www-form-urlencoded">
		<table align="center">
			<tr>
				<th colspan="3"><h3>회원가입</h3></th>
			</tr>
			<tr>
				<td>아이디</td>
				<td><input type="text" id="uid" name="uid"placeholder="아이디를 입력해주세요" required /></td>			
				<td><button type="button" id="checkId">중복 확인</button></td>
			</tr>
			<tr>
				<td></td>
				<td><div id="result"></div></td>
			</tr>
				<tr>
					<td>비밀번호</td>
					<td>
						<input type="password" name="upw" placeholder="비밀번호를 입력해주세요" required/>
					</td>
				</tr>
				<tr>
					<td>비밀번호 확인</td>
					<td>
						<input type="password" name="upw2" placeholder="비밀번호를 입력해주세요" required/>
					</td>
				</tr>
				<tr>
					<td>이름</td>
					<td>
						<input type="text" name="uname" placeholder="이름을 입력해주세요" required/>
					</td>
				</tr>
				<tr>
					<td>주소</td>
					<td>
						<input type="text" name="uaddr" placeholder="주소를 입력해주세요" required/>
					</td>
				</tr>
				<tr>
				
					<td>전화번호</td>
					<td>
						<input type="text" name="uphone"  placeholder="전화번호를 입력해주세요" required/>
					</td>
				</tr>
				<tr>
					<td>이메일</td>
					<td>
						<input type="email" name="uemail" placeholder="이메일을 입력해주세요" required/>
					</td>
				</tr>
				<tr>
					<td>부서</td>
					<td>
						<select name="udep" >
							<option disabled selected hidden required>부서를 선택하세요</option>
							<option value="개발">개발</option>
							<option value="기획">기획</option>
							<option value="디자인">디자인</option>
							<option value="마케팅">마케팅</option>
							<option value="영업">영업</option>
							<option value="인사">인사</option>
							<option value="총무">총무</option>						
						</select>
					</td>
				</tr>
				<tr>
					<td>직책</td>
					<td>
						<select name="ujob">
							<option disabled selected hidden required>직책을 선택하세요</option>
							<option value="사원">사원</option>
							<option value="팀장">팀장</option>
							<!-- 관리자 선택은 숨김 -->	
							<option hidden value="관리자">관리자</option>				
						</select>
					</td>
				</tr>
				<tr>
					<td>입사일자</td>
					<td>
						<input type="date" name="udate" data-msg="입사일" placeholder="입사일을 해주세요"/>
					</td>
				</tr>
				<tr>
					<th colspan="3" >
						<button id="joincan" type="button" >가입취소</button>
						<button id="joinsuc" type="submit" >회원가입</button>
					</th>
				</tr>
			</table>
	</form>

	<script>
	$(document).ready(function() {	
		$("#joinsuc").click(function() {	
	
			// 회원가입 빈칸시 알람
			if($("#uid").val().length <= 0){
				alert("사용자아이디를 입력해주세요");
				$("#uid").val("");
				$("#uid").focus();
				return false;
			}
			
			if($("#upw").val().length <= 0){
				alert("비밀번호를 입력해주세요");
				$("#upw").val("");
				$("#upw").focus();
				return false;
			}
			
			if($("#upw2").val().length <= 0){
				alert("비밀번호를 재입력해주세요");
				$("#upw2").val("");
				$("#upw2").focus();
				return false;
			}
			
			if($("#uname").val().length <= 0){
				alert("이름을 입력해주세요");
				$("#uid").val("");
				$("#uid").focus();
				return false;
			}
			
			if($("#uemail").val().length <= 0){
				alert("이메일을 입력해주세요");
				$("#uemail").val("");
				$("#uemail").focus();
				return false;
			}
			
			if($("#uphone").val().length <= 0){
				alert("휴대폰 번호를 입력해주세요");
				$("#uphone").val("");
				$("#uphone").focus();
				return false;
			}
			
			if($("#udep").val().length <= 0){
				alert("해당부서를 입력해주세요");
				$("#udep").val("");
				$("#udep").focus();
				return false;
			}
			
			if($("#ujob").val().length <= 0){
				alert("직책을 입력해주세요");
				$("#ujob").val("");
				$("#ujob").focus();
				return false;
			}
			
			if($("#udate").val().length <= 0){
				alert("입사일을 입력해주세요");
				$("#udate").val("");
				$("#udate").focus();
				return false;
			}
			
			
			// 비밀번호 확인 
			if($("#upw").val() != $("#upw2").val()){
				alert("비밀번호가 일치하지 않습니다.");
				$("#upw2").focus();
				return false;			
			}		
		}); // $("#joinsuc").on("click",function(){	
		

			
		// 아이디 중복 확인 
		$("#checkId").on("click",function() {
			$.ajax({
				type:"POST",
				url : "checkId",
				data:{
					uid : $("#uid").val()
				},
				dataType:"text",
				success: function(res){
					console.log(res)
					
					if (res === "duplicate") {
                      $("#result").text("이미 사용 중인 아이디입니다.");
                  } else {
                      $("#result").text("사용할 수 있는 아이디입니다.")
					}
				},
				error : function(res){
					console.log(res);
				}
			});	// $.ajax({
		});	// $("#checkId").click(function() {
	
			
			
		// 가입취소 버튼 		
		$("#joincan").on("click",function(){
			if(confirm("회원가입을 취소하시겠습니까"));{		
				location.href = "${pageContext.request.contextPath}";
			}	
		});
	});
	</script>

</body>
</html>