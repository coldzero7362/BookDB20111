package book;

import java.sql.Date;

public class BookVO {
	int code;
	String title;
	String writer;
	int pubNum;
	String pub;
	int price;
	Date date;
	
	
	public BookVO(int code, String title, String writer,int pubNum,String pub, int price,Date date) {
		this.code = code;
		this.title = title;
		this.writer = writer;
		this.pubNum = pubNum;
		this.pub = pub;
		this.price = price;
		this.date = date;
	}
public BookVO() {
		
	}
	public int getCode() {
		return code;
	}
	public void setCode(int code) {
		this.code = code;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public int getPubNum() {
		return pubNum;
	}
	public void setPubNum(int pubNum) {
		this.pubNum = pubNum;
	}
	public String getPub() {
		return pub;
	}
	public void setPub(String pub) {
		this.pub = pub;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	

}
