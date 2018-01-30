package Mproject.mvc;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

public class trDelAction implements Action {
	Logger logger = Logger.getLogger(trDelAction.class);
	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
		logger.info("execute 호출성공");
		
		String tr_no = req.getParameter("tr_no");
		
		String path="";
		ActionForward forward = new ActionForward();
		Map<String,Object> pMap = new HashMap<String,Object>();
		
		BoardLogic boardLogic = new BoardLogic();
		int result = 0;
		result = boardLogic.trDel(tr_no);
		
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
