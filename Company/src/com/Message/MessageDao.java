package com.Message;

import java.io.Reader;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.apache.log4j.Logger;

public class MessageDao {
	Logger logger = Logger.getLogger(MessageDao.class);
	//MapperConfig.xml문서 스캔
	SqlSessionFactory sqlMapper = null;
	//오라클 서버 커넥션 맺음- commit, rollback
	SqlSession sqlSes = null;
	String resource =
			"Final/mybatis/MapperConfig.xml";
	public int messageInsert(Map<String, Object> pMap) {
		logger.info("messageInsert 호출 성공");
		int result = 0;
		try {
			logger.info("성공?");
			Reader reader = null;
			reader = 
					Resources.getResourceAsReader(resource);
			sqlMapper =
					new SqlSessionFactoryBuilder()
									.build(reader);
			sqlSes = sqlMapper.openSession();
			result = sqlSes.update("messageInsert",pMap);
			
			sqlSes.commit();
			logger.info("result:"+result);
		} catch (Exception e) {
			logger.info("Exception:"+e.getMessage());
		}
		return result;
	}
	public List<Map<String, Object>> sendMessageList(Map<String, Object> pMap) {
		logger.info("sendMessageList 호출 성공");
		List<Map<String,Object>> meList
			= new ArrayList<Map<String,Object>>();
		try {
			Reader reader = null;
			reader = 
					Resources.getResourceAsReader(resource);
			sqlMapper =
					new SqlSessionFactoryBuilder()
									.build(reader);
			sqlSes = sqlMapper.openSession();
			meList = sqlSes.selectList("sendMessageList",pMap);
			logger.info("meList:"+meList.size());
		} catch (Exception e) {
			logger.info("Exception:"+e.getMessage());
		}
		return meList;
	}   
	public List<Map<String, Object>> recvMessageList(Map<String, Object> pMap) {
		logger.info("recvMessageList 호출 성공");
		List<Map<String,Object>> meList
			= new ArrayList<Map<String,Object>>();
		try { 
			Reader reader = null;
			reader = 
					Resources.getResourceAsReader(resource);
			logger.info("recvMessageList 호출 성공");
			sqlMapper =
					new SqlSessionFactoryBuilder()
					.build(reader);
			sqlSes = sqlMapper.openSession();
			meList = sqlSes.selectList("recvMessageList",pMap);
			logger.info("meList:"+meList.size());
		} catch (Exception e) {
			logger.info("Exception:"+e.toString());
		}
		return meList;
	}
	public int messageReadYNUpdate(int msg_no) {
		logger.info("messageReadYNUpdate 호출 성공:"+msg_no);
		int result = 0;
		try {  
			Reader reader = null;
			reader = 
					Resources.getResourceAsReader(resource);
			//logger.info("11"+(Integer.parseInt("msg_no")));
			sqlMapper =
					new SqlSessionFactoryBuilder()
									.build(reader);
			sqlSes = sqlMapper.openSession();
			result = sqlSes.update("messageReadYNUpdate",msg_no);
			sqlSes.commit();
			logger.info("result:"+result);
		} catch (Exception e) {
			logger.info("Exception:"+e.toString());
		}
		return result;
	}
	public int getDeptList(Map<String, Object> pMap) {
		logger.info("getDeptList 호출 성공");
		int result = 0;
		try {
			Reader reader = null;
			reader = 
					Resources.getResourceAsReader(resource);
			sqlMapper =
					new SqlSessionFactoryBuilder()
									.build(reader);
			logger.info("getDeptList 호출 성공");
			//logger.info("사원번호:"+pMap.put("emp_no", "emp_no"));
			logger.info("사원번호:"+pMap.get("emp_no"));
			/*logger.info("제목:"+pMap.put("msg_title", "msg_title"));
			logger.info("메세지:"+pMap.put("msg_contents", "msg_contents"));
			logger.info("받는 사람:"+pMap.put("receive_emp_no", "receive_emp_no"));
			logger.info("개봉 여부:"+pMap.put("reception_yn", "reception_yn"));*/
			sqlSes = sqlMapper.openSession();
			logger.info("getDeptList 호출 성공");
			//logger.info("부서명:"+deptm_name);
			result = sqlSes.insert("sendMessage", pMap);
			logger.info("getDeptList 호출 성공");
			sqlSes.commit();
			logger.info("msgList:"+result);
		} catch (Exception e) {
			logger.info("Exception:"+e.toString());
		}
		return result;
	}
}
