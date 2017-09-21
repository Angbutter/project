<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.util.List,java.util.Map, java.util.HashMap" %>   
<%@ page import="java.util.ArrayList" %>   
<%@ page import="com.google.gson.Gson" %> 
<%
    List<Map<String,Object>> totalList=
    ( List<Map<String,Object>>)request.getAttribute("totalList");
	Gson g = new Gson();
	String jsonTotal = g.toJson(totalList);
	out.print(jsonTotal);
%>