package Mproject.mvc;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import Mproject.util.KoreanConversion;

public class BoardSearch implements Action {
	Logger logger = Logger.getLogger(BoardSearch.class);
	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
		logger.info("execute ȣ�⼺��");
		
		String tr_option1 = req.getParameter("tr_option1");	 // ��ü, sap, pap ����
		String tr_option2 = req.getParameter("tr_option2");  // ����, �۾��� ����
		String tr_keyword = req.getParameter("tr_keyword");  // �˻���
		
		Map<String,Object> pMap = new HashMap<String,Object>();
		
		pMap.put("tr_option1",tr_option1);
		pMap.put("tr_option2",tr_option2);
		pMap.put("tr_keyword",KoreanConversion.toKor(tr_keyword));
		
		List<Map<String,Object>> trSearchBoard = BoardLogic.trBoardSearch(pMap);
		
		req.setAttribute("trSearchBoard", trSearchBoard);
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("../mProject/start.jsp?gugu=tboard");
		return forward;
	}
}
