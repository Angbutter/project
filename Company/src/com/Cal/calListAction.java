package com.Cal;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;

import com.main.Action;
import com.main.ActionForward;

public class calListAction implements Action {
	Logger logger = Logger.getLogger(calListAction.class); 
	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
		ActionForward forward = new ActionForward();
		calLogic callogic = new calLogic();
		List<Map<String,Object>> calList = null;		
		HttpSession session = req.getSession();
		String emp_no = session.getAttribute("emp_no").toString();
		calList = calLogic.getCalList(emp_no);
		req.setAttribute("calList", calList);
		//session.setAttribute("calList", calList);
		forward.setRedirect(false);
		forward.setPath("./index.jsp?gugu=cal");
		return forward;
		
	}

}
