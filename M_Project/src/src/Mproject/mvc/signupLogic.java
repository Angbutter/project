package Mproject.mvc;

import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;

public class signupLogic {
	Logger logger = Logger.getLogger(signupLogic.class);
	public static int signup(Map<String, Object> pMap) {
		signupDao signupdao = new signupDao();
		int result = 0;
		result = signupdao.signup(pMap);
		return result;
	}
}