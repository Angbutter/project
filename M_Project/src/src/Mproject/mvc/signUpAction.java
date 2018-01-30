package Mproject.mvc;

import java.io.IOException;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import Mproject.util.KoreanConversion;

import org.apache.log4j.Logger;

public class signUpAction implements Action {
	Logger logger = Logger.getLogger(signUpAction.class);
	
	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
		logger.info("signUpAction execute 호출성공");
		Map<String,Object> pMap = new HashMap<String,Object>();
		String mem_id = req.getParameter("signup_mem_id");
		String mem_pw = req.getParameter("signup_mem_pw");
		String mem_te = req.getParameter("signup_mem_te1")+"-"+req.getParameter("signup_mem_te2")+"-"+req.getParameter("signup_mem_te3");
		String mem_nm = req.getParameter("signup_mem_nm");
		String mem_nn = req.getParameter("signup_mem_nn");
		String mem_em = req.getParameter("signup_mem_em");
		pMap.put("mem_id", KoreanConversion.toKor(mem_id));
		pMap.put("mem_pw", mem_pw);
		pMap.put("mem_te", mem_te);
		pMap.put("mem_nm", KoreanConversion.toKor(mem_nm));
		pMap.put("mem_nn", KoreanConversion.toKor(mem_nn));
		pMap.put("mem_em", mem_em);
		String path = "";
		ActionForward forward = new ActionForward();
		//true : sendRedirect - 새로운 요청 , false : forward - 유지
		// 중복되지 않았으면 회원가입 성공		
		
		int result = 0;
		signupLogic signuplogic = new signupLogic();
		result = signuplogic.signup(pMap);
		
		if ( result == 0 ){
			path = "../mProject/signupFail.jsp"; 
		}
		else{
			path = "../mProject/signupSuccess.jsp";
		}
		
		forward.setRedirect(false);
		forward.setPath(path);
		return forward;
	}

}