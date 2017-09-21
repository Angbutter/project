package com.Board;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import com.main.Action;
import com.main.ActionForward;

public class boardHitAction implements Action {
	Logger logger = Logger.getLogger(boardHitAction.class);
	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
		logger.info("execute 호출성공");
		BoardLogic boardLogic = new BoardLogic();
		int result = 0;
		Map<String,Object> pMap = new HashMap<String,Object>();
		String board_emp_hit = req.getParameter("board_emp_hit");
		String board_emp_no = req.getParameter("board_emp_no");
		pMap.put("board_emp_no", board_emp_no);
		pMap.put("board_emp_hit", board_emp_hit);
		result = boardLogic.hitUpdate(pMap);
		ActionForward forward = new ActionForward();
		//true : sendRedirect - 새로운 요청 , false : forward - 유지
		forward.setRedirect(false);
		forward.setPath("./index.jsp?gugu=board");
		return forward;	
	}

}
