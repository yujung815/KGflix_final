<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<title>Insert title here</title>
<link rel="stylesheet" href="css/cs.css"> 
<link rel="stylesheet" href="css/main.css">

<script type="text/javascript">

	function process(f) {
		if(f.cs_title.value == ""){
			alert('소분류를 입력해주세요');
			f.cs_title.focus();
			return;
		}else if(f.cs_content.value == ""){
			alert('내용을 입력해주세요');
			f.cs_title.focus();
			return;
		}else if(f.e_mail.value == ""){
			alert('이메일을 입력해주세요');
			f.e_mail.focus();
			return;
		}
		else{
			alert('정상적으로 1:1문의가 완료되었습니다!');
			f.submit();
		}
	}

</script>

<body>
<header>
      <jsp:include page="common/header.jsp"/>
</header>
<section>
	<form action ="write" method="post">
		<article align=center>
			<div id="cs_title">KG플릭스 1:1 문의</div> <br /><br />
			<div id="email">입력하신 이메일로 답변 보내드립니다.</div> 
		</article>
		<br /><br />
	<table id="insert" align=center>
			<tr>
				<th width=120px id="pd"> 이메일 </th>
				<td id="pd">
					<c:if test="${member != null }">
						${member.email }
						<input type="hidden" name="e_mail" value="${member.email }" id="box"> 
					</c:if>
					<c:if test="${member == null }">
						<input type="text" name="e_mail" placeholder="이메일을 입력하세요" id="box"> 
					</c:if>
				</td>
			<tr>
				<th id="pd">아이디</th>
				<td id="pd">
				<c:if test="${member != null }">
						${member.id } 
						<input type="hidden" name="user_no" value="${member.id }" />
					</c:if>
					<c:if test="${member == null }">
						비회원 
						<input type="hidden" name="user_no" value="비회원" />
					</c:if>
				</td>
			</tr>
			<tr>
				<th id="pd">문의사항 종류</th>
				<td id="pd"><select class="form-control" name="cs_title" placeholder="제목" id="box2"> 
							<option value=""disabled selected hidden>제목</option>
								<option>결제 오류</option>
								<option >영상 출력 오류</option><option >회원 탈퇴 문의</option>
								<option >로그인 문제 지원받기</option>
								<option>기타 문의 사항</option>
						</select>
				</td>
			</tr>	
			<tr>
				<th id="pd">내용 입력</th>
				<td id="pd"><textarea name="cs_content" placeholder="내용을 입력해주세요" id="box3"></textarea></td>
			</tr>
			<tr>
				<td colspan="2" align=center>
					<br />
					<input type="button" onclick="process(this.form);" value="보내기" class="button" />
				</td>
			</tr>
	</table>
	</form>
</section>
<br /><br /><br /><br /><br />
</body>

<footer>
	<jsp:include page="common/footer.jsp" />
</footer>
