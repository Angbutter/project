package Mproject.mvc;

import java.io.Reader;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.apache.log4j.Logger;

public class BoardDao {
	Logger logger = Logger.getLogger(BoardDao.class);
	SqlSessionFactory sqlMapper = null;
	SqlSession sqlSes = null; 
	String resource = "Mproject/mybatis/MapperConfig.xml";
	
	/* ����������������������������������������������������������������� �ŷ��Խ��� ��� */
	public int trBoardIns(Map<String, Object> pMap) {
		logger.info("tr_board_insert() ȣ�� ����");
		int result = 0;
		try {
			Reader reader = Resources.getResourceAsReader(resource);; // 2byte ������ �о���̴� IO Ŭ���� ( ����¿��� �Է°� ���� )	
			sqlMapper = new SqlSessionFactoryBuilder().build(reader);
			sqlSes = sqlMapper.openSession();
			result = sqlSes.insert("trBoardIns",pMap);
			sqlSes.commit();
		} catch (Exception e) {
			logger.info("Exception : "+e.getMessage());
		}
		return result;
	}
	/* ����������������������������������������������������������������� �ŷ��Խ��� ����Ʈ */
	public List<Map<String,Object>> trBoardList(){
		logger.info("trBoardList() ȣ�� ����");
		List<Map<String,Object>> trBoardList = null;
		try{
			Reader reader = Resources.getResourceAsReader(resource);; // 2byte ������ �о���̴� IO Ŭ���� ( ����¿��� �Է°� ���� )	
			sqlMapper = new SqlSessionFactoryBuilder().build(reader);
			sqlSes = sqlMapper.openSession();
			trBoardList = sqlSes.selectList("trBoardList");
		}catch(Exception e){
			logger.info("Exception : "+e.getMessage());
		}
		return trBoardList;
	}
	/* ����������������������������������������������������������������� �ŷ��Խ��� �˻� */
	public List<Map<String, Object>> trBoardSearch(Map<String, Object> pMap) {
		logger.info("trBoardSearch() ȣ�� ����");
		List<Map<String,Object>> trSearchBoard = null;
		try{
			Reader reader = Resources.getResourceAsReader(resource);; // 2byte ������ �о���̴� IO Ŭ���� ( ����¿��� �Է°� ���� )	
			sqlMapper = new SqlSessionFactoryBuilder().build(reader);
			sqlSes = sqlMapper.openSession();
			trSearchBoard = sqlSes.selectList("trSearchBoard",pMap);
		}catch(Exception e){
			logger.info("Exception : "+e.getMessage());
		}
		return trSearchBoard;
	}
	/* ����������������������������������������������������������������� �����Խ��� �˻� */
	public List<Map<String, Object>> frBoardSearch(Map<String, Object> pMap) {
		logger.info("frBoardSearch() ȣ�� ����");
		List<Map<String,Object>> frSearchBoard = null;
		try{
			Reader reader = Resources.getResourceAsReader(resource);; // 2byte ������ �о���̴� IO Ŭ���� ( ����¿��� �Է°� ���� )	
			sqlMapper = new SqlSessionFactoryBuilder().build(reader);
			sqlSes = sqlMapper.openSession();
			frSearchBoard = sqlSes.selectList("frSearchBoard",pMap);
		}catch(Exception e){
			logger.info("Exception : "+e.getMessage());
		}
		return frSearchBoard;
	}
	/* ����������������������������������������������������������������� �ŷ��Խ��� �󼼺��� */
	public List<Map<String,Object>> trBoardView(String tr_no){
		logger.info("trBoardView() ȣ�� ����");
		List<Map<String,Object>> trBoardView = null;
		int no = Integer.parseInt(tr_no);
		try{
			Reader reader = Resources.getResourceAsReader(resource);; // 2byte ������ �о���̴� IO Ŭ���� ( ����¿��� �Է°� ���� )	
			sqlMapper = new SqlSessionFactoryBuilder().build(reader);
			sqlSes = sqlMapper.openSession();
			trBoardView = sqlSes.selectList("trBoardView",no);
		}catch(Exception e){
			logger.info("Exception : "+e.getMessage());
		}
		return trBoardView;
	}
	
