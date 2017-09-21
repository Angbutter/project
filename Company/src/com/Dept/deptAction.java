package com.Dept;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import com.Admin.AdminLogic;
import com.main.Action;
import com.main.ActionForward;

public class deptAction implements Action {
	Logger logger = Logger.getLogger(deptAction.class);
	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
		logger.info("execute 호출성공");
		AdminLogic adLogic = new AdminLogic();
		List<Map<String,Object>> deptList = adLogic.getDeptList();
		req.setAttribute("deptList", deptList);
		logger.info("deptList.size() : "+deptList.size());
		ActionForward forward = new ActionForward();
		//true : sendRedirect - 새로운 요청 , false : forward - 유지
		forward.setRedirect(false);
		forward.setPath("./jsonDeptList.jsp");
		return forward;		
	}

}
