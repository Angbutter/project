<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.util.List,java.util.Map" %>   
<%@ page import="com.google.gson.Gson" %> 
<%
	List<Map<String,Object>> boardList = (List<Map<String,Object>>)request.getAttribute("boardList");
	Gson g = new Gson();
	String jsonBoard = g.toJson(boardList);
	out.print(jsonBoard);
%>