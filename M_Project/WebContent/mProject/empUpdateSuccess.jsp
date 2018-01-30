<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>정보 수정</title>
<script type="text/javascript" src="../js/jquery-1.11.1.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
</head>
<body>
<script type="text/javascript">
	swal({
	  title: "알림",
	  text: "정보 변경 성공! 변경된 정보로 다시 로그인하세요.",
	  icon: "success",
	  button: "확인"
	}).then((value)=>{
		opener.parent.location.href="./logout.jsp"; // 팝업창 닫으면서 부모창 새로고침
		window.close();
	});
</script>
</body>
</html>