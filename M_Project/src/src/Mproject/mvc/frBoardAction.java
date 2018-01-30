package Mproject.mvc;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class frBoardAction implements Action {
	Logger logger = Logger.getLogger(frBoardAction.class);
	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
		logger.info("execute 호출성공");
		
		req.setCharacterEncoding("euc-kr");
		MultipartRequest multi = null;
		int sizeLimit = 10*1024*1024;
		String savePath = req.getRealPath("/image");
		try{
			multi = new MultipartRequest(req, savePath, sizeLimit, "euc-kr", new DefaultFileRenamePolicy());
		}catch (Exception e){
			e.printStackTrace();
		}
		String filename = multi.getFilesystemName("fr_im");
		if (filename==null){
			filename="";
		}
		String fr_id = multi.getParameter("fr_id");
		String fr_je = multi.getParameter("fr_je");
		String fr_ne = multi.getParameter("fr_ne");
		String path="";
		ActionForward forward = new ActionForward();
		Map<String,Object> pMap = new HashMap<String,Object>();
		pMap.put("fr_id",fr_id);
		pMap.put("fr_je",fr_je);
		pMap.put("fr_ne",fr_ne);
		pMap.put("fr_im",filename);
		
		BoardLogic boardLogic = new BoardLogic();
		int result = 0;
		result = boardLogic.frBoardIns(pMap);
		
		if ( result == 0 ){
			path = "../mProject/tr_board_f.jsp"; 
		}
		else{
			path = "../mProject/tr_board_s.jsp";
		}
		forward.setRedirect(false);
		forward.setPath(path);
		return forward;
	}
}
