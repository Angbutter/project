<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<head>
<jsp:include page="../common/commonEasyUI.jsp" flush="false"/>
<script type="text/javascript">
	$(document).ready(function(){
		$.messager.alert({
			title: '알림',
			msg: '삭제 실패!',
			fn: function(){
				location.href="./getCalList.do";
			}
		});
	});
</script>
</head>