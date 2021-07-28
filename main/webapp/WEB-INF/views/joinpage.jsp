<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html> 
<html>
<head>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.6/jquery.min.js"></script>
<style>

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
label{
	color:white;
}
.button1{
	background-color:white;
	color:black;
	text-align:center;
	display:inline-block;
	font-size:80%;
}


</style>
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
 //패스워드 일치 확인
});//function종료
 
 $(document).ready(function()){
	 $('#checkbtn').on('click',function(){
		 $.ajax({
			 type:'POST',
			 url:'/checkSignup',
			 data:{
				 "id":$('#id').val()
			 },
			 success:function(data){
				 if($.trim(data)==0){
					 $('#checkMsg').html('<p style="color:blue">사용가능</p>');
				 }else{
					 $('#checkMsg').html('<p style="color:red">사용불가능</p>');
					 
				 }
			 }
		 });//end ajax
	 });//end on
 });//function종료


 
</script>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<body>
	<header>
        <jsp:include page="common/header.jsp"/>
    </header>
<section>
<article>
		<h2>KG 플릭스 회원가입</h2>
	<form action="/joinmember" name="frm" id="frm" method="post">
		<table border="1">
		<tr>
			<td>
				<input type="text" class="form-control" id="id" placeholder="아이디를 입력하세요"/>
				<div id="checkMsg"></div>
			</td>
			<td>
				<button type="submit" id="checkbtn" class="btn btn-default">중복확인</button>
			</td>
		</tr> 
		<tr>
			<td colspan="2">
			<label>비밀번호</label><br>
			<input type="password" placeholder="Password" id="password" name="pw" required> 
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<label>비밀번호 확인</label><br>
				<input type="password" placeholder="Confirm Password" id="confirm_password" required>
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<label>이름</label><br>
				<input type="text" name="name" placeholder="이름" required>
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<label>전화번호</label><br>
				<input type="text" name="tel" placeholder="전화번호" required>
			</td>
		<tr>
		<tr><td colspan="2">
				<label>이메일</label><br>
				<input type="email" name="email" placeholder="이메일" required><br>
				
			</td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<input type="submit" id="reg_submit" value="회원가입">
			</td>
		</tr>
		</table>
	</form>

</article>
</section>
</body>
</html>