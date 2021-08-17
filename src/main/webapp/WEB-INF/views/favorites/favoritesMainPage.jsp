<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<!DOCTYPE html>
<html>
<link rel="stylesheet" href="css/favoritesMainPage.css" />
<meta charset="UTF-8">
<title>Insert title here</title>
<head>
		<jsp:include page="../common/header.jsp"/>
</head>	
<body>

	<div class="list_wrap">
	<div class="user"><h1 class="userFavoritesList">즐겨찾기 목록</h1></div>
	<br>
        <ul>
        <c:forEach var="test" items="${favoritesVOList}">
           <li class="item item1">
                 <img src="${test.thumb_uri}" class="image"/>
                      <div class="cont">
                      <c:choose>
                      	<c:when test = "${test.free==1}">
                      		 <strong>무료</strong>
                      	</c:when>
                        <c:when test = "${test.free==0}">
                      		 <strong>유료</strong>
                      	</c:when>
                      </c:choose>
                      <strong>"${test.title}"</strong>
                         <a href="/myPlay?con_no=${test.con_no}">시청하기</a> 
                      	 <a href="/delete?deleteCon_no=${test.con_no}">삭제</a>
                     </div>
           </li>
           </c:forEach>
        </ul>
     </div>

</body>
</html>