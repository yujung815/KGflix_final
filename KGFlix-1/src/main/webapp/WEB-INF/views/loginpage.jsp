<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style>
table{
	border:none;
	align:center;
}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="/login" method="post">
<table>
<tr><th>KG 플릭스 로그인</th></tr>
<tr><td><input type="text" name="id" placeholder="아이디를 입력하세요"></td></tr>
<tr><td><input type="text" name="pw" placeholder="비밀번호를 입력하세요"></td></tr>
<tr><td><input type="submit" value="로그인"></td></tr>
<tr><td>아직 KG플릭스 가족이 아니신가요?<a href="/joinpage">회원가입하기</a></td></tr>
<tr><td><a href="/findID">아이디 찾기</a>|<a href="/findPW">비밀번호 찾기</a></td></tr>
</table></form>
</body>
</html>