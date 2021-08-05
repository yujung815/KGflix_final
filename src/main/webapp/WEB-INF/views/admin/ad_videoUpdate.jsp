<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>영상 수정</title>
<link rel="stylesheet" href="css/admin.css" />
</head>
<body>

	<header><jsp:include page="../common/ad_header.jsp"/></header>
	<section>
	<article>
		<br />
		<table align=center>
		<tr><th id="font">영상수정</th></tr>
		<tr><th>
			<input type="text" value="경로 재설정" id="textbox"/><button onclick="#" id="button3">찾기</button> <br />
			<input type="text" value="이미지 경로" id="textbox"/><button onclick="#" id="button3">찾기</button> <br />
			<input type="text" value="콘텐츠 제목 입력" id="textbox"/>
		</th></tr>
		<tr><th id="checkbox">
			<input type="checkbox" name="type" value="new" />신작
			<input type="checkbox" name="type" value="popular" />인기
			<input type="checkbox" name="type" value="free" />무료  <br />
			<input type="checkbox" name="type" value="docu" />다큐
			<input type="checkbox" name="type" value="movie" />영화
			<input type="checkbox" name="type" value="ani" />애니 <br />
			<input type="checkbox" name="type" value="entertainment" />예능
			<input type="checkbox" name="type" value="drama" />드라마
			<input type="checkbox" name="type" value="event" />시사 <br />
			<input type="submit" value="저장" id="button3"/>
		</th></tr>
		</table>
	</article>
	</section>

</body>
</html>