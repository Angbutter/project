package Mproject.mvc;

import java.io.Reader;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.apache.log4j.Logger;
public class signupDao {
	Logger logger = Logger.getLogger(signupDao.class);
	SqlSessionFactory sqlMapper = null;
	SqlSession sqlSes = null; 
	String resource = "Mproject/mybatis/MapperConfig.xml";
	
	public int signup(Map<String, Object> pMap) {
		logger.info("signup() 호출 성공");
		int result = 0;
		try {
			Reader reader = Resources.getResourceAsReader(resource);; // 2byte 단위로 읽어들이는 IO 클래스 ( 입출력에서 입력과 관련 )	
			sqlMapper = new SqlSessionFactoryBuilder().build(reader);
			sqlSes = sqlMapper.openSession();
			result = sqlSes.insert("signup",pMap);
			sqlSes.commit();
		} catch (Exception e) {
			logger.info("Exception : "+e.getMessage());
		}
		return result;
	}

	public String jungbok(String mem_id) {
		logger.info("jungbok() 호출 성공");
		logger.info("mem_id : "+mem_id);
		String mem_nm = null;
		try {
			Reader reader = Resources.getResourceAsReader(resource);; // 2byte 단위로 읽어들이는 IO 클래스 ( 입출력에서 입력과 관련 )	
			sqlMapper = new SqlSessionFactoryBuilder().build(reader);
			sqlSes = sqlMapper.openSession();
			mem_nm = sqlSes.selectOne("jungbok",mem_id);
			logger.info("mem_nm : "+mem_nm);
		} catch (Exception e) {
			logger.info("Exception : "+e.getMessage());
		}
		return mem_nm;
	}
}