package com.one.action;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.one.common.Constants;
import com.one.dao.BoardDAO;

import oracle.net.aso.i;

public class BoardDeleteAction implements Action {

	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// D드라이브에있는 첨부파일 삭제
		String filename = request.getParameter("filename");
		// 만약 첨부파일이 없으면
		if(!filename.equals("-")) {
			File file = new File(Constants.UPLOAD_PATH+filename);
			file.delete();
		}
		
		String url = "boardList.one";
		
		int bno = Integer.parseInt(request.getParameter("bno"));
		BoardDAO bDao = BoardDAO.getInstance();
		int result = bDao.boardDelete(bno);
		
		ActionForward forward = new ActionForward();
		forward.setPath(url);
		forward.setRedirect(true);
		
		return forward;
	}

}
