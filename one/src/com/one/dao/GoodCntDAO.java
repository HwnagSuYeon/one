package com.one.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.one.dto.BoardDTO;
import com.one.dto.GoodCntDTO;
import com.one.mybatis.SqlMapConfig;

public class GoodCntDAO {
	SqlSessionFactory sqlSessionFactory = SqlMapConfig.getSqlSession();
	SqlSession sqlSession;
	
	int result = 0;
	BoardDTO bDto = new BoardDTO();
	List<GoodCntDTO> list = null;
	boolean flag = false;
	
	private GoodCntDAO() {}
	private static GoodCntDAO instance = new GoodCntDAO();
	public static GoodCntDAO getInstance() {
		return instance;
	}
}
