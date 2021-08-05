<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>영상 상세</title>
<link rel="stylesheet" href="css/admin.css" />
</head>
<body>
	<header><jsp:include page="../common/ad_header.jsp"/></header>

		<br />
		<div align=center>
			<img src="${vo.thumb_uri}" width=400 height=300/>
			<div id="video_name">
				${vo.title}
			</div> 
			<button type="button" onclick="location.href='ad_videoUpdate'" id="button2">수정</button>
			<button type="button" onclick="location.href='deleteContent?title=${vo.title}'" id="button2">삭제</button>
			<button type="button" onclick="location.href='ad_videoSearch'" id="button2">돌아가기</button>
		</div>

</body>
</html>