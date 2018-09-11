<%@page import="concert.member.ConcertDAO"%>
<%@page import="concert.member.ConcertDTO"%>
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
	<jsp:useBean id="dto" class="concert.member.ConcertDTO">
		<jsp:setProperty name="dto" property="pname" param="pname" />
	</jsp:useBean>
<%
String id = (String)session.getAttribute("memId");
ConcertDAO dao = ConcertDAO.getInstance();

dao.cancel(id, dto);


%>

예약 취소 완료!!!<br>
<a href="concertMain.jsp">처음화면으로</a>


</body>
</html>