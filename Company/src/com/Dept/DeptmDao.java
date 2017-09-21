package com.Dept;

import java.io.Reader;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.apache.log4j.Logger;

public class DeptmDao {
	Logger logger = Logger.getLogger(DeptmDao.class);
	SqlSessionFactory sqlMapper = null;
	//����Ŭ ���� Ŀ�ؼ� ����- commit, rollback
	SqlSession sqlSes = null;
	String resource =
			"Final/mybatis/MapperConfig.xml";
	public List<Map<String, Object>> getDeptmList(Map<String, Object> pMap) {
		logger.info("getDeptmList ȣ�� ����");
		List<Map<String,Object>> deptList = null;
		try {
			Reader reader = null;
			reader = 
					Resources.getResourceAsReader(resource);
			logger.info("getDeptmList ȣ�� ����");
			sqlMapper =
					new SqlSessionFactoryBuilder()
									.build(reader);
			sqlSes = sqlMapper.openSession();
			String deptm_name = (String)pMap.get("deptm_name");
			//logger.info("�μ���:"+deptm_name);
			deptList = sqlSes.selectList("getDeptmList",deptm_name);
			logger.info("deptList:"+deptList.size());
		} catch (Exception e) {
			logger.info("Exception:"+e.getMessage());
		}
		return deptList;
	}

}
