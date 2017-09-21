package com.Member;

import java.io.Reader;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.apache.log4j.Logger;


public class MemberDao {
	Logger logger = Logger.getLogger(MemberDao.class);
	SqlSessionFactory sqlMapper = null;
	SqlSession sqlSes = null; 
	String resource = "Final/mybatis/MapperConfig.xml";
	
	/* ������������������������������������������������������ �̸� ��ȸ ������������������������������������������������������ */
	public String getMemList(String pName){
		logger.info("��� ��� ��ȸ ����");
		String memName="";
		try {
			Reader reader = Resources.getResourceAsReader(resource);; // 2byte ������ �о���̴� IO Ŭ���� ( ����¿��� �Է°� ���� )	
			sqlMapper = new SqlSessionFactoryBuilder().build(reader);
			sqlSes = sqlMapper.openSession();
			reader.close();
			memName = sqlSes.selectOne("getMemName", pName);
		} catch (Exception e) {
			logger.info("Exception : "+e.getMessage());
		}
		return memName;
	}

	public List<Map<String, Object>> getEmployee() {
		logger.info("getEmployee() ȣ�� ����");
		List<Map<String,Object>> empList = new ArrayList<Map<String,Object>>();
		try {
			Reader reader = Resources.getResourceAsReader(resource);; // 2byte ������ �о���̴� IO Ŭ���� ( ����¿��� �Է°� ���� )	
			sqlMapper = new SqlSessionFactoryBuilder().build(reader);
			sqlSes = sqlMapper.openSession();
			empList = sqlSes.selectList("getEmployee");
			logger.info("memList : "+empList.size());
		} catch (Exception e) {
			logger.info("Exception : "+e.getMessage());
		}
		return empList;
	}
}
