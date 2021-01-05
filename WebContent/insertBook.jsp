<%@page import="book.BookDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="header.jsp" %>
	<% 
		BookDAO instance = BookDAO.getInstance();
		int bookCode = instance.getMaxcode();
	%>
	<script>
function inputdayNumber(obj) {
    var number = obj.value.replace(/[^0-9]/g, "");
    var day = "";
       
    if(number.length < 4) {
        return number;
    } else if(number.length < 7) {
       day += number.substr(0, 4);
       day += "-";
       day += number.substr(4);
    }else if(number.length < 11) {
       day += number.substr(0, 4);
       day += "-";
       day += number.substr(4, 2);
      day += "-";
      day += number.substr(6);
    }
    
    obj.value = day;
}
</script>
	<form method="post" action="insertBookPro.jsp" name="regForm" onsubmit="return checkAll()">
		<table border="1" style="width:400">
		<tr><th>도서코드</th><td><input type ="text" name ="code" value="<%=bookCode%>" readonly="readonly"></td>
		</tr>
		<tr><th>도서제목</th><td><input type = "text" name = "title" required="required"></td>
		</tr>
		<tr><th>도서저자</th><td><input type = "text" name ="writer" value="" required="required"></td>
		</tr>
		<tr><th>출판사코드</th>
			<td><select name = "pub">
					<option value="1001">양영디지털</option>
					<option value="1002">북스미디어</option>
					<option value="1003">한빛아카데미</option>
					<option value="1004">이지스</option>
				</select>	
			</td>
		</tr>
		<tr><th>가격</th><td><input type = "text" name = "price" value="" required="required"></td>
		</tr>
		<tr><th>출간날짜</th><td><input type = "text" name = "date" value="" required="required" onkeyup="inputdayNumber(this);" maxlength="13"></td>
		</tr>
		<tr><td colspan="2" align="center">
			<input type = "submit" value="등록"><input type = "reset" value="재작성">
		</td>
		</tr>
		</table>
	</form>
	
	
<%@include file="footer.jsp" %>