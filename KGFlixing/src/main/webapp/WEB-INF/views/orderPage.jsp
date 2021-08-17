<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<script type="text/javascript"
	src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js">
</script>
<script type="text/javascript"
	src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js">
</script>
<style>
.outCase {
  display: flex;
  justify-content: center;
}
#box{
	width: 200px;
	height: 30px;
	font-size: 18px;
}
</style>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<header>
        <jsp:include page="common/header.jsp"/>
    </header>

	<form action="/pay">
		<div class="outCase">
      <div class="inCase" style="border: 1px solid white; margin-top: 200px;
             margin-bottom: 260px;">
			<p style="font-weight: bold; color:white; font-size:30px;margin-left:10px;">KGFlix</p>
			<label class="box-radio-input">
        <a style="color:white; font-size:20px; margin-left:10px;">1개월</a>
				<input type="radio" name="price" value="5000" checked="checked" required> 
				<span style="color:white; font-size:20px;">5,000원</span>
			</label> 
      <br>
			<label class="box-radio-input">
        <a style="color:white; font-size:20px; margin-left:10px;">2개월</a>
			    <input type="radio" name="price" value="10000"> 
			    <span style="color:white; font-size:20px;">10,000원</span>
			</label><br><br> <label class="idCheck"> 
				&nbsp;&nbsp;<input type="text" name="id" placeholder="아이디를 입력하세요" required id="box">&nbsp;&nbsp;
			</label><br> <br />
			<label class="pwCheck"> 
				&nbsp;&nbsp;<input type="text" name="pw" placeholder="비밀번호를 입력하세요" required id="box">&nbsp;&nbsp;
			</label><br><br>
			<div align="center">
				<button type="submit" class="btn btn-lg btn-block  btn-custom"
				id="charge_kakao" style="background:aliceblue;margin-left:5px;">충 전 하 기</button>
			</div>
			<br />
        </div>
		</div>
	</form>
</body>
	<footer>
        <jsp:include page="common/footer.jsp"/>
    </footer>
</html>