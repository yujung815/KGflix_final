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
	
		f.submit(); 
		
	}

</script>


<script type="text/javascript">
	function displayResult() {
		var id = $("#id").val();
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
		<h2>KG 플릭스 회원가입</h2>
	<form action="joinmember" method="post">
		<table border="1">
		<tr>
			<td>
				<input type="text" name="id" id="id" placeholder="ID를 입력하세요">
			</td>
			<td>
				<input type="button" id="checkbtn" onclick="displayResult();" value="중복확인">
			</td>
		</tr> 
		<tr>
			<td colspan="2">
			<label>비밀번호</label><br>
			<input type="password" placeholder="PW를 입력하세요" name="pw" > 
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<label>비밀번호 확인</label><br>
				<input type="password" placeholder="Confirm Password" name="pw_con">
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<label>이름</label><br>
				<input type="text" name="name" placeholder="이름" >
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<label>전화번호</label><br>
				<input type="text" name="tel"  placeholder="전화번호">
			</td>
		<tr>
		<tr><td colspan="2">
				<label>이메일</label><br>
				<input type="email" name="email" placeholder="이메일" ><br>
				
			</td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<input type="hidden" name="idDuplication" id="idDuplication" value="uncheked" />
				<button type="button" onclick="join(this.form);" style="color: white;">가입하기</button>
			</td>
		</tr>
		</table>
	</form>

</article>
</section>
</body>
