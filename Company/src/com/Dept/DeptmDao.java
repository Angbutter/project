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
	//오라클 서버 커넥션 맺음- commit, rollback
	SqlSession sqlSes = null;
	String resource =
			"Final/mybatis/MapperConfig.xml";
	public List<Map<String, Object>> getDeptmList(Map<String, Object> pMap) {
		logger.info("getDeptmList 호출 성공");
		List<Map<String,Object>> deptList = null;
		try {
			Reader reader = null;
			reader = 
					Resources.getResourceAsReader(resource);
			logger.info("getDeptmList 호출 성공");
			sqlMapper =
					new SqlSessionFactoryBuilder()
									.build(reader);
			sqlSes = sqlMapper.openSession();
			String deptm_name = (String)pMap.get("deptm_name");
			//logger.info("부서명:"+deptm_name);
			deptList = sqlSes.selectList("getDeptmList",deptm_name);
			logger.info("deptList:"+deptList.size());
		} catch (Exception e) {
			logger.info("Exception:"+e.getMessage());
		}
		return deptList;
	}

}
