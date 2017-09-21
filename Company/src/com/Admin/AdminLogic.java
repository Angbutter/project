package com.Admin;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;

public class AdminLogic {
	Logger logger = Logger.getLogger(AdminLogic.class);
	public List<Map<String,Object>> getEmployee(Map<String, Object> pMap){
		logger.info("getEmployee() 호출 성공");
		List<Map<String,Object>> empList = new ArrayList<Map<String,Object>>();
		AdminDao adDao = new AdminDao();
		empList = adDao.getEmployee(pMap);
		return empList;
	}
	public List<Map<String, Object>> getDeptList() {
		logger.info("getDeptList() 호출 성공");
		List<Map<String,Object>> deptList = new ArrayList<Map<String,Object>>();
		AdminDao adDao = new AdminDao();
		deptList = adDao.getDeptList();
		return deptList;
	}
	public int empInsert(Map<String, Object> pMap) {
		logger.info("empInsert() 호출 성공");
		int result = 0;
		AdminDao adDao = new AdminDao();
		result = adDao.empInsert(pMap);
		return result;
	}
	public int empDelete(Map<String, Object> pMap) {
		logger.info("empDelete() 호출 성공");
		int result = 0;
		AdminDao adDao = new AdminDao();
		result = adDao.empDelete(pMap);
		return result;
	}
	public int empUpdate(Map<String, Object> pMap) {
		logger.info("empUpdate() 호출 성공");
		int result = 0;
		AdminDao adDao = new AdminDao();
		result = adDao.empUpdate(pMap);
		return result;
	}
	public int deptInsert(Map<String, Object> pMap) {
		logger.info("deptInsert() 호출 성공");
		int result = 0;
		AdminDao adDao = new AdminDao();
		result = adDao.deptInsert(pMap);
		return result;
	}
	public int deptDelete(Map<String, Object> pMap) {
		logger.info("deptDelete() 호출 성공");
		int result = 0;
		AdminDao adDao = new AdminDao();
		result = adDao.deptDelete(pMap);
		return result;
	}
	public int deptUpdate(Map<String, Object> pMap) {
		logger.info("deptUpdate() 호출 성공");
		int result = 0;
		AdminDao adDao = new AdminDao();
		result = adDao.deptUpdate(pMap);
		return result;
	}
	public int empUpd(Map<String, Object> pMap) {
		logger.info("empUpd() 호출 성공");
		int result = 0;
		AdminDao adDao = new AdminDao();
		result = adDao.empUpd(pMap);
		return result;
	}
}
