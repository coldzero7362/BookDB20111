<%@page import="book.BookVO"%>
<%@page import="java.sql.*"%>
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
		
		String msg = null;
		Date day = Date.valueOf(date);
		System.out.print(day);
		BookVO vo = new BookVO();
		vo.setCode(code);
		vo.setTitle(title);
		vo.setWriter(writer);
		vo.setPubNum(pub);
		vo.setPrice(price);
		vo.setDate(day);
		int cnt = instance.insertBook(vo);
		
		if(cnt > 0){msg = "도서 등록 성공";}
		else msg = "도서 등록 실패";
	%>
		<script>
			alert('<%=msg%>');
			location.href('selectBook.jsp');
		</script>
</body>
</html>