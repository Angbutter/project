package com.Message;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.StringTokenizer;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import com.main.ActionForward;
import com.main.Action;
public class MessageDeleteAction implements Action {
	Logger logger 
	= Logger.getLogger
			(MessageDeleteAction.class);
	
	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		logger.info("execute 호출 성공");
		MessageLogic messageLogic = new MessageLogic();
		int result = 0;
		int msg_no = 0;
		if(req.getParameter("msg_no")!=null){
			msg_no = Integer.parseInt(req.getParameter("msg_no"));
		}
		//result = meLogic.messageDelete(msg_no);
		ActionForward forward = new ActionForward();
		forward.setRedirect(true);
		forward.setPath("./sendMessageList.kosmo");
		return forward;
	}
}


