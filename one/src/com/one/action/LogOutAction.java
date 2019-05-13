package com.one.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LogOutAction implements Action {

	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		
		if (session != null) {
			//session초기화
			session.invalidate();
		}
		// referer => 내 페이지 바로 앞의 url 정보를 알려주는 역할을 함. 앞의 주소를 계속 갖고다니는 것. ajax를 사용하지 않고, 이전의 페이지를 띄어줄 때 사용한다.
		String referer = request.getHeader("referer");
		
		System.out.println("url: "+referer);
		
		String url= referer;
		ActionForward forward = new ActionForward();
		forward.setPath(url);
		forward.setRedirect(true);
		
		return forward;
	}

}
