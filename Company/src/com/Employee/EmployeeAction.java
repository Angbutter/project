package com.Employee;
import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import com.main.Action;
import com.main.ActionForward;

public class EmployeeAction implements Action {
	Logger logger = Logger.getLogger(EmployeeAction.class);
	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		logger.info("execute ȣ�� ����");
		EmployeeLogic empLogic = new EmployeeLogic();
		List<Map<String, Object>> empList
			=empLogic.getEmployeeList();
		req.setAttribute("empList", empList);
		String path = "/pref/jsonGetEmployeeList.jsp";
		boolean isRedirect = false;
		ActionForward forward = new ActionForward();
		//true:sendRedirect-���ο� ��û, false:forward-����
		forward.setRedirect(isRedirect);
		forward.setPath(path);
		return forward;
	}

}
