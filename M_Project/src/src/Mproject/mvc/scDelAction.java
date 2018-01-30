package Mproject.mvc;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

public class scDelAction implements Action {
	Logger logger = Logger.getLogger(scDelAction.class);
	
	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
		logger.info("scDelAction execute 호출성공");
		
		String sc_no = req.getParameter("sc_no");
		
		logger.info("sc_no : "+sc_no);
		
		String path = "";
		ActionForward forward = new ActionForward();
		//true : sendRedirect - 새로운 요청 , false : forward - 유지
		// 중복되지 않았으면 회원가입 성공		
		
		int result = 0;
		BoardLogic boardLogic = new BoardLogic();
		result = boardLogic.scDel(sc_no);
		
		if ( result == 0 ){
			path = "../mProject/trDelf.jsp"; 
		}
		else{
			path = "../mProject/trDels.jsp";
		}
		
		forward.setRedirect(false);
		forward.setPath(path);
		return forward;
	}

}