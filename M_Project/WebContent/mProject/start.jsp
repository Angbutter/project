<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
 	String mem_no = session.getAttribute("mem_no").toString();
	String mem_nm = session.getAttribute("mem_nm").toString();
	String mem_nn = session.getAttribute("mem_nn").toString();
	String mem_id = session.getAttribute("mem_id").toString();
	
	String gugu = request.getParameter("gugu");
	if ( gugu == null ){
		gugu="main";
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<!-- Bootstrap -->
<link rel="stylesheet" type="text/css"  href="../css/bootstrap.css">
<link rel="stylesheet" type="text/css" href="../fonts/font-awesome/css/font-awesome.css">

<!-- Stylesheet -->
<link rel="stylesheet" type="text/css"  href="../css/style.css">
<link rel="stylesheet" type="text/css" href="../css/prettyPhoto.css">
<link href='http://fonts.googleapis.com/css?family=Open+Sans:400,700,800,600,300' rel='stylesheet' type='text/css'>
<script type="text/javascript" src="../js/jquery.1.11.1.js"></script> 
<title>중고세상</title>
<script type="text/javascript">
	/* 여기도 넣어보고 안되면 body에도 넣어보기 */
	$(document).ready(function (){
		
	});
	function logout(){
		location.href="./logout.jsp";
	}
	function frBoard(){
		location.href="./start.jsp?gugu=fboard";
	}
	function intro(){
		location.href="./start.jsp?gugu=main";
	}
	function trBoard(){
		location.href="./start.jsp?gugu=tboard";
	}
	function schedule(){
		location.href="./scList.do";
	}
	function mteam(){
		location.href="./start.jsp?gugu=mteam";
	}
	function contact(){
		location.href="./start.jsp?gugu=contact";
	}
	function logout(){
		location.href="./logout.jsp";
	}
	function tr_search(){
		$("#f_tr_search").attr("method","post");
		$("#f_tr_search").attr("action","./trSearch.do");
		$("#f_tr_search").submit();
	}
	function fr_search(){
		$("#f_fr_search").attr("method","post");
		$("#f_fr_search").attr("action","./frSearch.do");
		$("#f_fr_search").submit();
	}
	function tr_write(
			  popupwidth
			, popupheight
			, popupname){
							Top = (window.screen.height-popupheight)/3;
							Left = (window.screen.width-popupwidth)/2;
							if ( Top < 0 ) Top = 0;
							if ( Left < 0 ) Left = 0;
							options = "location=no, fullscreen=no, status=yes, left=" + Left + ", top=" + Top + 
							", width=" + popupwidth + ", height=" + popupheight;
							popupname = window.open("./tr_write_popup.jsp", popupname, options);
							popupname.focus();
	}
	function fr_write(
			  popupwidth
			, popupheight
			, popupname){
							Top = (window.screen.height-popupheight)/3; 
							Left = (window.screen.width-popupwidth)/2;
							if ( Top < 0 ) Top = 0;
							if ( Left < 0 ) Left = 0;
							options = "location=no, fullscreen=no, status=yes, left=" + Left + ", top=" + Top + 
							", width=" + popupwidth + ", height=" + popupheight;
							popupname = window.open("./fr_write_popup.jsp", popupname, options);
							popupname.focus();
	}
	function trView(
			  popupwidth
			, popupheight
			, popupname
			, tr_no
			, page){
							trHitUpd(tr_no,page);
							Top = (window.screen.height-popupheight)/3; 
							Left = (window.screen.width-popupwidth)/2;
							if ( Top < 0 ) Top = 0;
							if ( Left < 0 ) Left = 0;
							options = "location=no, fullscreen=no, status=yes, left=" + Left + ", top=" + Top + 
							", width=" + popupwidth + ", height=" + popupheight;
							popupname = window.open("./trBoardView.jsp?tr_no="+tr_no, popupname, options);
							popupname.focus();
	}
	function frView(
			  popupwidth
			, popupheight
			, popupname
			, fr_no
			, page){
							frHitUpd(fr_no,page);
							Top = (window.screen.height-popupheight)/3; 
							Left = (window.screen.width-popupwidth)/2;
							if ( Top < 0 ) Top = 0;
							if ( Left < 0 ) Left = 0;
							options = "location=no, fullscreen=no, status=yes, left=" + Left + ", top=" + Top + 
							", width=" + popupwidth + ", height=" + popupheight;
							popupname = window.open("./frBoardView.jsp?fr_no="+fr_no, popupname, options);
							popupname.focus();
	}
	function trHitUpd(trnum,page){
		$.ajax({
			method : "GET", //전송방식 ( get방식 or post 방식 )
			url : "./trHitUpd.jsp?tr_no="+trnum, //요청처리를 담당할 페이지 - url ( xx.jsp , xx.html, xx.xml, xx.json)
			dataType : "html", // ( html, xml, json, text )
			success : function(data) {	
				if ( data==1 ){
					location.href="./start.jsp?gugu=tboard&page2="+page;
				}
			}
		});
	}
	function frHitUpd(frnum,page){
		$.ajax({
			method : "GET", //전송방식 ( get방식 or post 방식 )
			url : "./frHitUpd.jsp?fr_no="+frnum, //요청처리를 담당할 페이지 - url ( xx.jsp , xx.html, xx.xml, xx.json)
			dataType : "html", // ( html, xml, json, text )
			success : function(data) {	
				if ( data==1 ){
					location.href="./start.jsp?gugu=fboard&page2="+page;
				}
			}
		});
	}
	function memUpd(
			  popupwidth
			, popupheight
			, popupname){
							Top = (window.screen.height-popupheight)/3; 
							Left = (window.screen.width-popupwidth)/2;
							if ( Top < 0 ) Top = 0;
							if ( Left < 0 ) Left = 0;
							options = "location=no, fullscreen=no, status=yes, left=" + Left + ", top=" + Top + 
							", width=" + popupwidth + ", height=" + popupheight;
							popupname = window.open("./memUpdate.jsp", popupname, options);
							popupname.focus();
	}
</script>
<style type="text/css">
.table > thead > tr > th { 
	background: #8f5b38;
	color: #fff; 
	border-bottom: 0; 
	text-transform: uppercase; 
}
.btnb {
  display: inline-block;
  padding: 6px 12px;
  margin-bottom: 0;
  font-size: 11px;
  font-weight: normal;
  line-height: 1.42857143;
  text-align: center;
  white-space: nowrap;
  vertical-align: middle;
  -ms-touch-action: manipulation;
      touch-action: manipulation;
  cursor: pointer;
  -webkit-user-select: none;
     -moz-user-select: none;
      -ms-user-select: none;
          user-select: none;
  background-image: none;
  border: 1px solid transparent;
  border-radius: 4px;
}
</style>
</head>
<body id="page-top" data-spy="scroll" data-target=".navbar-fixed-top">
<!-- Navigation -->
<nav class="navbar-custom navbar-fixed-top" role="navigation">
  <div class="container">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-main-collapse"> <i class="fa fa-bars"></i> </button>
      <a class="navbar-brand page-scroll" href="javascript:intro()"> <i class="fa fa-paper-plane-o"></i>중고세상</a><!-- <i></i>비행기 사진  -->
    </div>
    
    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse navbar-main-collapse navbar-right">
      <ul class="nav navbar-nav">
	    <!-- <li> <a class="page-scroll" href="javascript:intro()">소개</a> </li>			소개, 자유게시판, 거래게시판, 일정, 협력업체, Contact, 개인정보 수정, 로그아웃 -->
        <li> <a class="page-scroll" href="javascript:frBoard()">자유게시판</a> </li>
        <li> <a class="page-scroll" href="javascript:trBoard()">거래게시판</a> </li>
        <li> <a class="page-scroll" href="javascript:schedule()">일정</a> </li>
        <li> <a class="page-scroll" href="javascript:mteam()" id="temp">PORTFOLIO</a></li>
        <li> <a class="page-scroll" href="javascript:contact()">Contact</a> </li>
        <li> <a class="page-scroll" href="javascript:memUpd(600,750,'회원정보수정')"><%=mem_nn %> 님</a> </li>
        <li> <a class="page-scroll" href="javascript:logout()">Logout</a> </li>
      </ul>
    </div>
  </div>
</nav>
<%
	if ( "main".equals(gugu)){
%>
		<%@ include file="main.jsp" %>
<%
	}else if("fboard".equals(gugu)){
%>
		<%@ include file="frBoard.jsp" %>
<%
	}else if("tboard".equals(gugu)){
%>
		<%@ include file="trBoard.jsp" %>
<%
	}else if("mteam".equals(gugu)){
%>
		<%@ include file="mTeam.jsp" %>
<%
	}else if("contact".equals(gugu)){
%>
		<%@ include file="contact.jsp" %>
<%
	}else if("cal".equals(gugu)){
%>
 		<%@ include file="calendar.jsp" %>
<%
	}
%>
<script type="text/javascript" src="../js/mainm.js"></script>
<iframe src="./iframeTest.jsp" style="width:0%; height:0%;"></iframe>
</body>
</html>