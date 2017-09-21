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
		logger.info("회원 삭제 호출 성공");
		AdminLogic adLogic = new AdminLogic();
		int result = 0;//1이면 성공 0 이면 실패
		Map<String,Object> pMap = new HashMap<String,Object>();
		String emp_no 	  	= req.getParameter("emp_no");
		pMap.put("emp_no", emp_no);
		result = adLogic.empDelete(pMap);
		ActionForward forward = new ActionForward();
		forward.setRedirect(true);
		if (result==1){ // 회원삭제 성공
			forward.setPath("./empDeleteSuccess.jsp");
		}
		else{ // 실패
			forward.setPath("./empDeleteFail.jsp");
		}
		return forward;
	}
}