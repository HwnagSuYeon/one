package com.one.action;

public class ActionForward {
	//view page(결과값을 어디로 넘길지 결정)
	private String path; //path => shs_index.jsp
	private boolean isRedirect; // isRedirect => false
	
	//페이지 넘길 때 두가지 방법
	//1)sendRedirect
	//2)forward
	//true -> sendRedirect
	//false -> forward
	
	
	public String getPath() {
		return path;
	}
	public void setPath(String path) {
		this.path = path;
	}
	public boolean isRedirect( ) {
		return isRedirect;
	}
	public void setRedirect(boolean isRedirect) {
		this.isRedirect = isRedirect;
	}
}
