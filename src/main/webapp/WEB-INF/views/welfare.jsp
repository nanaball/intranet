<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>   
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	h3{
		text-align: center;
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
  
	
	table tr td,
	table tr th {
		border: 1px solid #ccc;
		padding:10px;
		text-align: center;
	}
	
	.product:hover{
		cursor: pointer;
		
	}
	
	.btn{
		text-align:center;
	}
	
</style>
</head>
<body>
	<br/>
	<h3>직원복지몰</h3>
	<br/>
	
	<table>
		<tr>
			<td><a href=""><img src="resources/img/pororo.jpg" height="300px" onclick="alert('상품1 임시창')"></a></br>
				뽀로로(DB 값)<br/>
				30,000원(DB 값)</td>
			<td class="product"><img src="resources/img/pororo.jpg" height="300px" onclick="alert('상품2 임시창')"></br>
				뽀로루<br/>
				40,000원
			</td>
			<td class="product"><img src="resources/img/woman pororo.jpg" height="300px" onclick="alert('상품3 임시창')"></br>
				뽀로롱<br/>
				50,000원
			</td>
			<td class="product"><img src="resources/img/woman pororo.jpg" height="300px" onclick="alert('상품4 임시창')"></br>
				뽀로렁<br/>
				60,000워
			</td>
		</tr>
		<tr>
			<td class="product"><img src="resources/img/pororo.jpg" height="300px"></br>상품5</td>
			<td class="product"><img src="resources/img/pororo.jpg" height="300px"></br>상품6</td>
			<td class="product"><img src="resources/img/woman pororo.jpg" height="300px"></br>상품7</td>
			<td class="product"><img src="resources/img/woman pororo.jpg" height="300px"></br>상품8</td>
		</tr>
		<tr>
			<td class="product"><img src="resources/img/pororo.jpg" height="300px"></br>상품9</td>
			<td class="product"><img src="resources/img/pororo.jpg" height="300px"></br>상품10</td>
			<td class="product"><img src="resources/img/woman pororo.jpg" height="300px"></br>상품11</td>
			<td class="product"><img src="resources/img/woman pororo.jpg" height="300px"></br>상품12</td>
		</tr>
	</table>
</body>
</html>