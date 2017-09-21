package com.Employee;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.main.ActionForward;
import com.Admin.AdminLogic;
import com.main.Action;
import org.apache.log4j.Logger;

public class EmpUpdateAction implements Action {
	Logger logger = Logger.getLogger(EmpUpdateAction.class);
	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
		logger.info("ȸ�� ������Ʈ ȣ�� ����");
		AdminLogic adLogic = new AdminLogic();
		int result = 0;//1�̸� ���� 0 �̸� ����
		Map<String,Object> pMap = new HashMap<String,Object>();
		
		String emp_no 	  	= req.getParameter("d_emp_no2");
		String deptm_name   = req.getParameter("d_deptm_name2");
		String authority_no = req.getParameter("d_authority_no2");
		String emp_name 	= req.getParameter("d_emp_name2");
		String jikup 	    = req.getParameter("d_jikup2");
		String salary 	  	= req.getParameter("d_sal2");
		String hiredate 	= req.getParameter("d_hiredate2");
		String phone_num	= req.getParameter("d_phone_num2");
		String emp_pw 	  	= req.getParameter("d_emp_pw2");
		String gender       = req.getParameter("d_gender2");
		String email       = req.getParameter("d_email2");
		String deptm_no	  	= "";
		if ( "������".equals(deptm_name) ){
			deptm_no = "10";
		}
		else if ( "�λ��".equals(deptm_name) ){
			deptm_no = "20";
		}
		else if ( "�ѹ���".equals(deptm_name) ){
			deptm_no = "30";
		}
		else if ( "�ӿ�".equals(deptm_name) ){
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
		result = adLogic.empUpdate(pMap);
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
			if (result==1){ // ȸ������ ����
				forward.setPath("./empUpdateSuccess.jsp");
			}
			else{ // ����
				forward.setPath("./empUpdateFail.jsp");
			}
		}
		return forward;
	}

}
