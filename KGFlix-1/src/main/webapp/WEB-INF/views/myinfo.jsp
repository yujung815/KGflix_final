<%@ page language="java" contentType="text/html; c	harset=UTF-8"
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
	<h1>정보수정</h1>
		<form>
			<table>
				<tr><td>아이디</td><td>${member.id }</td></tr>
				<tr><td>비밀번호</td><td><input type="text" name=newPW1></td></tr>
				<tr><td>비밀번호확인</td><td><input type="text" name=newPW2></td></tr>
				<tr><td>이름</td><td>${member.name }</td></tr>
				<tr><td>전화번호</td><td><input type="text" name="tel" value="${member.tel }"></td></tr>
				<tr><td>이메일</td><td><input type="text" name="tel" value="${member.email }"></td></tr>
				<tr><td><input type="submit" value="변경하기"></td><td><input type="reset" value="리셋"></td></tr>
			</table>
		</form>
	<h1>도움이 필요하세요? <a href="/">고객센터 이동하기</a></h1>
	</article>
	</section>
</body>
</html>