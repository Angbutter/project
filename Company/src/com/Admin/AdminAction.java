package com.Admin;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import com.main.Action;
import com.main.ActionForward;
import com.Member.MemberLogic;
import com.util.HangulConversion;

public class AdminAction implements Action {
	Logger logger = Logger.getLogger(AdminAction.class);
	
	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
		logger.info("execute 호출성공");
		String jikup = req.getParameter("jikup");
		String deptm_name = req.getParameter("deptm_name");
		String shiredate = req.getParameter("shiredate");
		String ehiredate = req.getParameter("ehiredate");
		logger.info("jikup : "+jikup+", deptm_name : "+deptm_name +", shiredate : "+shiredate+", ehiredate : "+ehiredate);
		AdminLogic adLogic = new AdminLogic();
		Map<String,Object> pMap = new HashMap<String,Object>();
		pMap.put("jikup", jikup);
		pMap.put("deptm_name", deptm_name);
		pMap.put("shiredate", shiredate);
		pMap.put("ehiredate", ehiredate);
		List<Map<String,Object>> empList = adLogic.getEmployee(pMap);
		req.setAttribute("empList", empList);
		logger.info("empList.size() : "+empList.size());
		ActionForward forward = new ActionForward();
		//true : sendRedirect - 새로운 요청 , false : forward - 유지
		forward.setRedirect(false);
		forward.setPath("./jsonEmpList.jsp");
		return forward;		
	}
}