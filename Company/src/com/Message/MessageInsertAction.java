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
		logger.info("�������� ȣ�� ����");
		MessageLogic messageLogic = new MessageLogic();
		int result = 0;//1�̸� ���� 0�̸� ����
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
		if(result==1){//�������� ����
			forward.setPath("./index.jsp");
		}else{//����
			forward.setPath("./messageInsertFail.jsp");//404
		}
		//path���� �� isRedirect�� ��ȯ�� �����غ���
		//path=null isRedirect:false
		return forward;
	}
}
