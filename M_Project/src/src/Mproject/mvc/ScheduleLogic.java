package Mproject.mvc;

import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;

public class ScheduleLogic {
	Logger logger = Logger.getLogger(ScheduleLogic.class);
	public static List<Map<String, Object>> scList(String mem_no) {
		List<Map<String,Object>> scheduleList = null;
		ScheduleDao scDao = new ScheduleDao();
		scheduleList = scDao.scList(mem_no);
		return scheduleList;
	}
	/*public int calInsert(Map<String, Object> pMap) {
		int result = 0;
		calDao caldao = new calDao();
		result = caldao.calInsert(pMap);
		return result;
	}
	public int calUpdate(Map<String, Object> pMap) {
		int result = 0;
		calDao caldao = new calDao();
		result = caldao.calUpdate(pMap);
		return result;
	}
	public int calDelete(Map<String, Object> pMap) {
		int result = 0;
		calDao caldao = new calDao();
		result = caldao.calDelete(pMap);
		return result;
	}*/
}
