<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	h3 {
		text-align: center;
	}

	body {
		background-image: url(resources/img/bg.jpg);
		background-repeat: no-repeat;
		background-size: cover;
		/* background-height:100px; */
	}

	table {
		background-color: white;
		background-radius: 30px;
		padding: 20px;
		margin: auto;
		height: auto;
		border-radius:10px;
	}

	table td {
		padding: 10px;
		margin: 10px;
	}

	table tr td input[type='text'], table tr td input[type='password'],
	table tr td input[type='email'], table tr td input[type='date'], table tr td select{
		outline: none;
		border: none;
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
	
	
	
	
	
</style>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
</head>
<body>
	<form method="post" action="member/joinsuc" enctype="application/x-www-form-urlencoded">
		<H3>회원가입</H3>
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
				<td><input type="password" id="upw" name="upw" placeholder="비밀번호를 입력해주세요" required/></td>
			</tr>
			<tr>
				<td>비밀번호 확인</td>
				<td><input type="password" id="upw2" name="upw" placeholder="비밀번호를 입력해주세요" required/></td>
			</tr>
			<tr>
				<td>이름</td>
				<td><input type="text" id="uname" name="uname" placeholder="이름을 입력해주세요" required/></td>
			</tr>
			<tr>
				<td>주소</td>
				<td><input type="text" id="addr" name="uaddr" placeholder="주소를 입력해주세요" required/></td>
			</tr>
			<tr>
				<td>전화번호</td>
				<td><input type="text" id="uphone" name="uphone" placeholder="전화번호를 입력해주세요" required/></td>
			</tr>
			<tr>
				<td>이메일</td>
				<td><input type="email" id="uemail" name="uemail" placeholder="이메일을 입력해주세요" required/></td>
			</tr>
			<tr>
				<td>부서</td>
				<td>
					<select name="udep" id="udep">
						<option disabled selected hidden>부서를 선택하세요</option>
						<option value="develop">개발</option>
						<option value="plan">기획</option>
						<option value="design">디자인</option>
						<option value="marketing">마케팅</option>
						<option value="business">영업</option>
						<option value="manager">인사</option>
						<option value="affair">총무</option>
					</select>
				</td>
			</tr>
			<tr>
				<td>직책</td>
				<td>
					<select name="ujob" id="ujob">
						<option disabled selected hidden>직책을 선택하세요</option>
						<option value="사원">사원</option>
						<option value="팀장">팀장</option>
						<!-- 관리자 선택은 숨김 -->
						<option hidden value="관리자">관리자</option>
					</select>
				</td>
			</tr>
			<tr>
				<td>입사일자</td>
				<td><input type="date" id="udate" name="udate" data-msg="입사일" placeholder="입사일을 해주세요" required /></td>
			</tr>
			<tr>
				<td></td>
			</tr>
			<tr>
				<th colspan="3">
					<button id="joincan" type="button" >가입취소</button>
					<button id="joinsuc" type="submit" >회원가입</button>
				</th>
			</tr>
		</table>
	</form>

	<script>
		
		$("#joinsuc").click(function() {	
	
			// 회원가입 빈칸시 알람
			if($("#uid").val().length <= 0){
				alert("사용자아이디를 입력ㄱㄱ");
				$("#uid").val("");
				$("#uid").focus();
				return;
			}
			
			if($("#upw").val().length <= 0){
				alert("비밀번호를 입력ㄱㄱ");
				$("#upw").val("");
				$("#upw").focus();
				return;
			}
			
			if($("#upw2").val().length <= 0){
				alert("비밀번호 확인를 입력ㄱㄱ");
				$("#upw2").val("");
				$("#upw2").focus();
				return;
			}
			
			if($("#uname").val().length <= 0){
				alert("이름 입력ㄱㄱ");
				$("#uid").val("");
				$("#uid").focus();
				return;
			}
			
			if($("#uemail").val().length <= 0){
				alert("이메일 입력ㄱㄱ");
				$("#uemail").val("");
				$("#uemail").focus();
				return;
			}
			
			if($("#uphone").val().length <= 0){
				alert("휴대폰 입력ㄱㄱ");
				$("#uphone").val("");
				$("#uphone").focus();
				return;
			}
			
			if($("#udep").val().length <= 0){
				alert("부서 입력ㄱㄱ");
				$("#udep").val("");
				$("#udep").focus();
				return;
			}
			
			if($("#ujob").val().length <= 0){
				alert("직책 입력ㄱㄱ");
				$("#ujob").val("");
				$("#ujob").focus();
				return;
			}
			
			if($("#udate").val().length <= 0){
				alert("입사일 입력ㄱㄱ");
				$("#udate").val("");
				$("#udate").focus();
				return;
			}
			
			
			// 비밀번호 확인 
			if($("#upw").val() != $("#upw2").val()){
				alert("비밀번호가 일치하지 않습니다.");
				$("#upw2").focus();
				return;				
			}		
		}); // $("#joinsuc").on("click",function(){	
		

			
		// 아이디 중복 확인 
		$("#checkId").on("click",function() {
			$.ajax({
				type:"POST",
				url : "member/checkId",
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
			alert("회원가입이 취소되었습니다");
		});
	
		
	</script>

</body>
</html>