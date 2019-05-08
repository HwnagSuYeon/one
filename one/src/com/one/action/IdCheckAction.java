package com.one.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

public class IdCheckAction implements Action{

	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String id = request.getParameter("id");
		System.out.println("id>>" + id);
		
		// Ajax => JSON방식 => return할때 보내는값도 JSON방식
		JSONObject jObj = new JSONObject();
		int message = 1;
		jObj.put("message", message);
		jObj.put("id", id);
		
		//JSON객체에 담은 데이터를 호출한 페이지로 전송하는 기능
		response.setContentType("application/x-json; charset=UTF-8");
		response.getWriter().print(jObj);
		//ajax는 어디로 갈지 목적지가 정해져있기 때문에 (자기 자신으로 향함)
		// forward(목적지, 이동수단)을 return할 필요가 없음.
		return null;
	}

}
