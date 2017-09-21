package com.Board;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import com.main.Action;
import com.main.ActionForward;
import com.util.HashMapBinder;

public class BoardSelectAction implements Action {
	Logger logger = Logger.getLogger(BoardSelectAction.class);
	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		logger.info("BoardSelectAction 호출 성공");
		BoardLogic boardLogic = new BoardLogic();
		List<Map<String,Object>> boardList = null;
		Map<String,Object> pMap = new HashMap<String,Object>();
		HashMapBinder hmb = new HashMapBinder(req);
		hmb.bind(pMap);
		boardList = boardLogic.getBoardList(pMap);
		ActionForward forward = new ActionForward();
		req.setAttribute("boardList", boardList);
		forward.setRedirect(false);
		forward.setPath("./jsonBoardList.jsp");
		return forward;
		
	}
	
	

}
