<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.util.List,java.util.Map" %>   
<%@ page import="com.google.gson.Gson" %> 
<%
	List<Map<String,Object>> deptList = (List<Map<String,Object>>)request.getAttribute("deptList");
	Gson g = new Gson();
	String jsonDept = g.toJson(deptList);
	out.print(jsonDept); 
%>