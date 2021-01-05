<%@page import="java.sql.Date"%>
<%@page import="book.BookVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="book.BookDAO"%>
<%@ page import="java.text.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="header.jsp" %>
	<br>
	<%
		BookDAO instance = BookDAO.getInstance();
		ArrayList<BookVO> list = instance.selectBooks();
		NumberFormat nf = NumberFormat.getNumberInstance();
		SimpleDateFormat format = new SimpleDateFormat("yyyy년 MM월 dd일");
	%>
	<table border="1">
		<tr align="center">
	 		<th width="100">도서코드</th>
	 		<th width="200">도서제목</th>
	 		<th width="100">도서저자</th>
	 		<th width="150">출판사</th>
	 		<th width="100">가격</th>
	 		<th width="100">출간날짜</th>
	 		<th width="100">탈퇴</th>
	</tr>
	<%
		for(BookVO vo : list){
			int price = vo.getPrice();
			Date day = vo.getDate();
	%>
	<tr align="center">
		<td width="100"><a href="updateBook.jsp?code=<%=vo.getCode()%>"><%=vo.getCode() %></a></td>
		<td width="200"><%=vo.getTitle() %></td>
		<td width="100"><%=vo.getWriter()%></td>
		<td width="100"><%=vo.getPub() %></td>
		<td width="100"><%=nf.format(price)%></td>
		<td width="150"><%=format.format(day)%></td>
		<td width="50"><a href="deleteBook.jsp?code=<%=vo.getCode()%>">탈퇴</a></td>
		</tr>
<%
    }
	
%>
	</table>
	
	
<%@include file="footer.jsp" %>