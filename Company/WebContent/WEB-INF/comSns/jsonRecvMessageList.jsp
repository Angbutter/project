<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.util.List,java.util.Map" %>   
<%@ page import="com.google.gson.Gson" %> 
<%
	List<Map<String,Object>> rmeList
	=(List<Map<String,Object>>)request.getAttribute("rmeList");
	Gson g = new Gson();
	String jsonMessage = g.toJson(rmeList);
	out.print(jsonMessage);
%>