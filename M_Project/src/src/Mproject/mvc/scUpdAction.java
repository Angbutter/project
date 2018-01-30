package Mproject.mvc;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import Mproject.util.KoreanConversion;

public class scUpdAction implements Action {
	Logger logger = Logger.getLogger(scUpdAction.class);
	
	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
		logger.info("scUpdAction execute 호출성공");
		
		Map<String,Object> pMap = new HashMap<String,Object>();
		
		String sc_no = req.getParameter("sc_no");
		String sc_de = req.getParameter("sc_de");
		String sc_je = req.getParameter("sc_je");
		String sc_ne = req.getParameter("sc_ne");
		
		pMap.put("sc_no",sc_no);
		pMap.put("sc_de", sc_de);
		pMap.put("sc_je", KoreanConversion.toKor(sc_je));
		pMap.put("sc_ne", KoreanConversion.toKor(sc_ne));
		
		logger.info("sc_no : "+sc_no);
		logger.info("sc_de : "+sc_de);
		logger.info("sc_je : "+KoreanConversion.toKor(sc_je));
		logger.info("sc_ne : "+KoreanConversion.toKor(sc_ne));
		
		String path = "";
		ActionForward forward = new ActionForward();
		//true : sendRedirect - 새로운 요청 , false : forward - 유지
		// 중복되지 않았으면 회원가입 성공		
		
		int result = 0;
		BoardLogic boardLogic = new BoardLogic();
		result = boardLogic.scUpd(pMap);
		
		if ( result == 0 ){
			path = "../mProject/scUpdf.jsp"; 
		}
		else{
			path = "../mProject/scUpds.jsp";
		}
		
		forward.setRedirect(false);
		forward.setPath(path);
		return forward;
	}

}