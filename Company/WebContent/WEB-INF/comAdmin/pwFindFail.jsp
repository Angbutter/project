<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<html>
<head>
<jsp:include page="../common/commonEasyUI.jsp" flush="false"/>
<script type="text/javascript">
	$(document).ready(function(){
		$.messager.alert({
			title: '경고',
			msg: '이메일을 확인해주세요.',
			fn: function(){
				location.href="./loginForm.jsp";
			}
		});
	});
</script>
</head>