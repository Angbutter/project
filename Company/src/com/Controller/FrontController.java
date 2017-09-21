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
		//분기하는데 필요한
		String requestURI = req.getRequestURI();
		
		//-> / 출력
		String contextPath = req.getContextPath();
			
		//-> /memberInsert.kosmo 출력
		String command = requestURI.substring(contextPath.length());

		logger.info("requestURI  : "+requestURI);
		logger.info("contextPath : "+contextPath);
		logger.info("command     : "+command);
		
		/*
		    dev_jsp 까지 루트로 잡았을 때
			requestURI  : /member/memberDelete.kosmo
			contextPath : 
			command     : /member/memberDelete.kosmo
			
			dev_jsp 부터 들어갈 때
			requestURI  : /dev_jsp/memberDelete.kosmo
			contextPath : /dev_jsp
			command     : /memberDelete.kosmo
		*/
		String comm = req.getParameter("command");
		ActionForward forward = null;
		if ( "/member/getMemName.kosmo".equals(command) ){
			logger.info("회원목록 조회 호출 성공");
			MemberAction memAct = new MemberAction();
			try {
				forward = memAct.execute(req, res);
			} catch (Exception e) {

			}
		}
		
		/* ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ 회원 조회 */
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
		/* ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ 회원 추가 */
		else if ("/comAdmin/empInsert.do".equals(command)){
			logger.info("empInsert 호출 성공"); 
			// 액션에 execute로 넘길때, 부서명에 따라 부서번호 set 해주기
			EmpInsertAction eia = new EmpInsertAction();
			try {
				forward = eia.execute(req, res);
			} catch (Exception e) {
				logger.info(e.getMessage());
			}
		}
		/* ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ 회원 수정 */
		else if ("/comAdmin/empUpdate.do".equals(command)){
			logger.info("empInsert 호출 성공"); 
			// 액션에 execute로 넘길때, 부서명에 따라 부서번호 set 해주기
			EmpUpdateAction eua = new EmpUpdateAction();
			try {
				forward = eua.execute(req, res);
			} catch (Exception e) {
				logger.info(e.getMessage());
			}
		}
		/* ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ 회원 삭제 */
		else if ("/comAdmin/empDelete.do".equals(command)){
			logger.info("empDelete 호출 성공"); 
			// 액션에 execute로 넘길때, 부서명에 따라 부서번호 set 해주기
			EmpDeleteAction eda = new EmpDeleteAction();
			try {
				forward = eda.execute(req, res);
			} catch (Exception e) {
				logger.info(e.getMessage());
			}
		}
		/* ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ 부서 추가 */
		else if ("/comAdmin/deptInsert.do".equals(command)){
			logger.info("deptInsert 호출 성공"); 
			// 액션에 execute로 넘길때, 부서명에 따라 부서번호 set 해주기
			DeptInsertAction dia = new DeptInsertAction();
			try {
				forward = dia.execute(req, res);
			} catch (Exception e) {
				logger.info(e.getMessage());
			}
		}
		/* ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ 부서 삭제 */
		else if ("/comAdmin/deptDelete.do".equals(command)){
			logger.info("deptDelete 호출 성공"); 
			// 액션에 execute로 넘길때, 부서명에 따라 부서번호 set 해주기
			DeptDeleteAction dda = new DeptDeleteAction();
			try {
				forward = dda.execute(req, res);
			} catch (Exception e) {
				logger.info(e.getMessage());
			}
		}
		/* ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ 부서 수정 */
		else if ("/comAdmin/deptUpdate.do".equals(command)){
			logger.info("deptUpdate 호출 성공"); 
			// 액션에 execute로 넘길때, 부서명에 따라 부서번호 set 해주기
			DeptUpdateAction dua = new DeptUpdateAction();
			try {
				forward = dua.execute(req, res);
			} catch (Exception e) {
				logger.info(e.getMessage());
			}
		}
		/* ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ 부서 조회 */
		else if ("/comAdmin/getDeptList.do".equals(command)){
			logger.info("getDeptList");
			deptAction deptAct = new deptAction();
			try {
				forward = deptAct.execute(req, res);
			} catch (Exception e) {
				logger.info(e.getMessage());
			}
		}
		/* ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ 사원게시판 */
		else if ("/comBoard/getBoardEmp.do".equals(command)){
			logger.info("getBoardEmp");
			boardEmpAction bea = new boardEmpAction();
			try {
				forward = bea.execute(req, res);
			} catch (Exception e) {
				logger.info(e.getMessage());
			}
		}
		/* ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ 조회수 올리기 */
		else if ("/comBoard/hitUpdate.do".equals(command)){
			logger.info("hitUpdate");
			boardHitAction bha = new boardHitAction();
			try {
				forward = bha.execute(req, res);
			} catch (Exception e) {
				logger.info(e.getMessage());
			}
		}
		/* ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ 사원게시판작성 */
		else if ("/comBoard/boardIns.do".equals(command)){
			logger.info("boardIns");
			boardInsAction bia = new boardInsAction();
			try {
				forward = bia.execute(req, res);
			} catch (Exception e) {
				logger.info(e.getMessage());
			}
		}
		/* ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ 사원게시판삭제 */
		else if ("/comBoard/boardDel.do".equals(command)){
			logger.info("boardDel");
			boardDelAction bda = new boardDelAction();
			try {
				forward = bda.execute(req, res);
			} catch (Exception e) {
				logger.info(e.getMessage());
			}
		}
		/* ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ 사원게시판수정 */
		else if ("/comBoard/boardUpd.do".equals(command)){
			logger.info("boardUpd");
			boardUpdAction bua = new boardUpdAction();
			try {
				forward = bua.execute(req, res);
			} catch (Exception e) {
				logger.info(e.getMessage());
			}
		}
		/* ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ 공지게시판추가 */
		else if ("/comBoard/boardInsert.do".equals(command)){
			logger.info("boardInsert");
			BoardInsertAction bdAct = new BoardInsertAction();
			try {
				forward = bdAct.execute(req, res);
			} catch (Exception e) {
				logger.info(e.getMessage());
			}
		}
		/* ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ 공지게시판조회 */
		else if("/comBoard/getBoardList.do".equals(command)){
			logger.info("게시판 조회 성공");
			BoardSelectAction bsa = new BoardSelectAction();
			try {
				forward = bsa.execute(req, res);
			} catch (Exception e) {
				// TODO: handle exception
			}  
		}
		/* ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ 공지게시판 전체로우수 조회 */
		else if("/comBoard/getTotal.do".equals(command)){
			logger.info("전체 로우수 조회 성공");
			BoardTotalAction btAct = new BoardTotalAction();
			try {
				forward = btAct.execute(req, res);
			} catch (Exception e) {
				// TODO: handle exception
			}  
		}
		/* ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ 공지게시판 수정 */
		else if("/comBoard/boardUpdate.do".equals(command)){
			logger.info("게시판 수정 성공");
			BoardUpdateAction bua = new BoardUpdateAction();
			try {
				forward = bua.execute(req, res);
			} catch (Exception e) {
				// TODO: handle exception
			}
		}
		/* ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ 로그인 */
		else if ("/comAdmin/login.do".equals(command)){
			logger.info("loginaction");
			LoginAction loginaction = new LoginAction();
			try {
				forward = loginaction.execute(req, res);
			} catch (Exception e) {
				logger.info(e.getMessage());
			}
		}
		/* ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ 개인정보수정 */
		else if ("/comEmp/empUpd.do".equals(command)){
			logger.info("empUpd");
			EmpUpdAction eua = new EmpUpdAction();
			try {
				forward = eua.execute(req, res);
			} catch (Exception e) {
				logger.info(e.getMessage());
			}
		}
		/* ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ 비밀번호찾기 */
		else if ("/comAdmin/pwFind.do".equals(command)){
			logger.info("pwFind");
			PwFindAction pfa = new PwFindAction();
			try {
				forward = pfa.execute(req, res);
			} catch (Exception e) {
				logger.info(e.getMessage());
			}
		}
		/* ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ 일정 조회 */
		else if("/comMemo/getCalList.do".equals(command)){
			logger.info("일정조회");
			calListAction cla = new calListAction();
			try {
				forward = cla.execute(req, res);
			} catch (Exception e) {
				// TODO: handle exception
			}  
		}
		/* ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ 일정 추가 */
		else if("/comMemo/insert.do".equals(command)){
			logger.info("입력");
			calInsertAction cia = new calInsertAction();
			try {
				forward = cia.execute(req, res);
			} catch (Exception e) {
				// TODO: handle exception
			}  
		}
		/* ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ 일정 수정 */
		else if("/comMemo/update.do".equals(command)){
			logger.info("수정");
			calUpdateAction cia = new calUpdateAction();
			try {
				forward = cia.execute(req, res);
			} catch (Exception e) {
				// TODO: handle exception
			}  
		}
		/* ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ 일정 삭제 */
		else if("/comMemo/delete.do".equals(command)){
			logger.info("삭제");
			calDeleteAction cia = new calDeleteAction();
			try {
				forward = cia.execute(req, res);
			} catch (Exception e) {
				// TODO: handle exception
			}  
		}
		
		else if("/comSns/sendMessage.do".equals(command)){
			logger.info("메세지 보내기 호출 성공");
			MessageAction msgAct = new MessageAction();
			try{
				forward = msgAct.execute(req, res);
			} catch(Exception e){
				
			}
		}
		//////////부서쪽지 보내기시작//////////////
		//쪽지보내기
		else if("/comSns/messageInsert.do".equals(command)){
			logger.info("쪽지쓰기 성공");
			MessageInsertAction fiAct =
					new MessageInsertAction();
			forward = fiAct.execute(req, res);
		}
		//보관함에서 쪽지 삭제하기
		else if("/comSns/messageDelete.do".equals(command)){
			logger.info("쪽지삭제 성공");
			MessageDeleteAction fdAct =
					new MessageDeleteAction();
			forward = fdAct.execute(req, res);
		}		
		//보낸쪽지함
		else if("/comSns/sendMessageList.do".equals(command)){
			logger.info("보낸쪽지함 성공");
			MessageSendAction fiAct =
					new MessageSendAction();
			forward = fiAct.execute(req, res);
		}	
		//받은쪽지함
		else if("/comSns/recvMessageList.do".equals(command)){
			logger.info("받은쪽지함 성공");
			MessageRecvAction fiAct =
					new MessageRecvAction();
			forward = fiAct.execute(req, res);
		}
		//////////////쪽지 상세보기
		else if("/comSns/messageContentUpdate.do".equals(command)){
			logger.info("쪽지상세보기  성공");
			MessageUpdateAction fuAct =
					
					new MessageUpdateAction();
			forward = fuAct.execute(req, res);
		}
		////////// 부서의 사원 검색 시작 ////////////		
		else if("/comDept/getDeptmList.do".equals(command)){
			logger.info("부서목록 조회 호출 성공");
			DeptmAction deptAct = new DeptmAction();
			try {
				forward = deptAct.execute(req, res);
			} catch (Exception e) {
				// TODO: handle exception
			}  
		}
		else if("/comApproval/getApprovalList.do".equals(command)){
			logger.info("결재화면 조회 성공");
			ApprovalSelectAction apAct = new ApprovalSelectAction();
			try {
				forward = apAct.execute(req, res);
			} catch (Exception e) {
				// TODO: handle exception
			}  
		}
		else if("/comApproval/approvalInsert.do".equals(command)){
			logger.info("결재화면 입력 성공");
			ApprovalInsertAction apAct = new ApprovalInsertAction();
			try {
				forward = apAct.execute(req, res);
			} catch (Exception e) {
				// TODO: handle exception
			}  
		}
		else if("/comApproval/approvalDelete.do".equals(command)){
			logger.info("결재화면 삭제 성공");
			ApprovalDeleteAction apAct = new ApprovalDeleteAction();
			try {
				forward = apAct.execute(req, res);
			} catch (Exception e) {
				// TODO: handle exception
			}  
		}
		else if("/comBoard/getTotal.do".equals(command)){
			logger.info("전체 로우수 조회 성공");
			ApprovalTotalAction apAct = new ApprovalTotalAction();
			try {
				forward = apAct.execute(req, res);
			} catch (Exception e) {
				// TODO: handle exception
			}  
		}
		else if("/comApproval/angApprovalList.do".equals(command)){
			logger.info("사원목록 조회 호출 성공");
			MemberAction2 memAct2 = new MemberAction2();
			try {
				forward = memAct2.execute(req, res);
			} catch (Exception e) {
				// TODO: handle exception
			}  
		}
		//////////부서의 사원 검색 끝//////////////
		
		if ( forward.getRedirect() ) { // 너 sendRedirect 니?
			res.sendRedirect(forward.getPath());
		}
		else{ // 너 forward 할거지
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