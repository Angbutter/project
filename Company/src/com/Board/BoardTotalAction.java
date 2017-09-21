package com.Board;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;

import com.main.Action;
import com.main.ActionForward;

public class BoardTotalAction implements Action {
	Logger logger = Logger.getLogger(BoardTotalAction.class);
	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		logger.info("BoardTotalAction 호출 성공");
		BoardLogic boardLogic = new BoardLogic();
		List<Map<String,Object>> totalList = null;
		totalList = boardLogic.getTotal();
		req.setAttribute("totalList", totalList);
		HttpSession session = req.getSession();
		if(totalList!=null) {
			session.setAttribute("total", totalList.get(0).get("TOTAL"));
		}
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("./jsonGetTotal.jsp");
		return forward;
		
	}
}
