package com.Dept;

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

public class DeptUpdateAction implements Action {
	Logger logger = Logger.getLogger(DeptUpdateAction.class);
	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
		logger.info("�μ� ���� ȣ�� ����");
		AdminLogic adLogic = new AdminLogic();
		int result = 0;//1�̸� ���� 0 �̸� ����
		Map<String,Object> pMap = new HashMap<String,Object>();
		
		String deptm_no 	  	= req.getParameter("deptm_no4");
		String deptm_name   = req.getParameter("deptm_name4");
		
		pMap.put("deptm_no", deptm_no);
		pMap.put("deptm_name", deptm_name);

		result = adLogic.deptUpdate(pMap);
		ActionForward forward = new ActionForward();
		forward.setRedirect(true);
		if ( deptm_no == null 
	      || "".equals(deptm_no)
	      || deptm_name == null
	      || "".equals(deptm_name)
	      ){
			forward.setPath("./empty.jsp");
		}
		else {
			if (result==1){ // ȸ������ ����
				forward.setPath("./deptUpdateSuccess.jsp");
			}
			else{ // ����
				forward.setPath("./deptUpdateFail.jsp");
			}
		}
		return forward;
	}

}
