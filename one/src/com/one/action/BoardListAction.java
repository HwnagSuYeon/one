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
		
		// 페이지 번호설정
		int page = 1; // 인덱스페이지에서 처음 게시판을 눌렀을 때 디폴트로 1페이지를 띄우기 위해 설정
		// 화면단에서 받아온 페이지값을 page에 넣어줌. 만약 입력값이 없다면 null로 값이 들어오기 때문에 if문을 반드시 써줘야함. 정렬과 검색시에도 이 코드로 쓴다.
		if (request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		System.out.println("페이지번호>>"+ page);
		criDto.setPage(page);
		
		
		// 페이지 정렬 설정
		String sort_type = "new";
		if (request.getParameter("sort_type")!= null) {
			sort_type = request.getParameter("sort_type");
		}
		criDto.setSort_type(sort_type);
		System.out.println("정렬타입:" + sort_type);
		
		// 검색 설정(검색타입, 키워드)
		String search_option = null;
		String keyword = null;
		if (request.getParameter("keyword") != null) {
			search_option = request.getParameter("search_option");
			keyword = request.getParameter("keyword");
			criDto.setSearch_option(search_option);
			criDto.setKeyword(keyword);
			request.setAttribute("search_option", search_option);
			request.setAttribute("keyword", keyword);
			System.out.println(search_option+","+keyword);
		}
		System.out.println("결과값>>"+criDto.toString());
		
		// DB에서 게시글 목록 호출
		BoardDAO bDao = BoardDAO.getInstance();  // -> 싱글톤패턴: 객체생성은 해당 클래스에서 한번만하고, 인스턴스를 빌려쓸 수 있도록 함.
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
		request.setAttribute("sort_type", sort_type); // 페이지 이동시 sort_type정보를 계속 갖고다녀야 하기때문에 보내주는것.
		
		ActionForward forward = new ActionForward();
		forward.setPath(url);
		forward.setRedirect(false);
		
		return forward;
	}
}
