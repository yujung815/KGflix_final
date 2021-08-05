<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>영상 등록</title>
<link rel="stylesheet" href="css/admin.css" />

</head>
<body>

	<header><jsp:include page="../common/ad_header.jsp" /></header>
	<section>
		<article>
			<br />
			<form action="uploadAction" method="post" enctype="multipart/form-data">
				<table align=center>
					<tr>
						<th id="font">영상등록</th>
					</tr>

					<tr>
						<th>
							<div id="white">
								<br /> 비디오 입력<input type="file" name="video" /> <br />
								<br /> 썸네일 입력<input type="file" name="thumb" /> <br /><br />
								<div align="left">
								제목 입력 <input type="text" placeholder="콘텐츠 제목 입력" id="textbox" name="title" /> <br />
								</div>
								<br />
									</div>
						</th>
					</tr>
				
					<tr>
						<th id="checkbox">특이사항 <input type="checkbox" name="type" value="new" />
						신작 <input type="checkbox" name="type" value="popular" />
							인기 <input type="checkbox" name="type" value="free" />무료 <br /> <br /> 
							장르 선택 
							<select name="category" id="combobox">
								<option value="movie">영화</option>
								<option value="docu">다큐</option>
								<option value="ani">애니</option>
								<option value="entertain">예능</option>
								<option value="drama">드라마</option>
								<option value="social">시사</option>
						</select> <br />
						<br /> <input type="submit" value="저장" id="button3" />
						</th>
					</tr>

				</table>
			</form>
		</article>
	</section>

</body>
</html>