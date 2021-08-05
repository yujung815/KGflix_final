<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 

<title>영상수정/삭제</title>
<link rel="stylesheet" href="css/admin.css" />

<script type="text/javascript">
	function check(input) {
		if(input.searchItem.value.length < 2){
			alert('검색어를 2글자 이상 입력해주세요');
		}else{
			input.submit();
		}
	}
</script>

<body>
	<header><jsp:include page="../common/ad_header.jsp"/></header>
	<section>
	<article>
		<div align=center>
			<br />
			<div id="search_title">수정하실 컨텐츠를 검색</div> <br />
			<form action="/search2" name="input">
				<input type="text" name="searchItem" placeholder="제목 / 카테고리를 입력해주세요" id="search_textbox" /> 
				<input type="button" value="검색" id="button4" onclick="check(input);"/>
			</form>
			<br />
			<hr />
		</div>
		<table align="left" style="width: 20%; border: 0;">
			<tr>
				<td width="1300">
					<c:forEach var="search" items="${ad_videoSearch}">
						<table style="float:left;">
							<tr id="type">
								<td width="50">${search.category}</td>
								<td width="50">
									<c:choose>
										<c:when test="${search.free == 1}">
											<font style="color: red">무료</font>
										</c:when>
										<c:otherwise>
										 	<font style="color: red">유료</font>
										</c:otherwise>
									</c:choose>
								</td >
								<td width="50">
									<c:if test="${search.new_no == 1}">
										<font style="color: blue;">신작</font>
									</c:if>
								</td>
								<td width="50">
									<c:if test="${search.pop == 1 }">
										<font style="color: green;">인기</font>
									</c:if>
								</td>
							</tr>
							<tr onclick="location.href='ad_detail?title=${search.title}'">
								<td colspan=4>
									<img src="${search.thumb_uri}" id="thumb" style="width: 100%"/> <br />
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
