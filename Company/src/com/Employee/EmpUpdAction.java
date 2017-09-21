package com.Employee;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;

import com.Admin.AdminLogic;
import com.main.ActionForward;
import com.main.Action;

public class EmpUpdAction implements Action {
	Logger logger = Logger.getLogger(EmpUpdAction.class);
	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
		logger.info("개인 정보 수정 성공");
		AdminLogic adLogic = new AdminLogic();
		int result = 0;//1이면 성공 0 이면 실패
		Map<String,Object> pMap = new HashMap<String,Object>();
		
		// emp_name, board_emp_pw1,2,3, email
		HttpSession session = req.getSession();   // 객체 생성
		String emp_no			= session.getAttribute("emp_no").toString();
		String board_emp_pw 	= req.getParameter("board_emp_pw");
		String board_emp_pw2 	= req.getParameter("board_emp_pw2");
		String email 			= req.getParameter("email");
		
		pMap.put("emp_no", emp_no);
		pMap.put("board_emp_pw", board_emp_pw);
		pMap.put("board_emp_pw2", board_emp_pw2);
		pMap.put("email", email);
		
		result = adLogic.empUpd(pMap);
		ActionForward forward = new ActionForward();
		forward.setRedirect(true);
		if (result == 1 ){
			forward.setPath("./empUpdSuccess.jsp");
		}
		else {
			forward.setPath("./empUpdFail.jsp");
		}
		return forward;
	}

}
