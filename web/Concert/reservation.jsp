<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<form method="post" action="reservationPro.jsp">
<table>
<caption><h2>콘서트 예약</h2></caption>
<tr>
	<td>예약 이름</td>
	<td><input type="text" name="pname"> </td>
</tr>
<tr>
	<td>좌석 구분</td>
	<td>
	<select name="seatClass"> 
		<option value="S">S등급</option>
		<option value="A">A등급</option>
		<option value="B">B등급</option>
	</select>
	</td>
</tr>
<tr>
	<td>좌석 번호</td>
	<td>
	<select name="seatNo">
	<% for(int i=0; i<10; i++){
	%> 
		<option value="<%= (i+1)%>"> <%= (i+1) %> </option>
	<%} %>
	</select>
	</td>
</tr>
<tr>
	<td><input type="submit" value="확인"></td> 
	<td><input type="reset" value="취소"></td>
</tr>
</table>
</form>
<a href="concertMain.jsp">예매 사이트 메인 화면으로</a>
	
</body>
</html>