<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html> 
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#logo {
	color: yellow;
	font-size: 40px;
	text-align: left;
	text-decoration: none;
}

#userInfo{
	text-align: right;
	color: white;
}

#button1{
	background-color: red;
	font-size: 40px;
}

body {
	background-color: black;
	color: yellow;
	font-size: 40px;
}
</style>
</head>
<link rel="stylesheet" href="css/ad_header.css" />
<body>
	<table align=center>
		<tr>
			<th style="width: 1000px;">
				<div id="logo">
					<a href="/" id="logo">KG플릭스</a>
				</div>
			</th>
			<th style="width: 500px">
				<div id="userInfo">관리자님 반갑습니다</div>
			</th>
		</tr>
		<tr align=right>
			
			<th colspan="2" align=right><button oneclick="#" id="button1">로그아웃</button></th>
			
		</tr>
	</table>

</body>
</html>