package com.Message;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;

import com.util.HangulConversion;
import com.main.ActionForward;
import com.main.Action;

public class MessageAction implements Action {

	Logger logger = Logger.getLogger(MessageAction.class);
	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		int result=0;
		String path= "";
		MessageLogic msgLogic = new MessageLogic();
		Map<String,Object> pMap = new HashMap<String,Object>();
		String emp_name = HangulConversion.toKor(req.getParameter("emp_name"));
		pMap.put("emp_no", req.getParameter("emp_no"));
		pMap.put("receive_emp_no", req.getParameter("cb_name")); 
		pMap.put("msg_title", req.getParameter("msg_title"));
		pMap.put("msg_title", HangulConversion.toKor(pMap.get("msg_title").toString()));
		//req.setAttribute("title", HangulConversion.toKor(req.getParameter("title")));
		pMap.put("msg_contents", req.getParameter("msg_contents"));
		pMap.put("msg_contents", HangulConversion.toKor(pMap.get("msg_contents").toString()));
		pMap.put("emp_name", emp_name);
		//req.setAttribute("message", HangulConversion.toKor(req.getParameter("message")));
		logger.info("받는 사람:"+req.getParameter("cb_name"));
		logger.info("제목:"+req.getParameter("msg_title"));
		logger.info("msg_title:"+HangulConversion.toKor(pMap.get("msg_title").toString()));
		logger.info("메세지:"+req.getParameter("msg_contents"));
		logger.info("사원:"+req.getParameter("cb_name"));
		logger.info("보내는사람 이름 emp_name : "+emp_name);
		ActionForward forward = new ActionForward();
		result = msgLogic.insertMsgList(pMap);
		if(result==0){
			path="./fail.jsp";
		}
		else{
			forward.setRedirect(false);
			forward.setPath("./memo2Success.jsp");
		}
		//true:sendRedirect-새로운 요청, false:forward-유지
		return forward;
	}

}
