<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<link rel="stylesheet" href="css/main.css" />
<link rel="stylesheet" href="css/login.css" />



<script type="text/javascript">
	function send(f) {
		var id = f.id.value;
		var pw1 = f.newPW1.value;
		var pw2 = f.newPW2.value;
		var tel = f.tel.value;
		var email = f.email.value;
		
		if(pw1 == ''){
			alert('비밀번호를 입력해주세요');
			return;
		}
		if(pw2 == ''){
			alert('비밀번호 확인을 입력해주세요');
			return;
		}
		if(tel == ''){
			alert('전화번호를 입력해주세요');
			return;
		}
		if(email == ''){
			alert('이메일을 입력해주세요');
			return;
		}
		if(pw1 != pw2){
			alert('비밀번호가 일치하지 않습니다');
			return;
		}
		f.submit();
	}
</script>



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
					<td id="font1">${member.id }
						<input type="hidden" name="id" value="${member.id}" />
					</td>
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
					<td id="pd"><input type="text" name="tel" value="${member.tel}" id="box"></td>
				</tr>
				<tr>
					<td id="font1">이메일</td>
					<td id="pd"><input type="text" name="email" value="${member.email}" id="box"></td>
				</tr>
				<tr>
					<td id="pd"><input type="button" value="변경하기" id="btn1" onclick="send(this.form);"></td>
					<td id="pd" align=right><input type="reset" value="원래대로" id="btn1"></td>
				</tr>
				<tr><td colspan=2 align=center>
					<br />
					<button id="font3" type="button" onclick="if(confirm('정말 탈퇴하시겠습니까?')){location.href='deleteMembInfo'};">회원 탈퇴</button>
				<td><tr>
				
			</table>
		</form>
		<br /><br />
		<div align=center id="font4">
			도움이 필요하세요? &nbsp;<a href="/cs" id="font6">고객센터 이동하기</a>
		</div>
	</article>
	</section>
	<br /><br /><br /><br /><br /><br />
</body>
<footer>
	<jsp:include page="common/footer.jsp" />
</footer>
