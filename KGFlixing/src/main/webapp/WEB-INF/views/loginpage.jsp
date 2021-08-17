<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 


<title>Insert title here</title>
<link rel="stylesheet" href="css/main.css" />
<link rel="stylesheet" href="css/login.css" />

<script type="text/javascript">
       var check  = '${msg}';
       if(check == 'stop'){
    	   alert('이용정지된 아이디입니다. 고객센터에 문의 바랍니다');
       }
       if(check == 'fail'){
    	   alert('아이디 혹은 비밀번호가 틀립니다.');
       }
</script>


<body>
<header>
	<jsp:include page="common/header.jsp"/>
</header>
    <section>
    <article>
		<div id="title" align=center>KGFlix 로그인</div>
		<br /><br />
		<form action="/login" method="post">
			<table align=center>
				<tr>
				 	<td id="font1">아이디</td>
					<td id="pd"><input type="text" name="id" placeholder="아이디를 입력하세요" required id="box"></td>
				</tr>
				<tr>
					<td id="font1">비밀번호</td>
					<td id="pd"><input type="password" name="pw" placeholder="비밀번호를 입력하세요" required id="box"></td>
				</tr>
				<tr><td colspan=2 style="text-align: center;">
					<br /><input type="submit" value="로그인" id="btn1"> <br /><br />
				</td></tr>
			</table>
			<br /><br />
			<table align=center>		
				<tr><td colspan=2>
					<font id="font1">아직 KG플릭스 가족이 아니신가요?</font> &nbsp;<a href="/joinpage" id="font3">회원가입</a> <br /><br />
					<font id="font1">아이디가 기억 안나시나요?</font> &nbsp;<a href="/findID" id="font4">아이디 찾기</a> <br /><br />
					<font id="font1">비밀번호가 기억 안나시나요?</font> &nbsp;<a href="/findPW" id="font5">비밀번호 찾기</a>
				</td></tr>
			</table>
		</form>
<br /><br /><br /><br /><br /><br /><br /><br /><br />
	 </article>
    </section>
</body>
<footer>
	<jsp:include page="common/footer.jsp" />
</footer>
