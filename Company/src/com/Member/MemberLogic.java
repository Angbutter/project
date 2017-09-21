package com.Member;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;


public class MemberLogic {
	Logger logger = Logger.getLogger(MemberLogic.class);
	MemberDao memberDao = new MemberDao();
	
	public String getMemName(String pName){
		logger.info("사원 목록 조회 성공");
		String memName = memberDao.getMemList(pName);
		return memName; 
	}
	
/*	public int empInsert(Map<String,Object> pMap){
		logger.info("empInsert 호출");
		int result = 0; // 0이면 입력실패, 1이면 입력성공
		result = empDao.empInsert(pMap);  // 주의하기
		return result;
	}*/
	

	
	/*********************************************************************
	 * 사원정보 수정 구현
	 * SQL : UPDATE emp 
	 * 			SET ename = ?
	 * 			  , sal = ?
	 * 			  , hiredate = ?
	 * 		      , comm = ?
	 *            , deptno = ?
	 *        WHERE empno = ?
	 * @param pMap
	 * @return 1(성공) or 0(실패)
	 * 작성자, 작성일자 등
	 *********************************************************************/
	/*public int empUpdate(Map<String,Object> pMap){
		int result = 0; // 0이면 입력실패, 1이면 입력성공
		result = empDao.empUpdate(pMap);  // 주의하기
		return result;
	}*/
	
	/*********************************************************************
	 * 사원정보 삭제 구현
	 * SQL : DELETE FROM emp WHERE empno = ?
	 * @param u_empno : 사원번호 - primary key
	 * @return 1(성공) or 0(실패)
	 * 작성자, 작성일자 등
	 *********************************************************************/
	/*public int empDelete(int u_empno){
		int result = 0; // 0이면 입력실패, 1이면 입력성공
		result = empDao.empDelete(u_empno);  // 주의하기
		return result;
	}*/
}
