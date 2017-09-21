package com.Cal;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import com.main.Action;
import com.main.ActionForward;

public class calUpdateAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
		Logger logger = Logger.getLogger(calInsertAction.class);
		  logger.info("일정 수정 호출 성공");
		  calLogic adLogic = new calLogic();
	      int result = 0;//1이면 성공 0 이면 실패
	      Map<String,Object> pMap = new HashMap<String,Object>();
	      String emp_no = req.getParameter("emp_no2");
	      String calday = req.getParameter("calday2");
	      String caltitle = req.getParameter("caltitle2");
	      String calcontent = req.getParameter("calcontent2");
	      pMap.put("emp_no", emp_no);
	      pMap.put("calday", calday);
	      pMap.put("caltitle", caltitle);
	      pMap.put("calcontent", calcontent);
	      result = adLogic.calUpdate(pMap);
	      ActionForward forward = new ActionForward();
	      forward.setRedirect(true);
	      if (result==1){ // 회원삭제 성공
	         forward.setPath("./memoUpdateSucess.jsp");
	      }
	      else{ // 실패
	         forward.setPath("./memoUpdateFail.jsp");
	      }
	      return forward;
	}

}
