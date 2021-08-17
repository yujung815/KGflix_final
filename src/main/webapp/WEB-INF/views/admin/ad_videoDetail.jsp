<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html> 
<html>
<head>
<meta charset="EUC-KR">
<title>영상 상세</title>
<link rel="stylesheet" href="css/admin.css" />
</head>
<body>
	<header><jsp:include page="../common/ad_header.jsp"/></header>

		<br />
		<div align=center>
			<img src="${vo.thumb_uri}" width=400 height=300/>
			<div id="video_name">${vo.title}</div> 
			<button type="button" onclick="location.href='ad_videoUpdate?con_no=${vo.con_no}'" id="btn2"">수정</button>
			<button type="button" onclick="del()" id="btn2">삭제</button>
				<script>
					function del(){
						if(confirm("삭제하시겠습니까?") == true){
							location.href="/deleteContent?con_no=${vo.con_no}"
							alert("삭제되었습니다.")
						}else{
							return false;
						}
					}
				</script>
			<button type="button" onclick="location.href='ad_videoSearch'" id="btn2">돌아가기</button>
		</div>

</body>
</html>