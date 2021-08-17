<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<link rel="stylesheet" href="css/main.css">
<link rel="stylesheet" href="css/cs.css" />

<header>
	<jsp:include page="common/header.jsp"/>
</header>



<title>1:1게시판 리스트</title>

<body>
<div align=center>

	<div id="cs_title">문의 목록</div>
	<br />
	<table border="1" id="cs_table" >
		<thead>
		<tr id="gray">
			<th>번호</th>
			<th>이메일</th>
			<th>아이디</th>
			<th>제목</th>
			<th>등록일</th>
		</tr>
		</thead>
		
		<tbody>
		
		<c:forEach var="list" items="${list}">
		<tr>
		<td scope="row">${list.cs_no}</td>
		<td> ${list.e_mail}</td>
		<td> ${list.user_no}</td>
		<td><a href="list2?cs_no=${list.cs_no}">${list.cs_title}</a></td>
		<td><fmt:formatDate pattern="yyyy-MM-dd" value="${list.regdate}" /></td>
			</tr>	
		</c:forEach>
		
	
		
		</tbody>
	
	</table>
<br>

<button class="button" type="button" onclick="location.href='writeForm'">글쓰기</button>
<button class="button" type="button" onclick="location.href='cs_main'">고객센터</button>

</div>
</body>


