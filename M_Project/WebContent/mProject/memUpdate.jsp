<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="Mproject.util.KoreanConversion" %>
<%
	String mem_nm = session.getAttribute("mem_nm").toString();
	String mem_id = session.getAttribute("mem_id").toString();
	String mem_nn = session.getAttribute("mem_nn").toString();
	String mem_em = session.getAttribute("mem_em").toString(); 
	String mem_no = session.getAttribute("mem_no").toString();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
  	<title>회원정보수정</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<script type="text/javascript" src="../js/jquery-1.11.1.js"></script>
    <link href="../css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="../css/font-awesomem.min.css" media="screen" title="no title" charset="utf-8">
    <link rel="stylesheet" href="../css/stylem.css" media="screen" title="no title" charset="utf-8">
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <script type="text/javascript">/* 회원정보수정 */
    	$(document).ready(function(){
    		$("#mem_pw2").keyup(function (){
    			if ($("mem_pw2").val() != "" && $("#mem_pw3").val() != "" && $("#mem_pw2").val()!=null && $("#mem_pw3").val()!=null && $("#mem_pw2").val()==$("#mem_pw3").val()){
    				$("#d_msg").css("color","black").text("비밀번호가 확인되었습니다.");	
    			}
    			else if ($("mem_pw3").val() == "" || $("mem_pw3").val() == null){
    				$("#d_msg").css("color","red").text("비밀번호를 확인하세요.");	
    			}
    			else {
    				$("#d_msg").css("color","red").text("비밀번호를 확인하세요.");	
    			}
    		});
    		$("#mem_pw3").keyup(function(){
    			if ($("mem_pw2").val() != "" && $("#mem_pw3").val() != "" && $("#mem_pw2").val()!=null && $("#mem_pw3").val()!=null && $("#mem_pw2").val()==$("#mem_pw3").val()){
    				$("#d_msg").css("color","black").text("비밀번호가 확인되었습니다.");	
    			}
    			else if ($("mem_pw3").val() == "" || $("mem_pw3").val() == null){
    				$("#d_msg").css("color","red").text("비밀번호를 확인하세요.");	
    			}
    			else {
    				$("#d_msg").css("color","red").text("비밀번호를 확인하세요.");	
    			}
    		});
    	});
    	function empUpd(){
    		if ($("#mem_pw2").val() != $("#mem_pw3").val()){
    			swal({
    				  title: "알림",
    				  text: "비밀번호가 일치하지 않습니다.",
    				  icon: "error",
    				  button: "확인"
    				}).then((value)=>{
		    			return;
    				});
    		}
    		else if ($("#mem_pw2").val()==null || $("#mem_pw2").val() ==""
    			  || $("#mem_pw3").val()==null || $("#mem_pw3").val() ==""){
    			swal({
  				  title: "알림",
  				  text: "비밀번호는 공백이 될 수 없습니다.",
  				  icon: "error",
  				  button: "확인"
  				}).then((value)=>{
		    			return;
  				});
    		}
    		
    		swal({
    			  title: "경고",
    			  text: "수정하시겠습니까?",
    			  icon: "warning",
    			  buttons: true,
    			  dangerMode: true,
    			})
    			.then((willDelete) => {
    			  if (willDelete) {/* 확인 */
    		    		if ( $("#mem_pw2").val() == $("#mem_pw3").val() ){
    		    			$("#f_empUpd").attr("method","post");
    		    	    	$("#f_empUpd").attr("action","./empUpd.do");
    		    	    	$("#f_empUpd").submit();
    		        	}
    			  } else { /* 취소 */
    			    
    			  }
    		});
    	}
    		
    	function closeWindow(){
    		$("#mem_id").val("");
    		$("#mem_nm").val("");
    		$("#mem_pw1").val("");
    		$("#mem_pw2").val("");
    		$("#mem_pw3").val("");
    		$("#mem_em").val("");
    		window.close();
    	}
    	function memDel(){
    		swal({
  			  title: "경고",
  			  text: "정말 탈퇴하시겠습니까?",
  			  icon: "warning",
  			  buttons: true,
  			  dangerMode: true,
  			})
  			.then((willDelete) => {
  			  if (willDelete) {/* 확인 */
  				  $("#f_empUpd").attr("method","post");
  				  $("#f_empUpd").attr("action","./memDel.do");
  				  $("#f_empUpd").submit();
  			  } else { /* 취소 */
  			    
  			  }
  		});
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
          	<input type="hidden" name="mem_no" id="mem_no" value="<%=mem_no %>">
            <div class="form-group">
              <label for="InputEmail">아이디</label>
              <input type="text" class="form-control" id="mem_id" name="mem_id" value="<%=KoreanConversion.toKor(mem_id)%>" readonly>
            </div>
            <div class="form-group">
              <label for="InputEmail">이름</label>
              <input type="text" class="form-control" id="mem_nm" name="mem_nm" value="<%=mem_nm %>" readonly>
            </div>
            <div class="form-group">
              <label for="InputEmail">닉네임</label>
              <input type="text" class="form-control" id="mem_nn" name="mem_nn" value="<%=mem_nn %>" autocomplete="off">
            </div>
            <div class="form-group">
              <label for="InputPassword0">사용중인 비밀번호</label>
              <input type="password" class="form-control" id="mem_pw1" name="mem_pw1" placeholder="기존 비밀번호">
            </div>
            <div class="form-group">
              <label for="InputPassword1">변경할 비밀번호</label>
              <input type="password" class="form-control" id="mem_pw2" name="mem_pw2" placeholder="새 비밀번호">
            </div>
            <div class="form-group">
              <label for="InputPassword2">비밀번호 확인</label>
              <input type="password" class="form-control" id="mem_pw3" name="mem_pw3" placeholder="비밀번호 확인">
              <div id="d_msg"></div>
            </div>
            <div class="form-group">
              <label for="InputEmail">이메일 주소</label>
              <input type="email" class="form-control" id="mem_em" name="mem_em" value="<%=mem_em %>" placeholder="이메일 주소" autocomplete="off">
            </div>
            <div class="form-group text-center">
              <input type="button" class="btn btn-info" onClick="empUpd()" value="확인">
              <input type="button" class="btn btn-warning" onClick="closeWindow()" value="취소">
              <input type="button" class="btn btn-danger" onClick="memDel()" value="회원탈퇴">
            </div>
          </form>
        </div>
        </form>
          <hr>
        </div>
      </article>
      
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <script src="../js/bootstrap.min.js"></script>
  </body>
</html>