package com.one.dto;

public class LikeDTO {
	private int bno;
	private String id;
	
	public LikeDTO() {
		super();
	}

	public LikeDTO(int bno, String id) {
		super();
		this.bno = bno;
		this.id = id;
	}

	public int getBno() {
		return bno;
	}

	public void setBno(int bno) {
		this.bno = bno;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	@Override
	public String toString() {
		return "LikeDTO [bno=" + bno + ", id=" + id + "]";
	}
	
	
}
