<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="Mproject.util.KoreanConversion" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	String mem_id = session.getAttribute("mem_id").toString();
	//String tr_id = "mkh";
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<title>�ŷ��Խ��� �۾���</title>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<link rel="stylesheet" href="../css/font-awesome.min.css">
<link href='https://fonts.googleapis.com/css?family=Passion+One' rel='stylesheet' type='text/css'>
<link href='https://fonts.googleapis.com/css?family=Oxygen'	rel='stylesheet' type='text/css'>
<link href="../css/bootstrap.min.css" rel="stylesheet" media="screen">
<link href="../css/font-awesome.min.css" rel="stylesheet">
<link href="../font/icon-7-stroke/css/pe-icon-7-stroke.css"	rel="stylesheet">
<link href="../css/animate.css" rel="stylesheet" media="screen">
<link href="../css/owl.theme.css" rel="stylesheet">
<link href="../css/owl.carousel.css" rel="stylesheet">
<script type="text/javascript" src="../js/jquery-1.11.1.js"></script>
<!-- �÷� -->
<link href="../css/css-index.css" rel="stylesheet" media="screen">
<style type="text/css">
	.img_wrap {
	    width: 250px;
	    margin-top: 10px;
	}
	.img_wrap img {
	    max-width: 100%;
	}
</style>
<script type="text/javascript">
	var sel_file;
	$(document).ready(function(){
		$("#tr_im").on("change", handleImgFileSelect);
	});
	function cancel(){
		this.close();
	}
	function tr_insert(){
		$("#f_tr_insert").attr("method","post");
		$("#f_tr_insert").attr("action","./trInsert.do");
		$("#f_tr_insert").submit();
	}
	function handleImgFileSelect(e) {
        var files = e.target.files;
        var filesArr = Array.prototype.slice.call(files);

        filesArr.forEach(function(f) {
            if(!f.type.match("image.*")) {
                swal({
                	  title: "�˸�",
                	  text: "Ȯ���ڴ� �̹��� Ȯ���ڸ� �����մϴ�.",
                	  icon: "error",
                	  button: "Ȯ��"
                	}).then((value)=>{
                		return;
                });
            }

            sel_file = f;

            var reader = new FileReader();
            reader.onload = function(e) {
                $("#img").attr("src", e.target.result);
            }
            reader.readAsDataURL(f);
        });
    }
</script>
</head>
<body>
	<!-- �����Խ��� �۾��� �� -->
	<div class="col-md-5" style="margin-top: 0%">
		<form id="f_tr_insert" name="f_tr_insert" method="post" enctype="multipart/form-data">
			<table>
				<tr>
					<td>
						<br>
					</td>
				</tr>
				<!-- ����� -->
				<tr>
					<td style="width:70px;height:20px;text-align:left;">
						<label style="margin-bottom:15px;"><font color="black">�����</font></label>
					</td>
					<td style="width:500px;height:20px;">
						<div class="form-group">
							<input class="form-control input" autocomplete="off" name="tr_id" id="tr_id" value="<%=KoreanConversion.toKor(mem_id) %>" type="text" readonly>
						</div>
					</td>
				</tr>
				<!-- ���� -->
				<tr>
					<td style="width:70px;height:20px;text-align:left;">
						<label style="margin-bottom:15px;"><font color="black">����</font></label>
					</td>
					<td style="width:500px;height:20px;">
						<div class="form-group">
							<input class="form-control input" autocomplete="off" name="tr_je" id="tr_je" type="text" required>
						</div>
					</td>
				</tr>
				<!-- ���� -->
				<tr>
					<td style="width:70px;height:20px;text-align:left;">
						<label style="margin-bottom:15px;"><font color="black">����</font></label>
					</td>
					<td style="width:500px;height:20px;">
						<div class="form-group">
							<input class="form-control input" autocomplete="off" name="tr_pr" id="tr_pr" type="text" required>
						</div>
					</td>
				</tr>
				<!-- ��ϴ�, �˴ϴ�. -->
				<tr>
					<td style="width:70px;height:20px;text-align:left;">
						<label style="margin-bottom:15px;"><font color="black">�ŷ�����</font></label>
					</td>
					<td colspan="2">
						<div class="form-group">
							<select name="sp_option" id="sp_option" style="height:30px;color:black;">
							    <option value="pap" style="color:black;">�˴ϴ�</option>
							    <option value="sap" style="color:black;">��ϴ�</option>
	  						</select>
  						</div>
					</td>
				</tr>
				<!-- ������� -->
				<tr>
					<td style="width:70px;height:20px;text-align:left;">
						<label style="margin-bottom:15px;"><font color="black">����</font></label>
					</td>
					<td>
						<input type="file" value="����÷��" id="tr_im" name="tr_im" style="margin-bottom:15px">
					</form>
					</td>
				</tr>
				<!-- ���� �̸����� -->
				<tr>
					<td style="width:70px;height:20px;text-align:left;">
						<label style="margin-bottom:15px;"><font color="white">����</font></label>
					</td>
					<td>
						<div class="img_wrap" style="width:300px;height:200px;">
							<img id="img" style="width:300px;height:200px;"/>
						</div>
					</td>
				</tr>
				<tr>
					<td>&nbsp;
					</td>
				</tr>
				<tr>
					<td style="width:70px;height:20px;text-align:left;">
						<label style="margin-bottom:15px;"><font color="black">����</font></label>
					</td>
					<td>
						<textarea style="height:200px;resize:none;" class="form-control col-sm-5" rows="5" id="tr_ne" name="tr_ne"></textarea>
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
						<button type="button" data-dismiss="modal" class="btn btn-default btn-sm cancle-button" style="margin-top:0px;margin-bottom:0px;" onClick="tr_insert()">Ȯ��</button>
					</td>
					<td>
						<button type="button" data-dismiss="modal" class="btn btn-default btn-sm cancle-button" style="margin-top:0px;margin-bottom:0px;" onClick="cancel()">���</button>
					</td>
				</tr>
			</table>
		</form>
	</div>
	<script src="../js/jquery.js"></script>
	<script type="text/javascript" src="../js/bootstrap.js"></script>
	<script src="../js/bootstrap.min.js"></script>
	<script src="../js/custom.js"></script>
	<script src="../js/jquery.sticky.js"></script>
	<script src="../js/wow.min.js"></script>
	<script src="../js/owl.carousel.min.js"></script>
</body>
</html>