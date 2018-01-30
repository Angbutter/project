<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="Mproject.mvc.BoardDao" %>
<%@ page import="java.util.Map, java.util.List" %>
<%@ page import="Mproject.util.KoreanConversion" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	String tr_no = request.getParameter("tr_no");
	String page2 = request.getParameter("page2");
	BoardDao boardDao = new BoardDao();
	List<Map<String,Object>> trBoardView = boardDao.trBoardView(tr_no);
	String mem_id = session.getAttribute("mem_id").toString();
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<title>�󼼺���</title>
<link rel="stylesheet" href="../css/font-awesome.min.css">
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
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
	$(document).ready(function(){
		
	});
	function cancel(){
		this.close();
	}
	function trUpd(){
		swal({
			  title: "���",
			  text: "�����Ͻðڽ��ϱ�?",
			  icon: "warning",
			  buttons: true,
			  dangerMode: true,
			})
			.then((willDelete) => {
			  if (willDelete) {/* Ȯ�� */
					$("#f_trUpd").attr("method","post");
					$("#f_trUpd").attr("action","./trUpd.do");
					$("#f_trUpd").submit();
			  } else { /* ��� */
			  
			  }
		});
	}
	function trDel(){
		swal({
			  title: "���",
			  text: "���� �����Ͻðڽ��ϱ�?",
			  icon: "warning",
			  buttons: true,
			  dangerMode: true,
			})
			.then((willDelete) => {
			  if (willDelete) {/* Ȯ�� */
				  $("#f_trUpd").attr("method","post");
				  $("#f_trUpd").attr("action","./trDel.do");
				  $("#f_trUpd").submit();
			  } else { /* ��� */
			    
			  }
		});
	}
	function trEnd(){
		swal({
			  title: "���",
			  text: "�ŷ��Ϸ� ó�� �Ͻðڽ��ϱ�?",
			  icon: "warning",
			  buttons: true,
			  dangerMode: true,
			})
			.then((willDelete) => {
			  if (willDelete) {/* Ȯ�� */
				  $("#f_trUpd").attr("method","post");
				  $("#f_trUpd").attr("action","./trEnd.do");
				  $("#f_trUpd").submit();
			  } else { /* ��� */
			    
			  }
		});
	}
