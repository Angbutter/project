<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<head>
<jsp:include page="../common/commonEasyUI.jsp" flush="false"/>
<script type="text/javascript">
	$(document).ready(function(){
		$.messager.alert({
			title: '�˸�',
			msg: '�Է��� ��й�ȣ�� Ʋ���ϴ�.',
			fn: function(){
				location.href="./index.jsp?gugu=board";
			}
		});
	});
</script>
</head>