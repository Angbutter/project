package Mproject.mvc;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;

public class ScheduleAction implements Action {
	Logger logger = Logger.getLogger(ScheduleAction.class);
	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
		logger.info("execute 호출성공");
		
		ActionForward forward = new ActionForward();
		ScheduleLogic scheduleLogic = new ScheduleLogic();
		List<Map<String,Object>> scheduleList = null;		
		HttpSession session = req.getSession();
		String mem_no = session.getAttribute("mem_no").toString();
		scheduleList = scheduleLogic.scList(mem_no);
		req.setAttribute("scheduleList", scheduleList);
		//session.setAttribute("calList", calList);
		forward.setRedirect(false);
		forward.setPath("./start.jsp?gugu=sch");
		return forward;
	}
}
