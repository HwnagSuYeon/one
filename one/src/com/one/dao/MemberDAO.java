package com.one.dao;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.one.dto.MemberDTO;
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
	MemberDTO mDto = new MemberDTO();
	boolean flag = false;
	
	// id중복체크기능
	public String idCheck(String id) {
		// 19. myBatis를 사용하기 위해 sqlSession을 빌려옴
		sqlSession = sqlSessionFactory.openSession();
		String result = "";
		
		try {
			// 20.sqlSession을 활용하여 mapper.xml의 idCheck 이름의 sql문을 실행 (매개변수로 id 데이터 전달)
			// 가져와야하는값이 1개이기 때문에 selectOne
			result = sqlSession.selectOne("idCheck", id);
			// 22.DB에서 sql문실행한 결과를 result변수에 담는다
			// 23.result가null이면 사용가능한 ID
			//	  result가 null이 아니면 중복된 ID
			//	    사용가능한 ID => 1
			//	    중복된 ID => -1
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
		// 24. IdCheckAction 클래스로 "1"또는"-1" 결과값 return으로 보냄
		return result;
	}
	
	// MemberPlayAction에서 받아온 값을 DB에 넣는 작업
	public int memInsert(MemberDTO mDto) {
		sqlSession = sqlSessionFactory.openSession(true);
		
		try {
			result = sqlSession.insert("memInsert", mDto);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		return result;
	}
	
	
	// 회원정보 수정(pw제외)
	public int memUpdate(MemberDTO mDto) {
		sqlSession = sqlSessionFactory.openSession(true);
		
		try {
			result = sqlSession.update("memUpdate", mDto);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		return result;
	}
	
	// 회원 1명의 정보를 가져옴: 아이디정보 다 갖고와서 세션에 모든 정보를 넣기 위해 사용
	public MemberDTO memOne(String id) {
		sqlSession = sqlSessionFactory.openSession();
		
		try {
			mDto = sqlSession.selectOne("memOne", id);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		return mDto;
	}
	
	//비밀번호 재설정(현재 비밀번호와 입력한 비밀번호가 일치하는지 확인)
	public boolean pwCheck(String id, String pw) {
		sqlSession = sqlSessionFactory.openSession();
		HashMap<String, String> map= new HashMap<>();
		
		try {
			map.put("id", id);
			map.put("pw", pw);
			result = sqlSession.selectOne("pwCheck", map);
			
			if(result == 1) {
				flag=true;
			} else {
				flag=false;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		return flag;
	}
	
	//비밀번호 수정정보 DB로 보내는 액션
	public int pwUpdate(String id, String pw) {
		sqlSession = sqlSessionFactory.openSession(true);
		HashMap<String, String> map = new HashMap<>();
		map.put("id", id);
		map.put("pw", pw);
		System.out.println(id+", "+pw);
		try {
			result = sqlSession.update("pwUpdate", map);
			System.out.println("DB끝");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		return result;
	}
	
	//회원 삭제기능
	public int memDelete(String id) {
		sqlSession = sqlSessionFactory.openSession(true);
		
		try {
			result = sqlSession.delete("memDelete", id);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		return result;
	}
}