	/* ����������������������������������������������������������������� �����Խ��� ��� */
	public int frBoardIns(Map<String, Object> pMap) {
		logger.info("fr_board_insert() ȣ�� ����");
		int result = 0;
		try {
			Reader reader = Resources.getResourceAsReader(resource);; // 2byte ������ �о���̴� IO Ŭ���� ( ����¿��� �Է°� ���� )	
			sqlMapper = new SqlSessionFactoryBuilder().build(reader);
			sqlSes = sqlMapper.openSession();
			result = sqlSes.insert("frBoardIns",pMap);
			sqlSes.commit();
		} catch (Exception e) {
			logger.info("Exception : "+e.getMessage());
		}
		return result;
	}
	/* ����������������������������������������������������������������� �����Խ��� ����Ʈ */
	public List<Map<String,Object>> frBoardList(){
		logger.info("frBoardList() ȣ�� ����");
		List<Map<String,Object>> frBoardList = null;
		try{
			Reader reader = Resources.getResourceAsReader(resource);; // 2byte ������ �о���̴� IO Ŭ���� ( ����¿��� �Է°� ���� )	
			sqlMapper = new SqlSessionFactoryBuilder().build(reader);
			sqlSes = sqlMapper.openSession();
			frBoardList = sqlSes.selectList("frBoardList");
		}catch(Exception e){
			logger.info("Exception : "+e.getMessage());
		}
		return frBoardList;
	}
	
	/* ����������������������������������������������������������������� �����Խ��� �󼼺��� */
	public List<Map<String,Object>> frBoardView(String fr_no){
		logger.info("frBoardView() ȣ�� ����");
		List<Map<String,Object>> frBoardView = null;
		int no = Integer.parseInt(fr_no);
		try{
			Reader reader = Resources.getResourceAsReader(resource);; // 2byte ������ �о���̴� IO Ŭ���� ( ����¿��� �Է°� ���� )	
			sqlMapper = new SqlSessionFactoryBuilder().build(reader);
			sqlSes = sqlMapper.openSession();
			frBoardView = sqlSes.selectList("frBoardView",no);
		}catch(Exception e){
			logger.info("Exception : "+e.getMessage());
		}
		return frBoardView;
	}
	
	/* ����������������������������������������������������������������� �ŷ��Խ��� ��ȸ�� */
	public int trHitUpd(String tr_no){
		logger.info("trHitUpd() ȣ�� ����");
		int result = 0;
		int no = Integer.parseInt(tr_no);
		try{
			Reader reader = Resources.getResourceAsReader(resource);; // 2byte ������ �о���̴� IO Ŭ���� ( ����¿��� �Է°� ���� )	
			sqlMapper = new SqlSessionFactoryBuilder().build(reader);
			sqlSes = sqlMapper.openSession();
			result = sqlSes.update("trHitUpd",no);
			sqlSes.commit();
		}catch(Exception e){
			logger.info("Exception : "+e.getMessage());
		}
		return result;
	}
	
	/* ����������������������������������������������������������������� �����Խ��� ��ȸ�� */
	public int frHitUpd(String fr_no){
		logger.info("frHitUpd() ȣ�� ����");
		int result = 0;
		int no = Integer.parseInt(fr_no);
		try{
			Reader reader = Resources.getResourceAsReader(resource);; // 2byte ������ �о���̴� IO Ŭ���� ( ����¿��� �Է°� ���� )	
			sqlMapper = new SqlSessionFactoryBuilder().build(reader);
			sqlSes = sqlMapper.openSession();
			result = sqlSes.update("frHitUpd",no);
			sqlSes.commit();
		}catch(Exception e){
			logger.info("Exception : "+e.getMessage());
		}
		return result;
	}
	
