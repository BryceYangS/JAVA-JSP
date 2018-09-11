<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	session.invalidate();
%>
	<script>
		alert('로그아웃되었습니다.');
		location.href('login.jsp');
	</script>
</body>
</html>