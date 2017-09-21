package com.Member;
import java.io.IOException;
import com.main.ActionForward;
import com.main.Action;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.util.*;

import org.apache.log4j.Logger;
public class MemberAction2 implements Action {
	Logger logger = Logger.getLogger(MemberAction.class);
	   @Override
	   public ActionForward execute(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
	      MemberLogic2 memLogic2 = new MemberLogic2();
	      Map<String,Object> pMap = new HashMap<String,Object>();
	      
	      String deptm_name = req.getParameter("deptm_name");
	      logger.info("부서명:"+deptm_name);
	      
	      String path= null;
	      pMap.put("deptm_name", deptm_name); 
	      List<Map<String, Object>> memList = memLogic2.getMemberList(pMap);
	      ActionForward forward = new ActionForward();
	      if ( memList.isEmpty() || memList==null || memList.size()==0 ){
	         path="./fail.jsp"; 
	      }
	      else{
	    	 logger.info("else");
	         req.setAttribute("memList", memList);
	         path="./jsonGetMemberList2.jsp";
	      }
	      //true:sendRedirect-새로운 요청, false:forward-유지
	      forward.setRedirect(false);
	      forward.setPath(path);
	      return forward;
	}

}
