<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>��й�ȣ ã��</title>
<script type="text/javascript" src="../js/jquery-1.11.1.js"></script>
<script type="text/javascript" src="../js/bootstrap.js"></script>
<script type="text/javascript" src="../js/bootstrap.min.js"></script>
<script type="text/javascript" src="../js/bootstrap-dialog.js"></script>
<script type="text/javascript" src="../js/bootstrap-dialog.min.js"></script>
<link rel="stylesheet" href="../css/bootstrap-dialog.min.css">
<link rel="stylesheet" href="../css/bootstrap-dialog.css">
<link rel="stylesheet" href="../css/bootstrap.css">
<link rel="stylesheet" href="../css/bootstrap.min.css">
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
</head>
<body>
<script type="text/javascript">
	swal({
	  title: "�˸�",
	  text: "��ϵ��� ���� �̸����Դϴ�.",
	  icon: "error",
	  button: "Ȯ��"
	}).then((value)=>{
		location.href="./loginForm.jsp";
	});
</script>
</body>
</html>