<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<header>
        <jsp:include page="common/header.jsp"/>
    </header>
<section>
<article>
<h1> 내가 찜한 영상</h1>

<c:foreach var="clip" items="${moveList }">
	<c:out value="${clip.name}"><button onclick="/watchmovie">시청하기</button>
								<button onclick="/watchmovie">찜 목록에서 제거</button>
	</c:out>
</c:foreach>
</article>
</section>
</body>
</html>