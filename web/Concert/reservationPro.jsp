<%@page import="concert.member.ConcertDAO"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<% request.setCharacterEncoding("UTF-8"); %>
<form method= "post" action="">
<jsp:useBean id="dto" class="concert.member.ConcertDTO">
	<jsp:setProperty	name="dto" property="seatClass" param="seatClass"/>
	<jsp:setProperty	name="dto" property="seatNo" param="seatNo"/>
	<jsp:setProperty	name="dto" property="pname" param="pname"/>
</jsp:useBean>
	<%-- reservation에서 pname을 param으로 받아서 dto의 pname에 setting --%>
<%
	String id = (String)session.getAttribute("memId");

	ConcertDAO dao = ConcertDAO.getInstance();
	
	if(dao.checkseat(dto)){%>
		<script>
			alert('이미 예매된 좌석입니다.')
			location.href('reservation.jsp')
		</script>
	<%}else{ 
		dao.reserve(dto, id);%>
		<script>
			alert('예매 완료!!')
			location.href('concertMain.jsp')
		</script>
	<%}%>
	

<a href="concertMain.jsp">예매 사이트 메인 화면으로</a>

</form>
</body>
</html>