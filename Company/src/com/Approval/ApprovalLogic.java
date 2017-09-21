package com.Approval;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;

public class ApprovalLogic {
	Logger logger = Logger.getLogger(ApprovalLogic.class);
	public List<Map<String,Object>> getApprovalList(Map<String, Object> pMap) {
		logger.info("getBoardList 호출 성공");
		int page = 0;//내가 있는 페이지
		int pageSize = 0;//한 페이지에 뿌려줄 로우 수
		int start = 0;//시작 페이지의 번호 1, 6, 11, 16  
		int end = 0;//끝 페이지 번호 5, 10, 15, 20
		ApprovalDao apDao = new ApprovalDao();
		List<Map<String, Object>> totalList = apDao.getTotal();
		int total = 0;//전체 로우의 수 33		
		if(pMap.get("page")!=null 
		&& Integer.parseInt(pMap.get("page").toString())>0){
			page = Integer.parseInt(pMap.get("page").toString());
		}
		//별도로 글의 전체로우수를 가져오는 getTotal 메소드를 구현하였으므로 굳이 화면에서
		//파라미터로 받지 않아도 될 것.
		//total값은 페이지 이동에 따른 start값과 end값을 계산하는데 필요한 정보이다.
		//이 값은 절대로 변해서는 안된다.
		if(totalList!=null){
			total = Integer.parseInt(totalList.get(0).get("TOTAL").toString());
		}
		if(pMap.get("pageSize")!=null && Integer.parseInt(pMap.get("pageSize").toString())>0){
			pageSize = Integer.parseInt(pMap.get("pageSize").toString());
		}
		logger.info("page:"+page+", pageSize:"+pageSize+", total:"+total);
		//start값과 end값을 계산해서 담기
		if(page > 0) {
		//예)내가 바라보는 페이지번호가 2이면 ((2-1)*5)+1	
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
		logger.info("approvalInsert 호출 성공");
		int result=0;
		ApprovalDao apDao = new ApprovalDao();
		result = apDao.approvalInsert(pMap);
		return result;
	}
	public int approvalDelete(Map<String, Object> pMap) {
		logger.info("approvalDelete 호출 성공");
		int result=0;
		ApprovalDao apDao = new ApprovalDao();
		result = apDao.approvalDelete(pMap);
		return result;
	}
	public List<Map<String, Object>> getTotal() {
		logger.info("getTotal 호출 성공");
		ApprovalDao apDao = new ApprovalDao();
		List<Map<String,Object>> totalList = null;
		totalList = apDao.getTotal();
		return totalList;
	}
}
