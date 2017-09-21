package com.Message;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import com.util.HangulConversion;
import com.main.ActionForward;
import com.main.Action;
public class MessageInsertAction implements Action {
	Logger logger 
	= Logger.getLogger
			(MessageInsertAction.class);
	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse res) 
			throws ServletException, IOException {
		logger.info("쪽지쓰기 호출 성공");
		MessageLogic messageLogic = new MessageLogic();
		int result = 0;//1이면 성공 0이면 성공
		Map<String,Object> pMap = 
				new HashMap<String,Object>();
		pMap.put("emp_no", req.getParameter("emp_no"));
		pMap.put("receive_emp_no",  req.getParameter("receive_emp_no"));
		pMap.put("msg_title", req.getParameter("msg_title"));
		pMap.put("msg_contents", req.getParameter("msg_contents"));
		result = messageLogic.messageInsert(pMap);
		ActionForward forward =
				new ActionForward();
		forward.setRedirect(true);
		if(result==1){//쪽지쓰기 성공
			forward.setPath("./index.jsp");
		}else{//실패
			forward.setPath("./messageInsertFail.jsp");//404
		}
		//path정보 와 isRedirect의 반환값 생각해보기
		//path=null isRedirect:false
		return forward;
	}
}
