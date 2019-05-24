package com.one.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.one.dao.BoardDAO;
import com.one.dao.ReplyDAO;
import com.one.dto.ReplyDTO;

public class ReplyRemoveAction implements Action {

	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int rno = Integer.parseInt(request.getParameter("rno"));
		String strBno = request.getParameter("bno");
		int bno = Integer.parseInt(strBno);
		System.out.println(bno+", "+rno);
		
		
		ReplyDAO rDao = ReplyDAO.getInstance();
		int result = rDao.replyRemove(rno);
		
		if (result > 0) {
			System.out.println("댓글삭제 성공");
			// 댓글삭제 성공시 boardList.jsp에서 댓글의 갯수가 줄어야한다
			BoardDAO bDao = BoardDAO.getInstance();
			String flag = "minus";
			bDao.replyCntUpdate(strBno, flag);
			
			if(result > 0) {
				System.out.println("댓글수 -1성공");
			} else {
				System.out.println("댓글수 -1실패");
			}
			
		} else {
			System.out.println("댓글삭제 실패");
		}
		
		return null;
	}

}
