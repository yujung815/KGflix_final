<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>실패</h1>
<script type="text/javascript">
var message = '${msg}';
var returnUrl='${url}';
alert(message);
document.location.href=returnUrl;
</script>
</body>
</html>