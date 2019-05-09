package com.one.dto;

import java.util.Date;

public class MemberDTO {
	// 변수
	private String id;
	private String pw;
	private String zipcode;
	private String addr1;
	private String addr2;
	private Date regdate;
	
	//생성자
	public MemberDTO() {
		super();
	}

	public MemberDTO(String id, String pw, String zipcode, String addr1, String addr2, Date regdate) {
		super();
		this.id = id;
		this.pw = pw;
		this.zipcode = zipcode;
		this.addr1 = addr1;
		this.addr2 = addr2;
		this.regdate = regdate;
	}

	
	//getter setter
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public String getZipcode() {
		return zipcode;
	}

	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}

	public String getAddr1() {
		return addr1;
	}

	public void setAddr1(String addr1) {
		this.addr1 = addr1;
	}

	public String getAddr2() {
		return addr2;
	}

	public void setAddr2(String addr2) {
		this.addr2 = addr2;
	}

	public Date getRegdate() {
		return regdate;
	}

	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}

	
	//toString
	@Override
	public String toString() {
		return "MemberDTO [id=" + id + ", pw=" + pw + ", zipcode=" + zipcode + ", addr1=" + addr1 + ", addr2=" + addr2
				+ ", regdate=" + regdate + "]";
	} 
}
