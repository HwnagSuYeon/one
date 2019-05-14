package com.one.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;

import com.one.dao.LoginDAO;
import com.one.dto.MemberDTO;

public class LoginAjaxAction implements Action {

	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//Session을 사용하기위해 session 객체 생성
		//session = WAS를 활용하여 web에서 사용하는 공용저장소
		HttpSession session = request.getSession();
		String message = "";
		
		
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		
		LoginDAO lDao = LoginDAO.getInstance();
		MemberDTO mDto = lDao.loginCheck(id, pw);
		
		
		if(mDto!=null) { //로그인 성공
			// Session에 로그인 정보 담음
			// 세션에서 loginUser정보를 삭제(혹시모를 기존에 남아있는 값을 제거)
			session.removeAttribute("loginUser");
			// 세션에 loginUser정보를 저장
			session.setAttribute("loginUser", mDto);
			message = "1";
		} else {
			message = "-1";
		}
		
		// json객체생성 : 컴퓨터가 읽을 수 있는 양식
		JSONObject jObj = new JSONObject();
		jObj.put("message", message);
		response.setContentType("application/x-json; charset=UTF-8");
		response.getWriter().print(jObj);
		return null;
	}

}
