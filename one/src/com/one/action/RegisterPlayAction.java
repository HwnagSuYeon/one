package com.one.action;

import java.io.File;
import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.one.common.Constants;
import com.one.dao.BoardDAO;
import com.one.dto.BoardDTO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class RegisterPlayAction implements Action {

	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String url = "boardList.one"; //index에서 Q&A경로를 누르는 순간 DB에서 업데이트된 모든 리스트를 불러오므로, 그 경로를 써줘야함
		
		//파일 업로드 1) 파일을 저장할 디렉토리 생성
		File uploadDir = new File(Constants.UPLOAD_PATH); // 폴더를 저장할 경로가 없으면 인스턴스가 null값. 
		
		if (!uploadDir.exists()) { // 저장할 경로가 없다면                 디렉토리가 없으면  false반환, 근데 if문타야하니까 false를 부정하는!를써줘 true로
			uploadDir.mkdir();	   // 디렉토리를 생성하세요               if문을 탔더니 디렉토리를 생성하래. mkdir = makedirectory.
		}
		
		// request를 확장시킨 MultipartRequest생성
		//request는 모두 String타입
		// 파일 -> request로 전송 불가
		// 파일 -> request를 향상시킨 multipartrequest를 사용
		// 그래서 파일뿐만 아니라 기존에 String타입도 전부 Multipart타입으로 변경해야함
		
		
		// 파일업로드 2) 'D:\\upload'로 첨부파일 저장
		MultipartRequest multi = new MultipartRequest(request,
				Constants.UPLOAD_PATH,  //파일 업로드 디렉토리 -> UPLOAD_PATH: file 관련된 DTO클래스라고 생각하면 된다.
				Constants.MAX_UPLOAD,   //업로드 최대 용량
				"UTF-8",  				//인코딩
				new DefaultFileRenamePolicy()); //파일이름 중복정책 -> 중복된 이름으로 업로드 되었을 때 어떻게 설정할건지
		
		// 파일 저장시 2가지의 유의사항
		// 1. 저장 경로를 web으로 설정하면 안된다.
		// -> 해킹을하는 jsp파일을 누군가 업로드한다면 백도어가 열려 소스가 유출된다. web경로를 저장경로로 설정하면 url접근이 가능하기때문에 하면 안됨.
		// -> 따라서 fileSystem이나 local(D:/upload)에 경로를 잡아야한다. 
		// 2. 실행파일은 저장하면 안된다.
		// -> *.jsp혹은 *.exe같은 실행파일을 말한다.
		// -> 확장자 검사를 한다. 모든확장자는 "."이 들어있기 때문에 .을 기점으로 뒤의 문자를 읽어 실행파일일경우 업로드 못시키게 만들면 된다.
		
		String title = multi.getParameter("title");
		String content = multi.getParameter("content");
		String writer = multi.getParameter("writer");
		String filename = " "; // 한칸을 띄어주는게 중요!
		int filesize = 0;
		
		
		
		// 파일업로드 3) DB에 저장할 첨부파일의 이름과 사이즈를 구함
		// 파일을 설정한 경로(D:\\upload)로 업로드하는 과정
		try {
			Enumeration files = multi.getFileNames(); // 첨부파일을 배열로 여러개의 값을 받음.
			
			while (files.hasMoreElements()) {
				// hasMoreElements-> 파일이 있으면 true를 반환, 없으면 flase를 반환.
				// hwile문 안에 있으므로, 첨부한 파일의 갯수만큼 파일이 있는지 없는지 검사후 맨 마지막에 파일이 없어서 false를 반환하면 while문 종료.
				String file1 = (String)files.nextElement(); 
				// nextElement -> rs.next와 같은 것. 업로드한 파일을 순차적으로가져오라는 것.
				filename = multi.getFilesystemName(file1); 
				// getFilesystemName-> 첨부파일의 이름
				File f1 = multi.getFile(file1);
				// getFile -> 첨부파일의 파일
				
				if(f1 != null) {
					// filesize는 Long타입으로 가져오기때문에 int로형변환해주는 작업이다.
					// 첨부파일의 사이즈를 한꺼번에 가져오는 것이 불가능하기때문에 첨부파일의 파일을 먼저 불러온 다음(f1안에 담겨있음) 그것의 사이즈를 잰다.
					filesize = (int)f1.length(); // 첨부파일의 사이즈
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		} 
		
		// 만약 첨부파일을 업로드하지 않으면, 값으로 null이 오기때문에 문제가 생긴다. 따라서 DB에 값을 저장할 때는 "-"이나 ""으로 저장하도록 한다
		if(filename == null || filename.trim().equals("")) {
			filename = "-";
		}
		
		BoardDTO bDto = new BoardDTO(title, content, writer, filename, filesize);
		System.out.println("★★★★★★★★★★★★★★★★★★★★★" + bDto.toString());
		BoardDAO bDao = BoardDAO.getInstance();
		int result = bDao.registerPlay(bDto);
		if (result > 0) {
			System.out.println("게시글 등록 성공");
		} else {
			System.out.println("게시글 등록 실패");
		}
		
		ActionForward forward = new ActionForward();
		forward.setPath(url);
		forward.setRedirect(true);
		
		return forward;
	}

}
