<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="com.util.HangulConversion" %>
<%@ page import="java.util.Calendar" %>
<%
	String emp_name = session.getAttribute("emp_name").toString();
	String gugu = request.getParameter("gugu");
	String strYear7 = request.getParameter("year");
	String strMonth7 = request.getParameter("month");
	if ( gugu == null ){
		gugu = "main";
	}
	Calendar cal = Calendar.getInstance();
	int year = cal.get(Calendar.YEAR);
	int month = cal.get(Calendar.MONTH)+1;
	int day = cal.get(Calendar.DAY_OF_MONTH);
	String month2 = "";
	String day2 = "";
	if ( month <10 ){
		month2 = "0"+month;
	}
	else {
		month2 = ""+month;
	}
	if ( day < 10 ){
		day2 = "0"+day;
	}
	else {
		day2 = ""+month;
	}
	String today = year+"-"+month2+"-"+day2;
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<title>Kosmo</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<link rel="stylesheet" href="../css/main.css?ver=1.1" />
		<link rel="stylesheet" type="text/css" href="../themes/default/easyui.css">
		<link rel="stylesheet" type="text/css" href="../themes/icon.css">
		<link rel="stylesheet" type="text/css" href="../demo/demo.css">
		<script src="../js/jquery.min.js"></script>
		<script src="../js/skel.min.js"></script>
		<script src="../js/util.js"></script>
		<script src="../js/main.js"></script>
		<script type="text/javascript" src="../js/jquery.min.js"></script>
		<script type="text/javascript" src="../js/jquery.easyui.min.js"></script>
		
		<script type="text/javascript">
			$(document).ready(function(){

			});
			function logout(){
				location.href="./logout.jsp";
			}
			function schedule(){
				location.href="./getCalList.do";
			}
			function boardEmp(){
				location.href="./getBoardEmp.do";
			}
			function boardBo(){
				location.href="./getBoardList.do";
			}
			function home(){
				location.href="./index.jsp?gugu=main";
			}
			function empUpdate(){
				location.href="./index.jsp?gugu=empUpd";
			}
			function cmm_window_popup(
					  popupwidth
	 				, popupheight
	 				, popupname){
									Top = (window.screen.height-popupheight)/3; 
									Left = (window.screen.width-popupwidth)/2;
									if ( Top < 0 ) Top = 0;
									if ( Left < 0 ) Left = 0;
									options = "location=no, fullscreen=no, status=yes, left=" + Left + ", top=" + Top + 
									", width=" + popupwidth + ", height=" + popupheight;
									popupname = window.open("./empUpdate.jsp", popupname, options);
									popupname.focus();
								}
			function cmm_window_pop(
					  popupwidth
	 				, popupheight
	 				, popupname){
									Top = (window.screen.height-popupheight)/3; 
									Left = (window.screen.width-popupwidth)/2;
									if ( Top < 0 ) Top = 0;
									if ( Left < 0 ) Left = 0;
									options = "location=no, fullscreen=no, status=yes, left=" + Left + ", top=" + Top + 
									", width=" + popupwidth + ", height=" + popupheight;
									popupname = window.open("./boardList.jsp", popupname, options);
									popupname.focus();
								}
			function cmm_window_popmemo(
					  popupwidth
	 				, popupheight
	 				, popupname){
									Top = (window.screen.height-popupheight)/3; 
									Left = (window.screen.width-popupwidth)/2;
									if ( Top < 0 ) Top = 0;
									if ( Left < 0 ) Left = 0;
									options = "location=no, fullscreen=no, status=yes, left=" + Left + ", top=" + Top + 
									", width=" + popupwidth + ", height=" + popupheight;
									popupname = window.open("./memo2.jsp", popupname, options);
									popupname.focus();
								}
			function cmm_window_popsign(
					  popupwidth
	 				, popupheight
	 				, popupname){
									Top = (window.screen.height-popupheight)/3; 
									Left = (window.screen.width-popupwidth)/2;
									if ( Top < 0 ) Top = 0;
									if ( Left < 0 ) Left = 0;
									options = "location=no, fullscreen=no, status=yes, left=" + Left + ", top=" + Top + 
									", width=" + popupwidth + ", height=" + popupheight;
									popupname = window.open("./approvalList.jsp", popupname, options);
									popupname.focus();
								}
		</script>
	</head>
	<body>
		<script type="text/javascript">
			$(document).ready(function(){
				var audio = new Audio('../music/signal.mp3');
				audio.play();
			});
		</script>
		<!-- Wrapper -->

			<div id="wrapper">
				<!-- Header -->
					<header id="header">
						<nav class="main">
							<ul>
								<li class="menu">
									<a class="fa-bars" href="#menu">Menu</a>
									<h1><a href="javascript:home()"><font size="1">홈</font></a></h1>
									&nbsp;&nbsp;&nbsp;&nbsp;
								</li>
							</ul>
						</nav>
						<nav class="links">
						</nav>
						 <h1>    </h1>
						 <h1><a href="javascript:cmm_window_popup('600','650','회원정보수정')"><%=emp_name %></a></h1>
						 <%-- <h1><a href="javascript:empUpdate()"><%=emp_name %></a></h1> --%>
						 <h1> | </h1>
						 <h1><a href="javascript:cmm_window_popmemo('1050','650','쪽지')">쪽지함</a></h1>
						 <h1> | </h1>
						 <h1><a href="javascript:logout()">로그아웃</a></h1>
 						 <h1>    </h1>
						 <h1>    </h1>
					</header>

				<!-- Menu -->
					<section id="menu">

						<!-- Search -->
							<section>
								<form class="text" method="get" action="#">
									<input type="text" name="query" placeholder="Search" />
								</form>
							</section>

						<!-- Links -->
							<section>
								<ul class="links">
									<li>
										<a href="javascript:cmm_window_pop('1100','750','공지사항')">
											<h3>공지사항</h3>
											<p>INFORMATION</p>
										</a>
									</li>
									<li>
										<a href="javascript:boardEmp()">
											<h3>게시판</h3>
											<p>MESSAGE BOARD</p>
										</a>
									</li>
									<li>
										<a href="javascript:schedule()">
											<h3>일정관리</h3>
											<p>SCHEDULE MANAGEMENT</p>
										</a>
									</li>
									<li>
										<a href="javascript:cmm_window_popsign('1100','900','결재')">
											<h3>전자결재</h3>
											<p>REPORT</p>
										</a>
									</li>
								</ul>
							</section>
					</section>
<%
	if ( "main".equals(gugu) ){
%>
		<%@ include file="main.jsp" %>
<%
	}
	else if ("cal".equals(gugu)){
%>
		<%@ include file="cal.jsp" %>
<%
	}
	else if ("board".equals(gugu)){
%>
		<%@ include file="boardEmp.jsp" %>
<%
	}
%>
			</div>
	</body>
</html>