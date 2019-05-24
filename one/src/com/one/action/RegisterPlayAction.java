package com.one.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.one.dao.BoardDAO;
import com.one.dto.BoardDTO;

public class RegisterPlayAction implements Action {

	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String url = "boardList.one"; //index에서 Q&A경로를 누르는 순간 DB에서 업데이트된 모든 리스트를 불러오므로, 그 경로를 써줘야함
		
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		String writer = request.getParameter("writer");
		
		BoardDTO bDto = new BoardDTO(title, content, writer);
		System.out.println("★★★★★★★★★★★★★★★★★★★★★" + bDto.toString());
		BoardDAO bDao = BoardDAO.getInstance();
		int result = bDao.registerPlay(bDto);
		
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
