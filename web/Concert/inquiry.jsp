<%@page import="concert.member.ConcertDAO"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
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

<%
	String id = (String)session.getAttribute("memId");

	ConcertDAO dao = ConcertDAO.getInstance();
	
	ResultSet rs = dao.inquiry(id);
	
	while(rs.next()){
		out.print("예약 이름	:	" + rs.getString("예약이름")
			+ "	||	좌석 구분	:	" + rs.getString("좌석구분")
			+ "	||	좌석 번호	:	" + rs.getString("좌석번호") + "<br>");
		
	}
	
	dao.close();

%>
<br>
<a href="concertMain.jsp">예매 사이트 메인 화면으로</a>

</body>
</html>