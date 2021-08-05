<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<header>
    <jsp:include page="common/header.jsp"/>
</header>

	<script type="text/javascript">
	
		function send(f) {

			 if(f.searchItem.value.length < 2){
				 alert('검색어를 2글자 이상 입력해주세요');
				 f.searchItem.focus();
				 return;
			 }else{ 
				 f.submit();
			 }
			}
	</script>

<link rel="stylesheet" href="css/main1.css" />

<section>
	<table align=center width=1500>
	<tr><td width=900>

		<div align="left" >
			<div id="sub_text">KGFlix의 장점?</div>
			<div><a href="#first" id="sub_text">1. 다양하고 재미있는 콘텐츠!!</a></div>
			<div><a href="#second" id="sub_text">2. 저렴한 가격의 갓성비!!</a></div>
			<div><a href="#third" id="sub_text">3. 어린이를 위한 맞춤 콘텐츠!</a></div>
		</div>
</td><td align="center" width=600>
		<div>
			<div id="sub_text">원하시는 컨텐츠를</div>
			<div id="sub_text">검색해보세요</div>
			<div id="sub_text">
				<form action="/search" method="get">
					<input type="text" name="searchItem" placeholder="제목/카테고리를 입력해주세요" id="input_text" /> 
					<input type="button" value="검색" onclick="send(this.form);"/>
				</form>
			</div>
		</div>
	</td></tr>
	<tr><td colspan="2"><br /><br /><br />
		<hr />
		<br /><br /><br /></td></tr>
<tr ><td style="text-align: center;"> 

			<img src="img/main_img_1.jpg" width="400px"/>
	</td>
	<td>	
			<div id="sub_text">다양하고 재미있는 콘텐츠!!</div>
	</td></tr>
	<tr><td colspan="2">
	<br /><br /><br />
		<hr />
		<br /><br /><br />
		</td></tr>
		
	<tr>
		<td> 
	
		<div style="text-align: center;" id="sub_text">
			저렴한 가격의 갓성비!</div>
			</td><td>
		<div style="text-align: center;">
			<div id="sub_text" style="color: red;">월 4900원으로</div>
			<div id="sub_text" style="color: red;">모든 콘텐츠를 즐겨보세요!</div>
		</div>
	
</td></tr>
<tr><td colspan="2">
<br /><br /><br />
		<hr />
		<br /><br /><br />
</td></tr>

	<tr ><td style="text-align: center;"> 

			<img src="img/main_img_2.jpg" width="400px"/>
	</td>
	<td>	
			<div id="sub_text">어린이를 위한 맞춤 컨텐츠!!</div>
	</td></tr>

<tr><td colspan="2">
	
		<br /><br /><br />
		<hr />
	<br /><br /><br />
</td></tr>
<tr><td colspan="2" style="text-align: center;">
	<article>
		<div id="sub_text">
			지금 바로 KGFlix를 <br />
			<font >이용해 보세요</font>
		</div>
		<div>
			<div id="sub_text">
				<a href="joinpage" style="color: red;">회원가입하러 가기</a>
			</div>
		</div>
	</article>

	<article>
		<div></div>
		<hr />
	</article>
</td></tr>
</table>


</section>
<footer>
	<jsp:include page="common/footer.jsp" />
</footer>
