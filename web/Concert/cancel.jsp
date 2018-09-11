<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<form method="post" action="cancelPro.jsp">
<table>
<caption><h2>콘서트 예약 취소</h2></caption>
<tr> <th clospan="2">정말 예약 취소 하실 건가요?? ㅜㅜㅜ</th>
</tr>
<tr> 
<th colspan="2">
<img src="IMG_7215.JPG" width =200>
</th>
</tr>
<tr>
	<td>예약 이름</td>
	<td><input type="text" placeholder="이름" name="pname"></td>
</tr>
</table>
<input type="submit" value="확인">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="reset" value="취소">
</form>
<br>
<a href="concertMain.jsp">예매 사이트 메인 화면으로</a>


</body>
</html>