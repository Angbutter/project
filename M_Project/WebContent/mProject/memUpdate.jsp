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
  	<title>ȸ����������</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<script type="text/javascript" src="../js/jquery-1.11.1.js"></script>
    <link href="../css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="../css/font-awesomem.min.css" media="screen" title="no title" charset="utf-8">
    <link rel="stylesheet" href="../css/stylem.css" media="screen" title="no title" charset="utf-8">
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <script type="text/javascript">/* ȸ���������� */
    	$(document).ready(function(){
    		$("#mem_pw2").keyup(function (){
    			if ($("mem_pw2").val() != "" && $("#mem_pw3").val() != "" && $("#mem_pw2").val()!=null && $("#mem_pw3").val()!=null && $("#mem_pw2").val()==$("#mem_pw3").val()){
    				$("#d_msg").css("color","black").text("��й�ȣ�� Ȯ�εǾ����ϴ�.");	
    			}
    			else if ($("mem_pw3").val() == "" || $("mem_pw3").val() == null){
    				$("#d_msg").css("color","red").text("��й�ȣ�� Ȯ���ϼ���.");	
    			}
    			else {
    				$("#d_msg").css("color","red").text("��й�ȣ�� Ȯ���ϼ���.");	
    			}
    		});
    		$("#mem_pw3").keyup(function(){
    			if ($("mem_pw2").val() != "" && $("#mem_pw3").val() != "" && $("#mem_pw2").val()!=null && $("#mem_pw3").val()!=null && $("#mem_pw2").val()==$("#mem_pw3").val()){
    				$("#d_msg").css("color","black").text("��й�ȣ�� Ȯ�εǾ����ϴ�.");	
    			}
    			else if ($("mem_pw3").val() == "" || $("mem_pw3").val() == null){
    				$("#d_msg").css("color","red").text("��й�ȣ�� Ȯ���ϼ���.");	
    			}
    			else {
    				$("#d_msg").css("color","red").text("��й�ȣ�� Ȯ���ϼ���.");	
    			}
    		});
    	});
    	function empUpd(){
    		if ($("#mem_pw2").val() != $("#mem_pw3").val()){
    			swal({
    				  title: "�˸�",
    				  text: "��й�ȣ�� ��ġ���� �ʽ��ϴ�.",
    				  icon: "error",
    				  button: "Ȯ��"
    				}).then((value)=>{
		    			return;
    				});
    		}
    		else if ($("#mem_pw2").val()==null || $("#mem_pw2").val() ==""
    			  || $("#mem_pw3").val()==null || $("#mem_pw3").val() ==""){
    			swal({
  				  title: "�˸�",
  				  text: "��й�ȣ�� ������ �� �� �����ϴ�.",
  				  icon: "error",
  				  button: "Ȯ��"
  				}).then((value)=>{
		    			return;
  				});
    		}
    		
    		swal({
    			  title: "���",
    			  text: "�����Ͻðڽ��ϱ�?",
    			  icon: "warning",
    			  buttons: true,
    			  dangerMode: true,
    			})
    			.then((willDelete) => {
    			  if (willDelete) {/* Ȯ�� */
    		    		if ( $("#mem_pw2").val() == $("#mem_pw3").val() ){
    		    			$("#f_empUpd").attr("method","post");
    		    	    	$("#f_empUpd").attr("action","./empUpd.do");
    		    	    	$("#f_empUpd").submit();
    		        	}
    			  } else { /* ��� */
    			    
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
  			  title: "���",
  			  text: "���� Ż���Ͻðڽ��ϱ�?",
  			  icon: "warning",
  			  buttons: true,
  			  dangerMode: true,
  			})
  			.then((willDelete) => {
  			  if (willDelete) {/* Ȯ�� */
  				  $("#f_empUpd").attr("method","post");
  				  $("#f_empUpd").attr("action","./memDel.do");
  				  $("#f_empUpd").submit();
  			  } else { /* ��� */
  			    
  			  }
  		});
    	}

    </script>
  </head>
  <body bgColor="white">
      <article class="container">
        <div class="page-header">
          <h1>ȸ������ <small>Member Information</small></h1>
        </div>
        <div class="col-md-6 col-md-offset-3">
          <form id="f_empUpd">
          	<input type="hidden" name="mem_no" id="mem_no" value="<%=mem_no %>">
            <div class="form-group">
              <label for="InputEmail">���̵�</label>
              <input type="text" class="form-control" id="mem_id" name="mem_id" value="<%=KoreanConversion.toKor(mem_id)%>" readonly>
            </div>
            <div class="form-group">
              <label for="InputEmail">�̸�</label>
              <input type="text" class="form-control" id="mem_nm" name="mem_nm" value="<%=mem_nm %>" readonly>
            </div>
            <div class="form-group">
              <label for="InputEmail">�г���</label>
              <input type="text" class="form-control" id="mem_nn" name="mem_nn" value="<%=mem_nn %>" autocomplete="off">
            </div>
            <div class="form-group">
              <label for="InputPassword0">������� ��й�ȣ</label>
              <input type="password" class="form-control" id="mem_pw1" name="mem_pw1" placeholder="���� ��й�ȣ">
            </div>
            <div class="form-group">
              <label for="InputPassword1">������ ��й�ȣ</label>
              <input type="password" class="form-control" id="mem_pw2" name="mem_pw2" placeholder="�� ��й�ȣ">
            </div>
            <div class="form-group">
              <label for="InputPassword2">��й�ȣ Ȯ��</label>
              <input type="password" class="form-control" id="mem_pw3" name="mem_pw3" placeholder="��й�ȣ Ȯ��">
              <div id="d_msg"></div>
            </div>
            <div class="form-group">
              <label for="InputEmail">�̸��� �ּ�</label>
              <input type="email" class="form-control" id="mem_em" name="mem_em" value="<%=mem_em %>" placeholder="�̸��� �ּ�" autocomplete="off">
            </div>
            <div class="form-group text-center">
              <input type="button" class="btn btn-info" onClick="empUpd()" value="Ȯ��">
              <input type="button" class="btn btn-warning" onClick="closeWindow()" value="���">
              <input type="button" class="btn btn-danger" onClick="memDel()" value="ȸ��Ż��">
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