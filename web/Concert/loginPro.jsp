<%@page import="concert.member.ConcertDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
	%>

	<%
		ConcertDAO dao = ConcertDAO.getInstance();

		String id = request.getParameter("id");
		String passwd = request.getParameter("passwd");

		if (dao.login(id, passwd)) {
			session.setAttribute("memId", id);
			response.sendRedirect("concertMain.jsp");
		} else {
	%>
		<script>
		alert('아이디와 비밀번호를 다시 확인하세요.')
		location.href('login.jsp')
		</script>

	<%
		}
	%>
</body>
</html>