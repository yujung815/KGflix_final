<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link rel="stylesheet" href="css/main.css" />


	<header>
		<jsp:include page="../common/header.jsp" />
	</header>
	
	<section>
		<article>
			<br /><br /><br /><br /><br /><br />
			<div id="main_text" class="container">
			<img src="${cvo.thumb_uri}" style="width: 30%"/> <br /> <!-- 검색결과 이미지 출력 -->
				<font>${cvo.title}</font> <br />  <!-- 검색결과 이름 출력 -->
				<c:choose>
					<c:when test="${avg != null }">
						<div id="detail_avg">평점 : ${avg}</div>
					</c:when>
					<c:otherwise>
						<div id="detail_avg">아직 등록평이 존재하지 않습니다</div>
					</c:otherwise>
				</c:choose>
				<table style="margin-left: auto; margin-right: auto;">
					<tr>
						<th><a href="/play?con_no=${cvo.con_no}"><button id="btn">바로시청</button></a></th>
						<th><a href="/favorites?con_no=${cvo.con_no}"><button id="btn">찜하기</button></a></th>
						<th><a href="javascript:history.go(-1);"><button id="btn">목록돌아가기</button></a>	</th>
					</tr>
				</table>	
			</div>
		</article>
	</section>
