package Mproject.mvc;

import java.io.Reader;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.apache.log4j.Logger;

public class LoginDao {
	Logger logger = Logger.getLogger(LoginDao.class);
	SqlSessionFactory sqlMapper = null;
	SqlSession sqlSes = null; 
	String resource = "Mproject/mybatis/MapperConfig.xml";
	
	public List<Map<String,Object>> login(Map<String, Object> pMap) {
		logger.info("login() ȣ�� ����");
		List<Map<String,Object>> member = null;
		try {
			Reader reader = Resources.getResourceAsReader(resource);; // 2byte ������ �о���̴� IO Ŭ���� ( ����¿��� �Է°� ���� )	
			sqlMapper = new SqlSessionFactoryBuilder().build(reader);
			sqlSes = sqlMapper.openSession();
			member = sqlSes.selectList("login",pMap);
		} catch (Exception e) {
			logger.info("Exception : "+e.getMessage());
		}
		return member;
	}
	public String pwFind(Map<String, Object> pMap) {
		logger.info("pwFind() ȣ�� ����");
		String mem_pw = "";
		try {
			Reader reader = Resources.getResourceAsReader(resource);; // 2byte ������ �о���̴� IO Ŭ���� ( ����¿��� �Է°� ���� )	
			sqlMapper = new SqlSessionFactoryBuilder().build(reader);
			sqlSes = sqlMapper.openSession();
			mem_pw = sqlSes.selectOne("pwFind",pMap);
			logger.info("mem_pw : "+mem_pw);
		} catch (Exception e) {
			logger.info("Exception : "+e.getMessage());
		}
		return mem_pw;
	}
	public int pwUpdate(Map<String, Object> pMap) {
		logger.info("pwUpdate() ȣ�� ����");
		int result=0;
		try {
			Reader reader = Resources.getResourceAsReader(resource);; // 2byte ������ �о���̴� IO Ŭ���� ( ����¿��� �Է°� ���� )	
			sqlMapper = new SqlSessionFactoryBuilder().build(reader);
			sqlSes = sqlMapper.openSession();
			result = sqlSes.update("pwUpdate",pMap);
			sqlSes.commit();
		} catch (Exception e) {
			logger.info("Exception : "+e.getMessage());
		}
		return result;
	}
	public int memUpd(Map<String, Object> pMap) {
		logger.info("memUpd() ȣ�� ����");
		int result=0;
		try {
			Reader reader = Resources.getResourceAsReader(resource);; // 2byte ������ �о���̴� IO Ŭ���� ( ����¿��� �Է°� ���� )	
			sqlMapper = new SqlSessionFactoryBuilder().build(reader);
			sqlSes = sqlMapper.openSession();
			result = sqlSes.update("memUpd",pMap);
			sqlSes.commit();
		} catch (Exception e) {
			logger.info("Exception : "+e.getMessage());
		}
		return result;
	}
	public int memDel(String mem_no) {
		logger.info("memDel() ȣ�� ����");
		int result = 0;
		int no = Integer.parseInt(mem_no);
		try{
			Reader reader = Resources.getResourceAsReader(resource);; // 2byte ������ �о���̴� IO Ŭ���� ( ����¿��� �Է°� ���� )	
			sqlMapper = new SqlSessionFactoryBuilder().build(reader);
			sqlSes = sqlMapper.openSession();
			result = sqlSes.delete("memDel",no);
			sqlSes.commit();
		}catch(Exception e){
			logger.info("Exception : "+e.getMessage());
		}
		return result;
	}
}