<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<script type="text/javascript">
var message = '${msg}';
var returnUrl='${url}';
alert(message);
document.location.href=returnUrl;
</script>
</body>
</html>