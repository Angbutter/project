package Mproject.mvc;

import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;

public class LoginLogic {
	Logger logger = Logger.getLogger(LoginLogic.class);
	public static List<Map<String,Object>> login(Map<String, Object> pMap) {
		LoginDao loginDao = new LoginDao();
		List<Map<String,Object>> member = null;
		member = loginDao.login(pMap);
		return member;
	}
	public static String pwFind(Map<String, Object> pMap) {
		String mem_pw = "";
		LoginDao logindao = new LoginDao();
		mem_pw = logindao.pwFind(pMap);
		return mem_pw;
	}
	public int pwUpdate(Map<String, Object> pMap) {
		int result = 0;
		LoginDao logindao = new LoginDao();
		result = logindao.pwUpdate(pMap);
		return result;
	}
	public int memUpd(Map<String, Object> pMap) {
		int result = 0;
		LoginDao logindao = new LoginDao();
		result = logindao.memUpd(pMap);
		return result;
	}
	public int memDel(String mem_no) {
		int result = 0;
		LoginDao logindao = new LoginDao();
		result = logindao.memDel(mem_no);
		return result;
	}
}