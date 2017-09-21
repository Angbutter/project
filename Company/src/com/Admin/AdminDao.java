package com.Admin;

import java.io.Reader;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.apache.log4j.Logger;

public class AdminDao {
	Logger logger = Logger.getLogger(AdminDao.class);
	SqlSessionFactory sqlMapper = null;
	SqlSession sqlSes = null; 
	String resource = "Final/mybatis/MapperConfig.xml";
	
	
	public List<Map<String,Object>> getEmployee(Map<String, Object> pMap) {
		logger.info("getEmployee() ȣ�� ����");
		List<Map<String,Object>> empList = null;
		try {
			Reader reader = Resources.getResourceAsReader(resource);; // 2byte ������ �о���̴� IO Ŭ���� ( ����¿��� �Է°� ���� )	
			sqlMapper = new SqlSessionFactoryBuilder().build(reader);
			sqlSes = sqlMapper.openSession();
			empList = sqlSes.selectList("getEmployee",pMap);
			logger.info("empList.size(): "+empList);
		} catch (Exception e) {
			logger.info("Exception : "+e.getMessage());
		}
		return empList;
	}
	public String loginLogic(Map<String, Object> pMap) {
		logger.info("getEmployee() ȣ�� ����");
		String emp_name = "";
		try {
			Reader reader = Resources.getResourceAsReader(resource);; // 2byte ������ �о���̴� IO Ŭ���� ( ����¿��� �Է°� ���� )	
			sqlMapper = new SqlSessionFactoryBuilder().build(reader);
			sqlSes = sqlMapper.openSession();
			emp_name = sqlSes.selectOne("loginLogic",pMap);
			if ( emp_name==null ){
				emp_name = "";
			}
			logger.info("emp_name : "+emp_name);
		} catch (Exception e) {
			logger.info("Exception : "+e.getMessage());
		}
		return emp_name;
	}


	public List<Map<String, Object>> getDeptList() {
		logger.info("getDeptList() ȣ�� ����");
		List<Map<String,Object>> deptList = new ArrayList<Map<String,Object>>();
		try {
			Reader reader = Resources.getResourceAsReader(resource);; // 2byte ������ �о���̴� IO Ŭ���� ( ����¿��� �Է°� ���� )	
			sqlMapper = new SqlSessionFactoryBuilder().build(reader);
			sqlSes = sqlMapper.openSession();
			deptList = sqlSes.selectList("getDeptList");
		} catch (Exception e) {
			logger.info("Exception : "+e.getMessage());
		}
		return deptList;
	}


	public int empInsert(Map<String, Object> pMap) {
		logger.info("empInsert() ȣ�� ����");
		int result = 0;
		try {
			Reader reader = Resources.getResourceAsReader(resource);; // 2byte ������ �о���̴� IO Ŭ���� ( ����¿��� �Է°� ���� )	
			sqlMapper = new SqlSessionFactoryBuilder().build(reader);
			sqlSes = sqlMapper.openSession();
			result = sqlSes.insert("empInsert",pMap);
			sqlSes.commit();
		} catch (Exception e) {
			logger.info("Exception : "+e.getMessage());
		}
		return result;
	}


	public int empDelete(Map<String, Object> pMap) {
		logger.info("empDelete() ȣ�� ����");
		int result = 0;
		try {
			Reader reader = Resources.getResourceAsReader(resource);; // 2byte ������ �о���̴� IO Ŭ���� ( ����¿��� �Է°� ���� )	
			sqlMapper = new SqlSessionFactoryBuilder().build(reader);
			sqlSes = sqlMapper.openSession();
			result = sqlSes.delete("empDelete",pMap);
			sqlSes.commit();
		} catch (Exception e) {
			logger.info("Exception : "+e.getMessage());
		}
		return result;
	}


	public int empUpdate(Map<String, Object> pMap) {
		logger.info("empUpdate() ȣ�� ����");
		int result = 0;
		try {
			Reader reader = Resources.getResourceAsReader(resource);; // 2byte ������ �о���̴� IO Ŭ���� ( ����¿��� �Է°� ���� )	
			sqlMapper = new SqlSessionFactoryBuilder().build(reader);
			sqlSes = sqlMapper.openSession();
			result = sqlSes.update("empUpdate",pMap);
			sqlSes.commit();
		} catch (Exception e) {
			logger.info("Exception : "+e.getMessage());
		}
		return result;
	}


