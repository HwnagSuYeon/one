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

public class SwitchLikeAjaxAction implements Action {

	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int result = 0;
		HttpSession session = request.getSession();
		MemberDTO mDto = (MemberDTO) session.getAttribute("loginUser");
		
		int bno = Integer.parseInt(request.getParameter("bno"));
		LikeDTO lDto = new LikeDTO(bno, mDto.getId());
		LikeDAO lDao = LikeDAO.getInstance();
		lDto = lDao.checkLike(lDto);
		if (lDto == null) { // 좋아요정보 없음 
			result = lDao.insertLike(bno, mDto.getId());
		} else {
			result = lDao.deleteLike(bno, mDto.getId());
		}
		
		//tbl_board의 good_cnt 바꾸는 역할
		BoardDAO bDao = BoardDAO.getInstance();
		int like_cnt = bDao.likeCnt(bno);
		result = bDao.updateLikeCnt(like_cnt, bno);
		
		return null;
	}

}
