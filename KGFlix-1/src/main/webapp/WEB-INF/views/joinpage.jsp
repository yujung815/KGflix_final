<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style>

table{
	width:60%;
	height:80%;
		
}
td{
	width: 30%;
}
</style>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<body>
<form action="/joinmember" method="post">
<table border="1">
<tr><th>KG 플릭스 회원가입</th></tr>
<tr><td><input type="text" name="pw2" placeholder="비밀번호를 확인하세요"></td>
	<td>${pwwarning}</td></tr>
<tr><td colspan="2"><input type="text" name="name" placeholder="이름"></td></tr>
<tr><td colspan="2"><input type="text" name="bday" placeholder="생년월일 예)950123"></td></tr>
<tr><td colspan="2"><input type="text" name="tel" placeholder="전화번호"></td></tr>
<tr><td><input type="text" name="id" placeholder="아이디를 입력하세요"></td>
	<td><button onclick="/checkIdExist">중복체크</button></td></tr>
<tr><td colspan="2"><input type="text" name="pw1" placeholder="비밀번호를 입력하세요"></td></tr>
<tr><td><input type="text" name="email" placeholder="이메일"></td>
	<td>${emailwarning}</td></tr>
<tr><td colspan="2"><input type="submit" value="회원가입"></td></tr>


</table>
</form>




</body>
</html>