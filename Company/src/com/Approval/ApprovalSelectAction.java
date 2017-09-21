package com.Approval;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import com.main.Action;
import com.main.ActionForward;
import com.util.HashMapBinder;

public class ApprovalSelectAction implements Action {
	Logger logger = Logger.getLogger(ApprovalSelectAction.class);
	
	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
		logger.info("ApprovalSelectAction 호출 성공");
		ApprovalLogic approvalLogic = new ApprovalLogic();
		List<Map<String,Object>> approvalList = null;
		Map<String,Object> pMap = new HashMap<String,Object>();
		HashMapBinder hmb = new HashMapBinder(req);
		hmb.bind(pMap);
		approvalList = approvalLogic.getApprovalList(pMap);
		ActionForward forward = new ActionForward();
		req.setAttribute("approvalList", approvalList);
		forward.setRedirect(false);
		forward.setPath("./jsonApprovalList.jsp");
		return forward;
	}

}
