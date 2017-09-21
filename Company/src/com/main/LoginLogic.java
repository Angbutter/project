package com.main;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.Admin.AdminDao;

public class LoginLogic {
	public static String login(Map<String, Object> pMap) {
		String emp_name = "";
		AdminDao adDao = new AdminDao();
		emp_name = adDao.loginLogic(pMap);
		return emp_name;
	}
	public static String pwFind(Map<String, Object> pMap) {
		String emp_pw = "";
		AdminDao adDao = new AdminDao();
		emp_pw = adDao.pwFind(pMap);
		return emp_pw;
	}
	public int pwUpdate(Map<String, Object> pMap) {
		int result = 0;
		AdminDao adDao = new AdminDao();
		result = adDao.pwUpdate(pMap);
		return result;
	}
}
