package Mproject.mvc;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import Mproject.mvc.LoginAction;

public class Ctr extends HttpServlet {
	Logger logger = Logger.getLogger(Ctr.class);
	public void doService(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException{

		String requestURI = req.getRequestURI();
		String contextPath = req.getContextPath();
		String command = requestURI.substring(contextPath.length());

		logger.info("requestURI  : "+requestURI);
		logger.info("contextPath : "+contextPath);
		logger.info("command     : "+command);
		
		String comm = req.getParameter("command");
		ActionForward forward = null;
		
		/* ����������������������������������������������������������������� �α��� */
		if ( "/mProject/login.do".equals(command) ){
			logger.info("loginAction");
			LoginAction loginaction = new LoginAction();
			try {
				forward = loginaction.execute(req, res);
			} catch (Exception e) {
				logger.info(e.getMessage());
			}
		}
		
		/* ����������������������������������������������������������������� ȸ������ */
		else if ( "/mProject/signup.do".equals(command) ){
			logger.info("signupAction");
			signUpAction signupaction = new signUpAction();
			try {
				forward = signupaction.execute(req, res);
			} catch (Exception e) {
				logger.info(e.getMessage());
			}
		}
		
		/* ����������������������������������������������������������������� ȸ��Ż�� */
		else if ( "/mProject/memDel.do".equals(command) ){
			logger.info("memDel");
			memDelAction mda = new memDelAction();
			try {
				forward = mda.execute(req, res);
			} catch (Exception e) {
				logger.info(e.getMessage());
			}
		}
		
		/* ����������������������������������������������������������������� ��й�ȣã�� */
		else if ("/mProject/pwFind.do".equals(command)){
			logger.info("pwFind");
			PwFindAction pfa = new PwFindAction();
			try {
				forward = pfa.execute(req, res);
			} catch (Exception e) {
				logger.info(e.getMessage());
			}
		}
		
		/* ����������������������������������������������������������������� �ŷ��Խ��� �۾��� */
		else if ("/mProject/trInsert.do".equals(command)){
			logger.info("trInsert.do");
			BoardAction ba = new BoardAction();
			try {
				forward = ba.execute(req, res);
			} catch (Exception e) {
				logger.info(e.getMessage());
			}
		}
		
		/* ����������������������������������������������������������������� �ŷ��Խ��� �˻� */
		else if ("/mProject/trSearch.do".equals(command)){
			logger.info("trSearch.do");
			BoardSearch bs = new BoardSearch();
			try {
				forward = bs.execute(req, res);
			} catch (Exception e) {
				logger.info(e.getMessage());
			}
		}
		
		/* ����������������������������������������������������������������� �ŷ��Խ��� �ŷ��Ϸ�ó�� */
		else if ("/mProject/trEnd.do".equals(command)){
			logger.info("trEnd.do");
			trEndAction tea = new trEndAction();
			try {
				forward = tea.execute(req, res);
			} catch (Exception e) {
				logger.info(e.getMessage());
			}
		}
		
		/* ����������������������������������������������������������������� �����Խ��� �˻� */
		else if ("/mProject/frSearch.do".equals(command)){
			logger.info("frSearch.do");
			frBoardSearch fbs = new frBoardSearch();
			try {
				forward = fbs.execute(req, res);
			} catch (Exception e) {
				logger.info(e.getMessage());
			}
		}
		
		/* ����������������������������������������������������������������� �����Խ��� �۾��� */
		else if ("/mProject/frInsert.do".equals(command)){
			logger.info("frInsert.do");
			frBoardAction fba = new frBoardAction();
			try {
				forward = fba.execute(req, res);
			} catch (Exception e) {
				logger.info(e.getMessage());
			}
		}
		
		/* ����������������������������������������������������������������� ������ȸ */
		else if ("/mProject/schedule.do".equals(command)){
			logger.info("schedule.do");
			ScheduleAction sa = new ScheduleAction();
			try {
				forward = sa.execute(req, res);
			} catch (Exception e) {
				logger.info(e.getMessage());
			}
		}
		
		/* ����������������������������������������������������������������� ȸ���������� */
		else if ("/mProject/empUpd.do".equals(command)){
			logger.info("empUpd.do");
			empUpdateAction eua = new empUpdateAction();
			try {
				forward = eua.execute(req, res);
			} catch (Exception e) {
				logger.info(e.getMessage());
			}
		}
		
		/* ����������������������������������������������������������������� �ŷ��Խ��� ���� */
		else if ("/mProject/trUpd.do".equals(command)){
			logger.info("trUpd.do");
			trUpdAction tua = new trUpdAction();
			try {
				forward = tua.execute(req, res);
			} catch (Exception e) {
				logger.info(e.getMessage());
			}
		}
		
		/* ����������������������������������������������������������������� �ŷ��Խ��� ���� */
		else if ("/mProject/trDel.do".equals(command)){
			logger.info("trDel.do");
			trDelAction tda = new trDelAction();
			try {
				forward = tda.execute(req, res);
			} catch (Exception e) {
				logger.info(e.getMessage());
			}
		}
		
		/* ����������������������������������������������������������������� �����Խ��� ���� */
		else if ("/mProject/frUpd.do".equals(command)){
			logger.info("frUpd.do");
			frUpdAction fua = new frUpdAction();
			try {
				forward = fua.execute(req, res);
			} catch (Exception e) {
				logger.info(e.getMessage());
			}
		}
		
		/* ����������������������������������������������������������������� �����Խ��� ���� */
		else if ("/mProject/frDel.do".equals(command)){
			logger.info("frDel.do");
			frDelAction fda = new frDelAction();
			try {
				forward = fda.execute(req, res);
			} catch (Exception e) {
				logger.info(e.getMessage());
			}
		}
		
		/* ����������������������������������������������������������������� ���� �߰� */
		else if ("/mProject/scIns.do".equals(command)){
			logger.info("scIns.do");
			scInsAction sia = new scInsAction();
			try {
				forward = sia.execute(req, res);
			} catch (Exception e) {
				logger.info(e.getMessage());
			}
		}
		
		/* ����������������������������������������������������������������� ���� ���� */
		else if ("/mProject/scUpd.do".equals(command)){
			logger.info("scUpd.do");
			scUpdAction sua = new scUpdAction();
			try {
				forward = sua.execute(req, res);
			} catch (Exception e) {
				logger.info(e.getMessage());
			}
		}
		
		/* ����������������������������������������������������������������� ���� ���� */
		else if ("/mProject/scDel.do".equals(command)){
			logger.info("scDel.do");
			scDelAction sda = new scDelAction();
			try {
				forward = sda.execute(req, res);
			} catch (Exception e) {
				logger.info(e.getMessage());
			}
		}
		
		/* ����������������������������������������������������������������� ���� ��� �������� */
		else if ("/mProject/scList.do".equals(command)){
			logger.info("scList.do");
			scListAction sa = new scListAction();
			try {
				forward = sa.execute(req, res);
			} catch (Exception e) {
				logger.info(e.getMessage());
			}
		}
		
		if ( forward.getRedirect() ) { 
			res.sendRedirect(forward.getPath());
		}
		else{
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