<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<% request.setCharacterEncoding("UTF-8"); %>
	<img src ="IMG_7233.JPG" width=300>
<h2>콘서트 예약 시스템</h2>
<table>
<tr>
<td>
<form method="post" action="reservation.jsp">
<input type="submit" value="예약">
</form>
</td>
<td>
<form method="post" action="inquiry.jsp">
<input type="submit" value="조회">
</form>
</td>
<td>
<form method="post" action="cancel.jsp">
<input type="submit" value="취소">
</form>
</td>
<td>
<form method="post" action="logout.jsp">
<input type="submit" value="로그아웃">
</form>
</td>
</tr>
</table>

</body>
</html>