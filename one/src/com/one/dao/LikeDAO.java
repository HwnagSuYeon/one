package com.one.dao;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.one.dto.LikeDTO;
import com.one.mybatis.SqlMapConfig;

public class LikeDAO {
	SqlSessionFactory sqlSessionFactory = SqlMapConfig.getSqlSession();
	SqlSession sqlSession;
	
	private LikeDAO() {}
	private static LikeDAO instance = new LikeDAO();
	public static LikeDAO getInstance() {
		return instance;
	}
	
	
	// 로그인한 id가 좋아요를 줬었는지 안줬었는지 체크하는 기능  
	public LikeDTO checkLike(LikeDTO lDto) {
		sqlSession = sqlSessionFactory.openSession();
		LikeDTO result = new LikeDTO();
		
		try {
			result = sqlSession.selectOne("ckeckLike", lDto);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		return result;
	}
	// 좋아요 주는기능 
	public int insertLike(int bno, String id) {
		sqlSession = sqlSessionFactory.openSession(true);
		int result = 0;
		LikeDTO lDto = new LikeDTO(bno, id);
		try {
			result = sqlSession.insert("insertLike", lDto);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		return result;
	}

	// 좋아요 삭제기능 
	public int deleteLike(int bno, String id) {
		sqlSession = sqlSessionFactory.openSession(true);
		int result = 0;
		LikeDTO lDto = new LikeDTO(bno, id);
		try {
			result = sqlSession.delete("deleteLike", lDto);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		return result;
	}

}