	public int deptInsert(Map<String, Object> pMap) {
		logger.info("deptInsert() ȣ�� ����");
		int result = 0;
		try {
			Reader reader = Resources.getResourceAsReader(resource);; // 2byte ������ �о���̴� IO Ŭ���� ( ����¿��� �Է°� ���� )	
			sqlMapper = new SqlSessionFactoryBuilder().build(reader);
			sqlSes = sqlMapper.openSession();
			result = sqlSes.insert("deptInsert",pMap);
			sqlSes.commit();
		} catch (Exception e) {
			logger.info("Exception : "+e.getMessage());
		}
		return result;
	}


	public int deptDelete(Map<String, Object> pMap) {
		logger.info("deptDelete() ȣ�� ����");
		int result = 0;
		try {
			Reader reader = Resources.getResourceAsReader(resource);; // 2byte ������ �о���̴� IO Ŭ���� ( ����¿��� �Է°� ���� )	
			sqlMapper = new SqlSessionFactoryBuilder().build(reader);
			sqlSes = sqlMapper.openSession();
			result = sqlSes.delete("deptDelete",pMap);
			sqlSes.commit();
		} catch (Exception e) {
			logger.info("Exception : "+e.getMessage());
		}
		return result;
	}


	public int deptUpdate(Map<String, Object> pMap) {
		logger.info("deptUpdate() ȣ�� ����");
		int result = 0;
		try {
			Reader reader = Resources.getResourceAsReader(resource);; // 2byte ������ �о���̴� IO Ŭ���� ( ����¿��� �Է°� ���� )	
			sqlMapper = new SqlSessionFactoryBuilder().build(reader);
			sqlSes = sqlMapper.openSession();
			result = sqlSes.update("deptUpdate",pMap);
			sqlSes.commit();
		} catch (Exception e) {
			logger.info("Exception : "+e.getMessage());
		}
		return result;
	}
	public String pwFind(Map<String, Object> pMap) {
		logger.info("pwFind() ȣ�� ����");
		String emp_pw = "";
		try {
			Reader reader = Resources.getResourceAsReader(resource);; // 2byte ������ �о���̴� IO Ŭ���� ( ����¿��� �Է°� ���� )	
			sqlMapper = new SqlSessionFactoryBuilder().build(reader);
			sqlSes = sqlMapper.openSession();
			emp_pw = sqlSes.selectOne("pwFind",pMap);
			sqlSes.commit();
		} catch (Exception e) {
			logger.info("Exception : "+e.getMessage());
		}
		return emp_pw;
	}
	public int pwUpdate(Map<String, Object> pMap) {
		logger.info("pwUpdate() ȣ�� ����");
		int result=0;
		try {
			Reader reader = Resources.getResourceAsReader(resource);; // 2byte ������ �о���̴� IO Ŭ���� ( ����¿��� �Է°� ���� )	
			sqlMapper = new SqlSessionFactoryBuilder().build(reader);
			sqlSes = sqlMapper.openSession();
			result = sqlSes.update("pwUpdate",pMap);
			sqlSes.commit();
		} catch (Exception e) {
			logger.info("Exception : "+e.getMessage());
		}
		return result;
	}
	public int empUpd(Map<String, Object> pMap) {
		logger.info("empUpd() ȣ�� ����");
		int result=0;
		try {
			Reader reader = Resources.getResourceAsReader(resource);; // 2byte ������ �о���̴� IO Ŭ���� ( ����¿��� �Է°� ���� )	
			sqlMapper = new SqlSessionFactoryBuilder().build(reader);
			sqlSes = sqlMapper.openSession();
			result = sqlSes.update("empUpd",pMap);
			sqlSes.commit();
		} catch (Exception e) {
			logger.info("Exception : "+e.getMessage());
		}
		return result;
	}
}