	/* ����������������������������������������������������������������� �ŷ��Խ��� ���� */
	public int trUpd(Map<String, Object> pMap) {
		logger.info("trUpd() ȣ�� ����");
		int result = 0;
		try{
			Reader reader = Resources.getResourceAsReader(resource);; // 2byte ������ �о���̴� IO Ŭ���� ( ����¿��� �Է°� ���� )	
			sqlMapper = new SqlSessionFactoryBuilder().build(reader);
			sqlSes = sqlMapper.openSession();
			result = sqlSes.update("trUpd",pMap);
			sqlSes.commit();
		}catch(Exception e){
			logger.info("Exception : "+e.getMessage());
		}
		return result;
	}
	
	/* ����������������������������������������������������������������� �ŷ��Խ��� �ŷ��Ϸ� */
	public int trEnd(Map<String, Object> pMap) {
		logger.info("trEnd() ȣ�� ����");
		int result = 0;
		try{
			Reader reader = Resources.getResourceAsReader(resource);; // 2byte ������ �о���̴� IO Ŭ���� ( ����¿��� �Է°� ���� )	
			sqlMapper = new SqlSessionFactoryBuilder().build(reader);
			sqlSes = sqlMapper.openSession();
			result = sqlSes.update("trEnd",pMap);
			sqlSes.commit();
		}catch(Exception e){
			logger.info("Exception : "+e.getMessage());
		}
		return result;
	}
	
	/* ����������������������������������������������������������������� �����Խ��� ���� */
	public int frUpd(Map<String, Object> pMap) {
		logger.info("frUpd() ȣ�� ����");
		int result = 0;
		try{
			Reader reader = Resources.getResourceAsReader(resource);; // 2byte ������ �о���̴� IO Ŭ���� ( ����¿��� �Է°� ���� )	
			sqlMapper = new SqlSessionFactoryBuilder().build(reader);
			sqlSes = sqlMapper.openSession();
			result = sqlSes.update("frUpd",pMap);
			sqlSes.commit();
		}catch(Exception e){
			logger.info("Exception : "+e.getMessage());
		}
		return result;
	}
	
	/* ����������������������������������������������������������������� �ŷ��Խ��� ���� */
	public int trDel(String tr_no) {
		logger.info("trDel() ȣ�� ����");
		int result = 0;
		int no = Integer.parseInt(tr_no);
		try{
			Reader reader = Resources.getResourceAsReader(resource);; // 2byte ������ �о���̴� IO Ŭ���� ( ����¿��� �Է°� ���� )	
			sqlMapper = new SqlSessionFactoryBuilder().build(reader);
			sqlSes = sqlMapper.openSession();
			result = sqlSes.delete("trDel",no); 
			sqlSes.commit();
		}catch(Exception e){
			logger.info("Exception : "+e.getMessage());
		}
		return result;
	}
	
	/* ����������������������������������������������������������������� �����Խ��� ���� */
	public int frDel(String fr_no) {
		logger.info("frDel() ȣ�� ����");
		int result = 0;
		int no = Integer.parseInt(fr_no);
		try{
			Reader reader = Resources.getResourceAsReader(resource);; // 2byte ������ �о���̴� IO Ŭ���� ( ����¿��� �Է°� ���� )	
			sqlMapper = new SqlSessionFactoryBuilder().build(reader);
			sqlSes = sqlMapper.openSession();
			result = sqlSes.delete("frDel",no);
			sqlSes.commit();
		}catch(Exception e){
			logger.info("Exception : "+e.getMessage());
		}
		return result;
	}
	
