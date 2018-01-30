package Mproject.mvc;

import java.io.Reader;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.apache.log4j.Logger;

public class ScheduleDao {
	Logger logger = Logger.getLogger(ScheduleDao.class);
	//MapperConfig.xml���� ��ĵ
	SqlSessionFactory sqlMapper = null; // mapperConfig ������ �о����
	
	//����Ŭ ���� Ŀ�ؼ� ���� - commit, rollback
	SqlSession sqlSes = null;
	String resource = "Final/mybatis/MapperConfig.xml";
	
	public List<Map<String, Object>> scList(String mem_no) {
		List<Map<String,Object>> scheduleList = null;
		try {
			Reader reader = Resources.getResourceAsReader(resource);; // 2byte ������ �о���̴� IO Ŭ���� ( ����¿��� �Է°� ���� )	
			sqlMapper = new SqlSessionFactoryBuilder().build(reader);
			sqlSes = sqlMapper.openSession();
			scheduleList = sqlSes.selectList("scList",mem_no);
			logger.info("size : "+scheduleList.size());
		} catch (Exception e) {
			// TODO: handle exception
			logger.info("Exception : "+e.getMessage());
		}
		return scheduleList;
	}

	/*public int calInsert(Map<String, Object> pMap) {
		logger.info("calInsert ȣ�� ����");
		int result = 0;
		try {
			Reader reader = Resources.getResourceAsReader(resource);; // 2byte ������ �о���̴� IO Ŭ���� ( ����¿��� �Է°� ���� )	
			sqlMapper = new SqlSessionFactoryBuilder().build(reader);
			sqlSes = sqlMapper.openSession();
			result = sqlSes.insert("calInsert",pMap);
			sqlSes.commit();
		} catch (Exception e) {
			// TODO: handle exception
			logger.info("Exception : "+e.getMessage());
		}
		return result;
	}

	public int calUpdate(Map<String, Object> pMap) {
		logger.info("calUpdate ȣ�� ����");
		int result = 0;
		try {
			Reader reader = Resources.getResourceAsReader(resource);; // 2byte ������ �о���̴� IO Ŭ���� ( ����¿��� �Է°� ���� )	
			sqlMapper = new SqlSessionFactoryBuilder().build(reader);
			sqlSes = sqlMapper.openSession();
			result = sqlSes.update("calUpdate",pMap);
			sqlSes.commit();
		} catch (Exception e) {
			// TODO: handle exception
			logger.info("Exception : "+e.getMessage());
		}
		return result;
	}

	public int calDelete(Map<String, Object> pMap) {
		logger.info("calDelete ȣ�� ����");
		int result = 0;
		try {
			Reader reader = Resources.getResourceAsReader(resource);; // 2byte ������ �о���̴� IO Ŭ���� ( ����¿��� �Է°� ���� )	
			sqlMapper = new SqlSessionFactoryBuilder().build(reader);
			sqlSes = sqlMapper.openSession();
			result = sqlSes.delete("calDelete",pMap);
			sqlSes.commit();
		} catch (Exception e) {
			// TODO: handle exception
			logger.info("Exception : "+e.getMessage());
		}
		return result;
	}*/
}
