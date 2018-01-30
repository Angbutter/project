<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="Mproject.util.KoreanConversion" %>
<html>
<head>
<!-- �׽�Ʈ -->
<!-- ȸ������ CSS -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="../css/font-awesome.min.css">
<link href='https://fonts.googleapis.com/css?family=Passion+One' rel='stylesheet' type='text/css'>
<link href='https://fonts.googleapis.com/css?family=Oxygen'	rel='stylesheet' type='text/css'>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<!-- Ÿ��Ʋ -->
<title>�߰���</title>
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<!-- CSS ������ -->
<link href="../css/bootstrap.min.css" rel="stylesheet" media="screen">
<link href="../css/font-awesome.min.css" rel="stylesheet">
<link href="../font/icon-7-stroke/css/pe-icon-7-stroke.css" rel="stylesheet">
<link href="../css/animate.css" rel="stylesheet" media="screen">
<link href="../css/owl.theme.css" rel="stylesheet">
<link href="../css/owl.carousel.css" rel="stylesheet">
<script type="text/javascript" src="../js/jquery-1.11.1.js"></script>
<!-- �÷� -->
<link href="../css/css-index.css" rel="stylesheet" media="screen">

<!-- ���� ��Ʈ -->
<link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Lato:100,300,400,700,900,100italic,300italic,400italic,700italic,900italic" />
<script type="text/javascript">
	// â����
	var yn="CN";
	$(document).ready(function() {
		$("#dlg_signUp").on('hide.bs.modal',function(){
			signupCancel();
		});
		$("#dlg_sign").on('hide.bs.modal',function(){
			$("#find_email").val("");
		});
		$('.line').click(function() {
			$("#dlg_signUp").modal('show');
		});
		//��й�ȣã��
		$('.linee').click(function() {
			$("#dlg_sign").modal('show');
		});
		$("#signup_mem_pw").keyup(function (){
			if ($("signup_mem_pw").val() != "" && $("#signup_mem_pw2").val() != "" && $("#signup_mem_pw").val()!=null && $("#signup_mem_pw2").val()!=null && $("#signup_mem_pw").val()==$("#signup_mem_pw2").val()){
				$("#d_msg").css("color","white").text("��й�ȣ�� Ȯ�εǾ����ϴ�.");	
			}
			else if ($("signup_mem_pw2").val() == "" || $("signup_mem_pw2").val() == null){
				$("#d_msg").css("color","red").text("��й�ȣ�� Ȯ���ϼ���.");	
			}
			else {
				$("#d_msg").css("color","red").text("��й�ȣ�� Ȯ���ϼ���.");	
			}
		});   
		$("#signup_mem_pw2").keyup(function(){
			if ($("signup_mem_pw").val() != "" && $("#signup_mem_pw2").val() != "" && $("#signup_mem_pw").val()!=null && $("#signup_mem_pw2").val()!=null && $("#signup_mem_pw").val()==$("#signup_mem_pw2").val()){
				$("#d_msg").css("color","white").text("��й�ȣ�� Ȯ�εǾ����ϴ�.");	
			}
			else if ($("signup_mem_pw2").val() == "" || $("signup_mem_pw2").val() == null){
				$("#d_msg").css("color","red").text("��й�ȣ�� Ȯ���ϼ���.");	
			}
			else {
				$("#d_msg").css("color","red").text("��й�ȣ�� Ȯ���ϼ���.");	
			}
		});
		$("#signup_mem_te1").keyup(function(){
	 		var temp = $(this).val();
			var templen = temp.length;
			if(templen>3){
				$('#signup_mem_te1').val(temp.substring(0,3));
			}
		});
		$("#signup_mem_te2").keyup(function(){
	 		var temp = $(this).val();
			var templen = temp.length;
			if(templen>4){
				$('#signup_mem_te2').val(temp.substring(0,4));
			}  
		});
		$("#signup_mem_te3").keyup(function(){
	 		var temp = $(this).val();
			var templen = temp.length;
			if(templen>4){
				$('#signup_mem_te3').val(temp.substring(0,4));
			}  
		});
	});
	function login() {
		$("#f_login").attr("method", "post");
		$("#f_login").attr("action", "./login.do");
		$("#f_login").submit();
	}
	function pwFind() {
		$("#f_pw").attr("method", "post");
		$("#f_pw").attr("action", "./pwFind.do");
		$("#f_pw").submit();
	}
	
	function jungbok(){
		if ( $("#signup_mem_id").val() == "" || $("#signup_mem_id").val() == null){
			swal({
				  title: "�˸�",
				  text: "���̵� �Է����ּ���.",
				  icon: "error",
				  button: "Ȯ��"
				}).then((value)=>{
					return;
				});
		}
		$.ajax({
			method : "GET", //���۹�� ( get��� or post ��� )
			url : "./jungbok.jsp?mem_id="+ encodeURI(encodeURIComponent($("#signup_mem_id").val())), //��ûó���� ����� ������ - url ( xx.jsp , xx.html, xx.xml, xx.json)
			dataType : "html", // ( html, xml, json, text )
			success : function(data) {
				if($.trim(data)=="Y"){   
					yn="Y";
					swal({
						  title: "�˸�",
						  text: "���� ����!",
						  icon: "success",
						  button: "Ȯ��"
						}).then((value)=>{
							return;
						});
				}else{
					yn="N";
					swal({
						  title: "�˸�",
						  text: "�ߺ��� ���̵� �Դϴ�.",
						  icon: "error",
						  button: "Ȯ��"
						}).then((value)=>{
							return;
						});
				}
			}
		});
	}
	function signupCancel(){
		$("#signup_mem_id").val("");
		$("#signup_mem_pw").val("");
		$("#signup_mem_pw2").val("");
		$("#signup_mem_te1").val("");
		$("#signup_mem_te2").val("");
		$("#signup_mem_te3").val("");
		$("#signup_mem_nm").val("");
		$("#signup_mem_nn").val("");
		$("#signup_mem_em").val("");
		$("#d_msg").text("");
	}
	function signUpOk(){
		if ( $("#signup_mem_id").val()  == ""
		  || $("#signup_mem_pw").val()  == ""
		  || $("#signup_mem_pw2").val() == ""
		  || $("#signup_mem_te1").val() == ""
		  || $("#signup_mem_te2").val() == ""
		  || $("#signup_mem_te3").val() == ""
		  || $("#signup_mem_nn").val()  == ""
		  || $("#signup_mem_nm").val()  == ""
		  || $("#signup_mem_em").val()  == "" ){
			swal({
				  title: "�˸�",
				  text: "��� ������ �Է��ϼ���.",
				  icon: "error",
				  button: "Ȯ��"
				}).then((value)=>{ 
					return;
				});
	        return;
		}
		if ( $("#signup_mem_pw").val() != $("#signup_mem_pw2").val() ){
			swal({
				  title: "�˸�",
				  text: "��й�ȣ�� �ٸ��ϴ�.",
				  icon: "error",
				  button: "Ȯ��"
				}).then((value)=>{
					return;
				});
			return;
		}
		if(yn=="Y"){
	 		$("#f_signUp").attr("method","post");
			$("#f_signUp").attr("action","./signup.do");
			$("#f_signUp").submit();
		}
		else {
			swal({
				  title: "�˸�",
				  text: "���̵� Ȯ�����ּ���.",
				  icon: "error",
				  button: "Ȯ��"
				}).then((value)=>{
					return;
				});
			return;
		}
	}
