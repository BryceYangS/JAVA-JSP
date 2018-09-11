<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form method="post" action="loginPro.jsp">

		<table>
			<caption>
				<b><mark>양호석</mark>
				콘서트 예매 로그인</b>
			</caption>
			<tr>
				<img src="IMG_7179.JPG" width=300>	
			</tr>
			<tr>
				<td>아이디</td>
				<td><input  type="text" placeholder="id" name="id"></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" placeholder="password" name="passwd"></td>
			</tr>
			<tr>
				<td><input type="submit" value="로그인"></td>
				<td><input type="reset" value="취소"></td>
	</form>
	<form method="post" action="signUp.jsp">
				<td><input type="submit" value="회원가입"></td>
			</tr>
		</table>
		</form>
		
</body>
</html>