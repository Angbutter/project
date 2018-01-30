<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="Mproject.mvc.BoardDao" %>    
<%
	String fr_no = request.getParameter("fr_no");
	BoardDao boardDao = new BoardDao();
	
	int result = 0; 
	result = boardDao.frHitUpd(fr_no);
	out.print(result);
%>