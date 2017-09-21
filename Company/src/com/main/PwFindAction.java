package com.main;

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
		String email = req.getParameter("email");
		String path = "";
		int result = 0;
		logger.info("email : "+email);
		LoginLogic ll = new LoginLogic();
		Map<String,Object> pMap = new HashMap<String,Object>();
		pMap.put("email", email);
		String emp_pw = "";
		//req.setAttribute("empList", empList);
		ActionForward forward = new ActionForward();
		//true : sendRedirect - 새로운 요청 , false : forward - 유지
		emp_pw = ll.pwFind(pMap);
		if ( "".equals(emp_pw) || emp_pw==null ){
			path = "./pwFindFail.jsp";
		}
		else{
				pMap.put("emp_pw", emp_pw);
				result = ll.pwUpdate(pMap);
				if ( result == 1 ){
					path = "./mailTest.jsp?email="+email+"&emp_pw="+emp_pw;
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
