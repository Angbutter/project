package com.Cal;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;


public class calLogic {
	Logger logger = Logger.getLogger(calLogic.class);
	public List<Map<String,Object>> getMemberList(){
/*		logger.info("getMemberList() 호출 성공");
		List<Map<String,Object>> memList = new ArrayList<Map<String,Object>>();
		MemberDao memDao = new MemberDao();
		memList = memDao.getMemberList();
		return memList;*/
		return null;
	}
	public static List<Map<String, Object>> getCalList(String emp_no) {
		List<Map<String,Object>> calList = null;
		calDao caldao = new calDao();
		calList = caldao.getCalList(emp_no);
		return calList;
	}
	public int calInsert(Map<String, Object> pMap) {
		int result = 0;
		calDao caldao = new calDao();
		result = caldao.calInsert(pMap);
		return result;
	}
	public int calUpdate(Map<String, Object> pMap) {
		int result = 0;
		calDao caldao = new calDao();
		result = caldao.calUpdate(pMap);
		return result;
	}
	public int calDelete(Map<String, Object> pMap) {
		int result = 0;
		calDao caldao = new calDao();
		result = caldao.calDelete(pMap);
		return result;
	}
}
