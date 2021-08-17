<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<link rel="stylesheet" href="css/header.css" />


<script src="js/jquery-3.6.0.js"></script>
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
   <table align=center width=1500>
      <tr>
         <th align=left style="vertical-align: top;">
            <div id="logo">
               <a href="http://localhost:8763/mainpage" id="logo">KGFlix</a>
            </div>
         </th>
         <th align=right>
         
         <c:choose>
         <c:when test="${empty member}"> <!-- userInfo는 로그인정보 userVO객체 -->
            <table id="table_header">
               <tr><th><div id="div_btn"><a href="http://localhost:8763/loginpage">로그인</a> </div></th></tr>
               <tr><th><div id="div_btn"><a href="http://localhost:8763/joinpage"> 회원가입</a></div></th></tr>
            </table>
         </c:when>
         <c:otherwise> <!-- 유저정보 db출력 -->
            <table id="table_header">
               <tr><th colspan="3"><font id="logo"><c:out value="${member.name}"></c:out></font>
               <font id="logo" style="color: white;"> 님 반갑습니다</font></th></tr>
               <tr><th colspan="3"><font>기한: <c:if test="${member.subs == 0 }">미결제 회원입니다.</c:if>
             <c:if test="${member.subs == 1 }"><fmt:formatDate  var="date2" value="${pvo.lastday}" type="DATE" pattern="yyyy-MM-dd"/>
             ${date2}
             </c:if> </font></th></tr>
               <tr><th>
               <a href="http://localhost:8763/pay"><font id="div_btn">정액제신청</font></a></th>
               <th><button onclick="kaja(document.getElementById('menu'))"><font id="div_btn">마이페이지</font></button></th>
               <th><a href="http://localhost:8763/logout"><font id="div_btn">로그아웃</font></a>
               </th></tr>
               <tr ><th colspan="3">
                       <div id="menu" style="display: none;" align="center">
             	<ul>
                     <li><form action="http://localhost:8763/myinfo">
                     <input type="submit" value="내 정보 수정" id="btn1">
                     <input type="hidden" id="member" value=${member }></form>
                     <li><a href="http://localhost:8763/myFavoritesMain"><font>찜 목록 보기</font></a>
                </ul>
               </div>
               </th></tr>
            </table>
           
         </c:otherwise>
         
         </c:choose>
         </th>
      </tr>
   </table>
    

</body>
</html>