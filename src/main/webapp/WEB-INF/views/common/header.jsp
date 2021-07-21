<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<link rel="stylesheet" href="css/header.css" />

<script type="text/javascript">
function kaja(bada) {
   if(bada.style.display=="none"){
      bada.style.display="block";
   }else{
      bada.style.display = "none";
   }
}

 

</script>
<body>
   <table>
      <tr>
         <th style="width: 1000px;">
            <div id="logo">
               <a href="mainpage" id="logo">KG플릭스</a>
            </div>
         </th>
         <th style="width: 500px">

        <c:choose>
         <c:when test="${empty member}"> <!-- userInfo는 로그인정보 userVO객체 -->
            <table id="table_header">
               <tr><th><div id="div_btn"><a href="/loginpage">로그인</a></div></th></tr>
               <tr><th><div id="div_btn"><a href="/joinpage">회원가입</a></div></th></tr>
            </table>
         </c:when>
        	
         <c:otherwise> <!-- 유저정보 db출력 -->
            <table id="table_header">
             <tr><th colspan="3"><font id="logo"><c:out value="${sessionScope.member.name}"/>
               		</font><font id="logo" style="color: white;"> 님 반갑습니다</font></th></tr>
               <tr><th colspan="3"><font>기간:2021.07.01~2021.08.01</font></th></tr>
               <tr><th>
              <div id="div_btn"><a href="orderpage">월정액 신청</a></div></th>
               <th> <button onclick="kaja(document.getElementById('menu'))">
                    		<font id="div_btn">마이페이지</font></button></th>
               <th><div id="div_btn"><a href="logout">로그아웃</a></div>
               </th></tr>
               <tr><td></td><td>
            	<div id="menu" style="display: none;">
               		<ul>
                  		<li><a href="myinfo"><font>정보수정</font></a>
                  		<li><a href="myvideopage"><font>찜목록보기</font></a>
               		</ul>
               	</div></td>
              <tr>
            </table>
      </c:otherwise>
			</c:choose>
         
         </th>
      </tr>
      
   </table>

</body>
</html>