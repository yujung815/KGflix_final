<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인</title>
<link rel="stylesheet" href="css/admin.css" />
<script>
		function kaja(bada)
		{  
			if(bada.style.display=="none") 
				bada.style.display="block" 
			else  						
				bada.style.display="none"  
		}
</script>
</head>

<body>
	<header><jsp:include page="../common/ad_header.jsp"/></header>
	<section>
	<article>
		<div align="center" id="aa">
			<br /><br /><br /><br />
			
			<div class="menu1" id="bigmenu1"
			onclick="kaja(document.getElementById('somenu1'))">
				회원관리
			</div>
			<div class="menu2" id="somenu1" style="display:none">
				<a href="ad_member" id="font2">회원정보</a> <br />
				<a href="ad_cs" id="font2">1:1문의관리</a>		
			</div>
			<br /><br />
			<div class="menu1" id="bigmenu2"
			onclick="kaja(document.getElementById('somenu2'))">
				콘텐츠 관리
			</div>
			<div class="menu2" id="somenu2" style="display:none">
				<a href="ad_videoInsert" id="font2">영상등록</a> <br />
				<a href="ad_videoSearch" id="font2">영상수정 / 삭제</a>		
			</div>
		</div>
	</article>
	</section>
</body>
</html>