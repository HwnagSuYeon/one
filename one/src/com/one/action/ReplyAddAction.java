package com.one.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.one.dao.BoardDAO;
import com.one.dao.ReplyDAO;
import com.one.dto.ReplyDTO;

public class ReplyAddAction implements Action {

	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String url = "";
		
		int bno = Integer.parseInt(request.getParameter("re_bno"));
		String writer = request.getParameter("re_writer");
		String content = request.getParameter("re_content");
		
		ReplyDTO rDto = new ReplyDTO(content, writer, bno);
//		System.out.println("댓글정보받아옴>>"+rDto);
		
		ReplyDAO rDao = ReplyDAO.getInstance();
		int result = rDao.replyAdd(rDto);
		
		if(result > 0) {
			System.out.println("댓글등록 성공");
			BoardDAO bDao = BoardDAO.getInstance();
			result = bDao.replyCntUpdate(bno);
			
			if(result > 0) {
				System.out.println("댓글수 증가 성공");
			} else {
				System.out.println("댓글수 증가 실패");
			}
		} else {
			System.out.println("댓글등록 실패");
		}
		
		JSONObject jObj = new JSONObject();
		jObj.put("result", result);
		response.setContentType("application/x-json; charset=UTF-8");
		response.getWriter().print(jObj);
		
		
		return null;
	}

}
