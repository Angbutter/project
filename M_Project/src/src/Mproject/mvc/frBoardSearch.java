package Mproject.mvc;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import Mproject.util.KoreanConversion;

public class frBoardSearch implements Action {
	Logger logger = Logger.getLogger(frBoardSearch.class);
	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
		logger.info("execute 호출성공");
		
		String fr_option = req.getParameter("fr_option");	 // 제목, 글쓴이 구분
		String fr_keyword = req.getParameter("fr_keyword");  // 검색어
		
		Map<String,Object> pMap = new HashMap<String,Object>();
		
		pMap.put("fr_option",fr_option);
		pMap.put("fr_keyword",KoreanConversion.toKor(fr_keyword));
		
		List<Map<String,Object>> frSearchBoard = BoardLogic.frBoardSearch(pMap);
		
		req.setAttribute("frSearchBoard", frSearchBoard);
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("../mProject/start.jsp?gugu=fboard");
		return forward;
	}
}
