<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<script>
document.getElementById("idcheck").onclick = function() {myFunction()};
<%-- 
function myfunction() {
$('#idCheck').click(function(){

		var valId = $('#id').val();	
		
		var request = $.ajax({
			url: "<%=request.getContextPath() %>/idcheck.jsp", //통신할 url
			method: "POST", //통신할 메서드 타입
			data: { id : valId }, //전송할 데이타
			dataType: "json"
		});	 
		
		request.done(function( data ) {
			console.log(data.result)
			if(data.result == 'Y'){
				$('#idCheck').attr('idCheck','Y');
				alert('사용 가능한 아이디입니다.');
			} else{
				$('#idCheck').attr('idCheck','N');
				alert('사용할 수 없는 아이디입니다.');
			}	
		});	 
		request.fail(function( jqXHR, textStatus ) {
		  alert( "Request failed: " + textStatus );
		});			
		
	});		
})
 --%>
</script>
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
		<tr><td>
			<input type="text" name="id" placeholder="아이디를 입력하세요" required>
		</td><td>
			<button>중복확인 하기</button>
			<c:choose>
				<c:when test="${empty mvo}"><!--id로 찾을수 있는 멤보 정보가 없으면 -->
					<font color="green">사용할 수 있는 아이디입니다.</font>
					<c:set var=idpass value="pass"/>
				</c:when>
				<c:otherwise>
					<font color="red">사용할 수 없는 아이디입니다.</font>
					<c:set var=idpass value="fail"/>
				</c:otherwise>
			</c:choose>			
			</td>
		</tr> 
		<tr><td colspan="2"><c:set var="pw1" value="pw"/><input type="password" name="pw" placeholder="비밀번호를 입력하세요"></td></tr>
		
		<tr><td><input type="password" name="pw2" placeholder="위와 동일한 비밀번호 입력"></td>
			<td><div id="pwwarn">${pwwarning}</div></td></tr>
		<tr><td colspan="2"><input type="text" name="name" placeholder="이름" required></td></tr>
		<tr><td colspan="2"><input type="text" name="tel" placeholder="전화번호" required></td></tr>
			
		<tr><td><input type="text" name="email" placeholder="이메일"></td>
			<td><div id="emailwarn">${emailwarning}</div></td></tr>
		<tr><td colspan="2" align="center">
			<c:when test="{idpass} equals'pass'">
				<input type="submit" value="회원가입">
			</c:when>
			
		</td></tr>
		
		</table>
	</form>
</article>
</section>
</body>
</html>