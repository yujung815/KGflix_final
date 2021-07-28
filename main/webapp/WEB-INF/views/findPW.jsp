<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
section{
	position: relative;
	top: 40px; left: 40px;
}
table{
	border-line:1;
}
td{
	text-align:center;
	color:white;
	font-size:13px;
}


</style>
</head>
<body>
	<header>
        <jsp:include page="common/header.jsp"/>
    </header>
<h1>비밀번호 찾기</h1>
<form action="/findPW" method="POST">
<table>
	<tr><td>이름</td><td><input type="text" name="name"></td></tr>
	<tr><td>아이디</td><td><input type="text" name="id"></td></tr>
	<tr><td>가입할 때 사용한 이메일</td><td><input type="text" name="email"></td></tr>
	<tr><td colspan="2"><input type="submit" value="찾기"></td></tr>
</table>
</form>

</body>
</html>