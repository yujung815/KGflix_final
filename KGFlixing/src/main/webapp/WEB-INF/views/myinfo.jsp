<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/main.css" />
<link rel="stylesheet" href="css/login.css" />
<style>

</style>
</head>
<body>
	<header>
        <jsp:include page="common/header.jsp"/>
    </header>
   <section>
<article>
	<br /><br /><br /><br /><br />
	<div align=center id="title">정보수정</div>
	<br /><br />
		<form action="/updateMembInfo" method="post">
			<table align="center">
				<tr>
					<td id="font1">아이디</td>
					<td id="font1">${member.id }</td>
				</tr>
				<tr>
					<td id="font1">비밀번호변경</td>
					<td id="pd"><input type="password" name=newPW1 id="box"></td>
				</tr>
				<tr>
					<td id="font1">비밀번호확인</td>
					<td id="pd"><input type="password" name=newPW2 id="box"></td>
				</tr>
				<!-- 비밀번호 일치 여부 확인  -->
				
				<tr>
					<td id="font1">이름</td>
					<td id="font1">${member.name }</td>
				</tr>
				<tr>
					<td id="font1">전화번호</td>
					<td id="pd"><input type="text" name="tel" value="${member.tel }" id="box"></td>
				</tr>
				<tr>
					<td id="font1">이메일</td>
					<td id="pd"><input type="text" name="email" value="${member.email }" id="box"></td>
				</tr>
				<tr>
					<td id="pd"><input type="submit" value="변경하기" id="btn1"></td>
					<td id="pd" align=right><input type="reset" value="원래대로" id="btn1"></td>
				</tr>
				<tr><td colspan=2 align=center>
					<br /><a href="/deleteMembInfo" id="font3">회원 탈퇴하기</a>
				<td><tr>
				
			</table>
		</form>
		<br /><br />
		<div align=center id="font4">
			도움이 필요하세요? &nbsp;<a href="/고객센터주소" id="font6">고객센터 이동하기</a>
		</div>
	</article>
	</section>
</body>
</html>