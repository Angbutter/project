package com.Board;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;

import com.Admin.AdminDao;

public class BoardLogic {
	Logger logger = Logger.getLogger(BoardLogic.class);
	public List<Map<String,Object>> getEmployee(Map<String, Object> pMap){
		logger.info("getEmployee() ȣ�� ����");
		List<Map<String,Object>> empList = new ArrayList<Map<String,Object>>();
		AdminDao adDao = new AdminDao();
		empList = adDao.getEmployee(pMap);
		return empList;
	}
	/* �������������������������������������������������������������������� ��� �Խ��� ���� */
	public List<Map<String, Object>> getBoardEmp() {
		logger.info("getBoardEmp() ȣ�� ����");
		List<Map<String,Object>> boardEmpList = new ArrayList<Map<String,Object>>();
		BoardDao boardDao = new BoardDao();
		boardEmpList = boardDao.getBoardEmp();
		return boardEmpList;
	}
	public int hitUpdate(Map<String, Object> pMap) {
		logger.info("hitUpdate() ȣ�� ����");
		int result = 0 ;
		BoardDao boardDao = new BoardDao();
		result = boardDao.hitUpdate(pMap);
		return result;
	}
	public int boardIns(Map<String, Object> pMap) {
		logger.info("boardIns() ȣ�� ����");
		int result = 0 ;
		BoardDao boardDao = new BoardDao();
		result = boardDao.boardIns(pMap);
		return result;
	}
	public int boardDel(Map<String, Object> pMap) {
		logger.info("boardDel() ȣ�� ����");
		int result = 0 ;
		BoardDao boardDao = new BoardDao();
		result = boardDao.boardDel(pMap);
		return result;
	}
	public int boardUpd(Map<String, Object> pMap) {
		logger.info("boardUpd() ȣ�� ����");
		int result = 0 ;
		BoardDao boardDao = new BoardDao();
		result = boardDao.boardUpd(pMap);
		return result;
	}
	/* �������������������������������������������������������������������� ��� �Խ��� �� */
	
	/* �������������������������������������������������������������������� ���� �Խ��� ���� */
	public List<Map<String,Object>> getBoardList(Map<String, Object> pMap) {
		logger.info("getBoardList ȣ�� ����");
		int page = 0;//���� �ִ� ������
		int pageSize = 0;//�� �������� �ѷ��� �ο� ��
		int start = 0;//���� �������� ��ȣ 1, 6, 11, 16  
		int end = 0;//�� ������ ��ȣ 5, 10, 15, 20
		BoardDao bdDao = new BoardDao();
		List<Map<String, Object>> totalList = bdDao.getTotal();
		int total = 0;//��ü �ο��� �� 33		
		if(pMap.get("page")!=null 
		&& Integer.parseInt(pMap.get("page").toString())>0){
			page = Integer.parseInt(pMap.get("page").toString());
		}
		//������ ���� ��ü�ο���� �������� getTotal �޼ҵ带 �����Ͽ����Ƿ� ���� ȭ�鿡��
		//�Ķ���ͷ� ���� �ʾƵ� �� ��.
		//total���� ������ �̵��� ���� start���� end���� ����ϴµ� �ʿ��� �����̴�.
		//�� ���� ����� ���ؼ��� �ȵȴ�.
		if(totalList!=null){
			total = Integer.parseInt(totalList.get(0).get("TOTAL").toString());
		}
		if(pMap.get("pageSize")!=null && Integer.parseInt(pMap.get("pageSize").toString())>0){
			pageSize = Integer.parseInt(pMap.get("pageSize").toString());
		}
		logger.info("page:"+page+", pageSize:"+pageSize+", total:"+total);
		//start���� end���� ����ؼ� ���
		if(page > 0) {
		//��)���� �ٶ󺸴� ��������ȣ�� 2�̸� ((2-1)*5)+1	
			start = ((page-1)*pageSize)+1;
			end = page*pageSize;//5 10 15 20 25 30 35
			pMap.put("start", start);
			
			if(end > total) {//
				pMap.put("end", total);
			}else {
				pMap.put("end", end);
			}
		}
		logger.info("start:"+start+", end:"+end);
		List<Map<String,Object>> boardList = new ArrayList<Map<String,Object>>();
		boardList = bdDao.boardList(pMap);
		return boardList;
	}
	public int boardInsert(Map<String, Object> pMap) {
		logger.info("fileInsert ȣ�� ����");
		int result=0;
		BoardDao bdDao = new BoardDao();
		result = bdDao.boardInsert(pMap);
		return result;
	}
	public int boardUpdate(Map<String, Object> pMap) {
		logger.info("boardUpdate ȣ�� ����");
		int result=0;
		BoardDao bdDao = new BoardDao();
		result = bdDao.boardUpdate(pMap);
		return result;
	}
	public List<Map<String, Object>> getTotal() {
		logger.info("getTotal ȣ�� ����");
		BoardDao bdDao = new BoardDao();
		List<Map<String,Object>> totalList = null;
		totalList = bdDao.getTotal();
		return totalList;
	}
	/* �������������������������������������������������������������������� ���� �Խ��� �� */
}
