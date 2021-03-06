package com.one.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.one.dto.ReplyDTO;
import com.one.mybatis.SqlMapConfig;

public class ReplyDAO {
	SqlSessionFactory sqlSessionFactory = SqlMapConfig.getSqlSession();
	SqlSession sqlSession;
	ReplyDTO rDto = new ReplyDTO();
	List<ReplyDTO> list = null; 
	int result = 0;
	
	private ReplyDAO() {}
	private static ReplyDAO instance = new ReplyDAO();
	public static ReplyDAO getInstance() {
		return instance;
	}
	
	// 해당 게시글 댓글목록 조회
	public List<ReplyDTO> replyList(String bno) {
		sqlSession = sqlSessionFactory.openSession();
		
		try {
			list = sqlSession.selectList("replyList", bno);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		return list;
	}
	
	// 댓글 등록하는 기능
	public int replyAdd(ReplyDTO rDto) {
		sqlSession = sqlSessionFactory.openSession(true);
		
		try {
			result = sqlSession.insert("replyAdd", rDto);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		return result;
	}
	
	// 댓글 삭제하는 기능
	public int replyRemove(int rno) {
		sqlSession = sqlSessionFactory.openSession(true);
		
		try {
			result = sqlSession.delete("replyRemove", rno);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		return result;
	}
}
