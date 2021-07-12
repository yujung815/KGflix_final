<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<header>
        <jsp:include page="common/header.jsp"/>
    </header>
<section>
<article>
	<h1>아이디 찾기</h1>
	<form action="/" method="POST">
	<table>
		<tr><td>이름</td><td><input type="text" name="irum"></td></tr>
		<tr><td>가입할 때 사용한 이메일</td><td><input type="text" name="email"></td></tr>
		<tr><td><input type="text" value="찾기"></td></tr>


	</table>
	</form>

</article>
</section>
</body>
</html>