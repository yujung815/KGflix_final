<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<title>회원관리</title>
<link rel="stylesheet" href="css/admin.css" />

<body>
	<header><jsp:include page="../common/ad_header.jsp"/></header>
	<section>
	<article>
		<br />
		<table align=center>
			<tr><td id="title2">회원관리<br /><br /></td></tr>
			<tr><td>
				<table width=1300 id="member" border="1">
					<tr id="mem_top">
						<th id="pd">고유번호</th>
						<th id="pd">아이디</th>
						<th id="pd">비밀번호</th>
						<th id="pd">이름</th>
						<th id="pd">전화번호</th>
						<th id="pd">이메일</th>
						<th id="pd">정액제신청</th>
						<th id="pw">이용여부</th>
						<th style="background-color: black;" id="pd"></th>
					</tr>
					<c:forEach var="mem" items="${ad_member}">
					<tr>
						<td >${mem.user_no}</td>
						<td>${mem.id}</td>
						<td>${mem.pw}</td>
						<td>${mem.name}</td>
						<td>${mem.tel}</td>
						<td>${mem.email}</td>
						<td >
							<c:choose>
								<c:when test="${mem.subs == 0}">
									<div>미신청</div>
								</c:when>
								<c:when test="${mem.subs == 1}">
									<div>1개월 신청</div>
								</c:when>
							</c:choose>
						</td>
						
						<td>
							<c:choose>
								<c:when test="${mem.status == 0}">
									<div>이용가능</div>
								</c:when>
								<c:when test="${mem.status == 1}">
									<div>이용정지</div>
								</c:when>
							</c:choose>
						</td> 
						<td style="background-color: black;" id="pd2">
						
							<c:choose>
								<c:when test="${mem.status == 0}">
									<button type="button" onclick="location.href='user_status1?id=${mem.id}'"id="btn2">이용정지</button>
								</c:when>
								<c:when test="${mem.status == 1}">
									<button type="button" onclick="location.href='user_status2?id=${mem.id}'"id="btn2">정지취소</button>
								</c:when>
							</c:choose>

							<button type="button" onclick="del()" id="btn2">탈퇴</button>
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
						</td>
					</tr>
					</c:forEach>
				</table>
			</td></tr>
		</table>
	</article>
	</section>

</body>
