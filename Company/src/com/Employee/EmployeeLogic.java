package com.Employee;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;

public class EmployeeLogic {
	Logger logger = 
			Logger.getLogger(EmployeeLogic.class);
	EmployeeDao empDao = new EmployeeDao();
	public List<Map<String,Object>> getEmployeeList()
	{
		logger.info("getEmployeeList 호출 성공");
		List<Map<String,Object>> empList
			= new ArrayList<Map<String,Object>>();
		empList=empDao.getEmployeeList();//Dao계층의 메소드 호출
		return empList;
	}
	
}
