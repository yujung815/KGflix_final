<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html> 
<html>
<head>
<meta charset="EUC-KR">
<title>회원관리</title>
<link rel="stylesheet" href="css/admin.css" />
</head>
<body>
	<header><jsp:include page="../common/ad_header.jsp"/></header>
	<section>
	<article>
		<br />
		<table align=center>
			<tr><th id="mem_title">회원관리</th></tr>
			<tr height=50></tr>
			<tr><th>
				<table width=1200 id="member" border="1">
					<tr align=center id="mem_top">
						<td>고유번호</td>
						<td>아이디</td>
						<td>비밀번호</td>
						<td>이름</td>
						<td>전화번호</td>
						<td>이메일</td>
						<td>정액제신청</td>
						<td>기간</td>
						<td></td>
					</tr>
					<c:forEach var="mem" items="${ad_member}">
					<tr align=center>
						<th>${mem.user_no}</th>
						<th>${mem.id}</th>
						<th>${mem.pw}</th>
						<th>${mem.name}</th>
						<th>${mem.tel}</th>
						<th>${mem.email}</th>
						<th>
						<c:choose>
							<c:when test="${mem.subs == 1}">
								<div>신청</div>
							</c:when>
							<c:when test="${mem.subs == 2}">
								<div>이용정지</div>
							</c:when>
							<c:otherwise>
								<div>미신청</div>
							</c:otherwise>
						</c:choose>
						</th>
						<th>${mem.orderday}</th>
						<th id="kan">
							<button type="button" onclick="location.href='user_subs?id=${mem.id}'">이용정지</button>
							<button type="button" onclick="del()">탈퇴</button>
								<script>
									function del(){
										if(confirm("탈퇴하시겠습니까?") == true){
											location.href="/deleteuser?id=${mem.id}"
											alert("탈퇴되었습니다.")
										}else{
											return false;
										}
									}
								</script>
						</th>
					</tr>
					</c:forEach>
				</table>
			</th></tr>
		</table>
	</article>
	</section>

</body>
</html>