package com.Approval;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;

public class ApprovalLogic {
	Logger logger = Logger.getLogger(ApprovalLogic.class);
	public List<Map<String,Object>> getApprovalList(Map<String, Object> pMap) {
		logger.info("getBoardList ȣ�� ����");
		int page = 0;//���� �ִ� ������
		int pageSize = 0;//�� �������� �ѷ��� �ο� ��
		int start = 0;//���� �������� ��ȣ 1, 6, 11, 16  
		int end = 0;//�� ������ ��ȣ 5, 10, 15, 20
		ApprovalDao apDao = new ApprovalDao();
		List<Map<String, Object>> totalList = apDao.getTotal();
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
		List<Map<String,Object>> approvalList = new ArrayList<Map<String,Object>>();
		approvalList = apDao.approvalList(pMap);
		return approvalList;
	}
	public int approvalInsert(Map<String, Object> pMap) {
		logger.info("approvalInsert ȣ�� ����");
		int result=0;
		ApprovalDao apDao = new ApprovalDao();
		result = apDao.approvalInsert(pMap);
		return result;
	}
	public int approvalDelete(Map<String, Object> pMap) {
		logger.info("approvalDelete ȣ�� ����");
		int result=0;
		ApprovalDao apDao = new ApprovalDao();
		result = apDao.approvalDelete(pMap);
		return result;
	}
	public List<Map<String, Object>> getTotal() {
		logger.info("getTotal ȣ�� ����");
		ApprovalDao apDao = new ApprovalDao();
		List<Map<String,Object>> totalList = null;
		totalList = apDao.getTotal();
		return totalList;
	}
}
