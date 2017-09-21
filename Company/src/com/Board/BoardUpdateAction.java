package com.Board;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import com.main.Action;
import com.main.ActionForward;

public class BoardUpdateAction extends HttpServlet implements Action {
	Logger logger = Logger.getLogger(BoardUpdateAction.class);
	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
		logger.info("BoardUpdateAction 호출 성공");
		BoardLogic boardLogic = new BoardLogic();
		int result = 0;
		Map<String,Object> pMap = new HashMap<String,Object>();
		logger.info(req.getParameter("board_no"));
		logger.info(req.getParameter("board_title"));
		logger.info(req.getParameter("board_text"));
		logger.info(req.getParameter("board_level"));
		
		String board_no = req.getParameter("board_no");
		String board_title = req.getParameter("board_title");
		String board_text = req.getParameter("board_text");
		String board_level = req.getParameter("board_level");
		
		pMap.put("board_no",board_no);
		pMap.put("board_title",board_title);
		pMap.put("board_text",board_text);
		pMap.put("board_level",board_level);
		result = boardLogic.boardUpdate(pMap);
		ActionForward forward = new ActionForward();
		req.setAttribute("boardUpdate", result);
		forward.setRedirect(false);
		logger.info("result:"+result);
		if(result==1){
			forward.setPath("./boardList.jsp");
		}
		return forward;
	}

}
