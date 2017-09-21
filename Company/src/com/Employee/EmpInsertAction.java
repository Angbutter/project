package com.Employee;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import com.Admin.AdminLogic;
import com.main.Action;
import com.main.ActionForward;

public class EmpInsertAction implements Action {
	Logger logger = Logger.getLogger(EmpInsertAction.class);
	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
		logger.info("회원 추가 호출 성공");
		AdminLogic adLogic = new AdminLogic();
		int result = 0;//1이면 성공 0 이면 실패
		Map<String,Object> pMap = new HashMap<String,Object>();
		
		String emp_no 	  	= req.getParameter("d_emp_no");
		String deptm_name   = req.getParameter("d_deptm_name");
		String authority_no = req.getParameter("d_authority_no");
		String emp_name 	= req.getParameter("d_emp_name");
		String jikup 	    = req.getParameter("d_jikup");
		String salary 	  	= req.getParameter("d_sal");
		String hiredate 	= req.getParameter("d_hiredate");
		String phone_num	= req.getParameter("d_phone_num");
		String emp_pw 	  	= req.getParameter("d_emp_pw");
		String gender       = req.getParameter("d_gender");
		String email       = req.getParameter("d_email");
		String deptm_no	  	= "";
		if ( "영업부".equals(deptm_name) ){
			deptm_no = "10";
		}
		else if ( "인사부".equals(deptm_name) ){
			deptm_no = "20";
		}
		else if ( "총무부".equals(deptm_name) ){
			deptm_no = "30";
		}
		else if ( "임원".equals(deptm_name) ){
			deptm_no = "99";
		}
		pMap.put("emp_no", emp_no);
		pMap.put("deptm_name", deptm_name);
		pMap.put("authority_no", authority_no);
		pMap.put("emp_name", emp_name);
		pMap.put("jikup", jikup);
		pMap.put("salary", salary);
		pMap.put("hiredate", hiredate);
		pMap.put("phone_num", phone_num);
		pMap.put("emp_pw", emp_pw);
		pMap.put("deptm_no", deptm_no);
		pMap.put("gender", gender);
		pMap.put("email", email);
		result = adLogic.empInsert(pMap);
		ActionForward forward = new ActionForward();
		forward.setRedirect(true);
		if ( emp_no == null 
	      || "".equals(emp_no)
	      || deptm_name == null
	      || "".equals(deptm_name)
	      || authority_no == null
	      || "".equals(authority_no)
	      || emp_name == null
	      || "".equals(emp_name)
	      || jikup == null
	      || "".equals(jikup)
	      || salary == null
	      || "".equals(salary)
	      || hiredate == null
	      || "".equals(hiredate)
	      || phone_num == null
	      || "".equals(phone_num)
	      || emp_pw == null
	      || "".equals(emp_pw)
	      || deptm_no == null
	      || "".equals(deptm_no)
	      || gender == null
	      || "".equals(gender)
	      ){
			forward.setPath("./empty.jsp");
		}
		else {
			if (result==1){ // 회원가입 성공
				forward.setPath("./empInsertSuccess.jsp");
			}
			else{ // 실패
				forward.setPath("./empInsertFail.jsp");
			}
		}
		return forward;
	}
}
