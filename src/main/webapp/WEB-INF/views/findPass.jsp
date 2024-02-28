<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>findPass</title>
<style>

</style>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
</head>

<body>
	<form method="post" action="member/login" enctype="application/x-www-form-urlencoded">
		<table>
			<tr>
				<th colspan="2"> 
					<h1>비밀번호 찾기</h1>
				</th>
			</tr>
			<tr>
				<th colspan="2"> 
					회원가입 시 등록한 아이디와 이름을 입력해주세요.
				</th>
			</tr>
			<tr>
				<td>아아디</td>
				<td>
					<input type="text" name="id" required />
				</td>
			</tr>
			<tr>
				<td>이름</td>
				<td>
					<input type="text" name="name" required />
				</td>
			</tr>
			<tr>
				<th colspan="2">
					<input type="submit" value="확인" />
					<input type="button"
					onclick="location.href='findPass.jsp'" />
				</th>
			</tr>
		</table>
	</form>
</body>
<script>


</script>
</html>