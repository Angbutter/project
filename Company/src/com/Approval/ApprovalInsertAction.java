package com.Approval;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import com.main.Action;
import com.main.ActionForward;

public class ApprovalInsertAction extends HttpServlet implements Action {
	Logger logger = Logger.getLogger(ApprovalInsertAction.class);
	
	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
		logger.info("ApprovalInsertAction 호출 성공");
		ApprovalLogic approvalLogic = new ApprovalLogic();
		int result = 0;
		Map<String,Object> pMap = new HashMap<String,Object>();
		
		logger.info(req.getParameter("report_approval_no"));
		logger.info(req.getParameter("emp_no"));
		logger.info(req.getParameter("emp_name")); 
		logger.info(req.getParameter("deptm"));
		logger.info(req.getParameter("jikup"));
		logger.info(req.getParameter("approval_date"));
		logger.info(req.getParameter("section"));
		logger.info(req.getParameter("approval_level"));
		logger.info(req.getParameter("approval_title"));
		logger.info(req.getParameter("approval_reason"));
		logger.info(req.getParameter("approval_use"));
		logger.info(req.getParameter("approval_expense"));
		logger.info(req.getParameter("approval_cash"));
		
		
		pMap.put("report_approval_no", Integer.parseInt(req.getParameter("report_approval_no")));
		pMap.put("emp_no",Integer.parseInt(req.getParameter("emp_no")));
		pMap.put("emp_name",req.getParameter("emp_name"));
		pMap.put("approval_next_emp_no", Integer.parseInt(req.getParameter("deptm")));
		pMap.put("jikup",req.getParameter("jikup"));
		pMap.put("approval_date",req.getParameter("approval_date"));
		pMap.put("section",req.getParameter("section"));
		pMap.put("approval_level",req.getParameter("approval_level"));
		pMap.put("approval_title",req.getParameter("approval_title"));
		pMap.put("approval_reason",req.getParameter("approval_reason"));
		pMap.put("approval_use",req.getParameter("approval_use"));
		pMap.put("approval_expense",req.getParameter("approval_expense"));
		pMap.put("approval_cash",req.getParameter("approval_cash"));
		
		result = approvalLogic.approvalInsert(pMap);
		ActionForward forward = new ActionForward();
		req.setAttribute("approvalInsert", result);
		forward.setRedirect(true);
		if(result==1){
			forward.setPath("./approvalList.jsp");
		}
		return forward;
	}

}
