package com.Approval;

import java.io.Reader;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.apache.log4j.Logger;

public class ApprovalDao {
	Logger logger = Logger.getLogger(ApprovalDao.class);
	SqlSessionFactory sqlMapper = null; // mapperConfig 정보를 읽어들임
	SqlSession sqlSes = null; 
	String resource = "Final/mybatis/MapperConfig.xml";
	
	public List<Map<String, Object>> approvalList(Map<String, Object> pMap) {
		logger.info("approvalList() 호출 성공");
		List<Map<String,Object>> approvalList = null;
		try {
			Reader reader = Resources.getResourceAsReader(resource);; // 2byte 단위로 읽어들이는 IO 클래스 ( 입출력에서 입력과 관련 )	
			sqlMapper = new SqlSessionFactoryBuilder().build(reader);
			sqlSes = sqlMapper.openSession();
			approvalList = sqlSes.selectList("approvalList",pMap);
			logger.info("approvalList.size() : "+approvalList.size());
		} catch (Exception e) {
			logger.info("Exception : "+e.getMessage());
		}
		return approvalList;
	}

	public int approvalInsert(Map<String, Object> pMap) {
		logger.info("approvalInsert 호출");
		int result = 0;
		try {
			Reader reader = Resources.getResourceAsReader(resource);; // 2byte 단위로 읽어들이는 IO 클래스 ( 입출력에서 입력과 관련 )	
			sqlMapper = new SqlSessionFactoryBuilder().build(reader);
			sqlSes = sqlMapper.openSession();
			result = sqlSes.insert("approvalInsert", pMap);
			sqlSes.commit();
			logger.info("result : "+result);
		} catch (Exception e) {
			logger.info("Exception : "+e.getMessage());
		}
		return result;
	}

	public int approvalUpdate(Map<String, Object> pMap) {
		logger.info("approvalUpdate 호출");
		int result = 0;
		try {
			Reader reader = Resources.getResourceAsReader(resource);; // 2byte 단위로 읽어들이는 IO 클래스 ( 입출력에서 입력과 관련 )	
			sqlMapper = new SqlSessionFactoryBuilder().build(reader);
			sqlSes = sqlMapper.openSession();
			result = sqlSes.update("approvalUpdate", pMap);
			sqlSes.commit();
		} catch (Exception e) {
			logger.info("Exception : "+e.getMessage());
		}
		return result;
	}

	public List<Map<String, Object>> getTotal() {
		logger.info("getTotal 호출 성공");
		List<Map<String, Object>> totalList = null;
		try {
			Reader reader = Resources.getResourceAsReader(resource);; // 2byte 단위로 읽어들이는 IO 클래스 ( 입출력에서 입력과 관련 )	
			sqlMapper = new SqlSessionFactoryBuilder().build(reader);
			sqlSes = sqlMapper.openSession();
			totalList = sqlSes.selectList("getTotal");
			logger.info("boardList.size() : "+totalList.get(0).get("TOTAL"));
		} catch (Exception e) {
			logger.info("Exception : "+e.getMessage());
		}
		return totalList;
	}

	public int approvalDelete(Map<String, Object> pMap) {
		logger.info("approvalDelete 호출");
		int result = 0;
		try {
			Reader reader = Resources.getResourceAsReader(resource);; // 2byte 단위로 읽어들이는 IO 클래스 ( 입출력에서 입력과 관련 )	
			sqlMapper = new SqlSessionFactoryBuilder().build(reader);
			sqlSes = sqlMapper.openSession();
			result = sqlSes.update("approvalDelete", pMap);
			sqlSes.commit();
		} catch (Exception e) {
			logger.info("Exception : "+e.getMessage());
		}
		return result;
	}

}
