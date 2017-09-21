package com.Message;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import com.main.ActionForward;
import com.main.Action;
public class MessageUpdateAction implements Action {
	Logger logger = Logger.getLogger(MessageUpdateAction.class);
	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		logger.info("execute 호출 성공");
		ActionForward forward = new ActionForward();
		int result = 0;
		int msg_no = 0;
		if(req.getParameter("msg_no") !=null){
			msg_no = Integer.parseInt(req.getParameter("msg_no").toString());
		}
		MessageLogic meLogic = new MessageLogic();
		result = meLogic.messageReadYNUpdate(msg_no);
		forward.setRedirect(true);
		//forward.setPath("./menu2.jsp");
		forward.setPath("./memo2.jsp");
		return forward;
	}

}
//index.jsp?menu1=memo1&tab=2