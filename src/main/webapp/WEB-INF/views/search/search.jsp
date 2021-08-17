<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<link rel="stylesheet" href="css/main.css" />


<header>
	<jsp:include page="../common/header.jsp" />
	
</header>

<script type="text/javascript">
	var check = '${msg}';
	if(check == 'case1'){
		alert('로그인후 사용 가능한 컨텐츠 입니다');
		history.go(-1);
	}
	if( check == 'case2'){
		alert('유료 컨텐츠는 구독권 구매후 사용 가능합니다');
		history.go(-1);
	}
</script>

<section>
	<article>
		<div id="main_text">
			원하시는 컨텐츠를 <br /> 검색해 보세요
		</div>
		<br />
		<div style="text-align: center;">
			<form action="/search">
				<input type="text" name="searchItem" placeholder="제목/카테고리를 입력해주세요" id="input_text" /> 
				<input type="submit" value="검색" id="search_btn"/>
			</form>
		</div>
	</article>

	<article>	
		<br /><br />
		
		<ul align=center id="cate_ul">
			<li id="cate_li"><a href="search_cate?category=movie" id="aa">movie</a></li>
			<li id="cate_li"><a href="search_cate?category=docu" id="aa">docu</a></li>
			<li id="cate_li"><a href="search_cate?category=ani" id="aa">ani</a></li>
			<li id="cate_li"><a href="search_cate?category=entertain" id="aa">entertain</a></li>
			<li id="cate_li"><a href="search_cate?category=drama" id="aa">drama</a></li>
			<li id="cate_li"><a href="search_cate?category=social" id="aa">social</a></li>
		</ul>
		
		<hr />
		<br />
	</article>
	
	<table align=center>
		<tr>
			<td width="250" id="search_result">
				<br /><br />
				<div id="logo">검색결과</div>
				<div id="logo" style="color: red;">${searchItem}</div>
			</td>
			<td width="1330">
				<c:choose>
					<c:when test="${fn:length(search) == 0 }">
						<font>검색결과가 없습니다.</font>
					</c:when>
					
					<c:otherwise>
						<c:forEach var="search" items="${search}">
							<table style="float: left;" id="s_table">
								<tr id="type">
									<td id="search_td1">
										<font style="color: yellow;">${search.category}</font>
									</td>
									<td id="search_td">
										<c:choose>
											<c:when test="${search.free == 1}">
											 	<font style="color: red">무료</font>
											</c:when>
											<c:otherwise>
											 	<font style="color: red">유료</font>
											</c:otherwise>
										</c:choose>
									</td>
									<td id="search_td">
										<c:if test="${search.new_no == 1}">
											<font style="color: blue;">신작</font>
										</c:if>
									</td>
									<td id="search_td">
										<c:if test="${search.pop == 1 }">
											<font style="color: green;">인기</font>
										</c:if>
									</td>
								</tr>
								<tr>
									<td colspan="4">
										<a href="/detailPage?con_no=${search.con_no}&searchItem=${searchItem}"> 
											<img src="${search.thumb_uri}" id="thumb" />
										</a>
									</td>
								</tr>
								<tr>
									<td colspan="4" id="video_name"><font>${search.title}</font>
									</td>
								</tr>
							</table>
						</c:forEach>
					</c:otherwise>
			</c:choose>
		</tr>
	</table>
</section>