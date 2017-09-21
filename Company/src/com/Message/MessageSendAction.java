package com.Message;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import com.main.ActionForward;
import com.main.Action;
public class MessageSendAction implements Action {
	Logger logger = Logger.getLogger(MessageSendAction.class);
	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		logger.info("execute ȣ�� ����");
		MessageLogic meLogic = new MessageLogic();
		Map<String,Object> pMap = new HashMap<String,Object>();
		logger.info("emp_no:"+req.getParameter("emp_no"));
		pMap.put("emp_no", req.getParameter("emp_no"));
		List<Map<String, Object>> smeList
			=meLogic.sendMessageList(pMap);
		req.setAttribute("smeList", smeList);
		logger.info(pMap.get("emp_no"));   
		ActionForward forward = new ActionForward();
		//true:sendRedirect-���ο� ��û, false:forward-����
		forward.setRedirect(false);
		forward.setPath("./jsonSendMessageList.jsp");
		return forward;
	}

}
