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

public class empUpdateAction implements Action {
	Logger logger = Logger.getLogger(empUpdateAction.class);
	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
		logger.info("execute 호출성공");
		Map<String,Object> pMap = new HashMap<String,Object>();
		String mem_id = req.getParameter("mem_id");
		String mem_nm = req.getParameter("mem_nm");
		String mem_nn = req.getParameter("mem_nn");
		String mem_pw1 = req.getParameter("mem_pw1");
		String mem_pw2 = req.getParameter("mem_pw2");
		String mem_em = req.getParameter("mem_em");
		pMap.put("mem_id", KoreanConversion.toKor(mem_id));
		pMap.put("mem_nm", KoreanConversion.toKor(mem_nm));
		pMap.put("mem_nn", KoreanConversion.toKor(mem_nn));
		pMap.put("mem_pw1", mem_pw1);
		pMap.put("mem_pw2", mem_pw2);
		pMap.put("mem_em", mem_em);
		
		String path = "";
		ActionForward forward = new ActionForward();
		//true : sendRedirect - 새로운 요청 , false : forward - 유지
		int result = 0; 
		LoginLogic loginLogic = new LoginLogic();
		result = loginLogic.memUpd(pMap);
		
		
		if ( result == 0 ){
			path = "../mProject/empUpdateFail.jsp"; 
		}
		else{
			path = "../mProject/empUpdateSuccess.jsp";
		}
		forward.setRedirect(false);
		forward.setPath(path);
		return forward;
	}

}