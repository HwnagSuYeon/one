package com.one.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.one.dao.MemberDAO;
import com.one.dto.MemberDTO;

public class MemberPlayAction implements Action{

	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String url = "index.jsp";
		
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String name = request.getParameter("name");
		String phone = request.getParameter("phone");
		String zipcode = request.getParameter("zipcode");
		String addr1 = request.getParameter("addr1");
		String addr2 = request.getParameter("addr2");
		MemberDTO mDto = new MemberDTO(id, pw, name, phone, zipcode, addr1, addr2);
		System.out.println(mDto.toString());
		MemberDAO mDao = MemberDAO.getInstance();
		int result = mDao.memInsert(mDto);
		
		if (result > 0) {
			System.out.println("회원등록 성공");
		} else {
			System.out.println("회원등록 실패");
		}
		
		ActionForward forward = new ActionForward();
		forward.setPath(url);
		forward.setRedirect(true);
		// DB에 실제 값이 변하는 작업이므로 sendRedirect의 매개변수를 true로 쓴다.
		
		return forward;
	}

}
