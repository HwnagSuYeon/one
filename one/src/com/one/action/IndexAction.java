package com.one.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.one.dao.ProductDAO;
import com.one.dto.ProductDTO;

public class IndexAction implements Action{
//	implements로 Action인터페이스 구현받음

	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// index.jsp를 타라고 경로를 알려줌
		String url = "index.jsp";
		
		// 다음은 DB를 타는 작업
		ProductDAO pDao = ProductDAO.getInstance();
		// pick(best)상품을 가져옴
		List<ProductDTO> bList = pDao.bestList();
		List<ProductDTO> nList = pDao.newList();
		
		for (ProductDTO productDTO : bList) {
			System.out.print(productDTO.getP_name()+", ");
			System.out.print(productDTO.getP_img()+", ");
			System.out.print(productDTO.getP_price());
			System.out.println();
		}
		
		request.setAttribute("bestList", bList);
		request.setAttribute("newList", nList);
		
		ActionForward forward = new ActionForward();
		forward.setPath(url);
		forward.setRedirect(false);
		return forward;
	}

}
