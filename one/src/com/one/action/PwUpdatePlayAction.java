package com.one.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.one.dao.MemberDAO;
import com.one.dto.MemberDTO;

public class PwUpdatePlayAction implements Action {

	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("액션도착");
		String url = "index.one";
		
		String id = request.getParameter("id");
		String pw = request.getParameter("pw_val");
		System.out.println(id+", "+pw);
		
		//패스워드 수정
		MemberDAO mDao = MemberDAO.getInstance();
		int result = mDao.pwUpdate(id,pw); 
		System.out.println(result);
		if (result > 0) {
			HttpSession session = request.getSession();
			MemberDTO mDto = mDao.memOne(id);
			
			session.removeAttribute("loginUser");
			session.setAttribute("loginUser", mDto);
		}
		
		ActionForward forward = new ActionForward();
		forward.setPath(url);
		forward.setRedirect(true);
		
		return forward;
	}

}
