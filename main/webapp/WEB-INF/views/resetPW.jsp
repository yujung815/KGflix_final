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
 	    confirm_password.setCustomValidity("��й�ȣ�� ��ġ���� �ʽ��ϴ�.");
 	  } else {
 	    confirm_password.setCustomValidity('');	
 	  }
 	}
 	password.onchange = validatePassword;
 	confirm_password.onkeyup = validatePassword;
 })//�н����� ��ġ Ȯ�� 
 </script>
</head>
<body>
	<h1>��й�ȣ �缳��</h1>
		<form action="/updateMembInfo" method="post">
		
		<label>��й�ȣ</label><br>
		<input type="password" placeholder="Password" id="password" name="pw" required><br><br>
		<input type="hidden" name="tel" value="${member.tel}"> //updateMembInfo�� �״�� ���� ���ؼ� ���Ŀ� ���缭 �־��ش�.
		<label>��й�ȣ Ȯ��</label><br>
		<input type="password" placeholder="Confirm Password" id="confirm_password" required><br><br>
		<input type="submit" value="��й�ȣ ����">
		</form>
		
		
</body>
</html>