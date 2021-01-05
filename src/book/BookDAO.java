package book;

import java.sql.*;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;



public class BookDAO {
	private static BookDAO instance = new BookDAO();
	
	public static BookDAO getInstance() {
		return instance;
	}
	
	public Connection getConnection() {// sql연결
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String user = "hr";
		String password = "hr";
		Connection conn = null;
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection(url, user,password);
			System.out.println("오라클 접속 성공");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return conn;
	}
	
	public ArrayList<BookVO> selectBooks(){
		ArrayList<BookVO> list = new ArrayList<BookVO>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = instance.getConnection();
			String selectSql = "SELECT * FROM BOOK_TBL";
			pstmt = conn.prepareStatement(selectSql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				BookVO vo = new BookVO();
				vo.setCode(rs.getInt(1));
				vo.setTitle(rs.getString(2));
				vo.setWriter(rs.getString(3));
				vo.setPubNum(rs.getInt(4));
				vo.setPrice(rs.getInt(5));
				vo.setDate(rs.getDate(6));
				
				int bookpub = rs.getInt(4);
					
				switch(bookpub) {
				case 1001: 
					vo.setPub("양영디지털"); break;
				case 1002:	
					vo.setPub("북스미디어"); break;
				case 1003:	
					vo.setPub("한빛아카데미"); break;
				case 1004:	
					vo.setPub("이지스");	break;
				}
				list.add(vo);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("select에서 오류남");
		}
		return list;
	}
	
	public int insertBook(BookVO vo) {//요소를 추가하는 메서드
		int cnt = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = getConnection();
			String insertSql = "INSERT INTO book_TBL(bcode, btitle, bwriter, bpub, bprice,bdate)"
					+ "VALUES(?,?,?,?,?,?)";//다 넣어줌
			pstmt = conn.prepareStatement(insertSql);
			String msg = null;
			
			pstmt.setInt(1, vo.code);
			pstmt.setString(2, vo.title);
			pstmt.setString(3, vo.writer);
			pstmt.setInt(4, vo.pubNum);
			pstmt.setInt(5, vo.price);
			pstmt.setDate(6, vo.date);
			cnt = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return cnt;
	}
	public int updateMember(BookVO vo) {//수정해 주는 메서드
		int cnt = 0;
		String msg = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = getConnection();
			String updateSql = "UPDATE book_TBL SET btitle=?,bwriter=?,bpub=?,bprice=?,bdate=? WHERE bcode=?";//memno이 일치하는 사용자의 정보를 수정
			
			pstmt = conn.prepareStatement(updateSql);
			pstmt.setString(1, vo.title);
			pstmt.setString(2, vo.writer);
			pstmt.setInt(3, vo.pubNum);
			pstmt.setInt(4, vo.price);
			pstmt.setDate(5, vo.date);
			pstmt.setInt(6, vo.code);
			cnt = pstmt.executeUpdate();
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return cnt;
	}
	public int deleteBook(int code) {//지워주는 메서드
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int cnt=0;
		try {
			conn = getConnection();
			String deleteSql = "DELETE FROM BOOK_TBL WHERE BCODE=?";//memno가 일치하는거 지워버림
			pstmt = conn.prepareStatement(deleteSql);
	
			pstmt.setInt(1, code);
			cnt = pstmt.executeUpdate();
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		return cnt;
	}
	public int getMaxcode() {//가장 높은 memno를 찾는 메서드
		int code = 10100;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = getConnection();
			String getNoSql = "SELECT MAX(bcode) FROM book_TBL";//대충 테이블에서 가장큰 memno를 찾겠다는 내용
			pstmt = conn.prepareStatement(getNoSql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				code = rs.getInt(1)+1;
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("버근가");
		}
		return code;
	}
	public BookVO getAcode(int bcode) {//한줄 가져오는 메서드
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		BookVO vo = new BookVO();
		try {
			conn = instance.getConnection();
			String sql = "select * from Book_TBL where bcode = ?";//한줄만 가져오기
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bcode);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				vo.setCode(rs.getInt(1));
				vo.setTitle(rs.getString(2));
				vo.setWriter(rs.getString(3));
				vo.setPubNum(rs.getInt(4));
				vo.setPrice(rs.getInt(5));
				vo.setDate(rs.getDate(6));
				
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return vo;
	}
}
