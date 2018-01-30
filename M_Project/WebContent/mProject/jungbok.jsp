<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="Mproject.mvc.signupDao" %>
<%@ page import="java.net.URLDecoder" %>
<%
	String mem_id = URLDecoder.decode(request.getParameter("mem_id"),"UTF-8");
	signupDao signupdao = new signupDao();
	String jung = signupdao.jungbok(mem_id);
	if ( jung != null || "".equals(mem_id) ){
		jung = "N";
		out.print(jung);
	}
	else{
		jung = "Y";
		out.print(jung);
	}
%>