	/* ����������������������������������������������������������������� ���� �߰� */
	public int scIns(Map<String, Object> pMap) {
		logger.info("scIns() ȣ�� ����");
		int result = 0;
		try {
			Reader reader = Resources.getResourceAsReader(resource);; // 2byte ������ �о���̴� IO Ŭ���� ( ����¿��� �Է°� ���� )	
			sqlMapper = new SqlSessionFactoryBuilder().build(reader);
			sqlSes = sqlMapper.openSession();
			result = sqlSes.insert("scIns",pMap);
			sqlSes.commit();
		} catch (Exception e) {
			logger.info("Exception : "+e.getMessage());
		}
		return result;
	}
	
	/* ����������������������������������������������������������������� ���� �ҷ����� */
	public List<Map<String, Object>> scList(String mem_no) {
		logger.info("scList() ȣ�� ����"); 
		List<Map<String, Object>> scList = null;
		try {
			Reader reader = Resources.getResourceAsReader(resource);; // 2byte ������ �о���̴� IO Ŭ���� ( ����¿��� �Է°� ���� )	
			sqlMapper = new SqlSessionFactoryBuilder().build(reader);
			sqlSes = sqlMapper.openSession();
			scList = sqlSes.selectList("scList",mem_no);
			sqlSes.commit();
		} catch (Exception e) {
			logger.info("Exception : "+e.getMessage());
		}
		return scList;
	}
	
	/* ����������������������������������������������������������������� ����ȸ�� ���� �ҷ����� */ 
	public List<Map<String, Object>> scMemList(Map<String,Object> pMap) {
		logger.info("scMemList() ȣ�� ����");
		List<Map<String, Object>> scMemList = null;
		try {
			Reader reader = Resources.getResourceAsReader(resource);; // 2byte ������ �о���̴� IO Ŭ���� ( ����¿��� �Է°� ���� )	
			sqlMapper = new SqlSessionFactoryBuilder().build(reader);
			sqlSes = sqlMapper.openSession();
			scMemList = sqlSes.selectList("scMemList",pMap);
		} catch (Exception e) {
			logger.info("Exception : "+e.getMessage());
		}
		return scMemList;
	}

	/* ����������������������������������������������������������������� ���� ���� */
	public int scUpd(Map<String, Object> pMap) {
		logger.info("scIns() ȣ�� ����");
		int result = 0;
		try {
			Reader reader = Resources.getResourceAsReader(resource);; // 2byte ������ �о���̴� IO Ŭ���� ( ����¿��� �Է°� ���� )	
			sqlMapper = new SqlSessionFactoryBuilder().build(reader);
			sqlSes = sqlMapper.openSession();
			result = sqlSes.update("scUpd",pMap);
			sqlSes.commit();
		} catch (Exception e) {
			logger.info("Exception : "+e.getMessage());
		}
		return result;
	}
	
	/* ����������������������������������������������������������������� ���� ���� */
	public int scDel(String sc_no) {
		logger.info("scDel() ȣ�� ����");
		int result = 0;
		int no = Integer.parseInt(sc_no);
		try {
			Reader reader = Resources.getResourceAsReader(resource);; // 2byte ������ �о���̴� IO Ŭ���� ( ����¿��� �Է°� ���� )	
			sqlMapper = new SqlSessionFactoryBuilder().build(reader);
			sqlSes = sqlMapper.openSession();
			result = sqlSes.delete("scDel",no);
			sqlSes.commit();
		} catch (Exception e) {
			logger.info("Exception : "+e.getMessage());
		}
		return result;
	}
	
	/* ����������������������������������������������������������������� ���� ��ȣ ã�� */
	public String searchScNo(Map<String, Object> pMap) {
		logger.info("searchScNo() ȣ�� ����");
		String sc_no="";
		try {
			Reader reader = Resources.getResourceAsReader(resource);; // 2byte ������ �о���̴� IO Ŭ���� ( ����¿��� �Է°� ���� )	
			sqlMapper = new SqlSessionFactoryBuilder().build(reader);
			sqlSes = sqlMapper.openSession();
			sc_no = sqlSes.selectOne("searchScNo",pMap);
		} catch (Exception e) {
			logger.info("Exception : "+e.getMessage());
		}
		return sc_no;
	}
	
}
