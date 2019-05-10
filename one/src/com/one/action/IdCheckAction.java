package com.one.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.one.dao.MemberDAO;
import com.one.dto.MemberDTO;

public class IdCheckAction implements Action{

	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		//16. Controller에서 전송한 request를 활용하여 member.jsp에서 보낸 id:memId를 가져와 id 변수에 담음
		String id = request.getParameter("id");
//		System.out.println("id>>" + id);
		
		
		//17.MemberDAO 객체 빌려와 mDao에 담음
		MemberDAO mDao = MemberDAO.getInstance();
		
		//18.MemverDAO 클래스의 idCheck()매서드 실행->매개변수로 id값 전달
		String result = mDao.idCheck(id);
		// 25. "-1"또는"1"값을 result변수에 담음
		
		// 26.Ajax페이지로 결과값을 JSON방식으로 전달하기 위해 Foofle Json-Simple 라이브러리를 사용해 JSONObject생성
		JSONObject jObj = new JSONObject();
		//27. Ajax전달할 데이터를 담음
		//	  message변수에 result 담음
		//    id qustndp id 담음
		jObj.put("message", result);
		jObj.put("id", id);
		
		// forward로 보내는 것이 목적지와 방법을 쓰는건데, 여기는 나에게로 다시 돌아가는 것이기 때문에
		
		
		//28 .JSON객체에 담은 데이터를 호출한 페이지로 전송하는 기능
		//	결론: message와 id를 가지고 Ajax로 이동
		response.setContentType("application/x-json; charset=UTF-8");
		response.getWriter().print(jObj);
		//ajax는 어디로 갈지 목적지가 정해져있기 때문에 (자기 자신으로 향함)
		// forward(목적지, 이동수단)을 return할 필요가 없음.
		return null;
	}

}
