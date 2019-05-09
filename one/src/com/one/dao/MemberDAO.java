package com.one.dao;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.one.mybatis.SqlMapConfig;

public class MemberDAO {
	SqlSessionFactory sqlSessionFactory = SqlMapConfig.getSqlSession();
	SqlSession sqlSession;
	
	private MemberDAO() {}
	private static MemberDAO instance = new MemberDAO();
	public static MemberDAO getInstance() {
		return instance;
	}
	
	int result = 0;
	
	public String idCheck(String id) {
		sqlSession = sqlSessionFactory.openSession();
		String result = "";
		
		try {
			// 가져와야하는값이 1개이기 때문에 selectOne
			result = sqlSession.selectOne("idCheck", id);
			
			if(result != null) { //id가 있다 =>중복아이디
				result= "-1";
			} else { //사용가능한 id
				result = "1";
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		return result;
	}
}
