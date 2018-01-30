package Mproject.mvc;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import Mproject.util.KoreanConversion;

public class LoginAction implements Action {
	Logger logger = Logger.getLogger(LoginAction.class);
	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
		logger.info("execute 호출성공");
		Map<String,Object> pMap = new HashMap<String,Object>();
		String mem_id = req.getParameter("mem_id");
		String mem_pw = req.getParameter("mem_pw");
		pMap.put("mem_id", KoreanConversion.toKor(mem_id));
		pMap.put("mem_pw", mem_pw);
		
		String path = "";
		ActionForward forward = new ActionForward();
		//true : sendRedirect - 새로운 요청 , false : forward - 유지
		List<Map<String,Object>> member = null; 
		member = LoginLogic.login(pMap);
		String mem_nm = "";
		String mem_no = "";
		String mem_nn = "";
		String mem_em = "";
		if ( member.size() != 0 ){
			mem_nm = member.get(0).get("MEM_NM").toString();
			mem_no = member.get(0).get("MEM_NO").toString();
			mem_nn = member.get(0).get("MEM_NN").toString();
			mem_em = member.get(0).get("MEM_EM").toString();
		}
		req.setAttribute("member", member);
		HttpSession session = req.getSession();   // 객체 생성
		session.setAttribute("mem_nm", mem_nm);
		session.setAttribute("mem_no", mem_no);
		session.setAttribute("mem_nn", mem_nn);	
		session.setAttribute("mem_id", mem_id);
		session.setAttribute("mem_em", mem_em);
		if ( member.size() != 0 ){
			path = "../mProject/start.jsp";
		}
		else{
			path = "../mProject/loginFail.jsp"; 
		}
		forward.setRedirect(false);
		forward.setPath(path);
		return forward;
	}

}