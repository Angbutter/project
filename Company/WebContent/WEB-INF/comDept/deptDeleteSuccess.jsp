<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<html>
<head>
<jsp:include page="../common/commonEasyUI.jsp" flush="false"/>
<script type="text/javascript">
	$(document).ready(function(){
		$.messager.alert({
			title: '�˸�',
			msg: '���� ����!',
			fn: function(){
				location.href="./adminMain.jsp?gubun=dept";
			}
		});
	});
</script>
</head>