<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style>
section{
	align:center;
	
}
h2{
	color:white;
}
table{
	width:60%;
	height:80%;
		
}
td{
	padding:3px;
	margin-left:1px;
}

.button1{
	background-color:white;
	color:black;
	text-align:center;
	display:inline-block;
	font-size:80%;
}

#pwwarn,#emailwarn{
	color:red;
}


</style>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<body>
	<header>
        <jsp:include page="common/header.jsp" flush="true"/>
    </header>
<section>
<article>
		<h2>KG 플릭스 회원가입</h2>
	<form action="/joinmember" method="post">
		<table border="1">
		<tr><td colspan="2"><input type="text" name="name" placeholder="이름" required></td></tr>
		
		<tr><td colspan="2"><input type="text" name="bday" placeholder="생년월일 예)950123" required></td></tr>
		
		<tr><td colspan="2"><input type="text" name="tel" placeholder="전화번호" required></td></tr>
		<tr><td><input type="text" name="id" placeholder="아이디를 입력하세요" required></td>
			<td><button class="button1" onclick="/checkIdExist" >중복체크</button></td></tr><!-- 중복체크를 무조건 하게 해야함 -->
		<tr><td colspan="2"><input type="text" name="pw1" placeholder="비밀번호를 입력하세요"></td></tr>
		
		<tr><td><input type="text" name="pw2" placeholder="위와 동일한 비밀번호 입력"></td>
			<td><div id="pwwarn">${pwwarning}</div></td></tr>
			
			
			
		<tr><td><input type="text" name="email" placeholder="이메일"></td>
			<td><div id="emailwarn">${emailwarning}</div></td></tr>
			
		<tr><td colspan="2"><input type="submit" value="회원가입"></td></tr>
		</table>
	</form>
</article>
</section>
</body>
</html>