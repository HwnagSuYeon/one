package com.one.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.one.dao.BoardDAO;
import com.one.dto.BoardDTO;

public class BoardViewAction implements Action {

	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String url = "board/board_view.jsp";
		
		String bno = request.getParameter("bno");
		BoardDAO bDao = BoardDAO.getInstance();
		HttpSession session = request.getSession();
		
		// 조회수 증가(+1) -> 클릭한순간 조회수 증가
		bDao.viewCnt(bno, session);
		
		
		// 게시글 1건 상세 조회 -> 상세게시글에 진입하면 증가된 조회수 출력
		BoardDTO bDto = bDao.view(bno);
		request.setAttribute("one", bDto);
		
		ActionForward forward = new ActionForward();
		forward.setPath(url);
		forward.setRedirect(false);
		
		return forward;
	}

}
