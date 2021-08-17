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
			<tr><th id="title2">1:1 문의관리</th></tr>
			<tr height=50></tr>
			<tr><td>
				<table width=1200 id="cs_table">
					<tr id="cs_top">
						<th width=300 id="pd">No.</th>
						<th width=600 id="pd">title</th>
						<th width=300 colspan="2" id="pd">status</th>
					</tr>
					<c:forEach var="cs" items="${ad_cs}">
					<tr id="cs_list">
						<td>${cs.cs_no}</td>
						<td><a href="void(0);" onclick="alert('이메일 : ${cs.e_mail} \n\n${cs.cs_content}'); return false;" id="cs_a">${cs.cs_title}</a></td>
						<td width=120 align=center>
							<c:choose>
							<c:when test="${cs.status != 0}">
								<div>완료</div>
							</c:when>
							<c:otherwise>
								<div>미처리</div>
							</c:otherwise>
						</c:choose>
						</td>
						<td align=center id="pd"><button type="button" onclick="location.href='cs_status?cs_no=${cs.cs_no}'" id="btn2">완료</button></td>
					</tr>
					</c:forEach>
				</table>
			</td></tr>
		</table>
	</article>
	</section>

</body>
</html>