package com.Dept;

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

public class DeptmAction implements Action {
	Logger logger = Logger.getLogger(DeptmAction.class);
	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		logger.info("execute 호출 성공");
		DeptmLogic deptLogic = new DeptmLogic();
		Map<String,Object> pMap = new HashMap<String,Object>();
		logger.info("부서명:"+req.getParameter("deptm_name"));
		String deptm_name = req.getParameter("deptm_name");
		logger.info("execute 호출 성공");
		String path= "";
		pMap.put("deptm_name", deptm_name); 
		List<Map<String, Object>> deptList = deptLogic.getDeptmList(pMap);
		ActionForward forward = new ActionForward();
		if ( deptList.isEmpty() || deptList==null || deptList.size()==0 ){
			path="./fail.jsp"; 
		}
		else{
			req.setAttribute("deptList", deptList);
			path="./jsonGetDeptmList.jsp";
		}
		//true:sendRedirect-새로운 요청, false:forward-유지
		forward.setRedirect(false);
		forward.setPath(path);
		return forward;
	}

}
