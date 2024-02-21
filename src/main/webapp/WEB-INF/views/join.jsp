<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	h3{
		text-align:center;
	}
	
	body{
		background-image:url(resources/img/bg.jpg);
		background-repeat:no-repeat; 
		background-size:cover;
		/* background-height:100px; */
	}
	
	table{
		background-color:white;
		background-radius:30px;
		padding : 20px;
		margin : auto;
	}
	
	table td{
		padding: 10px;
		margin : 10ps;
	}
	
	table tr td input[type='text'],
	table tr td input[type='password'],
	table tr td input[type='email'],
	table tr td input[type='date'],
	table tr td select{
	outline: none;
	border: none;
	padding: 10px;
	font-size: 14px;
}
	button{
		padding : 10px;		
		margin : 10px
	}
</style>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
</head>
<body>
	<form action = "joinCheck.jsp" method="post" entype="multipart/form-data">
		<H3>회원가입</H3>
			<table align="center">
				<tr>
					<th colspan="2"><h3>회원가입</h3></th>
				</tr>
				<tr>
					<td>아이디</td>
					<td>
						<input type="text" name="id" data-msg="아이디" placeholder="아이디를 입력해주세요"/>
					</td>
				</tr>	
				<tr>
					<td>비밀번호</td>
					<td>
						<input type="password" name="pw" data-msg="비밀번호" placeholder="비밀번호를 입력해주세요" />
					</td>
				</tr>
				<tr>
					<td>이름</td>
					<td>
						<input type="text" name="name" data-msg="이름" placeholder="이름을 입력해주세요" />
					</td>
				</tr>
				<tr>
					<td>주소</td>
					<td>
						<input type="text" name="addr" data-msg="주소" placeholder="주소를 입력해주세요"/>
					</td>
				</tr>
				<tr>
					<td>전화번호</td>
					<td>
						<input type="text" name="phone" data-msg="전화번호" placeholder="전화번호를 입력해주세요"/>
					</td>
				</tr>
				<tr>
					<td>이메일</td>
					<td>
						<input type="email" name="email" data-msg="이메일" placeholder="이메일을 입력해주세요"/>
					</td>
				</tr>
				<tr>
					<td>부서</td>
					<td>
						<select name="dep" >
							<option value="choice">부서를 선택하세요</option>
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
						<select name="job">
							<option value="choice">직책을 선택하세요</option>
							<option value="worker">사원</option>
							<option value="master">팀장</option>
							<!-- 관리자 선택은 숨김 -->	
							<option hidden value="admin">관리자</option>				
						</select>
					</td>
				</tr>
				<tr>
					<td>입사일자</td>
					<td>
						<input type="date" name="date" data-msg="입사일" placeholder="입사일을 해주세요"/>
					</td>
				</tr>
				<tr>
					<th colspan="2" >
						<button>가입취소</button>
						<button>회원가입</button>
					</th>
				</tr>
			</table>
	</form>

</body>
</html>