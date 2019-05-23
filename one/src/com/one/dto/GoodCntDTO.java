package com.one.dto;

public class GoodCntDTO {
	// 변수
	private int gno;
	private String id;
	private int bno;
	
	// 생성자
	public GoodCntDTO() {
		super();
	}

	public GoodCntDTO(int gno, String id, int bno) {
		super();
		this.gno = gno;
		this.id = id;
		this.bno = bno;
	}

	// getter(), setter()
	public int getGno() {
		return gno;
	}

	public void setGno(int gno) {
		this.gno = gno;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public int getBno() {
		return bno;
	}

	public void setBno(int bno) {
		this.bno = bno;
	}
	
	//toString()
	@Override
	public String toString() {
		return "GoodCntDTO [gno=" + gno + ", id=" + id + ", bno=" + bno + "]";
	}
	
	
	
	
	
}
