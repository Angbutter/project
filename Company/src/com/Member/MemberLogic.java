package com.Member;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;


public class MemberLogic {
	Logger logger = Logger.getLogger(MemberLogic.class);
	MemberDao memberDao = new MemberDao();
	
	public String getMemName(String pName){
		logger.info("��� ��� ��ȸ ����");
		String memName = memberDao.getMemList(pName);
		return memName; 
	}
	
/*	public int empInsert(Map<String,Object> pMap){
		logger.info("empInsert ȣ��");
		int result = 0; // 0�̸� �Է½���, 1�̸� �Է¼���
		result = empDao.empInsert(pMap);  // �����ϱ�
		return result;
	}*/
	

	
	/*********************************************************************
	 * ������� ���� ����
	 * SQL : UPDATE emp 
	 * 			SET ename = ?
	 * 			  , sal = ?
	 * 			  , hiredate = ?
	 * 		      , comm = ?
	 *            , deptno = ?
	 *        WHERE empno = ?
	 * @param pMap
	 * @return 1(����) or 0(����)
	 * �ۼ���, �ۼ����� ��
	 *********************************************************************/
	/*public int empUpdate(Map<String,Object> pMap){
		int result = 0; // 0�̸� �Է½���, 1�̸� �Է¼���
		result = empDao.empUpdate(pMap);  // �����ϱ�
		return result;
	}*/
	
	/*********************************************************************
	 * ������� ���� ����
	 * SQL : DELETE FROM emp WHERE empno = ?
	 * @param u_empno : �����ȣ - primary key
	 * @return 1(����) or 0(����)
	 * �ۼ���, �ۼ����� ��
	 *********************************************************************/
	/*public int empDelete(int u_empno){
		int result = 0; // 0�̸� �Է½���, 1�̸� �Է¼���
		result = empDao.empDelete(u_empno);  // �����ϱ�
		return result;
	}*/
}
