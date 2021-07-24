<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style>

h2{
	
	text-align:center;	
	color:white;
	style:bold;
}

div{
	
	padding-top:5%;
	padding-bottom:5%;
	
}
 table{
 	text-align:center;
	margin-left:20%;
	width:60%;
	height:75%;
}
tr{
	width:100%;
	height:100%;
	color:white;
}
td{
	padding:5px;
	
}
a{
	color:red;
}
input{
	padding :auto;
}

</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<header>
        <jsp:include page="common/header.jsp"/>
    </header>
    <section>
    <article>
			<h2>KG플릭스 로그인</h2>
    <div class="container">
	<form action="/login" method="post">
		<table border="1">
			<tr><td><input type="text" name="id" placeholder="아이디를 입력하세요" required></td>
					<td></td></tr>
			<tr><td><input type="password" name="pw" placeholder="비밀번호를 입력하세요" required ></td>
					<td><input type="submit" value="로그인"></td></tr>
		</table>
	</form>
		<table>
			<tr><td><font color="yellow">${loginfail}</font></td></tr>
			<tr><td>아직 KG플릭스 가족이 아니신가요?<a href="/joinpage">회원가입하기</a></td></tr>
			<tr><td><a href="/findID">아이디 찾기</a>|<a href="/findPW">비밀번호 찾기</a></td></tr>
		</table>
	</div>
	 </article>
    </section>
</body>
</html>