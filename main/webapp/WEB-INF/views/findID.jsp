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
	border:grey;
	
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
<section>
<article>
	<h1>아이디 찾기</h1>
	<form action="/findID" method="POST">

	<table>
	<tr>
		<td><label>이름</label></td><td><input type="text" name="name"></td>
	</tr>
	<tr>
		<td><label>가입할 때 사용한 이메일</label></td><td><input type="text" name="email"></td>
	</tr>
	<tr>
	</tr>
	<tr>
		<td colspan="2"><input type="submit" value="찾기"></td>
	</tr>
	</table>

	</form>

</article>
</section>
</body>
</html>