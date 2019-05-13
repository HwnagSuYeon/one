package com.one.dao;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.one.dto.MemberDTO;
import com.one.mybatis.SqlMapConfig;

public class LoginDAO {
	SqlSessionFactory sqlSessionFactory = SqlMapConfig.getSqlSession();
	SqlSession sqlSession;
	
	private LoginDAO() {}
	private static LoginDAO instance = new LoginDAO();
	public static LoginDAO getInstance() {
		return instance;
	}
	
	// 로그인시 회원가입 유무 체크
	public MemberDTO loginCheck(String id, String pw) {
		sqlSession = sqlSessionFactory.openSession();
		MemberDTO mDto = new MemberDTO();
		// 기본생성자에 setter로 값을 다이렉트로 집어넣음.
		mDto.setId(id);
		mDto.setPw(pw);
		
		try {
			mDto = sqlSession.selectOne("loginCheck", mDto);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		return mDto;
	}
	
}
