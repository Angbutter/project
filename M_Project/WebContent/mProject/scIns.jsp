<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
 	String ym = request.getParameter("ym");
	String mem_no = request.getParameter("mem_no");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<title>일정 추가하기</title>
<link rel="stylesheet" href="../css/font-awesome.min.css">
<link href='https://fonts.googleapis.com/css?family=Passion+One' rel='stylesheet' type='text/css'>
<link href='https://fonts.googleapis.com/css?family=Oxygen'	rel='stylesheet' type='text/css'>
<link href="../css/bootstrap.min.css" rel="stylesheet" media="screen">
<link href="../css/font-awesome.min.css" rel="stylesheet">
<link href="../font/icon-7-stroke/css/pe-icon-7-stroke.css"	rel="stylesheet">
<link href="../css/animate.css" rel="stylesheet" media="screen">
<link href="../css/owl.theme.css" rel="stylesheet">
<link href="../css/owl.carousel.css" rel="stylesheet">
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script type="text/javascript" src="../js/jquery-1.11.1.js"></script>
<!-- 컬러 -->
<link href="../css/css-index.css" rel="stylesheet" media="screen">
<script type="text/javascript">
	function scInsCancel(){
		$("#sc_ne").val("");
		$("#sc_je").val("");
		window.close();
	}
	function sc_ins(){
		$("#f_scIns").attr("method","post");
		$("#f_scIns").attr("action","./scIns.do");
		$("#f_scIns").submit();
	}
	$(document).ready(function(){
		$("#sc_ne").keyup(function(){
			var temp = $(this).val();
			var templen = temp.length;
			if ( templen > 200 ){
				swal({
					  title: "알림",
					  text: "200글자까지 입력할 수 있습니다.",
					  icon: "warning",
					  button: "확인"
					});
				$('#sc_ne').val(temp.substring(0,200));
			}
		});
	})
</script>
</head>
<body>
	<div class="col-md-5" style="margin-top: 0%" id="insert">
		<form id="f_scIns" name="f_scIns" method="post">
			<input type="hidden" id="mem_no" name="mem_no" value="<%=mem_no %>"/>
			<table>
				<tr>
					<td>
						<br>
					</td>
				</tr>
				<!-- 등록자 -->
				<tr>
					<td style="width:70px;height:20px;text-align:left;">
						<label style="margin-bottom:15px;"><font color="black">날짜</font></label>
					</td>
					<td style="width:500px;height:20px;">
						<div class="form-group">
							<input class="form-control input" autocomplete="off" name="sc_de" id="sc_de" value="<%=ym %>" type="text" readonly>
						</div>
					</td>
				</tr>
				<!-- 제목 -->
				<tr>
					<td style="width:70px;height:20px;text-align:left;">
						<label style="margin-bottom:15px;"><font color="black">제목</font></label>
					</td>
					<td style="width:500px;height:20px;">
						<div class="form-group">
							<input class="form-control input" autocomplete="off" name="sc_je" id="sc_je" type="text" required>
						</div>
					</td>
				</tr>
				<tr>
					<td style="width:70px;height:20px;text-align:left;">
						<label style="margin-bottom:15px;"><font color="black">내용</font></label>
					</td>
					<td>
						<textarea style="height:200px;resize:none;" class="form-control col-sm-5" rows="5" id="sc_ne" name="sc_ne"></textarea>
					</td>
				</tr>
				<tr>
					<td>
						<br>
					</td>
				</tr>
			</table>
			<table align="center">
				<tr>
					<td>
						<button type="button" data-dismiss="modal" class="btn btn-default btn-sm cancle-button" style="margin-top:0px;margin-bottom:0px;" onClick="sc_ins()">확인</button>
					</td>
					<td>
						<button type="button" data-dismiss="modal" class="btn btn-default btn-sm cancle-button" style="margin-top:0px;margin-bottom:0px;" onClick="scInsCancel()">취소</button>
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>