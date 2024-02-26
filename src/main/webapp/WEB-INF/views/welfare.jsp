<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	h3{
		text-align: center;
	}
	
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
	<h3>복지복지복지</h3>
	<table>
		<tr>
			<td><a href="main"><img src="resources/img/pororo.jpg" height="300px"></a></br>상품1</td>
			<td><img src="resources/img/pororo.jpg" height="300px"></br>상품2</td>
			<td><img src="resources/img/pororo.jpg" height="300px"></br>상품3</td>
			<td><img src="resources/img/pororo.jpg" height="300px"></br>상품4</td>
		</tr>
		<tr>
			<td class="product"><img src="resources/img/pororo.jpg" height="300px"></br>상품5</td>
			<td class="product"><img src="resources/img/pororo.jpg" height="300px"></br>상품6</td>
			<td class="product"><img src="resources/img/woman pororo.jpg" height="300px"></br>상품7</td>
			<td class="product"><img src="resources/img/woman pororo.jpg" height="300px"></br>상품8</td>
		</tr>
		<tr>
			<td class="product"><img src="resources/img/woman pororo.jpg" height="300px"></br>상품9</td>
			<td class="product"><img src="resources/img/woman pororo.jpg" height="300px"></br>상품10</td>
			<td class="product"><img src="resources/img/woman pororo.jpg" height="300px"></br>상품11</td>
			<td class="product"><img src="resources/img/woman pororo.jpg" height="300px"></br>상품12</td>
		</tr>
	</table>
</body>
</html>