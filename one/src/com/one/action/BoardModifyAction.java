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

public class BoardModifyAction implements Action {

	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		
		//파일 업로드 1) 파일을 저장할 디렉토리 생성
		File uploadDir = new File(Constants.UPLOAD_PATH); // 폴더를 저장할 경로가 없으면 인스턴스가 null값. 
		
		if (!uploadDir.exists()) { // 저장할 경로가 없다면                 디렉토리가 없으면  false반환, 근데 if문타야하니까 false를 부정하는!를써줘 true로
			uploadDir.mkdir();	   // 디렉토리를 생성하세요               if문을 탔더니 디렉토리를 생성하래. mkdir = makedirectory.
		}
		
		
		// 파일업로드 2) 'D:\\upload'로 첨부파일 저장
		// 기존파일이 있든 없든 새로운 파일을 저장
		// ex) 만약에 기존파일이 aaa.text가 있고 새로 등록하는 첨부파일이 bbb.txt가 있다면 현재 upload 디렉토리에는 aaa.txt와 bbb.txt가 있음
		MultipartRequest multi = new MultipartRequest(request,
				Constants.UPLOAD_PATH,  //파일 업로드 디렉토리 -> UPLOAD_PATH: file 관련된 DTO클래스라고 생각하면 된다.
				Constants.MAX_UPLOAD,   //업로드 최대 용량
				"UTF-8",  				//인코딩
				new DefaultFileRenamePolicy()); //파일이름 중복정책 -> 중복된 이름으로 업로드 되었을 때 어떻게 설정할건지
		
		int bno = Integer.parseInt(multi.getParameter("bno"));
		String title = multi.getParameter("title");
		String content = multi.getParameter("content");
		String writer = multi.getParameter("writer");
		String bFileName = multi.getParameter("baisc_filename");
		int bFileSize = Integer.parseInt(multi.getParameter("baisc_filesize"));
		String bCheck = multi.getParameter("baisc_check");
		String filename = " "; 
		int filesize = 0;
		
		// 파일업로드 3) DB에 저장할 첨부파일의 이름과 사이즈를 구함
		// 새로 등록한 첨부파일이 있다면 새로등록한 첨부파일의 filename과 filesize를 구함
		// 새로 등록한 첨부파일이 없다면 while문을 타지 않음->filename=" ", filesize=0으로 고정
		try {
			Enumeration files = multi.getFileNames(); // 첨부파일을 배열로 여러개의 값을 받음.
			
			while (files.hasMoreElements()) {
				String file1 = (String)files.nextElement(); 
				filename = multi.getFilesystemName(file1); 
				File f1 = multi.getFile(file1);
				
				if(f1 != null) {
					filesize = (int)f1.length(); // 첨부파일의 사이즈
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		} 
		
		if(filename == null || filename.trim().equals("")) {
			// 새로 등록한 첨부파일이 없는 경우
			filename = "-";
			if(bCheck.equals("no")) { // 기존 첨부파일 있는 경우(삭제)
				File file = new File(Constants.UPLOAD_PATH+bFileName);
				file.delete();
			} else { //현상태 유지: 위에서 기존 첨부파일 값을 초기화 했기 때문에 다시입력
				filename = bFileName;
				filesize = bFileSize;
			}
		} else {
			// 새로 등록한 첨부파일이 있는 경우
			// 기존파일 있는지 체크
			if(bFileSize > 0) { // 기존파일이 있음 -> 기존파일 지움
				File file = new File(Constants.UPLOAD_PATH+bFileName);
				file.delete();
			}
		}
		
		BoardDTO bDto = new BoardDTO(bno, title, content, writer, filename, filesize);
		BoardDAO bDao = BoardDAO.getInstance();
		bDao.modify(bDto);
		
		String url = "boardView.one?bno="+bno; //index에서 Q&A경로를 누르는 순간 DB에서 업데이트된 모든 리스트를 불러오므로, 그 경로를 써줘야함
		ActionForward forward = new ActionForward();
		forward.setPath(url);
		forward.setRedirect(true);
		
		return forward;
	}

}
