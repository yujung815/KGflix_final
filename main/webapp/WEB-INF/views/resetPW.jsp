<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script>
  $(document).ready(function(){
 	var password = document.getElementById("password")
 	  , confirm_password = document.getElementById("confirm_password");
 	
 	function validatePassword(){
 	  if(password.value != confirm_password.value) {
 	    confirm_password.setCustomValidity("비밀번호가 일치하지 않습니다.");
 	  } else {
 	    confirm_password.setCustomValidity('');	
 	  }
 	}
 	password.onchange = validatePassword;
 	confirm_password.onkeyup = validatePassword;
 })//패스워드 일치 확인 
 </script>
</head>
<body>
	<h1>비밀번호 재설정</h1>
		<form action="/updateMembInfo" method="post">
		
		<label>비밀번호</label><br>
		<input type="password" placeholder="Password" id="password" name="pw" required><br><br>
		<input type="hidden" name="tel" value="${member.tel}"> //updateMembInfo를 그대로 쓰기 위해서 형식에 맞춰서 넣어준다.
		<label>비밀번호 확인</label><br>
		<input type="password" placeholder="Confirm Password" id="confirm_password" required><br><br>
		<input type="submit" value="비밀번호 변경">
		</form>
		
		
</body>
</html>