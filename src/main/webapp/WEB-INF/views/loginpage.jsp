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
    <article>
    	<br /><br /><br /><br /><br /><br /><br />
		<div id="title" align=center>KGFlix 로그인</div>
		<br /><br />
		<form action="/login" method="post">
			<table align=center>
				<tr>
				 	<td id="font1">아이디</td>
					<td id="pd"><input type="text" name="id" placeholder="아이디를 입력하세요" required id="box"></td>
				</tr>
				<tr>
					<td id="font1">비밀번호</td>
					<td id="pd"><input type="text" name="pw" placeholder="비밀번호를 입력하세요" required id="box"></td>
				</tr>
				<tr><td colspan=2 style="text-align: center;">
					<br /><input type="submit" value="로그인" id="btn1"> <br /><br />
				</td></tr>
			</table>
			<br /><br />
			<table align=center>		
				<tr><td id="loginfail" colspan=2>${loginfail}</td></tr>
				<tr><td colspan=2>
					아직 KG플릭스 가족이 아니신가요? &nbsp;<a href="/joinpage" id="font3">회원가입</a> <br /><br />
					아이디가 기억 안나시나요? &nbsp;<a href="/findID" id="font4">아이디 찾기</a> <br /><br />
					비밀번호가 기억 안나시나요? &nbsp;<a href="/findPW" id="font5">비밀번호 찾기</a>
				</td></tr>
			</table>
		</form>

	 </article>
    </section>
</body>
</html>