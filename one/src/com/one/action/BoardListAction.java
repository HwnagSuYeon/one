package com.one.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.one.dao.BoardDAO;
import com.one.dto.BoardDTO;
import com.one.dto.CriteriaDTO;
import com.one.dto.PageMakerDTO;

public class BoardListAction implements Action{

	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String url = "board/board_list.jsp";
		
		CriteriaDTO criDto = new CriteriaDTO();
		int page = 1;
		// 화면단에서 받아온 페이지값을 page에 넣어줌. 만약 입력값이 없다면 null로 값이 들어오기 때문에 if문을 반드시 써줘야함. 정렬과 검색시에도 이 코드로 쓴다.
		if (request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		System.out.println("페이지번호>>"+ page);
		criDto.setPage(page);
		
		String sort_type = "new";
		if (request.getParameter("sort_type")!= null) {
			sort_type = request.getParameter("sort_type");
		}
		System.out.println("정렬타입:" + sort_type);
		
		
		// DB에서 게시글 목록 호출
		BoardDAO bDao = BoardDAO.getInstance();
		List<BoardDTO> list = bDao.listAll(criDto);
		
		// 페이지네이션 생성
		PageMakerDTO pageMaker = new PageMakerDTO();
		pageMaker.setCriDto(criDto);
		int totalCount = bDao.totalCount(criDto);   // 총게시글 수를 구해서 totalCount에 넣음
		pageMaker.setTotalCount(totalCount);
		System.out.println(pageMaker.toString());
		
		
		// view단으로 게시글 목록 전송
		request.setAttribute("list", list);
		request.setAttribute("pageMaker", pageMaker);
		request.setAttribute("totalCount", totalCount);
		request.setAttribute("sort_type", sort_type);
		
		ActionForward forward = new ActionForward();
		forward.setPath(url);
		forward.setRedirect(false);
		
		return forward;
	}
}
