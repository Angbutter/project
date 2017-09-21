<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<head>
<jsp:include page="../common/commonEasyUI.jsp" flush="false"/>
<script type="text/javascript">
	$(document).ready(function(){
		$.messager.alert({
			title: '알림',
			msg: '쪽지 전송 완료!',
			fn: function(){
				window.close();
			}
		});
	});
</script>
</head>