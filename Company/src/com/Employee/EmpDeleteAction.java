package com.Employee;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import com.Admin.AdminLogic;
import com.main.Action;
import com.main.ActionForward;

public class EmpDeleteAction implements Action {
	Logger logger = Logger.getLogger(EmpDeleteAction.class);
	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
		logger.info("ȸ�� ���� ȣ�� ����");
		AdminLogic adLogic = new AdminLogic();
		int result = 0;//1�̸� ���� 0 �̸� ����
		Map<String,Object> pMap = new HashMap<String,Object>();
		String emp_no 	  	= req.getParameter("emp_no");
		pMap.put("emp_no", emp_no);
		result = adLogic.empDelete(pMap);
		ActionForward forward = new ActionForward();
		forward.setRedirect(true);
		if (result==1){ // ȸ������ ����
			forward.setPath("./empDeleteSuccess.jsp");
		}
		else{ // ����
			forward.setPath("./empDeleteFail.jsp");
		}
		return forward;
	}
}