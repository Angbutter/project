package com.Controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import com.Admin.AdminAction;
import com.Approval.ApprovalDeleteAction;
import com.Approval.ApprovalInsertAction;
import com.Approval.ApprovalSelectAction;
import com.Approval.ApprovalTotalAction;
import com.Board.BoardInsertAction;
import com.Board.BoardSelectAction;
import com.Board.BoardTotalAction;
import com.Board.BoardUpdateAction;
import com.Board.boardDelAction;
import com.Board.boardEmpAction;
import com.Board.boardHitAction;
import com.Board.boardInsAction;
import com.Board.boardUpdAction;
import com.Cal.calDeleteAction;
import com.Cal.calInsertAction;
import com.Cal.calListAction;
import com.Cal.calUpdateAction;
import com.Dept.DeptDeleteAction;
import com.Dept.DeptInsertAction;
import com.Dept.DeptUpdateAction;
import com.Dept.DeptmAction;
import com.Dept.deptAction;
import com.Employee.EmpDeleteAction;
import com.Employee.EmpInsertAction;
import com.Employee.EmpUpdAction;
import com.Employee.EmpUpdateAction;
import com.Member.MemberAction;
import com.Member.MemberAction2;
import com.Message.MessageAction;
import com.Message.MessageDeleteAction;
import com.Message.MessageInsertAction;
import com.Message.MessageRecvAction;
import com.Message.MessageSendAction;
import com.Message.MessageUpdateAction;
import com.main.ActionForward;
import com.main.LoginAction;
import com.main.PwFindAction;

