<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/main.css" />
<link rel="stylesheet" href="css/login.css" />

</head>
<body>
<header>
	<jsp:include page="common/header.jsp"/>
</header>
<section>
	<br /><br /><br /><br /><br /><br /><br />
	<div align=center id="title">비밀번호 찾기</div>
	<br /><br />
	<form action="/getPW" method="POST">
		<table align=center>
			<tr>
				<td id="font1">이름</td>
				<td id="pd"><input type="text" name="irum" placeholder="아이디를 입력하세요" required id="box"></td>
			</tr>
			<tr>
				<td id="font1">아이디</td>
				<td id="pd"><input type="text" name="id" placeholder="비밀번호를 입력하세요" required id="box"></td>
			</tr>
			<tr>
				<td id="font1">이메일</td>
				<td id="pd"><input type="text" name="email" placeholder="이메일을 입력하세요" required id="box"></td>
			</tr>
			<tr><td colspan=2 style="text-align: center;">
				<br /><input type="submit" value="찾기" id="btn1">
			</td></tr>
		</table>
	</form>
</section>

</body>
</html>