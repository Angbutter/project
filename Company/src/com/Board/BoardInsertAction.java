package com.Board;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import com.main.Action;
import com.main.ActionForward;

public class BoardInsertAction extends HttpServlet implements Action {
	Logger logger = Logger.getLogger(BoardInsertAction.class);

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
		logger.info("BoardInsertAction 호출 성공");
		BoardLogic boardLogic = new BoardLogic();
		int result = 0;
		Map<String,Object> pMap = new HashMap<String,Object>();
		logger.info(req.getParameter("emp_no"));
		logger.info(req.getParameter("board_text"));
		logger.info(req.getParameter("board_level")); 
		logger.info(req.getParameter("emp_name"));
		logger.info(req.getParameter("jikup"));
		logger.info(req.getParameter("board_title"));
		pMap.put("emp_no",Integer.parseInt(req.getParameter("emp_no")));
		pMap.put("emp_name",req.getParameter("emp_name"));
		pMap.put("jikup",req.getParameter("jikup"));
		pMap.put("board_title",req.getParameter("board_title"));
		pMap.put("board_text",req.getParameter("board_text"));
		pMap.put("board_level",req.getParameter("board_level"));
		result = boardLogic.boardInsert(pMap);
		ActionForward forward = new ActionForward();
		req.setAttribute("boardInsert", result);
		forward.setRedirect(true);
		if(result==1){
			forward.setPath("./boardInsertSuccess.jsp");
		}
		else {
			forward.setPath("./boardInsertFail.jsp");
		}
		return forward;
	}

}
