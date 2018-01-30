package Mproject.mvc;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import Mproject.util.KoreanConversion;
import org.apache.log4j.Logger;

public class trEndAction implements Action {
	Logger logger = Logger.getLogger(trEndAction.class);
	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
		logger.info("execute 호출성공");
		
		String tr_no = req.getParameter("tr_no");
		String tr_je = req.getParameter("tr_je");
		
		logger.info("tr_je : "+KoreanConversion.toKor(tr_je));
		
		String path="";
		ActionForward forward = new ActionForward();
		Map<String,Object> pMap = new HashMap<String,Object>();
		
		pMap.put("tr_no", tr_no);
		pMap.put("tr_je", "[거래완료]"+KoreanConversion.toKor(tr_je));
		
		BoardLogic boardLogic = new BoardLogic();
		int result = 0;
		result = boardLogic.trEnd(pMap);
		
		if ( result == 0 ){
			path = "../mProject/trEndf.jsp"; 
		}
		else{
			path = "../mProject/trEnds.jsp";
		}
		forward.setRedirect(false);
		forward.setPath(path);
		return forward;
	}
}
