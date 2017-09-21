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

public class ApprovalDeleteAction extends HttpServlet implements Action {
	Logger logger = Logger.getLogger(ApprovalDeleteAction.class);
	
	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
		logger.info("ApprovalUpdateAction 호출 성공");
		ApprovalLogic approvalLogic = new ApprovalLogic();
		int result = 0;
		Map<String,Object> pMap = new HashMap<String,Object>();
		result = approvalLogic.approvalDelete(pMap);
		ActionForward forward = new ActionForward();
		req.setAttribute("approvalDelete", result);
		forward.setRedirect(false);
		logger.info("result:"+result);
		if(result==1){
			forward.setPath("./ddDelete.jsp");
		}
		return forward;
	}

}
