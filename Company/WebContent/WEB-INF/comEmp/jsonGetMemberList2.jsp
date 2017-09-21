<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.util.List,java.util.Map, java.util.HashMap,java.util.ArrayList" %>   
<%@ page import="com.google.gson.Gson" %>
<%
	List<Map<String,Object>> memList = (List<Map<String,Object>>)request.getAttribute("memList");
	Gson g = new Gson();
	String jsonMember = g.toJson(memList);
	out.print(jsonMember);
%>