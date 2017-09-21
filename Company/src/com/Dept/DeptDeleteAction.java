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

public class DeptDeleteAction implements Action {
	Logger logger = Logger.getLogger(DeptDeleteAction.class);
	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
		logger.info("�μ� ���� ȣ�� ����");
		AdminLogic adLogic = new AdminLogic();
		int result = 0;//1�̸� ���� 0 �̸� ����
		Map<String,Object> pMap = new HashMap<String,Object>();
		String deptm_no = req.getParameter("deptm_no");
		pMap.put("deptm_no", deptm_no);
		result = adLogic.deptDelete(pMap);
		ActionForward forward = new ActionForward();
		forward.setRedirect(true);
		if (result==1){ // ȸ������ ����
			forward.setPath("./deptDeleteSuccess.jsp");
		}
		else{ // ����
			forward.setPath("./deptDeleteFail.jsp");
		}
		return forward;
	}

}