</script>
<style type="text/css">
/* Circle Text Styles */
#outerCircleText {
/* Optional - DO NOT SET FONT-SIZE HERE, SET IT IN THE SCRIPT */
font-style: italic;
font-weight: bold;
font-family: verdana;
color: #FFF;
/* End Optional */

/* Start Required - Do Not Edit */
position: absolute;top: 0;left: 0;z-index: 3000;cursor: default;}
#outerCircleText div {position: relative;}
#outerCircleText div div {position: absolute;top: 0;left: 0;text-align: center;}
</style>
</head>

<body data-spy="scroll" data-target="#navbar-scroll">

<script type="text/javascript">

;(function(){

//�޼��� �Է�
var msg = "Welcome to �߰���";

var size = 22;

var circleY = 0.75; var circleX = 2;

var letter_spacing = 5;

var diameter = 10;

var rotation = 0.4;

var speed = 0.3;

if (!window.addEventListener && !window.attachEvent || !document.createElement) return;

msg = msg.split('');
var n = msg.length - 1, a = Math.round(size * diameter * 0.208333), currStep = 20,
ymouse = a * circleY + 20, xmouse = a * circleX + 20, y = [], x = [], Y = [], X = [],
o = document.createElement('div'), oi = document.createElement('div'),
b = document.compatMode && document.compatMode != "BackCompat"? document.documentElement : document.body,

mouse = function(e){
 e = e || window.event;
 ymouse = !isNaN(e.pageY)? e.pageY : e.clientY; // y-position
 xmouse = !isNaN(e.pageX)? e.pageX : e.clientX; // x-position
},

makecircle = function(){ // rotation/positioning
 if(init.nopy){
  o.style.top = (b || document.body).scrollTop + 'px';
  o.style.left = (b || document.body).scrollLeft + 'px';
 };
 currStep -= rotation;
 for (var d, i = n; i > -1; --i){ // makes the circle
  d = document.getElementById('iemsg' + i).style;
  d.top = Math.round(y[i] + a * Math.sin((currStep + i) / letter_spacing) * circleY - 15) + 'px';
  d.left = Math.round(x[i] + a * Math.cos((currStep + i) / letter_spacing) * circleX) + 'px';
 };
},

drag = function(){ // makes the resistance
 y[0] = Y[0] += (ymouse - Y[0]) * speed;
 x[0] = X[0] += (xmouse - 20 - X[0]) * speed;
 for (var i = n; i > 0; --i){
  y[i] = Y[i] += (y[i-1] - Y[i]) * speed;
  x[i] = X[i] += (x[i-1] - X[i]) * speed;
 };
 makecircle();
},

init = function(){ // appends message divs, & sets initial values for positioning arrays
 if(!isNaN(window.pageYOffset)){
  ymouse += window.pageYOffset;
  xmouse += window.pageXOffset;
 } else init.nopy = true;
 for (var d, i = n; i > -1; --i){
  d = document.createElement('div'); d.id = 'iemsg' + i;
  d.style.height = d.style.width = a + 'px';
  d.appendChild(document.createTextNode(msg[i]));
  oi.appendChild(d); y[i] = x[i] = Y[i] = X[i] = 0;
 };
 o.appendChild(oi); document.body.appendChild(o);
 setInterval(drag, 25);
},

ascroll = function(){
 ymouse += window.pageYOffset;
 xmouse += window.pageXOffset;
 window.removeEventListener('scroll', ascroll, false);
};

o.id = 'outerCircleText'; o.style.fontSize = size + 'px';

if (window.addEventListener){
 window.addEventListener('load', init, false);
 document.addEventListener('mouseover', mouse, false);
 document.addEventListener('mousemove', mouse, false);
  if (/Apple/.test(navigator.vendor))
   window.addEventListener('scroll', ascroll, false);
}
else if (window.attachEvent){
 window.attachEvent('onload', init);
 document.attachEvent('onmousemove', mouse);
};

})();

