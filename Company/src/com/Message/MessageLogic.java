package com.Message;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;

public class MessageLogic {
	Logger logger = Logger.getLogger(MessageLogic.class);
	public int messageInsert(Map<String, Object> pMap) {
		logger.info("messageInsert 호출 성공");
		int result = 0;
		MessageDao messageDao = new MessageDao();  
		result=messageDao.messageInsert(pMap);		
		return result;
	}
	public List<Map<String, Object>> sendMessageList(Map<String, Object> pMap) {
		logger.info("sendMessageList 호출 성공");
		List<Map<String,Object>> meList
			= new ArrayList<Map<String,Object>>();
		MessageDao meDao = new MessageDao();
		meList=meDao.sendMessageList(pMap);
		return meList;
	}
	public List<Map<String, Object>> recvMessageList(Map<String, Object> pMap) {
		logger.info("recvMessageList 호출 성공");
		List<Map<String,Object>> meList
			= new ArrayList<Map<String,Object>>();
		MessageDao meDao = new MessageDao();
		meList=meDao.recvMessageList(pMap);
		return meList;
	}
	public int messageReadYNUpdate(int msg_no) {
		logger.info("messageReadYNUpdate 호출 성공");
		int result = 0;
		MessageDao meDao = new MessageDao();
		result = meDao.messageReadYNUpdate(msg_no);
		return result;
	}
	public int insertMsgList(Map<String, Object> pMap) {
		logger.info("insertMsgList 호출 성공");
		int result = 0;
		MessageDao msgDao = new MessageDao();
		result=msgDao.getDeptList(pMap); 
		return result;
	}
}
