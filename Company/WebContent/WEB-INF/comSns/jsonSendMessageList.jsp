<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.util.List,java.util.Map" %>   
<%@ page import="com.google.gson.Gson" %> 
<%
	List<Map<String,Object>> smeList
	=(List<Map<String,Object>>)request.getAttribute("smeList");
	Gson g = new Gson();
	String jsonEmployee = g.toJson(smeList);
	out.print(jsonEmployee);
%>