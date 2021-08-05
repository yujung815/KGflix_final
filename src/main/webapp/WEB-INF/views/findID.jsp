<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/main.css" />
<link rel="stylesheet" href="css/login.css" />
<script src="js/jquery-3.6.0.js"></script>

<script type="text/javascript">
	function findId() {
		var name = $('input[name=name]').val();
		var email = $('input[name=email]').val();
		if(name == ""){
			alert('이름을 입력해주세요!');
			return;
		}
		if(email == ""){
			alert('이메일을 입력해주세요!');
			return;
		}
		$.ajax({
			url : 'findIdAtion',
			type : 'post',
			data : {
				name : name ,
				email : email
			},
			success : function(data){ //ajax가 성공하면 다시 이곳으로 도착!
				if(data.result == 'fail'){
					alert('확인된 결과가 없습니다');
				}else{
					alert('찾으시는 id는 '+data.result +' 입니다');
				}
			},
			error : function(data, status, opt) {
		        //alert("code:"+data, status+"\n"+"error:"+opt);
		        alert("에러");
			}
		});//end of ajax
		
	}
</script>

<body>
<header>
	<jsp:include page="common/header.jsp"/>
</header>
<section>
<article>
	
	<div align=center id="title">아이디 찾기</div>
	<br /><br />
	<form action="" method="POST">
	<table align=center>
		<tr>
			<td id="font1">이름</td>
			<td id="pd"><input type="text" name="name" placeholder="아이디를 입력하세요" id="box"></td>
		</tr>
		<tr>
			<td id="font1">이메일</td>
			<td id="pd"><input type="email" name="email" placeholder="이메일을 입력하세요" id="box"></td>
		</tr>
		<tr><td colspan=2 style="text-align: center;"> <br />
			<button id="btn1" type="button" name="btn" onclick="findId();">찾기</button>
		</td></tr>


	</table>
	</form>

</article>
</section>
<br /><br /><br /><br /><br /><br /><br /><br /><br />
</body>
<footer>
	<jsp:include page="common/footer.jsp" />
</footer>
