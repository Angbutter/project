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
	//MapperConfig.xml���� ��ĵ
	SqlSessionFactory sqlMapper = null;
	//����Ŭ ���� Ŀ�ؼ� ����- commit, rollback
	SqlSession sqlSes = null;
	String resource =
			"Final/mybatis/MapperConfig.xml";
	public int messageInsert(Map<String, Object> pMap) {
		logger.info("messageInsert ȣ�� ����");
		int result = 0;
		try {
			logger.info("����?");
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
		logger.info("sendMessageList ȣ�� ����");
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
		logger.info("recvMessageList ȣ�� ����");
		List<Map<String,Object>> meList
			= new ArrayList<Map<String,Object>>();
		try { 
			Reader reader = null;
			reader = 
					Resources.getResourceAsReader(resource);
			logger.info("recvMessageList ȣ�� ����");
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
		logger.info("messageReadYNUpdate ȣ�� ����:"+msg_no);
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
		logger.info("getDeptList ȣ�� ����");
		int result = 0;
		try {
			Reader reader = null;
			reader = 
					Resources.getResourceAsReader(resource);
			sqlMapper =
					new SqlSessionFactoryBuilder()
									.build(reader);
			logger.info("getDeptList ȣ�� ����");
			//logger.info("�����ȣ:"+pMap.put("emp_no", "emp_no"));
			logger.info("�����ȣ:"+pMap.get("emp_no"));
			/*logger.info("����:"+pMap.put("msg_title", "msg_title"));
			logger.info("�޼���:"+pMap.put("msg_contents", "msg_contents"));
			logger.info("�޴� ���:"+pMap.put("receive_emp_no", "receive_emp_no"));
			logger.info("���� ����:"+pMap.put("reception_yn", "reception_yn"));*/
			sqlSes = sqlMapper.openSession();
			logger.info("getDeptList ȣ�� ����");
			//logger.info("�μ���:"+deptm_name);
			result = sqlSes.insert("sendMessage", pMap);
			logger.info("getDeptList ȣ�� ����");
			sqlSes.commit();
			logger.info("msgList:"+result);
		} catch (Exception e) {
			logger.info("Exception:"+e.toString());
		}
		return result;
	}
}
