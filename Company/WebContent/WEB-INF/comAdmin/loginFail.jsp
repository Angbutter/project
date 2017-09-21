<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<html>
<head>
<jsp:include page="../common/commonEasyUI.jsp" flush="false"/>
<script type="text/javascript">
	$(document).ready(function(){
		$.messager.alert({
			title: '경고',
			msg: '아이디와 비밀번호를 확인하세요.',
			fn: function(){
				location.href="./loginForm.jsp";
			}
		});
	});
</script>
</head>