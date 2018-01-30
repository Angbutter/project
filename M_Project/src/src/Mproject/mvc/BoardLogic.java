package Mproject.mvc;

import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;

public class BoardLogic {
	Logger logger = Logger.getLogger(LoginLogic.class);
	/* ����������������������������������������������������������������� �ŷ��Խ��� �۾��� */
	public int trBoardIns(Map<String, Object> pMap) {
		BoardDao boardDao = new BoardDao();
		int result = 0;
		result = boardDao.trBoardIns(pMap);
		return result;
	}
	/* ����������������������������������������������������������������� �ŷ��Խ��� �˻� */
	public static List<Map<String, Object>> trBoardSearch(Map<String, Object> pMap) {
		BoardDao boardDao = new BoardDao();
		List<Map<String, Object>> trSearchBoard = null;
		trSearchBoard = boardDao.trBoardSearch(pMap);
		return trSearchBoard;
	}
	
	/* ����������������������������������������������������������������� �ŷ��Խ��� ���� */
	public int trUpd(Map<String, Object> pMap) {
		BoardDao boardDao = new BoardDao();
		int result = 0;
		result = boardDao.trUpd(pMap);
		return result;
	}
	
	/* ����������������������������������������������������������������� �ŷ��Խ��� ���� */
	public int trDel(String tr_no) {
		BoardDao boardDao = new BoardDao();
		int result = 0;
		result = boardDao.trDel(tr_no);
		return result;
	}
	
	/* ����������������������������������������������������������������� �ŷ��Խ��� �ŷ��Ϸ� */
	public int trEnd(Map<String, Object> pMap) {
		BoardDao boardDao = new BoardDao();
		int result = 0;
		result = boardDao.trEnd(pMap);
		return result;
	}
	
	/* ����������������������������������������������������������������� �����Խ��� �˻� */
	public static List<Map<String, Object>> frBoardSearch(Map<String, Object> pMap) {
		BoardDao boardDao = new BoardDao();
		List<Map<String, Object>> frSearchBoard = null;
		frSearchBoard = boardDao.frBoardSearch(pMap);
		return frSearchBoard;
	}
	/* ����������������������������������������������������������������� �����Խ��� �۾��� */
	public int frBoardIns(Map<String, Object> pMap) {
		BoardDao boardDao = new BoardDao();
		int result = 0;
		result = boardDao.frBoardIns(pMap);
		return result;
	}
	/* ����������������������������������������������������������������� �����Խ��� ���� */
	public int frUpd(Map<String, Object> pMap) {
		BoardDao boardDao = new BoardDao();
		int result = 0;
		result = boardDao.frUpd(pMap);
		return result;
	}
	
	/* ����������������������������������������������������������������� �����Խ��� ���� */
	public int frDel(String fr_no) {
		BoardDao boardDao = new BoardDao();
		int result = 0;
		result = boardDao.frDel(fr_no);
		return result;
	}
	
	/* ����������������������������������������������������������������� ���� �߰� */
	public int scIns(Map<String, Object> pMap) {
		BoardDao boardDao = new BoardDao();
		int result = 0;
		result = boardDao.scIns(pMap);
		return result;
	}
	
	/* ����������������������������������������������������������������� ���� ���� */
	public int scUpd(Map<String, Object> pMap) {
		BoardDao boardDao = new BoardDao();
		int result = 0;
		result = boardDao.scUpd(pMap);
		return result;
	}
	
	/* ����������������������������������������������������������������� ���� ���� */
	public int scDel(String sc_no) {
		BoardDao boardDao = new BoardDao();
		int result = 0;
		result = boardDao.scDel(sc_no);
		return result;
	}
	
	/* ����������������������������������������������������������������� ���� �ҷ����� */
	public List<Map<String, Object>> scList(String mem_no) {
		BoardDao boardDao = new BoardDao();
		int result = 0;
		List<Map<String,Object>> scList = null;
		scList = boardDao.scList(mem_no);
		return scList;
	}

}
