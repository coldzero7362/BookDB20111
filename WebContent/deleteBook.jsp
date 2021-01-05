<%@page import="book.BookDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body  onload="submit()">
	<% 
		request.setCharacterEncoding("utf-8");
		BookDAO instance = BookDAO.getInstance();
		int code = Integer.parseInt(request.getParameter("code"));
	%>
	<form method="post" action="deleteBookPro.jsp">
		<input type="hidden" name="code" value="<%=code%>">
	</form>
</body>
</html>