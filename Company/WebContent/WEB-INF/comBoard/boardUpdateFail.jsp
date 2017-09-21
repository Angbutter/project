<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<head>
<jsp:include page="../common/commonEasyUI.jsp" flush="false"/>
<script type="text/javascript">
	$(document).ready(function(){
		$.messager.alert({
			title: '알림',
			msg: '입력한 비밀번호가 틀립니다.',
			fn: function(){
				location.href="./index.jsp?gugu=board";
			}
		});
	});
</script>
</head>