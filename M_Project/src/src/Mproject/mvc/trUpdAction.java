package Mproject.mvc;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import Mproject.util.KoreanConversion;
import org.apache.log4j.Logger;

public class trUpdAction implements Action {
	Logger logger = Logger.getLogger(trUpdAction.class);
	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
		logger.info("execute 호출성공");
		
		String tr_id = req.getParameter("tr_id");
		String tr_je = req.getParameter("tr_je");
		String tr_pr = req.getParameter("tr_pr");
		String tr_ne = req.getParameter("tr_ne");
		String tr_no = req.getParameter("tr_no");
		
		String path="";
		ActionForward forward = new ActionForward();
		Map<String,Object> pMap = new HashMap<String,Object>();
		
		logger.info("tr_id : "+KoreanConversion.toKor(tr_id));
		logger.info("tr_je : "+KoreanConversion.toKor(tr_je));
		logger.info("tr_pr : "+KoreanConversion.toKor(tr_pr));
		logger.info("tr_ne : "+KoreanConversion.toKor(tr_ne));
		logger.info("tr_no : "+tr_no);
		
		pMap.put("tr_id",KoreanConversion.toKor(tr_id));
		pMap.put("tr_je",KoreanConversion.toKor(tr_je));
		pMap.put("tr_pr",KoreanConversion.toKor(tr_pr));
		pMap.put("tr_ne",KoreanConversion.toKor(tr_ne));
		pMap.put("tr_no", tr_no);
		
		BoardLogic boardLogic = new BoardLogic();
		int result = 0;
		result = boardLogic.trUpd(pMap);
		
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
