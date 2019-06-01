package com.one.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;

import com.one.dao.BoardDAO;
import com.one.dao.LikeDAO;
import com.one.dto.LikeDTO;
import com.one.dto.MemberDTO;

public class CheckLikeAjaxAction implements Action {

	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		
		int bno = Integer.parseInt(request.getParameter("bno"));
		// 보안을 위해서 mDto.id로 접근하기 위해 DTO에 담음. 
		MemberDTO mDto = (MemberDTO) session.getAttribute("loginUser");

		LikeDTO lDto = new LikeDTO(bno, mDto.getId());
		
		LikeDAO lDao = LikeDAO.getInstance();
		lDto = lDao.checkLike(lDto);
		// 해당게시물의 좋아요 갯수  
		BoardDAO bDao = BoardDAO.getInstance();
		System.out.println(bno);
		int like_cnt = bDao.likeCnt(bno);
		
		// ajax를 사용하기위한 객체생성 
		JSONObject jObj = new JSONObject();
		
		// 받아온 result를 json으로 바꿔줌
		if (lDto == null) {
			jObj.put("result", "0");
		} else {
			jObj.put("reslut", "1");
		}
		jObj.put("likeCnt", like_cnt);
		response.setContentType("application/x-json; charset=UTF-8");
		response.getWriter().print(jObj);
		
		
		return null;
	}

}
