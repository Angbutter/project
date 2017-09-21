package com.Admin;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;

public class AdminLogic {
	Logger logger = Logger.getLogger(AdminLogic.class);
	public List<Map<String,Object>> getEmployee(Map<String, Object> pMap){
		logger.info("getEmployee() ȣ�� ����");
		List<Map<String,Object>> empList = new ArrayList<Map<String,Object>>();
		AdminDao adDao = new AdminDao();
		empList = adDao.getEmployee(pMap);
		return empList;
	}
	public List<Map<String, Object>> getDeptList() {
		logger.info("getDeptList() ȣ�� ����");
		List<Map<String,Object>> deptList = new ArrayList<Map<String,Object>>();
		AdminDao adDao = new AdminDao();
		deptList = adDao.getDeptList();
		return deptList;
	}
	public int empInsert(Map<String, Object> pMap) {
		logger.info("empInsert() ȣ�� ����");
		int result = 0;
		AdminDao adDao = new AdminDao();
		result = adDao.empInsert(pMap);
		return result;
	}
	public int empDelete(Map<String, Object> pMap) {
		logger.info("empDelete() ȣ�� ����");
		int result = 0;
		AdminDao adDao = new AdminDao();
		result = adDao.empDelete(pMap);
		return result;
	}
	public int empUpdate(Map<String, Object> pMap) {
		logger.info("empUpdate() ȣ�� ����");
		int result = 0;
		AdminDao adDao = new AdminDao();
		result = adDao.empUpdate(pMap);
		return result;
	}
	public int deptInsert(Map<String, Object> pMap) {
		logger.info("deptInsert() ȣ�� ����");
		int result = 0;
		AdminDao adDao = new AdminDao();
		result = adDao.deptInsert(pMap);
		return result;
	}
	public int deptDelete(Map<String, Object> pMap) {
		logger.info("deptDelete() ȣ�� ����");
		int result = 0;
		AdminDao adDao = new AdminDao();
		result = adDao.deptDelete(pMap);
		return result;
	}
	public int deptUpdate(Map<String, Object> pMap) {
		logger.info("deptUpdate() ȣ�� ����");
		int result = 0;
		AdminDao adDao = new AdminDao();
		result = adDao.deptUpdate(pMap);
		return result;
	}
	public int empUpd(Map<String, Object> pMap) {
		logger.info("empUpd() ȣ�� ����");
		int result = 0;
		AdminDao adDao = new AdminDao();
		result = adDao.empUpd(pMap);
		return result;
	}
}
