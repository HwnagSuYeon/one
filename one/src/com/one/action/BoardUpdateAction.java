package com.one.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.one.dao.BoardDAO;
import com.one.dto.BoardDTO;

public class BoardUpdateAction implements Action {

	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// boardUpdateAction에서는 기존에 있는 DB데이터를 화면단에 띄어주는 역할(select)
		// boardUpdatePlayActio에서는 수정된 데이터를 DB 에 update시켜주는 역할  
		String url = "board/board_modify.jsp";
		
		String bno = request.getParameter("bno");
		BoardDAO bDao = BoardDAO.getInstance();
		
		// 수정할 게시물의 정보를 가져옴(화면단에서 정보를 뿌려주기위해)
		BoardDTO bDto = bDao.view(bno);
		request.setAttribute("one", bDto);
		
		ActionForward forward = new ActionForward();
		forward.setPath(url);
		forward.setRedirect(false);
		
		return forward;
	}

}
