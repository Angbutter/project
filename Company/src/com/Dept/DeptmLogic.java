package com.Dept;

import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;

	public class DeptmLogic {
		Logger logger = Logger.getLogger(DeptmLogic.class);
		public List<Map<String, Object>> getDeptmList(Map<String, Object> pMap) {
			List<Map<String,Object>> deptList = null;
			DeptmDao deptDao = new DeptmDao();
			deptList=deptDao.getDeptmList(pMap); 
			return deptList;
	}
}
