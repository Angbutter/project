<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<html>
<head>
<jsp:include page="../common/commonEasyUI.jsp" flush="false"/>
<script type="text/javascript">
	$(document).ready(function(){
		$.messager.alert({
			title: '알림',
			msg: '입력한 이메일로 임시 비밀번호 전송!',
			fn: function(){
				location.href="./loginForm.jsp";
			}
		});
	});
</script>
</head>