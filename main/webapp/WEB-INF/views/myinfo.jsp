<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.6/jquery.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
body{
	text-align:center;
}

h1{
	color:white;

}

td{
	color:white;
	padding:10px;
	margin:7px;
	
}
#tablemember{
	text-align:left;
	bgcolor:ligh-green;
	color:white;
	line-color:grey;
}
#buttons{
	border:0;
	align:center;

}
#submit{
	box-radius:2px;
	background-color:white;
	color:black;
	border:2px;
	border-color:grey;
	}

#memberdelete{
	position:absoulute;
	bottom:2px;
	color:grey;
	font-style:italic;
	font-size:4px;
}


</style>
<script type="text/javascript">
$(document).ready(function(){
	var password = document.getElementById("password")
	  , confirm_password = document.getElementById("confirm_password");

	function validatePassword(){
	  if(password.value != confirm_password.value) {
	    confirm_password.setCustomValidity("Passwords Don't Match");
	  } else {
	    confirm_password.setCustomValidity('');
	  }
	}
	password.onchange = validatePassword;
	confirm_password.onkeyup = validatePassword;
})
 </script>

</head>
<body>
	<header>
        <jsp:include page="common/header.jsp"/>
    </header>
   <section>
<article>
	<h1>정보수정</h1>
		<form action="/updateMembInfo" method="post" class="pure-form">
			<table align="center" border="2" id="tablemeber">
				<tr><td>이름</td><td>${member.name }</td></tr>
				<tr><td>아이디</td><td>${member.id }</td></tr>
				
				<tr><td>비밀번호변경</td><td><input type="password" placeholder="Password" id="password" required> </td></tr>
				<tr><td>비밀번호확인</td><td><input type="password" placeholder="Confirm Password" id="confirm_password" required></td></tr>
				<tr><td colspan="2"><p id="pwmismatch"> </p></td></tr>
				<!-- onkeypress함수에 의해서 비밀번호 일치 여부 확인 p태그통해서 'html'값 보내준다.  -->
				
				
				<tr><td>전화번호</td><td><input type="text" name="tel" value="${member.tel }"></td></tr>
				<tr><td>이메일</td><td><input type="text" name="email" value="${member.email }"></td></tr>
			</table>
			<table id="buttons" align="center">
				<tr><td colspan="2" align="left"><button type="submit" id="submit" >회원정보 수정하기</button></td><tr>
				<!-- <td><input type="reset" value="원래대로"></td></tr> -->
				<tr><tr>
				
				
			</table>				
				<h1>도움이 필요하세요? <a href="/고객센터주소">고객센터 이동하기</a></h1>
				<div id="memberdelete">
					<a href="/deleteMembInfo">회원 탈퇴하기</a>
				</div>
		</form>
	</article>
	</section>
</body>
</html>