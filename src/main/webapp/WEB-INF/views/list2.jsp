<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<link rel="stylesheet" href="css/main.css">
<link rel="stylesheet" href="css/cs.css" />

<header>
	<jsp:include page="common/header.jsp" flush="true" />
</header>


<title>1:1게시판 리스트</title>
<body>
<div align=center>

<form action="updateinfo" method="post">
<h1><span2>1:1 게시판 문의 내용 확인</span2></h1>

<table border="1" bgcolor="white"  bordercolor="black" width ="1000"  >

	<tr><td>아이디</td><td>제목</td><td>문의 내용</td></tr>
	
	<tr>
	<td>${vo.user_no}</td>
	
	<td>${vo.cs_title}</td>
	
	<td>${vo.cs_content}</td>
	</tr>
	

</table>
</form>
<br>

<button class="button" type="button" onclick="location.href='deleteinfo?cs_no=${vo.cs_no}&user_no=${vo.user_no}'">삭제</button>
<button class="button" type="button" onclick="history.go(-1);">1:1 게시판 다시보기</button>
</div>
</body>



