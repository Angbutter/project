<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.util.List,java.util.Map" %>   
<%@ page import="com.google.gson.Gson" %> 
<%
	List<Map<String,Object>> approvalList = (List<Map<String,Object>>)request.getAttribute("approvalList");
	Gson g = new Gson();
	String jsonApproval = g.toJson(approvalList);
	out.print(jsonApproval);
%>