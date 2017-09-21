package com.Employee;

import java.io.Reader;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.apache.log4j.Logger;

public class EmployeeDao {
	Logger logger = Logger.getLogger(EmployeeDao.class);
	SqlSessionFactory sqlMapper = null;
	SqlSession sqlSes = null;
	String resource =
			"Final/mybatis/MapperConfig.xml";
	public int isID(String emp_no) {
		logger.info("isID 호출 성공");
		int result = 0;
		try {
			logger.info("result:"+result);
			Reader reader = null;
			reader = 
					Resources.getResourceAsReader(resource);
			sqlMapper =
					new SqlSessionFactoryBuilder()
									.build(reader);
			sqlSes = sqlMapper.openSession();
			result = sqlSes.selectOne("isID",emp_no);
			logger.info("result:"+result);
		} catch (Exception e) {
			logger.info("Exception:"+e.getMessage());
		}
		return result;
	}
	public List<Map<String, Object>> getEmployeeList() {
		logger.info("getEmployeeList 호출 성공");
		List<Map<String,Object>> empList
		= new ArrayList<Map<String,Object>>();
		try {
			Reader reader = null;
			reader = 
					Resources.getResourceAsReader(resource);
			sqlMapper =
					new SqlSessionFactoryBuilder()
					.build(reader);
			sqlSes = sqlMapper.openSession();
			empList = sqlSes.selectList("getEmployeeList");
			logger.info("empList:"+empList.size());
		} catch (Exception e) {
			logger.info("Exception:"+e.getMessage());
		}
		return empList;
	}
	public List<Map<String, Object>> loginCheck(Map<String, Object> pMap) {
		logger.info("loginCheck 호출 성공");
		List<Map<String,Object>> empInfo = null;
		try {
			Reader reader = null;
			reader = 
					Resources.getResourceAsReader(resource);
			sqlMapper =
					new SqlSessionFactoryBuilder()
					.build(reader);
			sqlSes = sqlMapper.openSession();
			empInfo = sqlSes.selectList("loginCheck",pMap);
			logger.info("size:"+empInfo.size());//1 0
		} catch (Exception e) {
			logger.info("Exception:"+e.getMessage());
		}
		return empInfo;
	}
}
