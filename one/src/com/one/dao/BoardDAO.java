package com.one.dao;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.one.dto.BoardDTO;
import com.one.dto.CriteriaDTO;
import com.one.mybatis.SqlMapConfig;

import oracle.net.aso.s;

public class BoardDAO {
	SqlSessionFactory sqlSessionFactory = SqlMapConfig.getSqlSession();
	SqlSession sqlSession;
	
	int result = 0;
	BoardDTO bDto = new BoardDTO();
	List<BoardDTO> list = null;
	boolean flag = false;
	
	private BoardDAO() {}
	private static BoardDAO instance = new BoardDAO();
	public static BoardDAO getInstance() {
		return instance;
	}
	
	
	//게시글 목록
	public List<BoardDTO> listAll(CriteriaDTO criDto) {
		sqlSession = sqlSessionFactory.openSession();
		
		try {
			list = sqlSession.selectList("listAll", criDto);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		return list;
	}
	// 페이지네이션에 필요한 게시글 Total수 구하기
	public int totalCount(CriteriaDTO criDto) {
		sqlSession = sqlSessionFactory.openSession();
		try {
			result = sqlSession.selectOne("totalCount", criDto);
			// totalCount-> 실행해야할 sql문의 이름. sql들의 모음인 mapper에 찾아가서 이 이름으로 된 sql문을 실행한다.
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		return result;
	}
	
	// 게시글 1건 상세조회
	public BoardDTO view(String bno) {
		sqlSession = sqlSessionFactory.openSession();
		try {
			bDto = sqlSession.selectOne("view", bno);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		return bDto;
	}
	
	
	// 조회수 증가 (+1)
	public void viewCnt(String bno, HttpSession session) {
		sqlSession = sqlSessionFactory.openSession(true);
		try {
			long update_time =0;
			// 세션정보에 read_time정보가 없다면, 조회수 1 증가
			if (session.getAttribute("read_time_"+bno) != null) {
				// 이전에 게시글을 조회한 시간
				update_time = (long)session.getAttribute("read_time_"+bno);
			} 
			// 현재시간 구하기
			long current_time = System.currentTimeMillis();
			
			// 현재시간과 이전에 게시글 조회시간 비교
			// 24시간 초과 -> 조회수 1증가
			// 아니라면 -> 조회수 증가 X
			// 24*60*60*1000 ->currentTimeMillis를 사용했을 때 시간형식은 초로 계산하고, 1초를 1000으로 계산해서 포맷을 맞춰주기 위해 이렇게 씀.
			if (current_time - update_time > 24*60*60*1000) {
				// 조회수 1 증가
				sqlSession.update("viewCnt", bno);
				// 조회수 1 증가한 최신 시간을 sessiont에 담음
				session.setAttribute("read_time_"+bno, current_time);
				// ex) 30번 게시글인 경우
				// read_time_30변수를 하나 만들고 현재시간을담음
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
	}
	
	
	// 댓글 등록 또는 삭제시 해당 게시글 replycnt +1 or -1
	public int replyCntUpdate(String bno, String flag) {
		sqlSession = sqlSessionFactory.openSession(true);
		
		try {
			// mapper로 매개변수를 2개 보낼수 없으니 해쉬맵으로 담아 보내주도록 한다.(DTO에는 bno정보는 있으나 flag정보가 없기 때문)
			HashMap<String, String> map = new HashMap<>();
			map.put("bno", bno);
			map.put("flag", flag);
			
			System.out.println("☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆" + map.toString());
			result = sqlSession.update("replyCntUpdate", map);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		return result;
		
	}
	
	// 게시글 등록기능
	public int registerPlay(BoardDTO bDto) {
		sqlSession = sqlSessionFactory.openSession(true);
		
		try {
			result = sqlSession.insert("boardInsert", bDto);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		return result;
	}
	
	// 게시글 삭제기능
	public int boardDelete(int bno) {
		sqlSession = sqlSessionFactory.openSession(true);
		
		try {
			result = sqlSession.delete("boardDelete", bno);
			
			if (result > 0) {
				System.out.println("게시글 삭제 성공");
			} else {
				System.out.println("게시글 삭제 실패!");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			sqlSession.close();
		}
		return result;
	}
}
