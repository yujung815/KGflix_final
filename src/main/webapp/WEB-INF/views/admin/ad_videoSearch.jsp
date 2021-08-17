<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영상수정/삭제</title>
<link rel="stylesheet" href="css/admin.css" />
</head>

<body>
	<header><jsp:include page="../common/ad_header.jsp"/></header>
	<section>
	<article>
		<div align=center>
			<br /><br />
			<div id="search_title">수정하실 컨텐츠를 검색하세요</div> <br />
			<form action="/search2">
				<input type="text" name="searchItem" placeholder="제목 / 카테고리를 입력해주세요" id="search_textbox" /> 
				<input type="submit" value="검색" id="s_btn"/>
			</form>
			<br />
			<hr />
		</div>
		<table align=center width="1410">
			<tr>
				<td>
					<c:forEach var="search" items="${ad_videoSearch}">
						<table id="s_table">
							<tr id="type">
								<td width="70" style="color:#3CB371;">${search.category}</td>
								<td width="50" style="color:#DC143C">
									<c:choose>
										<c:when test="${search.free == 1}">
											<font>무료</font>
										</c:when>
										<c:otherwise>
										 	<font>유료</font>
										</c:otherwise>
									</c:choose>
								</td >
								<td width="50">
									<c:if test="${search.new_no == 1}">
										<font style="color: gold;">신작</font>
									</c:if>
								</td>
								<td width="50">
									<c:if test="${search.pop == 1 }">
										<font style="color:#00CED1;">인기</font>
									</c:if>
								</td>
							</tr>
							<tr onclick="location.href='ad_detail?con_no=${search.con_no}'">
								<td colspan=4>
									<img src="${search.thumb_uri}" id="thumb"/> <br />
									<div id="video_name">${search.title}</div>
								</td>
							</tr>
						</table>
					</c:forEach>
				</td>				
			</tr>
			
		</table>
	</article>
	</section>

</body>
</html>