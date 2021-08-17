<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link rel="stylesheet" href="css/login.css" />
<script src="js/jquery-3.6.0.js"></script>
<script>	
	function join(f) {
		var check = '${msg}';
		var id = f.id.value;
		var pw = f.pw.value;
		var pw_con = f.pw_con.value;
		var name = f.name.value;
		var tel = f.tel.value;
		var email = f.email.value;
		var idCheck = f.idDuplication.value;
		var regExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;

		if(email.match(regExp) == null){
			alert('이메일을 확인해보세요');
			f.email.focus();
			return;
		}
		
		if(id == ''){
			alert('아이디를 입력해 주세요');
			f.id.focus();
			return;
		}
		if(pw == ''){
			alert('비밀번호를 입력해 주세요');
			f.pw.focus();
			return;
		}
		if(name == ''){
			alert('이름을 입력해 주세요');
			f.name.focus();
			return;
		}
		if(tel == ''){
			alert('전화번호를 입력해 주세요');
			f.tel.focus();
			return;
		}
		if(email == ''){
			alert('아이디를 입력해 주세요');
			f.email.focus();
			return;
		}
		if(pw != pw_con){
			alert('비밀번호를 확인해주세요');
			f.pw_con.focus();
			return;
		}
		if (idCheck != 'confirm'){
			alert('아이디 중복체크를 해주세요');
			f.id.focus();
			return;
		}
	
		alert('정상가입이 완료 되었습니다.');
		f.submit(); 
		
	}

</script>


<script type="text/javascript">
	function displayResult() {
		var id = $('input[name=id]').val();
		if(id == ""){
			alert('id를 입력해주세요!');
			return;
		}
		$.ajax({
			url : 'checkId',
			type : 'post',
			data : {
				id : id			
			},
			success : function(data){ //ajax가 성공하면 다시 이곳으로 도착!
				if(data.result == 'fail'){
					alert('중복된 아이디입니다');
				}else{
					$('#idDuplication').val('confirm');
					alert('사용가능한 아이디입니다');
				}
			},
			error : function(data, status, opt) {
		        alert("code:"+data, status+"\n"+"error:"+opt);
			}
		});//end of ajax
		
	}
</script>

<title>회원가입</title>

<body>
	<header>
        <jsp:include page="common/header.jsp"/>
    </header>
<section>
<article>
<div align="center">
	<div id="title">KGFlix 회원가입</div> <br />
	<form action="joinmember" method="post">
		<table>
		<tr>
			<td id="font1">아이디</td>
			<td id="pd">
				<input type="text" name="id"  placeholder="ID를 입력하세요" id="box">
				<input type="button" id="checkbtn" onclick="displayResult();" value="중복확인">
			</td>

				
		</tr> 
		<tr>
			<td id="font1">비밀번호</td>
			<td id="pd"><input type="password" placeholder="PW를 입력하세요" name="pw" id="box"></td>
		</tr>
		<tr>
			<td id="font1">비밀번호 확인</td>
			<td id="pd"><input type="password" placeholder="Confirm Password" name="pw_con" id="box"></td>
		</tr>
		<tr>
			<td id="font1">이름</td>
			<td id="pd"><input type="text" name="name" placeholder="이름" id="box"></td>
		</tr>
		<tr>
			<td id="font1">전화번호</td>
			<td id="pd"><input type="text" name="tel"  placeholder="전화번호" id="box"></td>
		</tr>
		<tr>
			<td id="font1">이메일</td>
			<td id="pd"><input type="email" name="email" placeholder="이메일" id="box"></td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<br />
				<input type="hidden" name="idDuplication" id="idDuplication" value="uncheked" />
				<br /><button type="button" onclick="join(this.form);" id="btn1">가입하기</button>
			</td>
		</tr>
		</table>
	</form>
	<br /><br /><br /><br />
</div>
</article>
</section>
</body>
<footer>
	<jsp:include page="common/footer.jsp" />
</footer>
