package Mproject.mvc;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import Mproject.util.KoreanConversion;

public class frUpdAction implements Action {
	Logger logger = Logger.getLogger(frUpdAction.class);
	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
		logger.info("execute 호출성공");
		
		String fr_je = req.getParameter("fr_je");
		String fr_ne = req.getParameter("fr_ne");
		String fr_no = req.getParameter("fr_no");
		String path="";
		ActionForward forward = new ActionForward();
		Map<String,Object> pMap = new HashMap<String,Object>();
		logger.info("fr_je : "+KoreanConversion.toKor(fr_je));
		logger.info("fr_ne : "+KoreanConversion.toKor(fr_ne));
		logger.info("fr_no : "+fr_no);
		
		pMap.put("fr_je",KoreanConversion.toKor(fr_je));
		pMap.put("fr_ne",KoreanConversion.toKor(fr_ne));
		pMap.put("fr_no", fr_no);
		
		BoardLogic boardLogic = new BoardLogic();
		int result = 0;
		result = boardLogic.frUpd(pMap);
		
		if ( result == 0 ){
			path = "../mProject/trUpdf.jsp"; 
		}
		else{
			path = "../mProject/trUpds.jsp";
		}
		forward.setRedirect(false);
		forward.setPath(path);
		return forward;
	}
}
