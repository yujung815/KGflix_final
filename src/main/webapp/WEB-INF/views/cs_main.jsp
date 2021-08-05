<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   

<link rel="stylesheet" href="css/main.css">
<link rel="stylesheet" href="css/cs.css" />

<header>
   <jsp:include page="common/header.jsp" />
</header>


<section>
<br /><br /><br />
<table align=center width=1500px>
	<tr>
		<td>
			<div id="title">         
			   KGFlix 고객센터        
			</div> <br><br><br>
			
			
			<div align=left>
			   <h1 id="span2">자주하는 질문리스트</h1>
			</div>
			 
			   <input type="checkbox" id="answer01">
			   <label for="answer01"> Q. kg플릭스란?</label>
			   <div>
			      <span>
			         kg플릭스는 TV 프로그램과 영화를 인터넷 연결 지원 디바이스에서 광고 없이 시청할 수 있는 멤버십 기반 스트리밍
			         서비스입니다. 이미 kg플릭스에 가입했으며 이용 방법에 대해 자세히 알고자 하는 경우 kg플릭스 회원가입을 진행하세요.<br>
			         kg플릭스 앱이 제공되는 모든 인터넷 연결 지원 디바이스를 통해 kg플릭스를 시청할 수 있습니다.
			      </span>
			   </div>
				<br />
				
			   <input type="checkbox" id="answer02">
			   <label for="answer02"> Q.정액제 요금은 얼마인가요?</label>
			   <div>
			      <span>
			         멤버십 및 요금을 비교하여 가장 적합한 멤버십을 선택하세요. 언제든지 온라인으로 쉽게 멤버십을 변경하거나 해지할 수
			         있습니다. 회원가입 페이지로 이동합니다.<br> 이메일 주소를 입력하고 비밀번호를 만들어 계정을 생성합니다. 이제
			         끝났습니다. kg플릭스 와 함께 즐거운 시간 되세요.
			      </span>
			   </div>
				<br />
			
			   <input type="checkbox" id="answer03">
			   <label for="answer03"> Q. 어떤 콘텐츠가 있나요?</label>
			   <div>
			      <span>
			      KG플릭스는 영화(공포,로맨스,액션,SF & 판타지), 애니(교육,문화,유아), 다큐(우주,동물,의학,여행)
			         영상을 제공하고 있습니다.
			      </span>
			   </div>
			   <br />
			   
			   <input type="checkbox" id="answer04">
			   <label for="answer04"> Q. 아이들이 봐도 좋을까요?</label>
			     <div>   
			      <span>
			        아이들이 시청할경우 애니 혹은 다큐 카테고리에 다양한 컨텐츠가 제공 되고 있습니다. 영화관에서 상영하는
			         펭귄대탐험, 여름왕국, 타이거킹,헬로루카봇 등을 편안하게 집에서 시청할수 있는 멤버십 혜택을 받아보세요.
			      </span>
			   </div>
				<br />
			
			
			   <input type="checkbox" id="answer05">
			   <label for="answer05"> Q. 신작 업데이트는 언제 하나요?</label>
			   <div>
			      <span>
			         KG플릭스는 일주일에 한번씩 각국가의 인기 영상들이 메인페이지에 업데이트 되고 있습니다.
			      </span>
			   </div>
			   <div align=center>
				
				<br /><br /><br />
			   <h1 id="span3">원하시는 답변이 없으신가요? </h1>
			      <h1 id="span3">1:1문의하기</h1>
			   
			      <a href="/writeForm" id="span1"><h1>클릭</h1></a>
			   </div>
			   <br />
			   <c:if test="${member != null}">
			   		<div align="center">
			   			<h1 id="span3">내 문의목록 보기</h1>
			   			<a href="/list?user_no=${member.id}"><h1>클릭</h1></a>
			   		</div> 
			   </c:if>
		</td>
	</tr>
</table>

<br /><br /><br />
</section>

<footer>
	<jsp:include page="common/footer.jsp" />
</footer>
