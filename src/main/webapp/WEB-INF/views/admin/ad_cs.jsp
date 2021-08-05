<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html> 
<html>
<head>
<meta charset="EUC-KR">
<title>문의관리</title>
<link rel="stylesheet" href="css/admin.css" />
</head>
<body>
	<header><jsp:include page="../common/ad_header.jsp"/></header>
	<section>
	<article>
		<br />
		<table align=center>
			<tr><th id="cs_title">1:1 문의관리</th></tr>
			<tr height=50></tr>
			<tr><th>
				<table width=1200 id="cs_table">
					<tr id="cs_top">
						<td  width=300>No.</td>
						<td width=600>title</td>
						<td width=300 colspan="2">status</td>
					</tr>
					<c:forEach var="cs" items="${ad_cs}">
					<tr id="cs_list">
						<th>${cs.cs_no}</th>
						<th><a href="void(0);" onclick="alert('이메일 : ${cs.e_mail} \n\n${cs.cs_content}'); return false;" id="cs_a">${cs.cs_title}</a></th>
						<th width=120 align=center>
							<c:choose>
							<c:when test="${cs.status != 0}">
								<div>완료</div>
							</c:when>
							<c:otherwise>
								<div>미처리</div>
							</c:otherwise>
						</c:choose>
						</th>
						<th align=center><button type="button" onclick="location.href='cs_status?cs_no=${cs.cs_no}'" id="button2">완료</button></th>
					</tr>
					</c:forEach>
				</table>
			</th></tr>
		</table>
	</article>
	</section>

</body>
</html>