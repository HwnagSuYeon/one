package com.one.dto;

public class CriteriaDTO {
//	CriteriaDTO의역할 => 1페이지 내의게시물들을 컨트롤
	private int page;				//페이지 번호 (페이지네이션에서 숫자)
	private int perPageNum;			//한 페이지에 보여줄 게시글 수 
	private String keyword;			//검색 키워드
	private String search_option;	//검색타입
	private String sort_type;		//정렬타입
	
	public CriteriaDTO() {
		//Default로 게시판 목록 출력시 1페이지에 10개의 게시물을 출력함
		this.page = 1;
		this.perPageNum = 10;
	}

	public CriteriaDTO(int page, int perPageNum, String keyword, String search_option, String sort_type) {
		// 검색키워드를 이름으로 "수연"을 검색하는데, 댓글순으로 보고 2page를 보되 10개씩 한페이지에 띄워라 -> 다섯개의 기능을 다 쓰기위해 변수가 전부포함된 생성자를 만듦.
		super();
		this.page = page;
		this.perPageNum = perPageNum;
		this.keyword = keyword;
		this.search_option = search_option;
		this.sort_type = sort_type;
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		//1페이지에서 왼쪽으로 가는 화살표를 눌렀을 때 전페이지로 못가게 고정
		if(page <= 0) {
			this.page = 1;
			return;
		}
		this.page = page;
	}
	// method by MyBatis SQL Mapper: 조회 시작 row를 취득하는 메서드
	public int getPageStart() {
		return (((this.page -1)* perPageNum)+1);
	}
	//조회 마지막 row를 취득하는 메서드
	public int getPerPageNum() {
		return this.page * perPageNum;
	}

	public void setPerPageNum(int perPageNum) {
		this.perPageNum = perPageNum;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public String getSearch_option() {
		return search_option;
	}

	public void setSearch_option(String search_option) {
		this.search_option = search_option;
	}

	public String getSort_type() {
		return sort_type;
	}

	public void setSort_type(String sort_type) {
		this.sort_type = sort_type;
	}

	@Override
	public String toString() {
		return "CriteriaDTO [page=" + page + ", perPageNum=" + perPageNum + ", keyword=" + keyword + ", search_option="
				+ search_option + ", sort_type=" + sort_type + "]";
	}
	
	
	
	
}