</script>


	<!-- /.preloader -->
	<div id="preloader"></div>
	<div id="top"></div>
	<!-- �α��� ȭ�� �̹��� �ֱ� -->
	<div class="fullscreen landing parallax" style="background-image: url('../image/background.jpg');" data-img-width="2000" data-img-height="1333" data-diff="100">
		<div class="overlay">
		<!-- <div class="overlay" style="height:0px"> -->
			<div class="container">
				<div class="row">
					<div class="col-md-7">
						<!-- /.logo -->
						<div class="logo wow fadeInDown" style="margin-top: 25%">
							<a href=""></a>
						</div>
						<br>
						<br>
						<br>
						<br>
						<!-- ����ȭ�� -->
						<h1 class="wow fadeInLeft">
							<I> <b>�߰���</b>
							</I>
						</h1>
						<!-- �Ұ��� -->
						<div class="landing-text wow fadeInUp">
							<p>ȯ���մϴ�.</p>
							<p>������ �߰�ŷ� ����Ʈ �Դϴ�.</p>
						</div>
					</div>
					<br>
					<br>
					<br>
					<br>
					<!-- �α����� -->
					<div class="col-md-5" style="margin-top: 0%">
						<div class="signup-header wow fadeInUp">
							<h3 class="form-title text-center">
								<B>Welcome</B>
							</h3>
							<form id="f_login" name="f_login">
								<input type="hidden" name="command" value="loginCheck">
								<div class="form-group">
									<input class="form-control input-lg" autocomplete="off"	name="mem_id" id="mem_id" type="text" placeholder="���̵�" required>
									<!-- autocomplete="off" �ڵ��ϼ� ���� -->
								</div>
								<div class="form-group">
									<input class="form-control input-lg" name="mem_pw" id="mem_pw" type="password" placeholder="��й�ȣ" required>
								</div>
								<div class="form-group last">
									<input type="button" id="btn_login" class="btn-primary btn-block btn-lg" onclick="login()" value="�α���">
								</div>
								<p class="privacy text-center">
									<a class="line" data-toggle="modal" data-target="#dlg-signUp" href="#dlg_signUp">ȸ������</a>
								</p>
								<p class="privacy text-center">
									<a class="linee" data-toggle="modal" data-target="#dlg-sign"   href="#dlg_sign">��й�ȣã��</a>
								</p>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- ȸ������â -->
	<div id="dlg_signUp" class="modal fade" tabindex="-1" role="dialog"	aria-hiddem="true">
		<div class="modal-dialog main-login main-center" role="document">
			<div class="modal-body">
				<div class="row" style="width:500px;">
					<!-- form ���� -->
					<form id="f_signUp" name="f_signUp" class="form-horizontal">
						<!-- �̸��� -->
						<label for="name" class="cols-sm-2 control-label"><font color="white"><i>ȸ������</i></font></label>
						<div class="cols-sm-10">
							<div class="input-group">
								<table width="100%">
								<tr>
									<td width="115px">
										<label><font color="white">���̵�</font><font color="red">*</font></label>
									</td>
									<td>
										<input type="text" class="form-control" name="signup_mem_id"  id="signup_mem_id" autocomplete="off" placeholder="���̵�"/>
									</td>
									<td>
										<button type="button" onClick="jungbok()" style="width:100px;height:35px"><font size="2">�ߺ�Ȯ��</font></button>
									</td>
								</tr>
								</table>
							</div>
						</div>
						<br>
						<div class="cols-sm-10">
							<div class="input-group">
								<table width="100%">
								<tr>
									<td width="115px">
										<label><font color="white">��й�ȣ</font><font color="red">*</font></label>
									</td>
									<td>
										<input type="password"	class="form-control" name="signup_mem_pw"  id="signup_mem_pw" autocomplete="off" placeholder="��й�ȣ" />
									</td>
								</tr>
								</table>
							</div>
						</div>
						<br>
						<div class="cols-sm-10">
							<div class="input-group">
								<table width="100%">
								<tr>
									<td width="115px">
										<label><font color="white">��й�ȣȮ��</font><font color="red">*</font></label>
									</td>
									<td>
										<input type="password"	class="form-control" name="signup_mem_pw2"  id="signup_mem_pw2" autocomplete="off" placeholder="��й�ȣȮ��" />
									</td>
								</tr>
								</table>
							</div>
							<div id="d_msg"></div>
						</div>
						<br>
						<div class="cols-sm-10">
							<div class="input-group">
								<table width="100%">
								<tr>
									<td width="115px">
										<label><font color="white">�̸�</font><font color="red">*</font></label>
									</td>
									<td>
										<input type="text"	class="form-control" name="signup_mem_nm"  id="signup_mem_nm" autocomplete="off" placeholder="�̸�" />
									</td>
								</tr>
								</table>
							</div>
						</div>
						<br>
						<div class="cols-sm-10">
							<div class="input-group">
								<table width="100%">
								<tr>
									<td width="115px">
										<label><font color="white">�г���</font><font color="red">*</font></label>
									</td>
									<td>
										<input type="text"	class="form-control" name="signup_mem_nn"  id="signup_mem_nn" autocomplete="off" placeholder="�г���" />
									</td>
								</tr>
								</table>
							</div>
						</div>
						<br>
						<div class="cols-sm-10">
							<div class="input-group">
								<table width="100%">
								<tr>
									<td width="115px">
										<label><font color="white">��ȭ��ȣ</font><font color="red">*</font></label>
									</td>
									<td width="50px">
										<input type="text"	class="form-control" name="signup_mem_te1"  id="signup_mem_te1" autocomplete="off" style="width:100px;" />
									</td>
									<td width="5px">
										<h3><font color="white">-</font></h3>
									</td>
									<td width="50px">
										<input type="text"	class="form-control" name="signup_mem_te2"  id="signup_mem_te2" autocomplete="off" style="width:100px;" />
									</td>
									<td width="5px">
										<h3><font color="white">-</font></h3>
									</td>
									<td width="50px">
										<input type="text"	class="form-control" name="signup_mem_te3"  id="signup_mem_te3" autocomplete="off" style="width:100px;" />
									</td>
								</tr>
								</table>
							</div>
						</div>
						<br>
						<div class="cols-sm-10">
							<div class="input-group">
								<table width="100%">
								<tr>
									<td width="115px">
										<label><font color="white">�̸���</font><font color="red">*</font></label>
									</td>
									<td>
										<input type="email"	class="form-control" name="signup_mem_em" id="signup_mem_em" autocomplete="off" placeholder="�̸���" />
									</td>
								</tr>
								</table>
							</div>
						</div>
						<div class="form-group" style="text-align:center;">
							<button type="button" class="btn btn-primary btn-sm login-button" onClick="signUpOk()">Ȯ��</button>
							<button type="button" data-dismiss="modal" class="btn btn-default btn-sm cancle-button" onClick="signupCancel()">���</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	
	<!-- ��й�ȣã��â -->
	<div id="dlg_sign" class="modal fade" tabindex="-1" role="dialog" aria-hiddem="true">
		<div class="modal-dialog main-login main-center" role="document">
			<div class="modal-body">
				<div class="row">
					<!-- form ���� -->
					<form id="f_pw" class="form-horizontal">
						<!-- �̸��� -->
						<label for="name" class="cols-sm-2 control-label"><font color="white">��й�ȣã��</font></label>
						<div class="cols-sm-10">
							<div class="input-group">
								<span class="input-group-addon"><i class="fa fa-user fa" aria-hidden="true"></i></span><input type="email" class="form-control" name="find_email" id="find_email" autocomplete="off" placeholder="�̸���" />
							</div>
						</div>
						<div class="form-group" style="text-align:center;">
							<button type="button" class="btn btn-primary btn-sm login-button" onClick="pwFind()">Ȯ��</button>
							<button type="button" data-dismiss="modal" class="btn btn-default btn-sm cancle-button">���</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	
	<!-- javascript files -->
	<script src="../js/jquery.js"></script>
	<script type="text/javascript" src="../js/bootstrap.js"></script>
	<script src="../js/bootstrap.min.js"></script>
	<script src="../js/custom.js"></script>
	<script src="../js/jquery.sticky.js"></script>
	<script src="../js/wow.min.js"></script>
	<script src="../js/owl.carousel.min.js"></script>
	<script>
		new WOW().init();
	</script>
</body>
</html>