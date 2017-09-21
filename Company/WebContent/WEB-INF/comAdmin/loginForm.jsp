<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<html>
    <head>
       <!-- 테스트 -->
       <!-- 회원가입 CSS -->
      	<meta name="viewport" content="width=device-width, initial-scale=1">
      	<link rel="stylesheet" href="../css/font-awesome.min.css">
      	<link href='https://fonts.googleapis.com/css?family=Passion+One' rel='stylesheet' type='text/css'>
      	<link href='https://fonts.googleapis.com/css?family=Oxygen' rel='stylesheet' type='text/css'>

        <!-- 타이틀 -->
        <title>Final Project</title>
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
        <!-- CSS 엑세스 -->
        <link href="../css/bootstrap.min.css" rel="stylesheet" media="screen">
        <link href="../css/font-awesome.min.css" rel="stylesheet">
        <link href="../fonts/icon-7-stroke/css/pe-icon-7-stroke.css" rel="stylesheet">
        <link href="../css/animate.css" rel="stylesheet" media="screen">
        <link href="../css/owl.theme.css" rel="stylesheet">
        <link href="../css/owl.carousel.css" rel="stylesheet">
        <!-- 컬러 -->
        <link href="../css/css-index.css" rel="stylesheet" media="screen">

        <!-- 구글 폰트 -->
        <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Lato:100,300,400,700,900,100italic,300italic,400italic,700italic,900italic" />
        <script type="text/javascript">
        	function login(){
        		$("#f_login").attr("method","post");
        		$("#f_login").attr("action","./login.do");
        		$("#f_login").submit(); 
        	}
        	function pwFind(){
        		$("#f_pw").attr("method","post");
        		$("#f_pw").attr("action","./pwFind.do");
        		$("#f_pw").submit();
        	}
        </script>
    </head>

    <body data-spy="scroll" data-target="#navbar-scroll">

        <!-- /.preloader -->
       <div id="preloader"></div>
        <div id="top"></div>
        
        <!-- /.parallax full screen background image -->
        <!-- <div class="fullscreen landing parallax" style="background-image:url('../images/bg.jpg');" data-img-width="2000" data-img-height="1333" data-diff="100"> -->
        <div class="fullscreen landing parallax" style="background-image:url('../images/123.jpg');" data-img-width="2000" data-img-height="1333" data-diff="100">
            <div class="overlay">
                <div class="container">
                    <div class="row">
                        <div class="col-md-7">

                            <!-- /.logo -->
                            <!-- <div class="logo wow fadeInDown" style="margin-top:25%"><a href=""><img src="../images/1111.gif" alt="logo"></a></div> -->
                            <div class="logo wow fadeInDown" style="margin-top:25%"><a href=""></a></div>

                            <!-- 메인화면 -->
                            <h1 class="wow fadeInLeft">
                                  <I> <b>MUZI</b> </I>   
                            </h1>

                            <!-- 소개글 -->
                            <div class="landing-text wow fadeInUp">
                                <p>MUZI에 오신걸 환영합니다.</p>
                            </div>
                        </div> 
                        
                        <!-- 로그인폼 -->
                        <div class="col-md-5" style="margin-top:5%">
                            <div class="signup-header wow fadeInUp">
                                <h3 class="form-title text-center"><B>MUZI</B></h3>
                                <form id="f_login" name="f_login">
                                    <!-- <input type="hidden" name="id" value="ID">
                                    <input type="hidden" name="pw" value="PassWord"> -->
                                    <input type="hidden" name="command" value="loginCheck">
                                    <div class="form-group">
                                        <input class="form-control input-lg" autocomplete="off" name="emp_no" id="emp_no" type="text" placeholder="사원번호" required> <!-- autocomplete="off" 자동완성 금지 -->
                                    </div>
                                    <div class="form-group">
                                        <input class="form-control input-lg" name="emp_pw" id="emp_pw" type="password" placeholder="비밀번호" required>
                                    </div>
                                    <div class="form-group last">
                                        <input type="button" id="btn_login" class="btn-primary btn-block btn-lg" onclick="login()" value="로그인">
                                    </div>
                                    <p class="privacy text-center">
                                    <a class="line" data-toggle="modal" data-target="#dlg-sign" href="#dlg_sign">비밀번호찾기</a>
                                    <!-- <a href="pwsearch.jsp">비밀번호찾기</a> -->
                                    </p>
                                </form>
                            </div>            

                        </div>
            		  </div>   
                    </div>
                </div> 
            </div> 
            
        <!-- 회원가입창 -->
      <div id="dlg_sign" class="modal fade" tabindex="-1" role="dialog" aria-hiddem="true">
      <div class="modal-dialog main-login main-center" role="document">
      <div class="modal-body">
      <div class="row">
      
      <!-- form 시작 -->
      <form id="f_pw" class="form-horizontal">
         <!-- 이메일 -->
            <label for="name" class="cols-sm-2 control-label">비밀번호 찾기</label>
            <div class="cols-sm-10">
               <div class="input-group">
                  <span class="input-group-addon"><i class="fa fa-user fa" aria-hidden="true"></i></span> 
                  <input type="email" class="form-control" name="email" id="email" placeholder="이메일" />
               </div>
            </div>

         <div class="form-group ">
            <button type="button" class="btn btn-primary btn-lg btn-block login-button" onClick="pwFind()">확인</button>
            <button type="button" data-dismiss="modal" class="btn btn-default btn-lg btn-block cancle-button">취소</button>
         </div>
      </form>
      </div>
      </div> 
      </div>
      </div> <!-- 맨처음 div -->
      
      
        <!-- /.javascript files -->
      <script type="text/javascript" src="../js/bootstrap.js"></script>
      <script type="text/javascript" src="../js/jquery-1.11.1.js"></script>
        
        <script src="../js/jquery.js"></script>
        <script src="../js/bootstrap.min.js"></script>
        <script src="../js/custom.js"></script>
        <script src="../js/jquery.sticky.js"></script>
        <script src="../js/wow.min.js"></script>
        <script src="../js/owl.carousel.min.js"></script>
        <script>
           new WOW().init();
        </script>
        
        <script type="text/javascript">
           // 창열기
           $(document).ready(function () {
            $('.line').click(function () {
               $("#dlg_sign").modal('show');
            });
         });
        </script>
    </body>
</html>