package com.one.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.one.dao.BoardDAO;
import com.one.dto.BoardDTO;

public class BoardUpdatePlayAction implements Action {

	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String url = "boardList.one";
		
		int bno = Integer.parseInt(request.getParameter("bno"));
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		String writer = request.getParameter("writer");
		
		BoardDTO bDto = new BoardDTO(bno, title, content, writer);
		System.out.println("★★★★★★★★★★★★★★★★★★★★★" + bDto.toString());
		BoardDAO bDao = BoardDAO.getInstance();
		int result = bDao.boardUpdatePlay(bDto);
		
		if (result > 0) {
			System.out.println("게시글 등록 성공");
		} else {
			System.out.println("게시글 등록 실패");
		}
		
		ActionForward forward = new ActionForward();
		forward.setPath(url);
		forward.setRedirect(true);
		
		return forward;
	}

}
