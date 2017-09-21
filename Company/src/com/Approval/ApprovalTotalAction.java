package com.Approval;
import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;

import com.main.Action;
import com.main.ActionForward;

public class ApprovalTotalAction implements Action { 
	Logger logger = Logger.getLogger(ApprovalTotalAction.class);
	
	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
		logger.info("ApprovalTotalAction 호출 성공");
		ApprovalLogic approvalLogic = new ApprovalLogic();
		List<Map<String,Object>> totalList = null;
		totalList = approvalLogic.getTotal();
		req.setAttribute("totalList", totalList);
		HttpSession session = req.getSession();
		if(totalList!=null) {
			session.setAttribute("total", totalList.get(0).get("TOTAL"));
		}
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("./jsonGetTotal.jsp");
		return forward;
	}

}
