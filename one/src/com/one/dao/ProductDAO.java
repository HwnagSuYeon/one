package com.one.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.one.dao.ProductDAO;
import com.one.dto.ProductDTO;
import com.one.mybatis.SqlMapConfig;

public class ProductDAO {
	SqlSessionFactory sqlSessionFactory = SqlMapConfig.getSqlSession();
	SqlSession sqlSession;
	
	private ProductDAO() {}
	private static ProductDAO instance = new ProductDAO();
	public static ProductDAO getInstance() {
		return instance;
	}
	
	
	int result = 0;
	
	public List<ProductDTO> bestList() {
		List<ProductDTO> list = null;
		sqlSession = sqlSessionFactory.openSession();
		
		try {
			list = sqlSession.selectList("bestList");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		return list;
	}
	
	public List<ProductDTO> newList() {
		List<ProductDTO> list = null;
		sqlSession = sqlSessionFactory.openSession();
		
		try {
			list = sqlSession.selectList("newList");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		
		return list;
	}
}
