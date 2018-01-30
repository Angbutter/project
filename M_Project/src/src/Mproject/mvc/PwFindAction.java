package Mproject.mvc;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

public class PwFindAction implements Action {
	Logger logger = Logger.getLogger(PwFindAction.class);
	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
		logger.info("execute 호출성공");
		String mem_em = req.getParameter("find_email"); 
		String path = "";
		int result = 0;
		logger.info("mem_em : "+mem_em);
		LoginLogic loginLogic = new LoginLogic();
		Map<String,Object> pMap = new HashMap<String,Object>();
		pMap.put("mem_em", mem_em);
		String mem_pw = "";
		ActionForward forward = new ActionForward();
		//true : sendRedirect - 새로운 요청 , false : forward - 유지
		mem_pw = loginLogic.pwFind(pMap);
		logger.info("mem_pw : "+mem_pw);
		if ( "".equals(mem_pw) || mem_pw==null ){
			path = "./pwFindFail.jsp";
		}
		else{
				pMap.put("mem_pw", mem_pw);
				result = loginLogic.pwUpdate(pMap);
				if ( result == 1 ){
					path = "./mailTest.jsp?mem_em="+mem_em+"&mem_pw="+mem_pw;
				}
				else {
					path = "./pwFindFail.jsp";
				}
		}
		
		forward.setRedirect(false);
		forward.setPath(path);
		return forward;
	}
}
