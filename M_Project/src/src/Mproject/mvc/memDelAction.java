package Mproject.mvc;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

public class memDelAction implements Action {
	Logger logger = Logger.getLogger(memDelAction.class);
	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
		logger.info("execute 호출성공");
		
		String mem_no = req.getParameter("mem_no");
		
		String path="";
		ActionForward forward = new ActionForward();
		LoginLogic loginLogic = new LoginLogic();
		int result = 0;
		result = loginLogic.memDel(mem_no);
		
		if ( result == 0 ){
			path = "../mProject/memDelf.jsp"; 
		}
		else{
			path = "../mProject/memDels.jsp";
		}
		forward.setRedirect(false);
		forward.setPath(path);
		return forward;
	}
}
