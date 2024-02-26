<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Main</title>
<style>
	* {
		padding: 0;
		margin: 0;
	}
	
	body {
		width: 1600px;
		margin: auto;
	}
	
	header {
		height: 100px;
		border-bottom: 1px solid #ccc;
		display:flex;
		align-items:center;
		justify-content: space-between;
	}
	
	header div {
		overflow: hidden;
	}
	
	ul {
		list-style: none;
		float: right;
		height: 50px;
		line-height: 50px;
	}
	
	ul li {
		float: left;
		padding: 10px;
		padding-top: 0px;
	}
	
	ul li a {
		text-decoration: none;
		color: #000;
	}
	
	ul li a:hover {
		color: #ccc;
		cursor: pointer;
	}
</style>

</head>
<body>
	<header>
		<div>
			<ul>
				
				<li><a href="main">회사명</a>
				
				<li><a href="">공지사항</a>
				<li><a href="">결재</a>
				<li><a href="">자유게시판</a>
				<li><a href="welfare">직원복지몰</a>
			</ul>
		</div>
	</header>
</body>