<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="Mproject.mvc.BoardDao" %>    
<%
	String tr_no = request.getParameter("tr_no");
	BoardDao boardDao = new BoardDao();
	
	int result = 0; 
	result = boardDao.trHitUpd(tr_no);
	out.print(result);
%>