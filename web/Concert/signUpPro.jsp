<%@page import="concert.member.ConcertDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="dto" class="concert.member.ConcertDTO">
	<jsp:setProperty	name="dto" property="*"/>
</jsp:useBean>
<%
	ConcertDAO dao =ConcertDAO.getInstance();
	int check = dao.idCheck(dto.getId()); //1 = 중복 존재   ,    -1 = 중복 X
			
	if(check == 1){
		%>
		<script>
			alert('아이디가 중복됩니다.');
			location.href('signUp.jsp');
		</script>
	<%}else{
		dao.insert(dto);%>
		<script>
			alert('가입을 완료하였습니다.');
			
			location.href('login.jsp');
		</script>
	<%}%>

</body>
</html>