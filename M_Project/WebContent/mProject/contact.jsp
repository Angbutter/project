<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
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
<script type="text/javascript">
	function git(
			  popupwidth
			, popupheight
			, popupname){
							Top = (window.screen.height-popupheight)/3;
							Left = (window.screen.width-popupwidth)/2;
							if ( Top < 0 ) Top = 0;
							if ( Left < 0 ) Left = 0;
							options = "location=no, fullscreen=no, status=yes, left=" + Left + ", top=" + Top + 
							", width=" + popupwidth + ", height=" + popupheight;
							popupname = window.open("https://github.com/minkh1212", popupname, options);
							popupname.focus();
	}
	function facebook(
			  popupwidth
			, popupheight
			, popupname){
							Top = (window.screen.height-popupheight)/3;
							Left = (window.screen.width-popupwidth)/2;
							if ( Top < 0 ) Top = 0;
							if ( Left < 0 ) Left = 0;
							options = "location=no, fullscreen=no, status=yes, left=" + Left + ", top=" + Top + 
							", width=" + popupwidth + ", height=" + popupheight;
							popupname = window.open("https://www.facebook.com/minkh1212", popupname, options);
							popupname.focus();
	}
	function insta(
			  popupwidth
			, popupheight
			, popupname){
							Top = (window.screen.height-popupheight)/3;
							Left = (window.screen.width-popupwidth)/2;
							if ( Top < 0 ) Top = 0;
							if ( Left < 0 ) Left = 0;
							options = "location=no, fullscreen=no, status=yes, left=" + Left + ", top=" + Top + 
							", width=" + popupwidth + ", height=" + popupheight;
							popupname = window.open("https://www.instagram.com/minkh1212", popupname, options);
							popupname.focus();
	}
	function maps(
			  popupwidth
			, popupheight
			, popupname){
							Top = (window.screen.height-popupheight)/3;
							Left = (window.screen.width-popupwidth)/2;
							if ( Top < 0 ) Top = 0;
							if ( Left < 0 ) Left = 0;
							options = "location=no, fullscreen=no, status=yes, left=" + Left + ", top=" + Top + 
							", width=" + popupwidth + ", height=" + popupheight;
							popupname = window.open("https://www.google.com/maps/place/37.524573,%20126.678900", popupname, options);
							popupname.focus();
	}
</script>
</head>
<body>
<!-- Contact Section -->
<div id="contact" class="text-center">
  <div class="container">
    <div class="section-title center">
      <h2>Contact me</h2>
      <hr>
      <p>문제가 있거나 문의할 사항이 생기면 이쪽으로 연락해주세요.</p>
    </div>
    <div class="col-md-8 col-md-offset-2">
      <div class="col-md-4">
        <div class="contact-item"> <i class="fa fa-map-marker fa-2x"></i>
          <p><a href="javascript:maps(screen.availWidth,screen.availHeight,'maps')">위치</a></p>
        </div>
      </div>
      <div class="col-md-4">
        <div class="contact-item"> <i class="fa fa-envelope-o fa-2x"></i>
          <p>khmin@itcen.co.kr</p>
        </div>
      </div>
      <div class="col-md-4">
        <div class="contact-item"> <i class="fa fa-phone fa-2x"></i>
          <p>02-000-0000<br>
            02-000-0001</p>
        </div>
      </div>
      <div class="clearfix"></div>
    </div>
    <div class="col-md-8 col-md-offset-2">
      <h3>문의하기</h3>
      <form name="f_contact" id="f_contact" novalidate>
        <div class="row">
          <div class="col-md-6">
            <div class="form-group">
              <input type="text" id="writer" name="writer" class="form-control" placeholder="Name" required="required" autocomplete="off">
              <p class="help-block text-danger"></p>
            </div>
          </div>
          <div class="col-md-6">
            <div class="form-group">
              <input type="email" id="email" name="email" class="form-control" placeholder="Email" required="required" autocomplete="off">
              <p class="help-block text-danger"></p>
            </div>
          </div>
        </div>
        <div class="form-group">
          <textarea name="message" id="message" name="message" class="form-control" rows="4" placeholder="Message" required autocomplete="off"></textarea>
          <p class="help-block text-danger"></p>
        </div>
        <div id="success"></div>
        <button type="button" class="btn btn-default" onClick="#">Send Message</button>
      </form>
      <div class="social">
        <h3>Follow me</h3>
        <ul>
          <li><a href="javascript:facebook(screen.availWidth,screen.availHeight,'facebook')"><i class="fa fa-facebook"></i></a></li>
          <li><a href="javascript:git(screen.availWidth,screen.availHeight,'git')"><i class="fa fa-github"></i></a></li>
          <li><a href="javascript:insta(screen.availWidth,screen.availHeight,'insta')"><i class="fa fa-instagram"></i></a></li>
        </ul>
      </div>
    </div>
  </div>
</div>
<div id="footer">
  <div class="container">
    <p>Copyright &copy; MKH. Designed by MKH</p>
  </div>
</div>
<script type="text/javascript" src="../js/bootstrap.js"></script>
<script type="text/javascript" src="../js/SmoothScroll.js"></script>
<script type="text/javascript" src="../js/jquery.prettyPhoto.js"></script>
<script type="text/javascript" src="../js/jquery.isotope.js"></script>
<script type="text/javascript" src="../js/jquery.parallax.js"></script>
<script type="text/javascript" src="../js/jqBootstrapValidation.js"></script>
<script type="text/javascript" src="../js/contact_me.js"></script>
<script type="text/javascript" src="../js/mainm.js"></script>
</body>
</html>