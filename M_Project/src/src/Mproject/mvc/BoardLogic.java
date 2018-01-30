package Mproject.mvc;

import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;

public class BoardLogic {
	Logger logger = Logger.getLogger(LoginLogic.class);
	/* ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ 거래게시판 글쓰기 */
	public int trBoardIns(Map<String, Object> pMap) {
		BoardDao boardDao = new BoardDao();
		int result = 0;
		result = boardDao.trBoardIns(pMap);
		return result;
	}
	/* ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ 거래게시판 검색 */
	public static List<Map<String, Object>> trBoardSearch(Map<String, Object> pMap) {
		BoardDao boardDao = new BoardDao();
		List<Map<String, Object>> trSearchBoard = null;
		trSearchBoard = boardDao.trBoardSearch(pMap);
		return trSearchBoard;
	}
	
	/* ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ 거래게시판 수정 */
	public int trUpd(Map<String, Object> pMap) {
		BoardDao boardDao = new BoardDao();
		int result = 0;
		result = boardDao.trUpd(pMap);
		return result;
	}
	
	/* ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ 거래게시판 삭제 */
	public int trDel(String tr_no) {
		BoardDao boardDao = new BoardDao();
		int result = 0;
		result = boardDao.trDel(tr_no);
		return result;
	}
	
	/* ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ 거래게시판 거래완료 */
	public int trEnd(Map<String, Object> pMap) {
		BoardDao boardDao = new BoardDao();
		int result = 0;
		result = boardDao.trEnd(pMap);
		return result;
	}
	
	/* ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ 자유게시판 검색 */
	public static List<Map<String, Object>> frBoardSearch(Map<String, Object> pMap) {
		BoardDao boardDao = new BoardDao();
		List<Map<String, Object>> frSearchBoard = null;
		frSearchBoard = boardDao.frBoardSearch(pMap);
		return frSearchBoard;
	}
	/* ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ 자유게시판 글쓰기 */
	public int frBoardIns(Map<String, Object> pMap) {
		BoardDao boardDao = new BoardDao();
		int result = 0;
		result = boardDao.frBoardIns(pMap);
		return result;
	}
	/* ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ 자유게시판 수정 */
	public int frUpd(Map<String, Object> pMap) {
		BoardDao boardDao = new BoardDao();
		int result = 0;
		result = boardDao.frUpd(pMap);
		return result;
	}
	
	/* ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ 자유게시판 삭제 */
	public int frDel(String fr_no) {
		BoardDao boardDao = new BoardDao();
		int result = 0;
		result = boardDao.frDel(fr_no);
		return result;
	}
	
	/* ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ 일정 추가 */
	public int scIns(Map<String, Object> pMap) {
		BoardDao boardDao = new BoardDao();
		int result = 0;
		result = boardDao.scIns(pMap);
		return result;
	}
	
	/* ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ 일정 수정 */
	public int scUpd(Map<String, Object> pMap) {
		BoardDao boardDao = new BoardDao();
		int result = 0;
		result = boardDao.scUpd(pMap);
		return result;
	}
	
	/* ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ 일정 삭제 */
	public int scDel(String sc_no) {
		BoardDao boardDao = new BoardDao();
		int result = 0;
		result = boardDao.scDel(sc_no);
		return result;
	}
	
	/* ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ 일정 불러오기 */
	public List<Map<String, Object>> scList(String mem_no) {
		BoardDao boardDao = new BoardDao();
		int result = 0;
		List<Map<String,Object>> scList = null;
		scList = boardDao.scList(mem_no);
		return scList;
	}

}