</script>
</head>
<body>
	<!-- �ŷ��Խ��� �۾��� �� -->
	<div class="col-md-5" style="margin-top: 0%">
		<form id="f_trUpd" name="f_trUpd" method="post">
		<input type="hidden" name="tr_no" id="tr_no" value=<%=tr_no %>>
			<%
			if ( (KoreanConversion.toKor(mem_id)).equals(trBoardView.get(0).get("TR_ID")) && "N".equals(trBoardView.get(0).get("TR_YN"))) {
			%>
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
							<input class="form-control input" name="tr_id" id="tr_id" value="<%=trBoardView.get(0).get("TR_ID") %>" type="text" readonly>
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
							<input class="form-control input" name="tr_je" id="tr_je" value="<%=trBoardView.get(0).get("TR_JE") %>" type="text" autocomplete="off">
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
							<input class="form-control input" name="tr_pr" id="tr_pr"  value="<%=trBoardView.get(0).get("TR_PR") %>" type="text" autocomplete="off">
						</div>
					</td>
				</tr>
				<!-- ��ϴ�, �˴ϴ�. -->
				<tr>
					<td style="width:70px;height:20px;text-align:left;">
						<label style="margin-bottom:15px;"><font color="black">�ŷ�����</font></label>
					</td>
					<td colspan="2">
						<label style="margin-bottom:15px;"><font color="black">
						<% 
							if ("pap".equals(trBoardView.get(0).get("TR_GB"))){
						%>
							<select name="tr_option" id="tr_option" style="height:30px;color:black;" disabled>
							    <option value="pap" style="color:black;">�˴ϴ�</option>
	  						</select>
						<%
							}else{
						%>
							<select name="tr_option" id="tr_option" style="height:30px;color:black;" disabled>
							    <option value="sap" style="color:black;">��ϴ�</option>
	  						</select>
						<%
							}
						%>
						</font></label>
					</td>
				</tr>
				<!-- ������� -->
				<tr>
					<td style="width:70px;height:20px;text-align:left;">
						<label style="margin-bottom:15px;"><font color="black">����</font></label>
					</td>
					<td>
						<div class="img_wrap">
							<%
							if (trBoardView.get(0).get("TR_IM")!=null && trBoardView.get(0).get("TR_IM")!=""){
							%>
								<img id="img" src="../image/<%=trBoardView.get(0).get("TR_IM")%>" style="width:300px;height:200px;"/>
							<%
							}else{
							%>
								<img id="img" src="../image/noimage.jpg" style="width:300px;height:200px;"/>
							<%
							}
							%>
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
						<textarea style="height:200px;resize:none;" class="form-control col-sm-5" rows="5" id="tr_ne" name="tr_ne"><%=trBoardView.get(0).get("TR_NE")%></textarea>
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
						<button type="button" class="btn btn-default btn-sm cancle-button" style="margin-top:0px;margin-bottom:0px;" onClick="trUpd()">����</button>
					</td>
					<td>
						<button type="button" class="btn btn-default btn-sm cancle-button" style="margin-top:0px;margin-bottom:0px;" onClick="trDel()">����</button>
					</td>
					<td>
						<button type="button" class="btn btn-default btn-sm cancle-button" style="margin-top:0px;margin-bottom:0px;" onClick="trEnd()">�ŷ��Ϸ�</button>
					</td>
					<td>
						<button type="button" class="btn btn-default btn-sm cancle-button" style="margin-top:0px;margin-bottom:0px;" onClick="cancel()">���</button>
					</td>
				</tr>
			</table>
			<%
			}else if((KoreanConversion.toKor(mem_id)).equals(trBoardView.get(0).get("TR_ID")) && "Y".equals(trBoardView.get(0).get("TR_YN"))){
			%>
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
							<input class="form-control input" name="tr_id" id="tr_id" value="<%=trBoardView.get(0).get("TR_ID") %>" type="text" readonly>
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
							<input class="form-control input" name="tr_je" id="tr_je" value="<%=trBoardView.get(0).get("TR_JE") %>" type="text" readonly>
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
							<input class="form-control input" name="tr_pr" id="tr_pr"  value="<%=trBoardView.get(0).get("TR_PR") %>" type="text" readonly>
						</div>
					</td>
				</tr>
				<!-- ��ϴ�, �˴ϴ�. -->
				<tr>
					<td style="width:70px;height:20px;text-align:left;">
						<label style="margin-bottom:15px;"><font color="black">�ŷ�����</font></label>
					</td>
					<td colspan="2">
						<label style="margin-bottom:15px;"><font color="black">
						<% 
							if ("pap".equals(trBoardView.get(0).get("TR_GB"))){
						%>
							<select name="s" id="s" style="height:30px;color:black;" disabled>
							    <option value="pap" style="color:black;">�˴ϴ�</option>
	  						</select>
						<%
							}else{
						%>
							<select name="s" id="s" style="height:30px;color:black;" disabled>
							    <option value="sap" style="color:black;">��ϴ�</option>
	  						</select>
						<%
							}
						%>
						</font></label>
					</td>
				</tr>
				<!-- ������� -->
				<tr>
					<td style="width:70px;height:20px;text-align:left;">
						<label style="margin-bottom:15px;"><font color="black">����</font></label>
					</td>
					<td>
						<div class="img_wrap">
							<%
							if (trBoardView.get(0).get("TR_IM")!=null && trBoardView.get(0).get("TR_IM")!=""){
							%>
								<img id="img" src="../image/<%=trBoardView.get(0).get("TR_IM")%>" style="width:300px;height:200px;"/>
							<%
							}else{
							%>
								<img id="img" src="../image/noimage.jpg" style="width:300px;height:200px;"/>
							<%
							}
							%>
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
						<textarea style="height:200px;resize:none;" class="form-control col-sm-5" rows="5" id="tr_ne" name="tr_ne" readonly><%=trBoardView.get(0).get("TR_NE")%></textarea>
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
						<button type="button" class="btn btn-default btn-sm cancle-button" style="margin-top:0px;margin-bottom:0px;" onClick="trDel()">����</button>
					</td>
					<td>
						<button type="button" data-dismiss="modal" class="btn btn-default btn-sm cancle-button" style="margin-top:0px;margin-bottom:0px;" onClick="cancel()">Ȯ��</button>
					</td>
				</tr>
			</table>
			<%
			}else{
			%>
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
							<input class="form-control input" name="tr_id" id="tr_id" value="<%=trBoardView.get(0).get("TR_ID") %>" type="text" readonly>
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
							<input class="form-control input" name="tr_je" id="tr_je" value="<%=trBoardView.get(0).get("TR_JE") %>" type="text" readonly>
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
							<input class="form-control input" name="tr_pr" id="tr_pr"  value="<%=trBoardView.get(0).get("TR_PR") %>" type="text" readonly>
						</div>
					</td>
				</tr>
				<!-- ��ϴ�, �˴ϴ�. -->
				<tr>
					<td style="width:70px;height:20px;text-align:left;">
						<label style="margin-bottom:15px;"><font color="black">�ŷ�����</font></label>
					</td>
					<td colspan="2">
						<label style="margin-bottom:15px;"><font color="black">
						<% 
							if ("pap".equals(trBoardView.get(0).get("TR_GB"))){
						%>
							<select name="s" id="s" style="height:30px;color:black;" disabled>
							    <option value="pap" style="color:black;">�˴ϴ�</option>
	  						</select>
						<%
							}else{
						%>
							<select name="s" id="s" style="height:30px;color:black;" disabled>
							    <option value="sap" style="color:black;">��ϴ�</option>
	  						</select>
						<%
							}
						%>
						</font></label>
					</td>
				</tr>
				<!-- ������� -->
				<tr>
					<td style="width:70px;height:20px;text-align:left;">
						<label style="margin-bottom:15px;"><font color="black">����</font></label>
					</td>
					<td>
						<div class="img_wrap">
							<%
							if (trBoardView.get(0).get("TR_IM")!=null && trBoardView.get(0).get("TR_IM")!=""){
							%>
								<img id="img" src="../image/<%=trBoardView.get(0).get("TR_IM")%>" style="width:300px;height:200px;"/>
							<%
							}else{
							%>
								<img id="img" src="../image/noimage.jpg" style="width:300px;height:200px;"/>
							<%
							}
							%>
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
						<textarea style="height:200px;resize:none;" class="form-control col-sm-5" rows="5" id="tr_ne" name="tr_ne" readonly><%=trBoardView.get(0).get("TR_NE")%></textarea>
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
						<button type="button" data-dismiss="modal" class="btn btn-default btn-sm cancle-button" style="margin-top:0px;margin-bottom:0px;" onClick="cancel()">Ȯ��</button>
					</td>
				</tr>
			</table>
			<%
			}
			%>
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