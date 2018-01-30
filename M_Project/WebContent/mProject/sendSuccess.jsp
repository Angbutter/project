<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>전송</title>
<script type="text/javascript" src="../js/jquery-1.11.1.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
</head>
<body>
<script type="text/javascript">
	swal({
	  title: "알림",
	  text: "이메일로 임시 비밀번호 발송!",
	  icon: "success",
	  button: "확인"
	}).then((value)=>{
		location.href="./loginForm.jsp";
	});
</script>
</body>
</html>