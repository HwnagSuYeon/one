package com.one.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.one.action.Action;
import com.one.action.ActionForward;
import com.one.action.BoardDeleteAction;
import com.one.action.BoardListAction;
import com.one.action.BoardModifyAction;
import com.one.action.BoardUpdateAction;
import com.one.action.RegisterAjaxAction;
import com.one.action.RegisterPlayAction;
import com.one.action.RegisterViewAction;
import com.one.action.BoardViewAction;
import com.one.action.CheckLikeAjaxAction;
import com.one.action.CommentListAction;
import com.one.action.ConstractAction;
import com.one.action.DownloadAction;
import com.one.action.DropMemberAction;
import com.one.action.DropMemberPlayAction;
import com.one.action.IdCheckAction;
import com.one.action.IndexAction;
import com.one.action.InfoUpdateAction;
import com.one.action.InfoUpdatePlayAction;
import com.one.action.JoinAction;
import com.one.action.LogOutAction;
import com.one.action.LoginAjaxAction;
import com.one.action.LogoutAjaxAction;
import com.one.action.MemberPlayAction;
import com.one.action.PwCheckAction;
import com.one.action.PwUpdateAction;
import com.one.action.PwUpdatePlayAction;
import com.one.action.ReplyAddAction;
import com.one.action.ReplyRemoveAction;
import com.one.action.SwitchLikeAjaxAction;



@WebServlet("/FrontController")
public class FrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public FrontController() {
        super();
    }

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			request.setCharacterEncoding("UTF-8");
			
			Action action = null;
			ActionForward forward = null; 
			//13. uri와 ctx를 빼서 command생성
			//	    실행:/one/idCheck.one
			//	    -/one
			//--------------------------
			//		=/idCheck.one >> command
			String uri = request.getRequestURI();
			String ctx = request.getContextPath();
			String command = uri.substring(ctx.length());
			System.out.println("페이지 이동>>>"+command);
			
			
			// 14. 생성된 command 조건에 맞는 if문 실행
			// 	   command = /idCheck.one
			if(command.equals("/index.one")) {
				action = new IndexAction();
				forward = action.excute(request, response);
			} else if (command.equals("/join.one")){
				action = new JoinAction();
				forward = action.excute(request, response);
			} else if (command.equals("/constract.one")){
				action = new ConstractAction();
				forward = action.excute(request, response);
			} else if (command.equals("/idCheck.one")){
				// 15. IdCheckAction 클래스 객체 생성
				//		결과물: action인스턴스
				//		action 인스턴스를 활용하여 excute() 메서드 실행
				//		매개변수로 Controller의 request와 response를 전송
				//		이동: IdCheckAction클래스의 excute()로 이동!
				action = new IdCheckAction();
				forward = action.excute(request, response);
			} else if (command.equals("/memberPlay.one")){
				action = new MemberPlayAction();
				forward = action.excute(request, response);
			} else if (command.equals("/login.one")){
				action = new LoginAjaxAction();
				forward = action.excute(request, response);
			} else if (command.equals("/logOut.one")){
				action = new LogOutAction();
				forward = action.excute(request, response);
			} else if (command.equals("/logoutAjax.one")){
				action = new LogoutAjaxAction();
				forward = action.excute(request, response);
			} else if (command.equals("/infoUpdate.one")){
				action = new InfoUpdateAction();
				forward = action.excute(request, response);
			} else if (command.equals("/infoUpdatePlay.one")){
				action = new InfoUpdatePlayAction();
				forward = action.excute(request, response);
			} else if (command.equals("/pwUpdate.one")){
				action = new PwUpdateAction();
				forward = action.excute(request, response);
			} else if (command.equals("/pwCheck.one")){
				action = new PwCheckAction();
				forward = action.excute(request, response);
			} else if (command.equals("/pwUpdatePlay.one")){
				action = new PwUpdatePlayAction();
				forward = action.excute(request, response);
			} else if (command.equals("/dropMember.one")){
				action = new DropMemberAction();
				forward = action.excute(request, response);
			} else if (command.equals("/dropMemberPlay.one")){
				action = new DropMemberPlayAction();
				forward = action.excute(request, response);
			} else if (command.equals("/boardList.one")){
				action = new BoardListAction();
				forward = action.excute(request, response);
			} else if (command.equals("/boardView.one")){
				action = new BoardViewAction();
				forward = action.excute(request, response);
			} else if (command.equals("/commentlist.one")){
				action = new CommentListAction();
				forward = action.excute(request, response);
			} else if (command.equals("/replyAdd.one")){
				action = new ReplyAddAction();
				forward = action.excute(request, response);
			} else if (command.equals("/replyRemove.one")){
				action = new ReplyRemoveAction();
				forward = action.excute(request, response);
			} else if (command.equals("/registerAjax.one")){
				action = new RegisterAjaxAction();
				forward = action.excute(request, response);
			}  else if (command.equals("/registerView.one")){
				action = new RegisterViewAction();
				forward = action.excute(request, response);
			} else if (command.equals("/registerPlay.one")){
				action = new RegisterPlayAction();
				forward = action.excute(request, response);
			} else if (command.equals("/removePlay.one")){
				action = new BoardDeleteAction();
				forward = action.excute(request, response);
			} else if (command.equals("/boardUpdate.one")){
				action = new BoardUpdateAction();
				forward = action.excute(request, response);
			} else if (command.equals("/boardModifyAction.one")){
				action = new BoardModifyAction();
				forward = action.excute(request, response);
			} else if (command.equals("/download.one")){
				action = new DownloadAction();
				forward = action.excute(request, response);
			} else if (command.equals("/check_like.one")){
				action = new CheckLikeAjaxAction();
				forward = action.excute(request, response);
			} else if (command.equals("/switch_like.one")){
				action = new SwitchLikeAjaxAction();
				forward = action.excute(request, response);
			}
			
			
			
			if(forward !=null) {
				if(forward.isRedirect()) {
					response.sendRedirect(forward.getPath());
				} else {
					RequestDispatcher rd = request.getRequestDispatcher(forward.getPath());
					rd.forward(request,response);
				}
			}
				
	}
}
