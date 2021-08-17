<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link rel="stylesheet" href="css/main.css" />
<script src="js/jquery-3.6.0.js"></script>
<script>
var result = '${msg}';
if (result == 'error') {
        alert("이미 등록된 댓글이 존재합니다.");
}
</script>

	<header>
		<jsp:include page="../common/header.jsp"/>
	</header>
	
	<section>
		<article style="color: white; margin-left: auto; margin-right: auto">
		<table style="margin-left: auto; margin-right: auto;">
			<tr><th><font>${cvo.title}(평점 : ${avg}점)</font></th></tr> <!-- 영상제목넣는곳 -->
			<tr><th><video autoplay controls src="${cvo.video_uri}" style="width: 500px;"></video></th></tr>
		</table>
		</article>
		<br /><br /><br />
		<article>
			<form action="/comment_regist" method="post">
			<table style="width: 60%; margin-left: auto; margin-right: auto;">
				<tr>
					<th style="color: white;">&nbsp;&nbsp;&nbsp;&nbsp;
						<c:if test="${member != null }">${member.id }</c:if>
					</th> <!-- 로그인 유저 아이디 출력 -->
					<th style="text-align: right;">
					<input type="radio" name="score" value=5 checked/><font>5점</font>
					<input type="radio" name="score" value=4 /><font>4점</font>
					<input type="radio" name="score" value=3 /><font>3점</font>
					<input type="radio" name="score" value=2 /><font>2점</font>
					<input type="radio" name="score" value=1 /><font>1점</font>
					</th>
				</tr>
					<input type="hidden" name="id" value="${member.id}" /> <!-- 로그인정보 아이디 받아오기 -->
					<input type="hidden" name="con_no" value="${cvo.con_no}" />
				<tr>
					<th colspan="2"><textarea name="comment_user" cols="30" rows="5" id="play_area" placeholder="댓글을 등록 해주세요"></textarea></th>
				</tr>
				<tr>
					<c:if test="${member != null }">					
						<th colspan="2" style="text-align: right;"><input type="submit" value="등록"/></th>
					</c:if>
				</tr>
			</table>
			</form>
		</article>
		
		<article>
		<br />	<hr /> <br />
		</article>
		
		<article>
			<table style="padding-left: 10%;">
				<c:forEach var="comment" items="${comArr}">
					<tr>
						<th style="text-align: left;"><font>${comment.id} : ${comment.comment_user}</font></th>
						<th><div id="date">
						<fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${comment.uptime}"/>
						</div></th>
						<c:if test="true"> <!--만약 로그인한아이디와 코멘트아이디와 같을때만 삭제버튼 출력  -->
						<th><div id="del"><a href="/comment_del?id='${comment.id}'&con_no=${cvo.con_no}">삭제</a></div></th>
						</c:if>
					</tr>
				</c:forEach>
			</table>
			
			
	
		</article>
	</section>
	

