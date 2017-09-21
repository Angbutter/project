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
public class MessageRecvAction implements Action{
	Logger logger = Logger.getLogger(MessageRecvAction.class);
	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		logger.info("execute ȣ�� ����");
		MessageLogic meLogic = new MessageLogic();
		Map<String,Object> pMap = new HashMap<String,Object>();
		logger.info("receive_emp_no:"+req.getParameter("receive_emp_no"));
		pMap.put("receive_emp_no", req.getParameter("receive_emp_no"));
		List<Map<String, Object>> rmeList
			=meLogic.recvMessageList(pMap);
		req.setAttribute("rmeList", rmeList);
		logger.info(pMap.get("receive_emp_no"));
		ActionForward forward = new ActionForward();
		//true:sendRedirect-���ο� ��û, false:forward-����
		forward.setRedirect(false);
		forward.setPath("./jsonRecvMessageList.jsp");
		return forward;
	}
}
