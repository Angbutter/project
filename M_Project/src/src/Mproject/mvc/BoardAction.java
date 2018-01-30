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


public class BoardAction implements Action {
	Logger logger = Logger.getLogger(BoardAction.class);
	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
		logger.info("execute 호출성공");
		
		req.setCharacterEncoding("euc-kr");
		MultipartRequest multi = null;
		int sizeLimit = 10*1024*1024;
		String savePath = "C:\\Users\\minkh\\Desktop\\mpro\\M_Project\\WebContent\\image";
		try{
			multi = new MultipartRequest(req, savePath, sizeLimit, "euc-kr", new DefaultFileRenamePolicy());
		}catch (Exception e){
			e.printStackTrace();
		}
		String filename = multi.getFilesystemName("tr_im");
		if (filename==null){
			filename="";
		}
		String tr_id = multi.getParameter("tr_id");
		String tr_je = multi.getParameter("tr_je");
		String tr_pr = multi.getParameter("tr_pr");
		String tr_ne = multi.getParameter("tr_ne");
		String tr_gb = multi.getParameter("sp_option");
		String path="";
		ActionForward forward = new ActionForward();
		Map<String,Object> pMap = new HashMap<String,Object>();
		pMap.put("tr_id",tr_id);
		pMap.put("tr_je",tr_je);
		pMap.put("tr_pr",tr_pr);
		pMap.put("tr_ne",tr_ne);
		pMap.put("tr_gb",tr_gb);
		pMap.put("tr_im",filename);
		
		BoardLogic boardLogic = new BoardLogic();
		int result = 0;
		result = boardLogic.trBoardIns(pMap);
		
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
