<%@page import="book.BookVO"%>
<%@page import="java.sql.Date"%>
<%@page import="book.BookDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
		BookDAO instance = BookDAO.getInstance();
		
		int code =  Integer.parseInt(request.getParameter("code"));
		String title = request.getParameter("title");
		String writer = request.getParameter("writer");
		int pub = Integer.parseInt(request.getParameter("pub"));
		int price = Integer.parseInt(request.getParameter("price"));
		String date = request.getParameter("date");
		
		Date day = Date.valueOf(date);
		BookVO vo = new BookVO();
		vo.setCode(code);
		vo.setTitle(title);
		vo.setWriter(writer);
		vo.setPubNum(pub);
		vo.setPrice(price);
		vo.setDate(day);
		int cnt = instance.updateMember(vo);
		
	%>
		<script>
		location.href="selectBook.jsp"//성공했다면 회원 목록으로
		</script>
	%>
</body>
</html>