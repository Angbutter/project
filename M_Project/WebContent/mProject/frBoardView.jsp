<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="Mproject.mvc.BoardDao" %>
<%@ page import="java.util.Map, java.util.List" %>
<%@ page import="Mproject.util.KoreanConversion" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	String fr_no = request.getParameter("fr_no");
	String page2 = request.getParameter("page2");
	BoardDao boardDao = new BoardDao();
	List<Map<String,Object>> frBoardView = boardDao.frBoardView(fr_no); 
	String mem_id = session.getAttribute("mem_id").toString();
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<title>상세보기</title>
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
<!-- 컬러 -->
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
		
	});
	function cancel(){
		this.close();
	}
	function frUpd(){
		swal({
			  title: "경고",
			  text: "수정하시겠습니까?",
			  icon: "warning",
			  buttons: true,
			  dangerMode: true,
			})
			.then((willDelete) => {
			  if (willDelete) {/* 확인 */
					$("#f_frUpd").attr("method","post");
					$("#f_frUpd").attr("action","./frUpd.do");
					$("#f_frUpd").submit();
			  } else { /* 취소 */
			    
			  }
		});
	}
	function frDel(){
		swal({
			  title: "경고",
			  text: "정말 삭제하시겠습니까?",
			  icon: "warning",
			  buttons: true,
			  dangerMode: true,
			})
			.then((willDelete) => {
			  if (willDelete) {/* 확인 */
				  $("#f_frUpd").attr("method","post");
				  $("#f_frUpd").attr("action","./frDel.do");
				  $("#f_frUpd").submit();
			  } else { /* 취소 */
			    
			  }
		});
	}
</script>
</head>
<body>
	<!-- 로그인폼 -->
	<div class="col-md-5" style="margin-top: 0%">
		<form id="f_frUpd" name="f_frUpd" method="post">
		<input type="hidden" name="fr_no" id="fr_no" value="<%=fr_no%>">
			<%
			if ((KoreanConversion.toKor(mem_id)).equals(frBoardView.get(0).get("FR_ID"))){
			%>
			<table>
				<tr>
					<td>
						<br>
					</td>
				</tr>
				<!-- 등록자 -->
				<tr>
					<td style="width:70px;height:20px;text-align:left;">
						<label style="margin-bottom:15px;"><font color="black">등록자</font></label>
					</td>
					<td style="width:500px;height:20px;">
						<div class="form-group">
							<input class="form-control input" name="fr_id" id="fr_id" value="<%=frBoardView.get(0).get("FR_ID") %>" type="text" readonly >
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
							<input class="form-control input" name="fr_je" id="fr_je" value="<%=frBoardView.get(0).get("FR_JE") %>" type="text" autocomplete="off">
						</div>
					</td>
				</tr>
				<!-- 사진등록 -->
				<tr>
					<td style="width:70px;height:20px;text-align:left;">
						<label style="margin-bottom:15px;"><font color="black">사진</font></label>
					</td>
					<td>
						<div class="img_wrap">
							<%
							if (frBoardView.get(0).get("FR_IM")!=null && frBoardView.get(0).get("FR_IM")!=""){
							%>
								<img id="img" src="../image/<%=frBoardView.get(0).get("FR_IM")%>" style="width:300px;height:200px;"/>
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
						<label style="margin-bottom:15px;"><font color="black">내용</font></label>
					</td>
					<td>
						<textarea style="height:200px;resize:none;" class="form-control col-sm-5" rows="5" id="fr_ne" name="fr_ne" autocomplete="off"><%=frBoardView.get(0).get("FR_NE")%></textarea>
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
						<button type="button" data-dismiss="modal" class="btn btn-default btn-sm cancle-button" style="margin-top:0px;margin-bottom:0px;" onClick="frUpd()">수정</button>
					</td>
					<td>
						<button type="button" data-dismiss="modal" class="btn btn-default btn-sm cancle-button" style="margin-top:0px;margin-bottom:0px;" onClick="frDel()">삭제</button>
					</td>
					<td>
						<button type="button" data-dismiss="modal" class="btn btn-default btn-sm cancle-button" style="margin-top:0px;margin-bottom:0px;" onClick="cancel()">확인</button>
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
			<!-- 등록자 -->
				<tr>
					<td style="width:70px;height:20px;text-align:left;">
						<label style="margin-bottom:15px;"><font color="black">등록자</font></label>
					</td>
					<td style="width:500px;height:20px;">
						<div class="form-group">
							<input class="form-control input" name="fr_id" id="fr_id" value="<%=frBoardView.get(0).get("FR_ID") %>" type="text" readonly>
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
							<input class="form-control input" name="fr_je" id="fr_je" value="<%=frBoardView.get(0).get("FR_JE") %>" type="text" readonly>
						</div>
					</td>
				</tr>
				<!-- 사진등록 -->
				<tr>
					<td style="width:70px;height:20px;text-align:left;">
						<label style="margin-bottom:15px;"><font color="black">사진</font></label>
					</td>
					<td>
						<div class="img_wrap">
							<%
							if (frBoardView.get(0).get("FR_IM")!=null && frBoardView.get(0).get("FR_IM")!=""){
							%>
								<img id="img" src="../image/<%=frBoardView.get(0).get("FR_IM")%>" style="width:300px;height:200px;"/>
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
						<label style="margin-bottom:15px;"><font color="black">내용</font></label>
					</td>
					<td>
						<textarea style="height:200px;resize:none;" class="form-control col-sm-5" rows="5" id="fr_ne" name="fr_ne" readonly><%=frBoardView.get(0).get("FR_NE")%></textarea>
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
						<button type="button" data-dismiss="modal" class="btn btn-default btn-sm cancle-button" style="margin-top:0px;margin-bottom:0px;" onClick="cancel()">확인</button>
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