<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%> 


<title>영상 등록</title>
<link rel="stylesheet" href="css/admin.css" />

<script type="text/javascript">
	var check = '${msg}'
	if(check == 'suc'){
		alert('정상등록되었습니다.');
	}
</script>

<body>
<header><jsp:include page="../common/ad_header.jsp" /></header>

<section>
	<article>
		<br />
		<div align=center id="title1">영상등록</div>
		<br />
		<form action="uploadAction" method="post" enctype="multipart/form-data">
			<table align=center id="font1">
				<tr>
					<td id="pd">비디오 등록</td>
					<td id="pd"><input type="file" name="video" /></td>
				</tr>
				<tr>
					<td id="pd">썸네일 등록</td>
					<td id="pd"><input type="file" name="thumb" /></td>
				</tr>
				<tr>
					<td id="pd">콘텐츠 제목</td>
					<td id="pd"><input type="text" placeholder="콘텐츠 제목 입력" name="title" id="textbox"/></td>
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
					<td id="pd">장르</td>
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
					<th colspan=2 id="pd"> <br /><input type="submit" value="저장" id="btn1" /></th>
				</tr>
			</table>
		</form>
	</article>
</section>

</body>
