package com.one.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.one.dao.MemberDAO;
import com.one.dto.MemberDTO;

public class DropMemberPlayAction implements Action {

	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String url= "index.one";
		HttpSession session = request.getSession();
		//session에있는 유저정보 꺼내오는 방법:DTO로 담겨서 낱개로는 못꺼내므로 DTO로 먼저 꺼내고 다음 DTO에서 낱개로 꺼냄.
		// sesison에 담기는 순간 타입정보가 사라져서 형변환을 반드시 해줘야함.(MemberDTO)
		MemberDTO mDto= (MemberDTO)session.getAttribute("loginUser");
		String id = mDto.getId();
		MemberDAO mDao = MemberDAO.getInstance();
		int result = mDao.memDelete(id);
		
		if(result > 0) {
			session.invalidate();
		}
		
		ActionForward forward = new ActionForward();
		forward.setPath(url);
		forward.setRedirect(true);
		
		return forward;
	}

}
