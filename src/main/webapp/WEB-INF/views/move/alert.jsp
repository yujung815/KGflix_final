<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
   <script>
	var check = '${msg}';
	if(check == 'fail'){
		alert('로그인 후 사용가능합니다');
		history.go(-1);
	}
</script>