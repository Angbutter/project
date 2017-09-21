<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.util.List,java.util.Map" %>   
<%@ page import="com.google.gson.Gson" %> 	
<%
	List<Map<String,Object>> empList = (List<Map<String,Object>>)request.getAttribute("empList");
	Gson g = new Gson();
	String jsonEmp = g.toJson(empList);
	out.print(jsonEmp); 
%>