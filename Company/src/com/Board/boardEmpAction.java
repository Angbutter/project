package com.Board;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import com.main.Action;
import com.main.ActionForward;

public class boardEmpAction implements Action {
	Logger logger = Logger.getLogger(boardEmpAction.class);
	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
		logger.info("execute ȣ�⼺��");
		BoardLogic boardLogic = new BoardLogic();
		List<Map<String,Object>> boardEmpList = boardLogic.getBoardEmp();
		req.setAttribute("boardEmpList", boardEmpList);
		logger.info("boardEmpList.size() : "+boardEmpList.size());
		ActionForward forward = new ActionForward();
		//true : sendRedirect - ���ο� ��û , false : forward - ����
		forward.setRedirect(false);
		forward.setPath("./index.jsp?gugu=board");
		return forward;	
	}

}
