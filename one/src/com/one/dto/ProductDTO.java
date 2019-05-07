package com.one.dto;

import java.util.Date;

public class ProductDTO {
	// 변수
	private String p_code;
	private String p_type;
	private String p_sidename;
	private String p_name;
	private int p_price;
	private String p_img;
	private int p_count;
	private int p_like;
	private Date p_date;
	
	//생성자
	public ProductDTO() {
		super();
	}

	public ProductDTO(String p_code, String p_type, String p_sidename, String p_name, int p_price, String p_img,
			int p_count, int p_like, Date p_date) {
		super();
		this.p_code = p_code;
		this.p_type = p_type;
		this.p_sidename = p_sidename;
		this.p_name = p_name;
		this.p_price = p_price;
		this.p_img = p_img;
		this.p_count = p_count;
		this.p_like = p_like;
		this.p_date = p_date;
	}

	public String getP_code() {
		return p_code;
	}

	public void setP_code(String p_code) {
		this.p_code = p_code;
	}

	public String getP_type() {
		return p_type;
	}

	public void setP_type(String p_type) {
		this.p_type = p_type;
	}

	public String getP_sidename() {
		return p_sidename;
	}

	public void setP_sidename(String p_sidename) {
		this.p_sidename = p_sidename;
	}

	public String getP_name() {
		return p_name;
	}

	public void setP_name(String p_name) {
		this.p_name = p_name;
	}

	public int getP_price() {
		return p_price;
	}

	public void setP_price(int p_price) {
		this.p_price = p_price;
	}

	public String getP_img() {
		return p_img;
	}

	public void setP_img(String p_img) {
		this.p_img = p_img;
	}

	public int getP_count() {
		return p_count;
	}

	public void setP_count(int p_count) {
		this.p_count = p_count;
	}

	public int getP_like() {
		return p_like;
	}

	public void setP_like(int p_like) {
		this.p_like = p_like;
	}

	public Date getP_date() {
		return p_date;
	}

	public void setP_date(Date p_date) {
		this.p_date = p_date;
	}

	@Override
	public String toString() {
		return "ProductDTO [p_code=" + p_code + ", p_type=" + p_type + ", p_sidename=" + p_sidename + ", p_name="
				+ p_name + ", p_price=" + p_price + ", p_img=" + p_img + ", p_count=" + p_count + ", p_like=" + p_like
				+ ", p_date=" + p_date + "]";
	}
	
	
	
}
