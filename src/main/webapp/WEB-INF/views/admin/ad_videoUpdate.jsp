<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html> 
<html>
<head>
<meta charset="EUC-KR">
<title>영상 수정</title>
<link rel="stylesheet" href="css/admin.css" />
<script>
	window.onload = function(){}
	document.frm.category = "${vo.category}"
</script>
</head>
<body>
<header><jsp:include page="../common/ad_header.jsp"/></header>

<section>
	<article>
		<br />
		<div align=center id="title1">영상수정</div>
		<br />
		<form action="updateinfo?con_no=${vo.con_no}" method="post">
			<table align=center id="font1">
				<tr>
					<td colspan=2><img src="${vo.thumb_uri}" id="thumb2"/><br /><br /></td>
				</tr>
				<tr>
					<td id="pd">제목입력</td>
					<td id="pd">
						<input type="text" value="${vo.title}" id="textbox" name="title" />
						<input type="hidden" name="name" value="${vo.con_no}">
					</td>
				</tr>
				<tr>
					<td id="pd">특이사항</td>
					<td id="pd">
						<input type="checkbox" name="new_no" value="1" id="checkbox"/> 신작 &nbsp;
						<input type="checkbox" name="pop" value="1" id="checkbox"/> 인기 &nbsp;
						<input type="checkbox" name="free" value="1" id="checkbox"/> 무료
					</td>
				</tr>
				<tr>
					<td id="pd">장르선택</td>
					<td id="pd">
						<select name="category" id="combobox">
							<option value="movie">영화</option>
							<option value="docu">다큐</option>
							<option value="ani">애니</option>
							<option value="entertain">예능</option>
							<option value="drama">드라마</option>
							<option value="social">시사</option>
						</select>
					</td>
				</tr>
				<tr>
					<th colspan=2> <br /><input type="submit" value="저장" id="btn1" /></th>
				</tr>			
			</table>
		</form>
	</article>
</section>
</body>
</html>