public class FrontController extends HttpServlet {
	Logger logger = Logger.getLogger(FrontController.class);
	public void doService(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException{
		//�б��ϴµ� �ʿ���
		String requestURI = req.getRequestURI();
		
		//-> / ���
		String contextPath = req.getContextPath();
			
		//-> /memberInsert.kosmo ���
		String command = requestURI.substring(contextPath.length());

		logger.info("requestURI  : "+requestURI);
		logger.info("contextPath : "+contextPath);
		logger.info("command     : "+command);
		
		/*
		    dev_jsp ���� ��Ʈ�� ����� ��
			requestURI  : /member/memberDelete.kosmo
			contextPath : 
			command     : /member/memberDelete.kosmo
			
			dev_jsp ���� �� ��
			requestURI  : /dev_jsp/memberDelete.kosmo
			contextPath : /dev_jsp
			command     : /memberDelete.kosmo
		*/
		String comm = req.getParameter("command");
		ActionForward forward = null;
		if ( "/member/getMemName.kosmo".equals(command) ){
			logger.info("ȸ����� ��ȸ ȣ�� ����");
			MemberAction memAct = new MemberAction();
			try {
				forward = memAct.execute(req, res);
			} catch (Exception e) {

			}
		}
		
		/* ����������������������������������������������������������������� ȸ�� ��ȸ */
		else if ("/comAdmin/getEmployee.do".equals(command)){
			logger.info("getEmployee"); 

			AdminAction empAct = new AdminAction();
			//req.setAttribute("jikup", jikup);
			try {
				forward = empAct.execute(req, res);
			} catch (Exception e) {
				logger.info(e.getMessage());
			}
		}
		/* ����������������������������������������������������������������� ȸ�� �߰� */
		else if ("/comAdmin/empInsert.do".equals(command)){
			logger.info("empInsert ȣ�� ����"); 
			// �׼ǿ� execute�� �ѱ涧, �μ��� ���� �μ���ȣ set ���ֱ�
			EmpInsertAction eia = new EmpInsertAction();
			try {
				forward = eia.execute(req, res);
			} catch (Exception e) {
				logger.info(e.getMessage());
			}
		}
		/* ����������������������������������������������������������������� ȸ�� ���� */
		else if ("/comAdmin/empUpdate.do".equals(command)){
			logger.info("empInsert ȣ�� ����"); 
			// �׼ǿ� execute�� �ѱ涧, �μ��� ���� �μ���ȣ set ���ֱ�
			EmpUpdateAction eua = new EmpUpdateAction();
			try {
				forward = eua.execute(req, res);
			} catch (Exception e) {
				logger.info(e.getMessage());
			}
		}
		/* ����������������������������������������������������������������� ȸ�� ���� */
		else if ("/comAdmin/empDelete.do".equals(command)){
			logger.info("empDelete ȣ�� ����"); 
			// �׼ǿ� execute�� �ѱ涧, �μ��� ���� �μ���ȣ set ���ֱ�
			EmpDeleteAction eda = new EmpDeleteAction();
			try {
				forward = eda.execute(req, res);
			} catch (Exception e) {
				logger.info(e.getMessage());
			}
		}
		/* ����������������������������������������������������������������� �μ� �߰� */
		else if ("/comAdmin/deptInsert.do".equals(command)){
			logger.info("deptInsert ȣ�� ����"); 
			// �׼ǿ� execute�� �ѱ涧, �μ��� ���� �μ���ȣ set ���ֱ�
			DeptInsertAction dia = new DeptInsertAction();
			try {
				forward = dia.execute(req, res);
			} catch (Exception e) {
				logger.info(e.getMessage());
			}
		}
		/* ����������������������������������������������������������������� �μ� ���� */
		else if ("/comAdmin/deptDelete.do".equals(command)){
			logger.info("deptDelete ȣ�� ����"); 
			// �׼ǿ� execute�� �ѱ涧, �μ��� ���� �μ���ȣ set ���ֱ�
			DeptDeleteAction dda = new DeptDeleteAction();
			try {
				forward = dda.execute(req, res);
			} catch (Exception e) {
				logger.info(e.getMessage());
			}
		}
		/* ����������������������������������������������������������������� �μ� ���� */
		else if ("/comAdmin/deptUpdate.do".equals(command)){
			logger.info("deptUpdate ȣ�� ����"); 
			// �׼ǿ� execute�� �ѱ涧, �μ��� ���� �μ���ȣ set ���ֱ�
			DeptUpdateAction dua = new DeptUpdateAction();
			try {
				forward = dua.execute(req, res);
			} catch (Exception e) {
				logger.info(e.getMessage());
			}
		}
		/* ����������������������������������������������������������������� �μ� ��ȸ */
		else if ("/comAdmin/getDeptList.do".equals(command)){
			logger.info("getDeptList");
			deptAction deptAct = new deptAction();
			try {
				forward = deptAct.execute(req, res);
			} catch (Exception e) {
				logger.info(e.getMessage());
			}
		}
		/* ����������������������������������������������������������������� ����Խ��� */
		else if ("/comBoard/getBoardEmp.do".equals(command)){
			logger.info("getBoardEmp");
			boardEmpAction bea = new boardEmpAction();
			try {
				forward = bea.execute(req, res);
			} catch (Exception e) {
				logger.info(e.getMessage());
			}
		}
		/* ����������������������������������������������������������������� ��ȸ�� �ø��� */
		else if ("/comBoard/hitUpdate.do".equals(command)){
			logger.info("hitUpdate");
			boardHitAction bha = new boardHitAction();
			try {
				forward = bha.execute(req, res);
			} catch (Exception e) {
				logger.info(e.getMessage());
			}
		}
		/* ����������������������������������������������������������������� ����Խ����ۼ� */
		else if ("/comBoard/boardIns.do".equals(command)){
			logger.info("boardIns");
			boardInsAction bia = new boardInsAction();
			try {
				forward = bia.execute(req, res);
			} catch (Exception e) {
				logger.info(e.getMessage());
			}
		}
		/* ����������������������������������������������������������������� ����Խ��ǻ��� */
		else if ("/comBoard/boardDel.do".equals(command)){
			logger.info("boardDel");
			boardDelAction bda = new boardDelAction();
			try {
				forward = bda.execute(req, res);
			} catch (Exception e) {
				logger.info(e.getMessage());
			}
		}
		/* ����������������������������������������������������������������� ����Խ��Ǽ��� */
		else if ("/comBoard/boardUpd.do".equals(command)){
			logger.info("boardUpd");
			boardUpdAction bua = new boardUpdAction();
			try {
				forward = bua.execute(req, res);
			} catch (Exception e) {
				logger.info(e.getMessage());
			}
		}
		/* ����������������������������������������������������������������� �����Խ����߰� */
		else if ("/comBoard/boardInsert.do".equals(command)){
			logger.info("boardInsert");
			BoardInsertAction bdAct = new BoardInsertAction();
			try {
				forward = bdAct.execute(req, res);
			} catch (Exception e) {
				logger.info(e.getMessage());
			}
		}
		/* ����������������������������������������������������������������� �����Խ�����ȸ */
		else if("/comBoard/getBoardList.do".equals(command)){
			logger.info("�Խ��� ��ȸ ����");
			BoardSelectAction bsa = new BoardSelectAction();
			try {
				forward = bsa.execute(req, res);
			} catch (Exception e) {
				// TODO: handle exception
			}  
		}
		/* ����������������������������������������������������������������� �����Խ��� ��ü�ο�� ��ȸ */
		else if("/comBoard/getTotal.do".equals(command)){
			logger.info("��ü �ο�� ��ȸ ����");
			BoardTotalAction btAct = new BoardTotalAction();
			try {
				forward = btAct.execute(req, res);
			} catch (Exception e) {
				// TODO: handle exception
			}  
		}
		/* ����������������������������������������������������������������� �����Խ��� ���� */
		else if("/comBoard/boardUpdate.do".equals(command)){
			logger.info("�Խ��� ���� ����");
			BoardUpdateAction bua = new BoardUpdateAction();
			try {
				forward = bua.execute(req, res);
			} catch (Exception e) {
				// TODO: handle exception
			}
		}
		/* ����������������������������������������������������������������� �α��� */
		else if ("/comAdmin/login.do".equals(command)){
			logger.info("loginaction");
			LoginAction loginaction = new LoginAction();
			try {
				forward = loginaction.execute(req, res);
			} catch (Exception e) {
				logger.info(e.getMessage());
			}
		}
		/* ����������������������������������������������������������������� ������������ */
		else if ("/comEmp/empUpd.do".equals(command)){
			logger.info("empUpd");
			EmpUpdAction eua = new EmpUpdAction();
			try {
				forward = eua.execute(req, res);
			} catch (Exception e) {
				logger.info(e.getMessage());
			}
		}
		/* ����������������������������������������������������������������� ��й�ȣã�� */
		else if ("/comAdmin/pwFind.do".equals(command)){
			logger.info("pwFind");
			PwFindAction pfa = new PwFindAction();
			try {
				forward = pfa.execute(req, res);
			} catch (Exception e) {
				logger.info(e.getMessage());
			}
		}
		/* ����������������������������������������������������������������� ���� ��ȸ */
		else if("/comMemo/getCalList.do".equals(command)){
			logger.info("������ȸ");
			calListAction cla = new calListAction();
			try {
				forward = cla.execute(req, res);
			} catch (Exception e) {
				// TODO: handle exception
			}  
		}
		/* ����������������������������������������������������������������� ���� �߰� */
		else if("/comMemo/insert.do".equals(command)){
			logger.info("�Է�");
			calInsertAction cia = new calInsertAction();
			try {
				forward = cia.execute(req, res);
			} catch (Exception e) {
				// TODO: handle exception
			}  
		}
		/* ����������������������������������������������������������������� ���� ���� */
		else if("/comMemo/update.do".equals(command)){
			logger.info("����");
			calUpdateAction cia = new calUpdateAction();
			try {
				forward = cia.execute(req, res);
			} catch (Exception e) {
				// TODO: handle exception
			}  
		}
		/* ����������������������������������������������������������������� ���� ���� */
		else if("/comMemo/delete.do".equals(command)){
			logger.info("����");
			calDeleteAction cia = new calDeleteAction();
			try {
				forward = cia.execute(req, res);
			} catch (Exception e) {
				// TODO: handle exception
			}  
		}
		
		else if("/comSns/sendMessage.do".equals(command)){
			logger.info("�޼��� ������ ȣ�� ����");
			MessageAction msgAct = new MessageAction();
			try{
				forward = msgAct.execute(req, res);
			} catch(Exception e){
				
			}
		}
		//////////�μ����� ���������//////////////
		//����������
		else if("/comSns/messageInsert.do".equals(command)){
			logger.info("�������� ����");
			MessageInsertAction fiAct =
					new MessageInsertAction();
			forward = fiAct.execute(req, res);
		}
		//�����Կ��� ���� �����ϱ�
		else if("/comSns/messageDelete.do".equals(command)){
			logger.info("�������� ����");
			MessageDeleteAction fdAct =
					new MessageDeleteAction();
			forward = fdAct.execute(req, res);
		}		
		//����������
		else if("/comSns/sendMessageList.do".equals(command)){
			logger.info("���������� ����");
			MessageSendAction fiAct =
					new MessageSendAction();
			forward = fiAct.execute(req, res);
		}	
		//����������
		else if("/comSns/recvMessageList.do".equals(command)){
			logger.info("���������� ����");
			MessageRecvAction fiAct =
					new MessageRecvAction();
			forward = fiAct.execute(req, res);
		}
		//////////////���� �󼼺���
		else if("/comSns/messageContentUpdate.do".equals(command)){
			logger.info("�����󼼺���  ����");
			MessageUpdateAction fuAct =
					
					new MessageUpdateAction();
			forward = fuAct.execute(req, res);
		}
		////////// �μ��� ��� �˻� ���� ////////////		
		else if("/comDept/getDeptmList.do".equals(command)){
			logger.info("�μ���� ��ȸ ȣ�� ����");
			DeptmAction deptAct = new DeptmAction();
			try {
				forward = deptAct.execute(req, res);
			} catch (Exception e) {
				// TODO: handle exception
			}  
		}
		else if("/comApproval/getApprovalList.do".equals(command)){
			logger.info("����ȭ�� ��ȸ ����");
			ApprovalSelectAction apAct = new ApprovalSelectAction();
			try {
				forward = apAct.execute(req, res);
			} catch (Exception e) {
				// TODO: handle exception
			}  
		}
		else if("/comApproval/approvalInsert.do".equals(command)){
			logger.info("����ȭ�� �Է� ����");
			ApprovalInsertAction apAct = new ApprovalInsertAction();
			try {
				forward = apAct.execute(req, res);
			} catch (Exception e) {
				// TODO: handle exception
			}  
		}
		else if("/comApproval/approvalDelete.do".equals(command)){
			logger.info("����ȭ�� ���� ����");
			ApprovalDeleteAction apAct = new ApprovalDeleteAction();
			try {
				forward = apAct.execute(req, res);
			} catch (Exception e) {
				// TODO: handle exception
			}  
		}
		else if("/comBoard/getTotal.do".equals(command)){
			logger.info("��ü �ο�� ��ȸ ����");
			ApprovalTotalAction apAct = new ApprovalTotalAction();
			try {
				forward = apAct.execute(req, res);
			} catch (Exception e) {
				// TODO: handle exception
			}  
		}
		else if("/comApproval/angApprovalList.do".equals(command)){
			logger.info("������ ��ȸ ȣ�� ����");
			MemberAction2 memAct2 = new MemberAction2();
			try {
				forward = memAct2.execute(req, res);
			} catch (Exception e) {
				// TODO: handle exception
			}  
		}
		//////////�μ��� ��� �˻� ��//////////////
		
		if ( forward.getRedirect() ) { // �� sendRedirect ��?
			res.sendRedirect(forward.getPath());
		}
		else{ // �� forward �Ұ���
			RequestDispatcher view = req.getRequestDispatcher(forward.getPath());
			view.forward(req, res);
		}
	}
	
	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException{
		doService(req,res);
	}
	
	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException{
		doService(req,res);
	}
}