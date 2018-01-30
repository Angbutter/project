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
	
	/* ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ 거래게시판 등록 */
	public int trBoardIns(Map<String, Object> pMap) {
		logger.info("tr_board_insert() 호출 성공");
		int result = 0;
		try {
			Reader reader = Resources.getResourceAsReader(resource);; // 2byte 단위로 읽어들이는 IO 클래스 ( 입출력에서 입력과 관련 )	
			sqlMapper = new SqlSessionFactoryBuilder().build(reader);
			sqlSes = sqlMapper.openSession();
			result = sqlSes.insert("trBoardIns",pMap);
			sqlSes.commit();
		} catch (Exception e) {
			logger.info("Exception : "+e.getMessage());
		}
		return result;
	}
	/* ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ 거래게시판 리스트 */
	public List<Map<String,Object>> trBoardList(){
		logger.info("trBoardList() 호출 성공");
		List<Map<String,Object>> trBoardList = null;
		try{
			Reader reader = Resources.getResourceAsReader(resource);; // 2byte 단위로 읽어들이는 IO 클래스 ( 입출력에서 입력과 관련 )	
			sqlMapper = new SqlSessionFactoryBuilder().build(reader);
			sqlSes = sqlMapper.openSession();
			trBoardList = sqlSes.selectList("trBoardList");
		}catch(Exception e){
			logger.info("Exception : "+e.getMessage());
		}
		return trBoardList;
	}
	/* ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ 거래게시판 검색 */
	public List<Map<String, Object>> trBoardSearch(Map<String, Object> pMap) {
		logger.info("trBoardSearch() 호출 성공");
		List<Map<String,Object>> trSearchBoard = null;
		try{
			Reader reader = Resources.getResourceAsReader(resource);; // 2byte 단위로 읽어들이는 IO 클래스 ( 입출력에서 입력과 관련 )	
			sqlMapper = new SqlSessionFactoryBuilder().build(reader);
			sqlSes = sqlMapper.openSession();
			trSearchBoard = sqlSes.selectList("trSearchBoard",pMap);
		}catch(Exception e){
			logger.info("Exception : "+e.getMessage());
		}
		return trSearchBoard;
	}
	/* ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ 자유게시판 검색 */
	public List<Map<String, Object>> frBoardSearch(Map<String, Object> pMap) {
		logger.info("frBoardSearch() 호출 성공");
		List<Map<String,Object>> frSearchBoard = null;
		try{
			Reader reader = Resources.getResourceAsReader(resource);; // 2byte 단위로 읽어들이는 IO 클래스 ( 입출력에서 입력과 관련 )	
			sqlMapper = new SqlSessionFactoryBuilder().build(reader);
			sqlSes = sqlMapper.openSession();
			frSearchBoard = sqlSes.selectList("frSearchBoard",pMap);
		}catch(Exception e){
			logger.info("Exception : "+e.getMessage());
		}
		return frSearchBoard;
	}
	/* ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ 거래게시판 상세보기 */
	public List<Map<String,Object>> trBoardView(String tr_no){
		logger.info("trBoardView() 호출 성공");
		List<Map<String,Object>> trBoardView = null;
		int no = Integer.parseInt(tr_no);
		try{
			Reader reader = Resources.getResourceAsReader(resource);; // 2byte 단위로 읽어들이는 IO 클래스 ( 입출력에서 입력과 관련 )	
			sqlMapper = new SqlSessionFactoryBuilder().build(reader);
			sqlSes = sqlMapper.openSession();
			trBoardView = sqlSes.selectList("trBoardView",no);
		}catch(Exception e){
			logger.info("Exception : "+e.getMessage());
		}
		return trBoardView;
	}
	
	/* ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ 자유게시판 등록 */
	public int frBoardIns(Map<String, Object> pMap) {
		logger.info("fr_board_insert() 호출 성공");
		int result = 0;
		try {
			Reader reader = Resources.getResourceAsReader(resource);; // 2byte 단위로 읽어들이는 IO 클래스 ( 입출력에서 입력과 관련 )	
			sqlMapper = new SqlSessionFactoryBuilder().build(reader);
			sqlSes = sqlMapper.openSession();
			result = sqlSes.insert("frBoardIns",pMap);
			sqlSes.commit();
		} catch (Exception e) {
			logger.info("Exception : "+e.getMessage());
		}
		return result;
	}
	/* ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ 자유게시판 리스트 */
	public List<Map<String,Object>> frBoardList(){
		logger.info("frBoardList() 호출 성공");
		List<Map<String,Object>> frBoardList = null;
		try{
			Reader reader = Resources.getResourceAsReader(resource);; // 2byte 단위로 읽어들이는 IO 클래스 ( 입출력에서 입력과 관련 )	
			sqlMapper = new SqlSessionFactoryBuilder().build(reader);
			sqlSes = sqlMapper.openSession();
			frBoardList = sqlSes.selectList("frBoardList");
		}catch(Exception e){
			logger.info("Exception : "+e.getMessage());
		}
		return frBoardList;
	}
	
	/* ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ 자유게시판 상세보기 */
	public List<Map<String,Object>> frBoardView(String fr_no){
		logger.info("frBoardView() 호출 성공");
		List<Map<String,Object>> frBoardView = null;
		int no = Integer.parseInt(fr_no);
		try{
			Reader reader = Resources.getResourceAsReader(resource);; // 2byte 단위로 읽어들이는 IO 클래스 ( 입출력에서 입력과 관련 )	
			sqlMapper = new SqlSessionFactoryBuilder().build(reader);
			sqlSes = sqlMapper.openSession();
			frBoardView = sqlSes.selectList("frBoardView",no);
		}catch(Exception e){
			logger.info("Exception : "+e.getMessage());
		}
		return frBoardView;
	}
	
	/* ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ 거래게시판 조회수 */
	public int trHitUpd(String tr_no){
		logger.info("trHitUpd() 호출 성공");
		int result = 0;
		int no = Integer.parseInt(tr_no);
		try{
			Reader reader = Resources.getResourceAsReader(resource);; // 2byte 단위로 읽어들이는 IO 클래스 ( 입출력에서 입력과 관련 )	
			sqlMapper = new SqlSessionFactoryBuilder().build(reader);
			sqlSes = sqlMapper.openSession();
			result = sqlSes.update("trHitUpd",no);
			sqlSes.commit();
		}catch(Exception e){
			logger.info("Exception : "+e.getMessage());
		}
		return result;
	}
	
	/* ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ 자유게시판 조회수 */
	public int frHitUpd(String fr_no){
		logger.info("frHitUpd() 호출 성공");
		int result = 0;
		int no = Integer.parseInt(fr_no);
		try{
			Reader reader = Resources.getResourceAsReader(resource);; // 2byte 단위로 읽어들이는 IO 클래스 ( 입출력에서 입력과 관련 )	
			sqlMapper = new SqlSessionFactoryBuilder().build(reader);
			sqlSes = sqlMapper.openSession();
			result = sqlSes.update("frHitUpd",no);
			sqlSes.commit();
		}catch(Exception e){
			logger.info("Exception : "+e.getMessage());
		}
		return result;
	}
	
	/* ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ 거래게시판 수정 */
	public int trUpd(Map<String, Object> pMap) {
		logger.info("trUpd() 호출 성공");
		int result = 0;
		try{
			Reader reader = Resources.getResourceAsReader(resource);; // 2byte 단위로 읽어들이는 IO 클래스 ( 입출력에서 입력과 관련 )	
			sqlMapper = new SqlSessionFactoryBuilder().build(reader);
			sqlSes = sqlMapper.openSession();
			result = sqlSes.update("trUpd",pMap);
			sqlSes.commit();
		}catch(Exception e){
			logger.info("Exception : "+e.getMessage());
		}
		return result;
	}
	
	/* ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ 거래게시판 거래완료 */
	public int trEnd(Map<String, Object> pMap) {
		logger.info("trEnd() 호출 성공");
		int result = 0;
		try{
			Reader reader = Resources.getResourceAsReader(resource);; // 2byte 단위로 읽어들이는 IO 클래스 ( 입출력에서 입력과 관련 )	
			sqlMapper = new SqlSessionFactoryBuilder().build(reader);
			sqlSes = sqlMapper.openSession();
			result = sqlSes.update("trEnd",pMap);
			sqlSes.commit();
		}catch(Exception e){
			logger.info("Exception : "+e.getMessage());
		}
		return result;
	}
	
	/* ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ 자유게시판 수정 */
	public int frUpd(Map<String, Object> pMap) {
		logger.info("frUpd() 호출 성공");
		int result = 0;
		try{
			Reader reader = Resources.getResourceAsReader(resource);; // 2byte 단위로 읽어들이는 IO 클래스 ( 입출력에서 입력과 관련 )	
			sqlMapper = new SqlSessionFactoryBuilder().build(reader);
			sqlSes = sqlMapper.openSession();
			result = sqlSes.update("frUpd",pMap);
			sqlSes.commit();
		}catch(Exception e){
			logger.info("Exception : "+e.getMessage());
		}
		return result;
	}
	
	/* ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ 거래게시판 삭제 */
	public int trDel(String tr_no) {
		logger.info("trDel() 호출 성공");
		int result = 0;
		int no = Integer.parseInt(tr_no);
		try{
			Reader reader = Resources.getResourceAsReader(resource);; // 2byte 단위로 읽어들이는 IO 클래스 ( 입출력에서 입력과 관련 )	
			sqlMapper = new SqlSessionFactoryBuilder().build(reader);
			sqlSes = sqlMapper.openSession();
			result = sqlSes.delete("trDel",no); 
			sqlSes.commit();
		}catch(Exception e){
			logger.info("Exception : "+e.getMessage());
		}
		return result;
	}
	
	/* ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ 자유게시판 삭제 */
	public int frDel(String fr_no) {
		logger.info("frDel() 호출 성공");
		int result = 0;
		int no = Integer.parseInt(fr_no);
		try{
			Reader reader = Resources.getResourceAsReader(resource);; // 2byte 단위로 읽어들이는 IO 클래스 ( 입출력에서 입력과 관련 )	
			sqlMapper = new SqlSessionFactoryBuilder().build(reader);
			sqlSes = sqlMapper.openSession();
			result = sqlSes.delete("frDel",no);
			sqlSes.commit();
		}catch(Exception e){
			logger.info("Exception : "+e.getMessage());
		}
		return result;
	}
	
	/* ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ 일정 추가 */
	public int scIns(Map<String, Object> pMap) {
		logger.info("scIns() 호출 성공");
		int result = 0;
		try {
			Reader reader = Resources.getResourceAsReader(resource);; // 2byte 단위로 읽어들이는 IO 클래스 ( 입출력에서 입력과 관련 )	
			sqlMapper = new SqlSessionFactoryBuilder().build(reader);
			sqlSes = sqlMapper.openSession();
			result = sqlSes.insert("scIns",pMap);
			sqlSes.commit();
		} catch (Exception e) {
			logger.info("Exception : "+e.getMessage());
		}
		return result;
	}
	
	/* ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ 일정 불러오기 */
	public List<Map<String, Object>> scList(String mem_no) {
		logger.info("scList() 호출 성공"); 
		List<Map<String, Object>> scList = null;
		try {
			Reader reader = Resources.getResourceAsReader(resource);; // 2byte 단위로 읽어들이는 IO 클래스 ( 입출력에서 입력과 관련 )	
			sqlMapper = new SqlSessionFactoryBuilder().build(reader);
			sqlSes = sqlMapper.openSession();
			scList = sqlSes.selectList("scList",mem_no);
			sqlSes.commit();
		} catch (Exception e) {
			logger.info("Exception : "+e.getMessage());
		}
		return scList;
	}
	
	/* ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ 접속회원 일정 불러오기 */ 
	public List<Map<String, Object>> scMemList(Map<String,Object> pMap) {
		logger.info("scMemList() 호출 성공");
		List<Map<String, Object>> scMemList = null;
		try {
			Reader reader = Resources.getResourceAsReader(resource);; // 2byte 단위로 읽어들이는 IO 클래스 ( 입출력에서 입력과 관련 )	
			sqlMapper = new SqlSessionFactoryBuilder().build(reader);
			sqlSes = sqlMapper.openSession();
			scMemList = sqlSes.selectList("scMemList",pMap);
		} catch (Exception e) {
			logger.info("Exception : "+e.getMessage());
		}
		return scMemList;
	}

	/* ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ 일정 수정 */
	public int scUpd(Map<String, Object> pMap) {
		logger.info("scIns() 호출 성공");
		int result = 0;
		try {
			Reader reader = Resources.getResourceAsReader(resource);; // 2byte 단위로 읽어들이는 IO 클래스 ( 입출력에서 입력과 관련 )	
			sqlMapper = new SqlSessionFactoryBuilder().build(reader);
			sqlSes = sqlMapper.openSession();
			result = sqlSes.update("scUpd",pMap);
			sqlSes.commit();
		} catch (Exception e) {
			logger.info("Exception : "+e.getMessage());
		}
		return result;
	}
	
	/* ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ 일정 삭제 */
	public int scDel(String sc_no) {
		logger.info("scDel() 호출 성공");
		int result = 0;
		int no = Integer.parseInt(sc_no);
		try {
			Reader reader = Resources.getResourceAsReader(resource);; // 2byte 단위로 읽어들이는 IO 클래스 ( 입출력에서 입력과 관련 )	
			sqlMapper = new SqlSessionFactoryBuilder().build(reader);
			sqlSes = sqlMapper.openSession();
			result = sqlSes.delete("scDel",no);
			sqlSes.commit();
		} catch (Exception e) {
			logger.info("Exception : "+e.getMessage());
		}
		return result;
	}
	
	/* ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ 일정 번호 찾기 */
	public String searchScNo(Map<String, Object> pMap) {
		logger.info("searchScNo() 호출 성공");
		String sc_no="";
		try {
			Reader reader = Resources.getResourceAsReader(resource);; // 2byte 단위로 읽어들이는 IO 클래스 ( 입출력에서 입력과 관련 )	
			sqlMapper = new SqlSessionFactoryBuilder().build(reader);
			sqlSes = sqlMapper.openSession();
			sc_no = sqlSes.selectOne("searchScNo",pMap);
		} catch (Exception e) {
			logger.info("Exception : "+e.getMessage());
		}
		return sc_no;
	}
	
}
