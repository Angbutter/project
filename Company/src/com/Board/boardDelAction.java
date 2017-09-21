package com.Board;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;

import com.main.Action;
import com.main.ActionForward;

public class boardDelAction implements Action {
	Logger logger = Logger.getLogger(boardDelAction.class);
	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
		logger.info("execute 호출성공");
		BoardLogic boardLogic = new BoardLogic();
		int result = 0;
		Map<String,Object> pMap = new HashMap<String,Object>();
		HttpSession session = req.getSession();
		String emp_no = session.getAttribute("emp_no").toString();
		String board_emp_title = req.getParameter("d_title2");
		String board_emp_content = req.getParameter("d_content2");
		String board_emp_pw = req.getParameter("d_pw2");
		String board_emp_no = req.getParameter("board_emp_no");
		pMap.put("emp_no", emp_no);
		pMap.put("board_emp_title", board_emp_title);
		pMap.put("board_emp_content", board_emp_content);
		pMap.put("board_emp_pw", board_emp_pw);
		pMap.put("board_emp_no", board_emp_no);
		result = boardLogic.boardDel(pMap);
		ActionForward forward = new ActionForward();
		//true : sendRedirect - 새로운 요청 , false : forward - 유지
		forward.setRedirect(false);
		
		if ( result == 1 ){
			forward.setPath("./boardDeleteSucess.jsp");
		}
		else {
			boardLogic.hitUpdate(pMap);
			forward.setPath("./boardDeleteFail.jsp");
		}
		return forward;	
	}

}
