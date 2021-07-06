<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>비밀번호 찾기</h1>
<form action="/getPW" method="POST">
<table>
<tr><td>이름</td><td><input type="text" name="irum"></td></tr>
<tr><td>아이디</td><td><input type="text" name="id"></td></tr>
<tr><td>가입할 때 사용한 이메일</td><td><input type="text" name="email"></td></tr>
<tr><td><input type="submit" value="찾기"></td></tr>
</table></form>

</body>
</html>