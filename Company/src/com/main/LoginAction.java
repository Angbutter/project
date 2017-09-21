package com.main;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;

public class LoginAction implements Action {
	Logger logger = Logger.getLogger(LoginAction.class);
	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
		logger.info("execute 龋免己傍");
		Map<String,Object> pMap = new HashMap<String,Object>();
		String emp_no = req.getParameter("emp_no");
		String emp_pw = req.getParameter("emp_pw");
		
		pMap.put("emp_no", emp_no);
		pMap.put("emp_pw", emp_pw);
		String path = "";
		ActionForward forward = new ActionForward();
		//true : sendRedirect - 货肺款 夸没 , false : forward - 蜡瘤
		List<Map<String,Object>> empList = null;
		String emp_name = "";
		emp_name = LoginLogic.login(pMap);
		HttpSession session = req.getSession();   // 按眉 积己
		session.setAttribute("emp_name", emp_name);
		session.setAttribute("emp_no", emp_no);
		if ( "包府磊".equals(emp_name) ){
			path = "../finalAdmin/adminMain.jsp";
		}
		else if ( "".equals(emp_name) ){
			path = "../finalAdmin/loginFail.jsp";
		}
		else {
			path = "../finalAdmin/index.jsp";
			//path = "../finalAdmin/index.jsp";
		}
		forward.setRedirect(false);
		forward.setPath(path);
		return forward;
	}

}
