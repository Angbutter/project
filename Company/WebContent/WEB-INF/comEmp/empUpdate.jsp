<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	//String eee = request.getParameter("eee");
	String emp_name2 = session.getAttribute("emp_name").toString();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
	<script type="text/javascript" src="../js/jquery-1.11.1.js"></script>
    <!-- Bootstrap -->
    <link href="../ccs/bootstrap.min.css" rel="stylesheet">
    <!-- <link href="../css/css-index2.css" rel="stylesheet" media="screen"> -->
    <!-- font awesome -->
    <link rel="stylesheet" href="../css/font-awesome.min.css" media="screen" title="no title" charset="utf-8">
    <!-- Custom style -->
    <link rel="stylesheet" href="../css/style.css" media="screen" title="no title" charset="utf-8">
    <script type="text/javascript">
    	$(document).ready(function(){
    		$("#board_emp_pw2").keyup(function (){
    			if ($("#board_emp_pw2").val()==$("#board_emp_pw3").val()){
    				$("#d_msg").css("color","black").text("비밀번호가 확인되었습니다.");	
    			}
    			else {
    				$("#d_msg").css("color","red").text("비밀번호를 확인하세요.");	
    			}
    		});
    		$("#board_emp_pw3").keyup(function(){
    			if ($("#board_emp_pw2").val()==$("#board_emp_pw3").val()){
    				$("#d_msg").css("color","black").text("비밀번호가 확인되었습니다.");	
    			}
    			else {
    				$("#d_msg").css("color","red").text("비밀번호를 확인하세요.");	
    			}
    		});
    	});
    	function empUpd(){
    		if ($("#board_emp_pw2").val() != $("#board_emp_pw3").val()){
    			alert("비밀번호가 일치하지 않습니다.");
    			return;
    		}
    		$("#f_empUpd").attr("method","post");
	    	$("#f_empUpd").attr("action","./empUpd.do");
	    	$("#f_empUpd").submit();
    	}
    	function closeWindow(){
    		window.close();
    	}

    </script>
  </head>
  <body bgColor="white">
      <article class="container">
        <div class="page-header">
          <h1>회원정보 <small>Member Information</small></h1>
        </div>
        <div class="col-md-6 col-md-offset-3">
          <form id="f_empUpd">
            <div class="form-group">
              <label for="InputEmail">이름</label>
              <input type="text" class="form-control" id="emp_name" name="emp_name" value="<%=emp_name2%>" readonly="false">
            </div>
            <div class="form-group">
              <label for="InputPassword0">사용중인 비밀번호</label>
              <input type="password" class="form-control" id="board_emp_pw" name="board_emp_pw" placeholder="비밀번호">
            </div>
            <div class="form-group">
              <label for="InputPassword1">변경할 비밀번호</label>
              <input type="password" class="form-control" id="board_emp_pw2" name="board_emp_pw2" placeholder="비밀번호">
            </div>
            <div class="form-group">
              <label for="InputPassword2">비밀번호 확인</label>
              <input type="password" class="form-control" id="board_emp_pw3" name="board_emp_pw3" placeholder="비밀번호 확인">
              <div id="d_msg"></div>
            </div>
            <div class="form-group">
              <label for="InputEmail">이메일 주소</label>
              <input type="email" class="form-control" id="email" name="email" placeholder="이메일 주소">
            </div>
            <div class="form-group text-center">
              <input type="button" class="btn btn-info" onClick="empUpd()" value="확인">
              <button class="btn btn-warning" onClick="closeWindow()">취 소<i class="fa fa-times spaceLeft"></i></button>
            </div>
          </form>
        </div>
        </form>
          <hr>
        </div>
      </article>
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="../js/bootstrap.min.js"></script>
  </body>
</html>