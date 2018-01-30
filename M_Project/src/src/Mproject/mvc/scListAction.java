package Mproject.mvc;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;

import Mproject.util.KoreanConversion;

public class scListAction implements Action {
	Logger logger = Logger.getLogger(scListAction.class);
	
	@Override 
	public ActionForward execute(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
		logger.info("scListAction execute 호출성공");
		
		Map<String,Object> pMap = new HashMap<String,Object>();
		List<Map<String,Object>> scList = null;
		HttpSession session = req.getSession();
		String mem_no = session.getAttribute("mem_no").toString();
		
		logger.info("mem_no : "+mem_no);
		
		String path = "";
		ActionForward forward = new ActionForward();
		//true : sendRedirect - 새로운 요청 , false : forward - 유지
		// 중복되지 않았으면 회원가입 성공		
		
		int result = 0;
		BoardLogic boardLogic = new BoardLogic();
		scList = boardLogic.scList(mem_no);
		
		req.setAttribute("scList", scList);
		path = "../mProject/start.jsp?gugu=cal"; 
		
		forward.setRedirect(false);
		forward.setPath(path);
		return forward;
	}

}