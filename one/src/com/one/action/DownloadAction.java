package com.one.action;

import java.io.FileInputStream;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.one.common.Constants;

public class DownloadAction implements Action {

	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String filename = request.getParameter("file");
		System.out.println("화면단에서 파일이름 받아옴>>"+filename);
		
		//파일 다운로드 과정
		String path = Constants.UPLOAD_PATH + filename;
		// D:\\upload\\*.png
		byte[] b = new byte[4096]; // 바이트 배열 생성
		
		// 서버에 저장된 파일을 읽기 위한 스트림 생성
		// 파일을 갖고있는 애는 D드라이브, (octet=stream)스트림은 자바로 한줄한줄 파일을 읽어와 다운받을 수 있도록 해준다.
		FileInputStream fis = new FileInputStream(path);
		
		// 통홥확장자(mimeType): 확장자가 많으니까 파일의 종류를 알아서 알아내는 것.
		String mimeType = request.getServletContext().getMimeType(path);
		if(mimeType == null) {
			mimeType = "application/octet=stream; charset=utf-8";
		}
		
		// 파일이름에 한글이 포함된 경우 new String(바이트배열, 변환할 인코딩) 8859_1서유럽언어 header에 특수문자 사용 못하므로 서유럽 언어로 변환해줌
		filename = new String(filename.getBytes("utf-8"), "8859_1");
		
		// http body
		// OutputStream생성 (서버에서 클라이언트에 쓰기)
		ServletOutputStream out = response.getOutputStream();		
		
		// 실질적으로 파일을 다운로드 해주는 코드
		// 파일이 35,000byte -> 한번에 다운로드 불가능
		int numRead;
		while(true) {
			//4096byte로 쪼개서 파일 읽어오기
			numRead = fis.read(b, 0, b.length);
			if(numRead == -1) break;
			out.write(b, 0, numRead);
		}
		
		// 파일처리 관련 리소스 정리
		fis.close();
		out.flush(); // 마지막에 덜 읽힌 것을 가져옴
		out.close();
		
		return null;
	}

}
