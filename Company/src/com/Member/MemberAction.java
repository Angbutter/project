package com.Member;

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
public class MemberAction implements Action {
	Logger logger = Logger.getLogger(MemberAction.class);
	
	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
		logger.info("execute ȣ�⼺��");
		MemberLogic memLogic = new MemberLogic();
		Map<String,Object> pMap = new HashMap<String,Object>();
		
		String pName = "";
		String name = memLogic.getMemName(pName);
		ActionForward forward = new ActionForward();
		//true : sendRedirect - ���ο� ��û , false : forward - ����
		forward.setRedirect(false);
		/*forward.setPath("./getMemberList.jsp");*/
		return forward;
	}

}
