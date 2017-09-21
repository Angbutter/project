<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%
	Date nowTime = new Date();
	SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<jsp:include page="../common/commonEasyUI.jsp" flush="false"/>
<script type="text/javascript">
 	function approvalIns(){
 		$("#fileChoice").attr("method","get");
		$("#fileChoice").attr("action","./approvalInsert.do");
		$("#fileChoice").submit();
		//location.href="./approvalList.jsp";
	}
 	function cbGetNameList(vdept){
 		//alert('22');
 		$('#deptm').combobox({
 			data:'EMP_NAME'//vo:�ҹ���, map:�빮��
 			//emp�׿��� �Է��� �� �ѱ� �� - �μ���ȣ
 			,valueField:"EMP_NO"
 			//ȭ�鿡 ������ �� = �μ��̸�
 			,textField:"EMP_NAME"
 			,url:'./angApprovalList.do?deptm_name='+vdept
 			,onSelect:function(param){
 				alert("deptm");
 				deptno = param.deptno;
 			}
 			,onChange:function(newValue,oldValue){
 				deptno = newValue;
 			}
 			,onLoadSuccess:function(){
 				alert("load.....");
 			}
 		});
	}
 	function cbGetNameList1(vdept){
 		$('#cb_name1').combobox({
 			data:'EMP_NAME'//vo:�ҹ���, map:�빮��
 			//emp�׿��� �Է��� �� �ѱ� �� - �μ���ȣ
 			,valueField:"EMP_NO"
 			//ȭ�鿡 ������ �� = �μ��̸�
 			,textField:"EMP_NAME"
 			,url:'./getfileList.list?deptm_name='+vdept
 			,required:true
 			,onSelect:function(param){
 				deptno = param.deptno;
 			}
 			,onChange:function(newValue,oldValue){
 				deptno = newValue;
 			}		
 		});
	}
 	function back_approvalList(){
		location.href="./approvalList.jsp";
	}
	function stamp_img(){
		//alert("����");
		$("#stamp").show();
	}
</script>
</head>
<body>
<!-- <script type="text/javascript" src="../tiny_mce/tiny_mce.js">
</script> -->
<!-- <input id="cc1" class="easyui-combobox" data-options="
        valueField: 'id',
        textField: 'text',
        url: 'get_data1.php',
        onSelect: function(rec){
            var url = 'get_data2.php?id='+rec.id;
            $('#cc2').combobox('reload', url);
        }">
<input id="cc2" class="easyui-combobox" data-options="valueField:'id',textField:'text'"> -->
<script type="text/javascript">
	$(document).ready(function(){	
	$("#stamp").hide();
		$('#cb_dept').combobox({
			onSelect: function(param){
				//alert('����');
				var vdept = $("#cb_dept").combobox('getValue');
	            var url = './angApprovalList.do?deptm_name='+vdept;
	            $('#deptm').combobox('reload', url);
				//cbGetNameList(vdept);
				//location.href="./getMemberList.ms?deptm_name="+vdept;
			}
		});
		$('#cb_dept1').combobox({
			onChange: function(param){
				var vdept = $("#cb_dept1").combobox('getValue');
				cbGetNameList1(vdept);
				//location.href="./getMemberList.ms?deptm_name="+vdept;
			}
		});
	});
	/* 	tinyMCE.init({
	   	 mode : "textareas",
	   	 theme : "simple"
	   }); */
</script>
<!-- <table border="1" width="1000px" height="50px">
	<tr> 
		<td><input type="radio" name="lang"><span style="font-size: medium;">������Ǽ�</span></td>
		<td><input type="radio" name="lang"><span style="font-size: medium;">ǰ�Ǽ�</span></td>
	</tr>
</table>
<br> -->
<div class="easyui-tabs" data-options="tabWidth:300" style="width:1002px;">
<form id="fileChoice" name="fileChoice">
<input type="hidden" value="������Ǽ�" id="section" name="section">
<input type="hidden" value="900001" id="emp_no" name="emp_no">
<table border="1" width="1000px">
	<tr>
		<td>
		<label style="font-size: medium;">���ȵ�� : </label>
		<input type="radio" name="lang" ><span style="font-size: medium;">�Ϲ�</span>&nbsp;&nbsp;
		<input type="radio" name="lang" ><span style="font-size: medium;">����</span>
		
		<td style="font-size: medium;"><label style="font-size: medium;">����� : </label>
		<%= sf.format(nowTime) %>
		<!-- <input class="easyui-datebox" data-options="formatter:myformatter,parser:myparser" style="width:50%;"> -->
		</td>
	</tr>
	 <tr>
	 	<td>
	 	<label style="font-size: medium;">�߿䵵 : </label>&nbsp;&nbsp;
		<input type="radio" id="approval_level" name="approval_level" ><span style="font-size: medium;">���</span>&nbsp;&nbsp;
		<input type="radio" id="approval_level" name="approval_level" ><span style="font-size: medium;">����</span>&nbsp;&nbsp;
		<input type="radio" id="approval_level" name="approval_level" ><span style="font-size: medium;">����</span>&nbsp;&nbsp;
		<input type="radio" id="approval_level" name="approval_level" ><span style="font-size: medium;">����</span>
		</td>
		<td>
			<label style="font-size: medium;">���� ������:</label>
            <select class="easyui-combobox" id="cb_dept" name="cb_dept" style="width:20%; font-size: medium;">
                	<option value="">�� ��</option>
                	<option>----------</option>
                	<option>������</option>
                	<option>�ѹ���</option>
                	<option>�λ��</option>
                	<option>�ӿ�</option>
                	
            </select>
            <input class="easyui-combobox" id="deptm" name="deptm" data-options="valueField:'EMP_NO',textField:'EMP_NAME'" style="width:20%; font-size: medium;"></td>
	</tr>
	<tr>
	 	<td colspan="2">
	 	<label style="font-size: medium;">÷������ : </label>&nbsp;&nbsp;
	 	<input class="easyui-filebox" data-options="prompt:'Choose a file...'" style="width:500px">
		</td>
	</tr>
	<!-- �����Է� ���� -->
	<tr>
	<td colspan="2">
	<!-- <textarea id="test" name="test" rows="70" cols="138" > -->
	<!-- ������Ǽ� -->
<table border="0" cellpadding="0" cellspacing="0" style="margin: auto auto auto 4.2pt; width: 723px; height: 769px; border-collapse: collapse;">
   <tbody>
      <tr style="height: 27px;">
         <td colspan="14" nowrap="nowrap" rowspan="4" style="border-width: 1pt 0px 1pt 1pt; border-style: solid none solid solid; padding: 0cm 4.95pt; width: 422px; height: 27px;">
         <p align="center" style="text-align: center; -ms-word-break: keep-all;"><strong><span style="font-size: 18pt;"><span style="font-family: ����;font-size:2.0em;">�� �� �� �� ��</span></span></strong></p>
         </td>
         <td colspan="2" rowspan="4" style="border-width: 1pt; border-style: solid; padding: 0cm 4.95pt; width: 27px; height: 27px; border-image: none;">
         <p align="center" style="text-align: center; -ms-word-break: keep-all;"><span style="font-family: ����;"><span style="font-size: medium;">��</span><br />
         &nbsp;<br />
         <span style="font-size: medium;">��</span></span></p>
         </td>
         <td colspan="3" nowrap="nowrap" style="border-width: 1pt 1pt 1pt 0px; border-style: solid solid solid none; padding: 0cm 4.95pt; width: 77px; height: 27px; border-image: none;">
         <p align="center" style="text-align: center; -ms-word-break: keep-all;"><span style="font-family: ����;"><span style="font-size: medium;">�ۼ�</span></span></p>
         </td>
         <td colspan="3" nowrap="nowrap" style="border-width: 1pt 1pt 1pt 0px; border-style: solid solid solid none; padding: 0cm 4.95pt; width: 77px; height: 27px; border-image: none;">
         <p align="center" style="text-align: center; -ms-word-break: keep-all;"><span style="font-family: ����;"><span style="font-size: medium;">����</span></span></p>
         </td>
         <td colspan="2" nowrap="nowrap" style="border-width: 1pt 1pt 1pt 0px; border-style: solid solid solid none; padding: 0cm 4.95pt; width: 77px; height: 27px; border-image: none;">
         <p align="center" style="text-align: center; -ms-word-break: keep-all;"><span style="font-family: ����;"><span style="font-size: medium;">����</span></span></p>
         </td>
         <td nowrap="nowrap" style="border-width: 1pt 1pt 1pt 0px; border-style: solid solid solid none; padding: 0cm 4.95pt; width: 77px; height: 27px;">
         <p align="center" style="text-align: center; -ms-word-break: keep-all;"><span style="font-family: ����;"><span style="font-size: medium;">����</span></span></p>
         </td>
         <td height="27" style="border: 0px rgb(0, 0, 0); height: 27px; border-image: none;">&nbsp;</td>
      </tr>
      <tr style="height: 31px;">
         <td colspan="3" nowrap="nowrap" rowspan="2" style="border-width: 0px 1pt 1pt 0px; border-style: none solid solid none; padding: 0cm 4.95pt; width: 70px; height: 31px;">
		 <div id="stamp" name="stamp">
         	<img src="../pds/stamp.JPG">
         </div>
         </td>
         <td colspan="3" nowrap="nowrap" rowspan="2" style="border-width: 0px 1pt 1pt 0px; border-style: none solid solid none; padding: 0cm 4.95pt; width: 70px; height: 31px;">
         <p align="center" style="text-align: center; -ms-word-break: keep-all;">��</p>
         </td>
         <td colspan="2" nowrap="nowrap" rowspan="2" style="border-width: 0px 1pt 1pt 0px; border-style: none solid solid none; padding: 0cm 4.95pt; width: 70px; height: 31px;">
         <p align="center" style="text-align: center; -ms-word-break: keep-all;">��</p>
         </td>
         <td nowrap="nowrap" rowspan="2" style="border-width: 0px 1pt 1pt 0px; border-style: none solid solid none; padding: 0cm 4.95pt; width: 70px; height: 31px;">
         <p align="center" style="text-align: center; -ms-word-break: keep-all;">��</p>
         </td>
         <td height="31" style="border: 0px rgb(0, 0, 0); height: 31px; border-image: none;">&nbsp;</td>
      </tr>
      <tr style="height: 31px;">
         <td height="31" style="border: 0px rgb(0, 0, 0); height: 31px; border-image: none;">&nbsp;</td>
      </tr>
      <tr style="height: 27px;">
         <td colspan="3" nowrap="nowrap" style="border-width: 0px 1pt 1pt 0px; border-style: none solid solid none; padding: 0cm 4.95pt; width: 77.42px; height: 27px;">
         <p align="center" style="text-align: center; -ms-word-break: keep-all;">&nbsp;/</p>
         </td>
         <td colspan="3" nowrap="nowrap" style="border-width: 0px 1pt 1pt 0px; border-style: none solid solid none; padding: 0cm 4.95pt; width: 77.57px; height: 27px;">
         <p align="center" style="text-align: center; -ms-word-break: keep-all;"><span style="font-family: ����;"><span style="font-size: small;">/</span></span></p>
         </td>
         <td colspan="2" nowrap="nowrap" style="border-width: 0px 1pt 1pt 0px; border-style: none solid solid none; padding: 0cm 4.95pt; width: 57px; height: 27px;">
         <p align="center" style="text-align: center; -ms-word-break: keep-all;"><span style="font-family: ����;"><span style="font-size: small;">/</span></span></p>
         </td>
         <td nowrap="nowrap" style="border-width: 0px 1pt 1pt 0px; border-style: none solid solid none; padding: 0cm 4.95pt; width: 53px; height: 27px;">
         <p align="center" style="text-align: center; -ms-word-break: keep-all;"><span style="font-family: ����;"><span style="font-size: small;">/</span></span></p>
         </td>
         <td height="27" style="border: 0px rgb(0, 0, 0); height: 27px; border-image: none;">&nbsp;</td>
      </tr>
      <tr style="height: 27px;">
         <td colspan="2" nowrap="nowrap" rowspan="2" style="border-width: 0px 1pt 1pt; border-style: none solid solid; padding: 0cm 4.95pt; width: 135.25px; height: 27px; border-image: none;">
         <p style="text-align: center; text-indent: 10pt; -ms-word-break: keep-all;"><span style="font-family: ����;"><span style="font-size: medium;">������ȣ</span></span></p>
         </td>
         <!-- �����ȣ �Է¶� -->
         <td align="center" colspan="5" nowrap="nowrap" rowspan="2" style="border-width: 0px 1pt 1pt 0px; border-style: none solid solid none; width: 185px; height: 27px;">
         <input class="easyui-text" id="report_approval_no" name="report_approval_no" style="width:98%;height:99%; text-align:center; font-size:1.5em;">
         <!-- <p id="report_approval_no" name="report_approval_no" align="center" style="text-align: center; -ms-word-break: keep-all;">&nbsp;</p> -->
         </td>
         <!-- �����ȣ �Է³� -->
         <td colspan="4" rowspan="2" nowrap="nowrap" style="border-width: 0px 1pt 1pt 0px; border-style: none solid solid none; padding: 0cm 4.95pt; width: 83.02px; height: 27px;">
         <p align="left" style="text-align: left; text-indent: 10pt; -ms-word-break: keep-all;"><span style="font-family: ����;"><span style="font-size: medium;">�����</span></span></p>
         </td>
         <!-- ����� �Է¶�  -->
         <td id="approval_date" name="approval_date" colspan="6" rowspan="2" nowrap="nowrap" style="border-width: 0px 1pt 1pt 0px; border-style: none solid solid none; padding: 0cm 4.95pt; width: 99px; height: 27px;">
         <input class="easyui-text" id="approval_date" name="approval_date" data-options="formatter:myformatter,parser:myparser" style="width:100%; text-align:center" value=<%= sf.format(nowTime) %>>
         <%-- <p id="approval_date" name="approval_date" align="center" style="text-align: center; -ms-word-break: keep-all;"><%= sf.format(nowTime) %></p --%>
         </td>
         <!-- ����� �Է³�  -->
         <td colspan="5"  style="border-width: 0px 1pt 1pt 0px; border-style: none solid solid none; padding: 0cm 4.95pt; width: 129px; height: 27px;">
         <p style="text-align: center; -ms-word-break: keep-all;"><span style="font-family: ����;"><span style="font-size: medium;">�� ��</span></span></p>

         <!-- <p style="text-align: center; text-indent: 10pt; -ms-word-break: keep-all;"><span style="font-family: ����;"><span style="font-size: medium;">(</span></span><span style="font-size: small;">��������</span><span style="font-size: small;">)</span></p> -->
         </td>
         <!-- �����(��������)��  -->
         <td colspan="3" nowrap="nowrap" style="border-width: 0px 1pt 1pt 0px; border-style: none solid solid none; padding: 0cm 4.95pt; width: 110px; height: 27px;">
         <input class="easyui-text" id="jikup" name="jikup" style="width:98%;height:99%; text-align:center; font-size:1.5em;">
         <!-- <p id="approval_emp_no" name="approval_emp_no" align="center" style="text-align: center; -ms-word-break: keep-all;">&nbsp;</p> -->
         </td>
         <!-- �����(��������)�� -->
         <td height="27" style="border: 0px rgb(0, 0, 0); height: 27px; border-image: none;">&nbsp;</td>
      </tr>
      <tr style="height: 27px;">
         <td colspan="5" nowrap="nowrap" style="border-width: 0px 1pt 1pt 0px; border-style: none solid solid none; padding: 0cm 4.95pt; width: 129px; height: 27px;">
         <p align="center" style="text-align: center; -ms-word-break: keep-all;"><span style="font-family: ����;"><span style="font-size: medium;">�����</span></span></p>
         </td>
         <!-- ������ܶ� -->
         <td colspan="3" nowrap="nowrap" style="border-width: 0px 1pt 1pt 0px; border-style: none solid solid none; padding: 0cm 4.95pt; width: 110px; height: 27px;">
         <input class="easyui-text" id="emp_name" name="emp_name" style="width:98%;height:99%; text-align:center; font-size:1.5em;">
         <!-- <p align="center" style="text-align: center; -ms-word-break: keep-all;">&nbsp;</p> -->
         </td>
         <!-- ������ܳ� -->
         <td height="27" style="border: 0px rgb(0, 0, 0); height: 27px; border-image: none;">&nbsp;</td>
      </tr>
      <tr style="height: 27px;">
         <td colspan="2" nowrap="nowrap" style="border-width: 0px 1pt 1pt; border-style: none solid solid; padding: 0cm 4.95pt; width: 135.25px; height: 27px; border-image: none;">
         <p style="text-align: center; text-indent: 10pt; -ms-word-break: keep-all;"><span style="font-family: ����;"><span style="font-size: medium;">����</span></span></p>
         </td>
         <!-- ����� -->
         <td align="center" colspan="23" nowrap="nowrap" style="border-width: 0px 1pt 1pt 0px; border-style: none solid solid none; width: 576.75px; height: 27px;">
         <input class="easyui-text" id="approval_title" name="approval_title" style="width:99%;height:99%; text-align:center; font-size:1.5em;">
         <p id="approval_title" name="approval_title" align="center" style="text-align: center; -ms-word-break: keep-all;">&nbsp;</p>
         </td>
         <!-- ���� -->
         <td height="27" style="border: 0px rgb(0, 0, 0); height: 27px; border-image: none;">&nbsp;</td>
      </tr>
      <tr style="height: 27px;">
         <td colspan="2" rowspan="3" style="border-width: 0px 1pt 1pt; border-style: none solid solid; padding: 0cm 4.95pt; width: 135.25px; height: 27px;">
         <p style="text-align: center; text-indent: 10pt; -ms-word-break: keep-all;"><span style="font-family: ����;"><span style="font-size: medium;">�������</span></span></p>

         <p style="text-align: center; text-indent: 10pt; -ms-word-break: keep-all;"><span style="font-family: ����;"><span style="font-size: medium;">(</span></span><span style="font-size: small;">�뵵���</span><span style="font-size: small;">)</span></p>
         </td>
        <!-- �������(�뵵���)��  -->
         <td align="center" colspan="23" nowrap="nowrap" rowspan="3" style="border-width: 0px 1pt 1pt 0px; border-style: none solid solid none; width: 576.75px; height: 27px;">
         <input class="easyui-text" id="approval_reason" name="approval_reason" style="width:99%;height:99%; text-align:center; font-size:1.5em;">
         <p id="approval_reason" name="approval_reason" align="center" style="text-align: center; -ms-word-break: keep-all;">&nbsp;</p>
         </td>
         <!-- �������(�뵵���)��  -->
         <td height="27" style="border: 0px rgb(0, 0, 0); height: 27px; border-image: none;">&nbsp;</td>
      </tr>
      <tr style="height: 27px;">
         <td height="27" style="border: 0px rgb(0, 0, 0); height: 27px; border-image: none;">&nbsp;</td>
      </tr>
      <tr style="height: 17px;">
         <td height="17" style="border: 0px rgb(0, 0, 0); height: 17px; border-image: none;">&nbsp;</td>
      </tr>
      <tr style="height: 27px;">
         <td colspan="25" nowrap="nowrap" style="border-width: 0px 1pt 1pt; border-style: none solid solid; padding: 0cm 4.95pt; width: 716px; height: 27px;">
         <p align="center" style="text-align: center; -ms-word-break: keep-all;"><span style="font-family: ����;"><span style="font-size: medium;">�� �� �� �� �� ��</span></span></p>
         </td>
         <td height="27" style="border: 0px rgb(0, 0, 0); height: 27px; border-image: none;">&nbsp;</td>
      </tr>
      <tr style="height: 27px;">
         <td colspan="8" nowrap="nowrap" style="border-width: 0px 1pt 1pt; border-style: none solid solid; padding: 0cm 4.95pt; width: 305px; height: 27px;">
         <p align="center" style="text-align: center; -ms-word-break: keep-all;"><span style="font-family: ����;"><span style="font-size: medium;">��</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <span style="font-size: medium;">��</span></span></p>
         </td>
         <td colspan="8" nowrap="nowrap" style="border-width: 0px 1pt 1pt 0px; border-style: none solid solid none; padding: 0cm 4.95pt; width: 145px; height: 27px;">
         <p align="center" style="text-align: center; -ms-word-break: keep-all;"><span style="font-family: ����;"><span style="font-size: medium;">�� �� ó</span></span></p>
         </td>
         <td colspan="6" nowrap="nowrap" style="border-width: 0px 1pt 1pt 0px; border-style: none solid solid none; padding: 0cm 4.95pt; width: 156px; height: 27px;">
         <p align="center" style="text-align: center; -ms-word-break: keep-all;"><span style="font-family: ����;"><span style="font-size: medium;">�ݾ�</span><span style="font-size: small;">(</span></span><span style="font-size: medium;">�ΰ��� ����</span><span style="font-size: small;">)</span></p>
         </td>
         <td colspan="3" nowrap="nowrap" style="border-width: 0px 1pt 1pt 0px; border-style: none solid solid none; padding: 0cm 4.95pt; width: 110px; height: 27px;">
         <p align="center" style="text-align: center; -ms-word-break: keep-all;"><span style="font-family: ����;"><span style="font-size: medium;">���</span></span></p>
         </td>
         <td height="27" style="border: 0px rgb(0, 0, 0); height: 27px; border-image: none;">&nbsp;</td>
      </tr>
      <tr style="height: 40px;">
         <!-- ù��° ���� -->
         <td colspan="8" nowrap="nowrap" align="center" style="border-width: 0px 1pt 1pt; border-style: none solid solid; width: 305px; height: 27px;">
         <input class="easyui-text" id="approval_use" name="approval_use" style="width:99%;height:98%; text-align:center; font-size:1.5em;">
         <!-- <p align="center" style="text-align: center; -ms-word-break: keep-all; font-size:1.5em;">&nbsp;</p> -->
         </td>
         <!-- ù��° ���� ��-->
         <!-- ù��° ����ó -->
         <td colspan="8" nowrap="nowrap" align="center" style="border-width: 0px 1pt 1pt 0px; border-style: none solid solid none; width: 145px; height: 27px;">
         <input class="easyui-text" id="approval_expense" name="approval_expense" style="width:98%;height:98%; text-align:center; font-size:1.5em;">
         <!-- <p id="approval_use" name="approval_use" align="center" style="text-align: center; -ms-word-break: keep-all; font-size:1.5em;">&nbsp;</p> -->
         </td>
         <!-- ù��° ����ó�� -->
         <!-- ù���� �ݾ� -->
         <td colspan="6" nowrap="nowrap" align="center" style="border-width: 0px 1pt 1pt 0px; border-style: none solid solid none; width: 156px; height: 27px;">
         <input class="easyui-text" id="approval_cash" name="approval_cash" style="width:98%;height:98%; text-align:center; font-size:1.5em;">
         <!-- <p id="approval_cash" name="approval_cash" align="center" style="text-align: center; -ms-word-break: keep-all; font-size:1.5em;">&nbsp;</p> -->
         </td>
         <!-- ù���� �ݾ׳� -->
         <!-- ù��° ��� -->
         <td colspan="3" nowrap="nowrap" align="center" style="border-width: 0px 1pt 1pt 0px; border-style: none solid solid none; width: 110px; height: 27px;">
         <input class="easyui-text" id="approval_bigo" name="approval_bigo" style="width:97%;height:98%; text-align:center; font-size:1.5em;">
         <!-- <p id="approval_bigo" name="approval_bigo" align="center" style="text-align: center; -ms-word-break: keep-all; font-size:1.5em;">&nbsp;</p> -->
         </td>
         <!-- ù��° ��� -->
         <td height="27" style="border: 0px rgb(0, 0, 0); height: 27px; border-image: none;"></td>
      </tr>
      <tr style="height: 40px;">
      	 <!-- �ι�° ���� -->
         <td colspan="8" nowrap="nowrap" align="center" style="border-width: 0px 1pt 1pt; border-style: none solid solid; width: 305px; height: 27px;">
         <!-- <input class="easyui-text" style="width:99%;height:98%; text-align:center; font-size:1.5em;"> -->
         <p align="center" style="text-align: center; -ms-word-break: keep-all; font-size:1.5em;">&nbsp;</p>
         </td>
         <!-- �ι�° ���� �� -->
	     <!-- �ι�° ������  -->
         <td colspan="8" nowrap="nowrap" align="center" style="border-width: 0px 1pt 1pt 0px; border-style: none solid solid none; width: 145px; height: 27px;">
         <!-- <input class="easyui-text" style="width:98%;height:98%; text-align:center; font-size:1.5em;"> -->
         <p align="center" style="text-align: center; -ms-word-break: keep-all; font-size:1.5em;">&nbsp;</p>
         </td>
         <!-- �ι�° ����ó �� -->
         <!-- �ι�° �ݾ� -->
         <td colspan="6" nowrap="nowrap" align="center" style="border-width: 0px 1pt 1pt 0px; border-style: none solid solid none; width: 156px; height: 27px;">
         <!-- <input class="easyui-text" style="width:98%;height:98%; text-align:center; font-size:1.5em;"> -->
         <p align="center" style="text-align: center; -ms-word-break: keep-all; font-size:1.5em;">&nbsp;</p>
         </td>
         <!-- �ι�° �ݾ� �� -->
         <!-- �ι�° ��� -->
         <td colspan="3" nowrap="nowrap" align="center" style="border-width: 0px 1pt 1pt 0px; border-style: none solid solid none; width: 110px; height: 27px;">
         <!-- <input class="easyui-text" style="width:97%;height:98%; text-align:center; font-size:1.5em;"> -->
         <p align="center" style="text-align: center; -ms-word-break: keep-all; font-size:1.5em;">&nbsp;</p>
         </td>
         <!-- �ι�° ��� �� -->
         <td height="27" style="border: 0px rgb(0, 0, 0); height: 27px; border-image: none;">&nbsp;</td>
      </tr>
      <tr style="height: 40px;">
         <td colspan="8" nowrap="nowrap" style="border-width: 0px 1pt 1pt; border-style: none solid solid; padding: 0cm 4.95pt; width: 305px; height: 27px;">
         <p align="center" style="text-align: center; -ms-word-break: keep-all;">&nbsp;</p>
         </td>
         <td colspan="8" nowrap="nowrap" style="border-width: 0px 1pt 1pt 0px; border-style: none solid solid none; padding: 0cm 4.95pt; width: 145px; height: 27px;">
         <p align="center" style="text-align: center; -ms-word-break: keep-all;">&nbsp;</p>
         </td>
         <td colspan="6" nowrap="nowrap" style="border-width: 0px 1pt 1pt 0px; border-style: none solid solid none; padding: 0cm 4.95pt; width: 156px; height: 27px;">
         <p align="center" style="text-align: center; -ms-word-break: keep-all;">&nbsp;</p>
         </td>
         <td colspan="3" nowrap="nowrap" style="border-width: 0px 1pt 1pt 0px; border-style: none solid solid none; padding: 0cm 4.95pt; width: 110px; height: 27px;">
         <p align="center" style="text-align: center; -ms-word-break: keep-all;">&nbsp;</p>
         </td>
         <td height="27" style="border: 0px rgb(0, 0, 0); height: 27px; border-image: none;">&nbsp;</td>
      </tr>
      <tr style="height: 40px;">
         <td colspan="8" nowrap="nowrap" style="border-width: 0px 1pt 1pt; border-style: none solid solid; padding: 0cm 4.95pt; width: 305px; height: 27px;">
         <p align="center" style="text-align: center; -ms-word-break: keep-all;">&nbsp;</p>
         </td>
         <td colspan="8" nowrap="nowrap" style="border-width: 0px 1pt 1pt 0px; border-style: none solid solid none; padding: 0cm 4.95pt; width: 145px; height: 27px;">
         <p align="center" style="text-align: center; -ms-word-break: keep-all;">&nbsp;</p>
         </td>
         <td colspan="6" nowrap="nowrap" style="border-width: 0px 1pt 1pt 0px; border-style: none solid solid none; padding: 0cm 4.95pt; width: 156px; height: 27px;">
         <p align="center" style="text-align: center; -ms-word-break: keep-all;">&nbsp;</p>
         </td>
         <td colspan="3" nowrap="nowrap" style="border-width: 0px 1pt 1pt 0px; border-style: none solid solid none; padding: 0cm 4.95pt; width: 110px; height: 27px;">
         <p align="center" style="text-align: center; -ms-word-break: keep-all;">��</p>
         </td>
         <td height="27" style="border: 0px rgb(0, 0, 0); height: 27px; border-image: none;">&nbsp;</td>
      </tr>
      <tr style="height: 40px;">
         <td colspan="8" nowrap="nowrap" style="border-width: 0px 1pt 1pt; border-style: none solid solid; padding: 0cm 4.95pt; width: 305px; height: 27px;">
         <p align="center" style="text-align: center; -ms-word-break: keep-all;">&nbsp;</p>
         </td>
         <td colspan="8" nowrap="nowrap" style="border-width: 0px 1pt 1pt 0px; border-style: none solid solid none; padding: 0cm 4.95pt; width: 145px; height: 27px;">
         <p align="center" style="text-align: center; -ms-word-break: keep-all;">&nbsp;</p>
         </td>
         <td colspan="6" nowrap="nowrap" style="border-width: 0px 1pt 1pt 0px; border-style: none solid solid none; padding: 0cm 4.95pt; width: 156px; height: 27px;">
         <p align="center" style="text-align: center; -ms-word-break: keep-all;">&nbsp;</p>
         </td>
         <td colspan="3" nowrap="nowrap" style="border-width: 0px 1pt 1pt 0px; border-style: none solid solid none; padding: 0cm 4.95pt; width: 110px; height: 27px;">
         <p align="center" style="text-align: center; -ms-word-break: keep-all;">��</p>
         </td>
         <td height="27" style="border: 0px rgb(0, 0, 0); height: 27px; border-image: none;">&nbsp;</td>
      </tr>
      <tr style="height: 40px;">
         <td colspan="8" nowrap="nowrap" style="border-width: 0px 1pt 1pt; border-style: none solid solid; padding: 0cm 4.95pt; width: 305px; height: 27px;">
         <p align="center" style="text-align: center; -ms-word-break: keep-all;">&nbsp;</p>
         </td>
         <td colspan="8" nowrap="nowrap" style="border-width: 0px 1pt 1pt 0px; border-style: none solid solid none; padding: 0cm 4.95pt; width: 145px; height: 27px;">
         <p align="center" style="text-align: center; -ms-word-break: keep-all;">&nbsp;</p>
         </td>
         <td colspan="6" nowrap="nowrap" style="border-width: 0px 1pt 1pt 0px; border-style: none solid solid none; padding: 0cm 4.95pt; width: 156px; height: 27px;">
         <p align="center" style="text-align: center; -ms-word-break: keep-all;">&nbsp;</p>
         </td>
         <td colspan="3" nowrap="nowrap" style="border-width: 0px 1pt 1pt 0px; border-style: none solid solid none; padding: 0cm 4.95pt; width: 110px; height: 27px;">
         <p align="center" style="text-align: center; -ms-word-break: keep-all;">��</p>
         </td>
         <td height="27" style="border: 0px rgb(0, 0, 0); height: 27px; border-image: none;">&nbsp;</td>
      </tr>
      <tr style="height: 40px;">
         <td colspan="8" nowrap="nowrap" style="border-width: 0px 1pt 1pt; border-style: none solid solid; padding: 0cm 4.95pt; width: 305px; height: 27px;">
         <p align="center" style="text-align: center; -ms-word-break: keep-all;">&nbsp;</p>
         </td>
         <td colspan="8" nowrap="nowrap" style="border-width: 0px 1pt 1pt 0px; border-style: none solid solid none; padding: 0cm 4.95pt; width: 145px; height: 27px;">
         <p align="center" style="text-align: center; -ms-word-break: keep-all;">&nbsp;</p>
         </td>
         <td colspan="6" nowrap="nowrap" style="border-width: 0px 1pt 1pt 0px; border-style: none solid solid none; padding: 0cm 4.95pt; width: 156px; height: 27px;">
         <p align="center" style="text-align: center; -ms-word-break: keep-all;">&nbsp;</p>
         </td>
         <td colspan="3" nowrap="nowrap" style="border-width: 0px 1pt 1pt 0px; border-style: none solid solid none; padding: 0cm 4.95pt; width: 110px; height: 27px;">
         <p align="center" style="text-align: center; -ms-word-break: keep-all;">��</p>
         </td>
         <td height="27" style="border: 0px rgb(0, 0, 0); height: 27px; border-image: none;">&nbsp;</td>
      </tr>
      <tr style="height: 40px;">
         <td colspan="8" nowrap="nowrap" style="border-width: 0px 1pt 1pt; border-style: none solid solid; padding: 0cm 4.95pt; width: 305px; height: 27px;">
         <p align="center" style="text-align: center; -ms-word-break: keep-all;">&nbsp;</p>
         </td>
         <td colspan="8" nowrap="nowrap" style="border-width: 0px 1pt 1pt 0px; border-style: none solid solid none; padding: 0cm 4.95pt; width: 145px; height: 27px;">
         <p align="center" style="text-align: center; -ms-word-break: keep-all;">&nbsp;</p>
         </td>
         <td colspan="6" nowrap="nowrap" style="border-width: 0px 1pt 1pt 0px; border-style: none solid solid none; padding: 0cm 4.95pt; width: 156px; height: 27px;">
         <p align="center" style="text-align: center; -ms-word-break: keep-all;">&nbsp;</p>
         </td>
         <td colspan="3" nowrap="nowrap" style="border-width: 0px 1pt 1pt 0px; border-style: none solid solid none; padding: 0cm 4.95pt; width: 110px; height: 27px;">
         <p align="center" style="text-align: center; -ms-word-break: keep-all;">��</p>
         </td>
         <td height="27" style="border: 0px rgb(0, 0, 0); height: 27px; border-image: none;">&nbsp;</td>
      </tr>
      <tr style="height: 40px;">
         <td colspan="8" nowrap="nowrap" style="border-width: 0px 1pt 2.25pt; border-style: none solid double; padding: 0cm 4.95pt; width: 305px; height: 27px;">
         <p align="center" style="text-align: center; -ms-word-break: keep-all;">&nbsp;</p>
         </td>
         <td colspan="8" nowrap="nowrap" style="border-width: 0px 1pt 2.25pt 0px; border-style: none solid double none; padding: 0cm 4.95pt; width: 145px; height: 27px;">
         <p align="center" style="text-align: center; -ms-word-break: keep-all;">&nbsp;</p>
         </td>
         <td colspan="6" nowrap="nowrap" style="border-width: 0px 1pt 2.25pt 0px; border-style: none solid double none; padding: 0cm 4.95pt; width: 156px; height: 27px;">
         <p align="center" style="text-align: center; -ms-word-break: keep-all;">&nbsp;</p>
         </td>
         <td colspan="3" nowrap="nowrap" style="border-width: 0px 1pt 2.25pt 0px; border-style: none solid double none; padding: 0cm 4.95pt; width: 110px; height: 27px;">
         <p align="center" style="text-align: center; -ms-word-break: keep-all;">��</p>
         </td>
         <td height="27" style="border: 0px rgb(0, 0, 0); height: 27px; border-image: none;">&nbsp;</td>
      </tr>
      <tr style="height: 40px;">
         <td colspan="16" nowrap="nowrap" style="border-width: 0px 1pt 1pt; border-style: none solid solid; padding: 0cm 4.95pt; width: 449px; height: 27px;">
         <p align="center" style="text-align: center; -ms-word-break: keep-all;"><span style="font-family: ����;"><span style="font-size: small;">��</span></span></p>
         </td>
         <td colspan="6" nowrap="nowrap" style="border-width: 0px 1pt 1pt 0px; border-style: none solid solid none; padding: 0cm 4.95pt; width: 156px; height: 27px;">
         <p style="text-align: right; -ms-word-break: keep-all;">&nbsp;</p>
         </td>
         <td colspan="3" nowrap="nowrap" style="border-width: 0px 1pt 1pt 0px; border-style: none solid solid none; padding: 0cm 4.95pt; width: 110px; height: 27px;">
         <p align="center" style="text-align: center; -ms-word-break: keep-all;">&nbsp;</p>
         </td>
         <td height="27" style="border: 0px rgb(0, 0, 0); height: 27px; border-image: none;">&nbsp;</td>
      </tr>
      <tr style="height: 40px;">
         <td colspan="2" rowspan="4" style="border-width: 0px 1pt 1pt; border-style: none solid solid; padding: 0cm 4.95pt; width: 135.25px; height: 27px; border-image: none;">
         <p align="left" style="text-align: left; text-indent: 10pt; -ms-word-break: keep-all;">�������</p>

         <p align="left" style="text-align: left; text-indent: 10pt; -ms-word-break: keep-all;">(���� ����)</p>
         </td>
         <td colspan="23" rowspan="4" style="border-width: 0px 1pt 1pt 0px; border-style: none solid solid none; padding: 0cm 4.95pt; width: 576.75px; height: 27px;">
         <p align="left" style="text-align: left; -ms-word-break: keep-all;">&nbsp;</p>
         </td>
         <td height="27" style="border: 0px rgb(0, 0, 0); height: 27px; border-image: none;">&nbsp;</td>
      </tr>
      <tr style="height: 27px;">
         <td height="27" style="border: 0px rgb(0, 0, 0); height: 27px; border-image: none;">&nbsp;</td>
      </tr>
      <tr style="height: 27px;">
         <td height="27" style="border: 0px rgb(0, 0, 0); height: 27px; border-image: none;">&nbsp;</td>
      </tr>
      <tr style="height: 27px;">
         <td height="27" style="border: 0px rgb(0, 0, 0); height: 27px; border-image: none;">&nbsp;</td>
      </tr>
      <tr style="height: 27px;">
         <td colspan="25" nowrap="nowrap" rowspan="2" style="border-width: 0px 1pt 1pt; border-style: none solid solid; padding: 0cm 4.95pt; width: 716px; height: 27px;">
         <p align="center" style="text-align: center; -ms-word-break: keep-all;"><u><span style="font-size: 11pt;"><span style="color: blue;"><span style="font-family: ���� ���;">-----</span></span></span></u></p>
         </td>
         <td height="27" style="border: 0px rgb(0, 0, 0); height: 27px; border-image: none;">&nbsp;</td>
      </tr>
      <tr style="height: 27px;">
         <td height="27" style="border: 0px rgb(0, 0, 0); height: 27px; border-image: none;">&nbsp;</td>
      </tr>
      <tr style="height: 27px;">
         <td nowrap="nowrap" style="padding: 0cm 4.95pt; border: rgb(0, 0, 0); width: 198px; height: 27px; border-image: none;">
         </td>
         <td nowrap="nowrap" style="padding: 0cm 4.95pt; border: rgb(0, 0, 0); width: 13.25px; height: 27px; border-image: none;">&nbsp;</td>
         <td nowrap="nowrap" style="padding: 0cm 4.95pt; border: rgb(0, 0, 0); width: 21.69px; height: 27px; border-image: none;">&nbsp;</td>
         <td nowrap="nowrap" style="padding: 0cm 4.95pt; border: rgb(0, 0, 0); width: 18.3px; height: 27px; border-image: none;">&nbsp;</td>
         <td nowrap="nowrap" style="padding: 0cm 4.95pt; border: rgb(0, 0, 0); width: 14px; height: 27px; border-image: none;">&nbsp;</td>
         <td nowrap="nowrap" style="padding: 0cm 4.95pt; border: rgb(0, 0, 0); width: 14px; height: 27px; border-image: none;">&nbsp;</td>
         <td nowrap="nowrap" style="padding: 0cm 4.95pt; border: rgb(0, 0, 0); width: 29.97px; height: 27px; border-image: none;">&nbsp;</td>
         <td nowrap="nowrap" style="padding: 0cm 4.95pt; border: rgb(0, 0, 0); width: 12.02px; height: 27px; border-image: none;">&nbsp;</td>
         <td nowrap="nowrap" style="padding: 0cm 4.95pt; border: rgb(0, 0, 0); width: 19px; height: 27px; border-image: none;">&nbsp;</td>
         <td nowrap="nowrap" style="padding: 0cm 4.95pt; border: rgb(0, 0, 0); width: 19px; height: 27px; border-image: none;">&nbsp;</td>
         <td colspan="2" nowrap="nowrap" style="padding: 0cm 4.95pt; border: rgb(0, 0, 0); width: 52px; height: 27px; border-image: none;">
         <p align="left" style="text-align: left; -ms-word-break: keep-all;"><span style="font-size: 15px;"><strong><span style="font-family: ����;">(��)Kosmo</span></strong></span></p>
         </td>
         <td nowrap="nowrap" style="padding: 0cm 4.95pt; border: rgb(0, 0, 0); width: 14px; height: 27px; border-image: none;">&nbsp;</td>
         <td nowrap="nowrap" style="padding: 0cm 4.95pt; border: rgb(0, 0, 0); width: 14px; height: 27px; border-image: none;">&nbsp;</td>
         <td nowrap="nowrap" style="padding: 0cm 4.95pt; border: rgb(0, 0, 0); width: 14px; height: 27px; border-image: none;">&nbsp;</td>
         <td nowrap="nowrap" style="padding: 0cm 4.95pt; border: rgb(0, 0, 0); width: 14px; height: 27px; border-image: none;">&nbsp;</td>
         <td nowrap="nowrap" style="padding: 0cm 4.95pt; border: rgb(0, 0, 0); width: 27px; height: 27px; border-image: none;">&nbsp;</td>
         <td nowrap="nowrap" style="padding: 0cm 4.95pt; border: rgb(0, 0, 0); width: 34px; height: 27px; border-image: none;">&nbsp;</td>
         <td nowrap="nowrap" style="padding: 0cm 4.95pt; border: rgb(0, 0, 0); width: 23.42px; height: 27px; border-image: none;">&nbsp;</td>
         <td nowrap="nowrap" style="padding: 0cm 4.95pt; border: rgb(0, 0, 0); width: 28.57px; height: 27px; border-image: none;">&nbsp;</td>
         <td nowrap="nowrap" style="padding: 0cm 4.95pt; border: rgb(0, 0, 0); width: 23px; height: 27px; border-image: none;">&nbsp;</td>
         <td nowrap="nowrap" style="padding: 0cm 4.95pt; border: rgb(0, 0, 0); width: 23px; height: 27px; border-image: none;">&nbsp;</td>
         <td nowrap="nowrap" style="padding: 0cm 4.95pt; border: rgb(0, 0, 0); width: 44px; height: 27px; border-image: none;">&nbsp;</td>
         <td colspan="2" nowrap="nowrap" style="padding: 0cm 4.95pt; border: rgb(0, 0, 0); width: 67px; height: 27px; border-image: none;">
         </td>
      </tr>
   </tbody>
</table>
<!-- </textarea> -->
<table align="center">
	  <tr>
      	 <td>
			<a href="javascript:approvalIns()" class="easyui-linkbutton" data-options="size:'large'" style="width:100px;">�� �� �� ��</a>
			<a href="#" class="easyui-linkbutton" data-options="size:'large'" style="width: 100px;" onClick="back_approvalList()">��        ��</a>
			<a href="#" class="easyui-linkbutton" data-options="size:'large'" style="width: 100px;" onClick="stamp_img()">��        ��</a>
      	 </td>
      </tr>      
</table>
</td>
</tr>

	<!-- �����Է�  ��-->
</table>
</form>
</div>
<!-- ������Ǽ� �� -->







<!-- <table border="1" width="1000px" height="50px" data-option="singleSelect: true">
	<tr> 
		<td><input type="radio" name="lang" width="250px" ><span style="font-size: medium;">������Ǽ�</span></td>
		<td><input type="radio" name="lang" width="250px"><span style="font-size: medium;">�ø���</span></td>
	</tr>
</table>
<br> -->
<%-- <div title="ǰ�Ǽ�">
<form id="fileChoice1" name="fileChoice1">
<table border="1">
	<tr>
		<td>
		<label style="font-size: medium;">���ȵ�� : </label>
		<input type="radio" name="lang" ><span style="font-size: medium;">�Ϲ�</span>&nbsp;&nbsp;
		<input type="radio" name="lang" ><span style="font-size: medium;">����</span>
		
		<td style="font-size: medium;"><label style="font-size: medium;">����� : </label>
		<%= sf.format(nowTime) %>
		<!-- <input class="easyui-datebox" data-options="formatter:myformatter,parser:myparser" style="width:50%;"> -->
		</td>
	</tr>
	 <tr>
	 	<td>
	 	<label style="font-size: medium;">�߿䵵 : </label>&nbsp;&nbsp;
		<input type="radio" name="lang" ><span style="font-size: medium;">���</span>&nbsp;&nbsp;
		<input type="radio" name="lang" ><span style="font-size: medium;">����</span>&nbsp;&nbsp;
		<input type="radio" name="lang" ><span style="font-size: medium;">����</span>&nbsp;&nbsp;
		<input type="radio" name="lang" ><span style="font-size: medium;">����</span>
		</td>
		<td>
			<label style="font-size: medium;">���� ������:</label>
            <select class="easyui-combobox" id="cb_dept1" name="cb_dept1" style="width:20%; font-size: medium;">
                	<option value="">�� ��</option>
                	<option>----------</option>
                	<option>������</option>
                	<option>�ѹ���</option>
                	<option>�λ��</option>
                	<option>�ӿ�</option>
                	
                </select>
                <select class="easyui-combobox" id="cb_name1" name="cb_name1" style="width:20%; font-size: medium;" ></select></td>
	</tr>
	<tr>
	 	<td colspan="2">
	 	<label style="font-size: medium;">÷������ : </label>&nbsp;&nbsp;
	 	<input class="easyui-filebox" data-options="prompt:'Choose a file...'" style="width:500px">
		</td>
	</tr>
	<!-- �����Է� ���� -->
	<tr>
		<td colspan=2 align="center">
		<!-- <textarea id="test1" name="test1" style=width:990px;height:1050px;> -->
		<!-- ��ȼ� -->
<table>
<tr>
<td>
<div style="clear: both;">&nbsp;</div>

<p style="-ms-word-break: keep-all;">&nbsp;</p>

<p><span style="font-family: ����ü;"><span style="color: white;"><span style="font-size: small;">y</span></span></span></p>
</td>
</tr>
</table>
<table align="center" border="1" cellpadding="0" cellspacing="0" style="margin: auto auto auto 2pt; border: currentColor; border-collapse: collapse; border-image: none;">
   <tbody>
      <tr style="height: 25px;">
         <td rowspan="2" style="border-width: 0px 1.5pt 0px 0px; border-style: none solid none none; padding: 0cm 0.6pt; width: 318px; height: 25px; border-image: none;">
         <p align="center" style="text-align: center; line-height: normal; -ms-word-break: keep-all;"><strong><span style="font-size: 20pt;"><span style="font-family: ����ü,serif;"><span style="color: rgb(0, 0, 255);">���ǰ�Ǽ�</span></span></span></strong></p>
         </td>
         <td rowspan="2" style="border-width: 1.5pt 1pt 1.5pt 0px; border-style: solid solid solid none; padding: 0cm 0.6pt; width: 29px; height: 25px;">
         <p align="center" style="text-align: center; line-height: normal; -ms-word-break: keep-all;"><span style="font-family: ����ü;"><span style="font-size: small;">��</span></span></p>

         <p align="center" style="text-align: center; line-height: normal; -ms-word-break: keep-all;">&nbsp;</p>

         <p align="center" style="text-align: center; line-height: normal; -ms-word-break: keep-all;"><span style="font-family: ����ü;"><span style="font-size: small;">��</span></span></p>
         </td>
         <td style="border-width: 1.5pt 1pt 1pt 0px; border-style: solid solid solid none; padding: 0cm 0.6pt; width: 63px; height: 25px;">
         <p align="center" style="text-align: center; line-height: normal; -ms-word-break: keep-all;"><span style="font-family: ����ü;"><span style="font-size: small;">��&nbsp; ��</span></span></p>
         </td>
         <td style="border-width: 1.5pt 1pt 1pt 0px; border-style: solid solid solid none; padding: 0cm 0.6pt; width: 63px; height: 25px;">
         <p align="center" style="text-align: center; line-height: normal; -ms-word-break: keep-all;"><span style="font-family: ����ü;"><span style="font-size: small;">�μ���</span></span></p>
         </td>
         <td style="border-width: 1.5pt 1.5pt 1pt 0px; border-style: solid solid solid none; padding: 0cm 0.6pt; width: 63px; height: 25px;">
         <p align="center" style="text-align: center; line-height: normal; -ms-word-break: keep-all;"><span style="font-family: ����ü;"><span style="font-size: small;">��&nbsp;&nbsp; ��</span></span></p>
         </td>
      </tr>
      <tr style="height: 59px;">
         <td style="border-width: 0px 1pt 1.5pt 0px; border-style: none solid solid none; padding: 0cm 0.6pt; width: 63px; height: 59px;">
         <p align="center" style="text-align: center; line-height: normal; -ms-word-break: keep-all;">&nbsp;</p>
         </td>
         <td style="border-width: 0px 1pt 1.5pt 0px; border-style: none solid solid none; padding: 0cm 0.6pt; width: 63px; height: 59px;">
         <p align="center" style="text-align: center; line-height: normal; -ms-word-break: keep-all;">&nbsp;</p>
         </td>
         <td style="border-width: 0px 1.5pt 1.5pt 0px; border-style: none solid solid none; padding: 0cm 0.6pt; width: 63px; height: 59px;">
         <p align="center" style="text-align: center; line-height: normal; -ms-word-break: keep-all;">&nbsp;</p>
         </td>
      </tr>
   </tbody>
</table>
<table>
<tr>
<td>
<div style="clear: both;">&nbsp;</div>

<p style="-ms-word-break: keep-all;">&nbsp;</p>

<p><span style="font-family: ����ü;"><span style="color: white;"><span style="font-size: small;">y</span></span></span></p>
</td>
</tr>
</table>
<table align="center" border="1" cellpadding="0" cellspacing="0" style="margin: auto auto auto 2.15pt; border: currentColor; border-collapse: collapse; border-image: none;">
   <tbody>
      <tr style="height: 32px;">
         <td style="background: rgb(255, 225, 225); border-width: 1.5pt 1pt 1pt 1.5pt; border-style: solid; padding: 0cm 0.6pt; width: 91px; height: 32px;">
         <p align="center" style="text-align: center; line-height: normal; -ms-word-break: keep-all;"><span style="font-family: ����ü;"><span style="font-size: medium;">�� �� �� ȣ</span></span></p>
         </td>
         <td style="border-width: 1.5pt 1.5pt 1pt 0px; border-style: solid solid solid none; padding: 0cm 0.6pt; width: 507px; height: 32px;">
         <p align="center" style="text-align: center; line-height: normal;">&nbsp;</p>
         </td>
      </tr>
      <tr style="height: 32px;">
         <td style="background: rgb(255, 225, 225); border-width: 0px 1pt 1pt 1.5pt; border-style: none solid solid; padding: 0cm 0.6pt; width: 91px; height: 32px;">
         <p align="center" style="text-align: center; line-height: normal; -ms-word-break: keep-all;"><span style="font-family: ����ü;"><span style="font-size: medium;">�� �� �� ��</span></span></p>
         </td>
         <td style="border-width: 0px 1.5pt 1pt 0px; border-style: none solid solid none; padding: 0cm 0.6pt; width: 507px; height: 32px;">
         <p align="center" style="text-align: center; line-height: normal;">&nbsp;</p>
         </td>
      </tr>
      <tr style="height: 32px;">
         <td style="background: rgb(255, 225, 225); border-width: 0px 1pt 1pt 1.5pt; border-style: none solid solid; padding: 0cm 0.6pt; width: 91px; height: 32px;">
         <p align="center" style="text-align: center; line-height: normal; -ms-word-break: keep-all;"><span style="font-family: ����ü;"><span style="font-size: medium;">�� �� �� ��</span></span></p>
         </td>
         <td style="border-width: 0px 1.5pt 1pt 0px; border-style: none solid solid none; padding: 0cm 0.6pt; width: 507px; height: 32px;">
         <p align="center" style="text-align: center; line-height: normal;">&nbsp;</p>
         </td>
      </tr>
      <tr style="height: 32px;">
         <td style="background: rgb(255, 225, 225); border-width: 0px 1pt 1pt 1.5pt; border-style: none solid solid; padding: 0cm 0.6pt; width: 91px; height: 32px;">
         <p align="center" style="text-align: center; line-height: normal; -ms-word-break: keep-all;"><span style="font-family: ����ü;"><span style="font-size: medium;">�� �� �� ��</span></span></p>
         </td>
         <td style="border-width: 0px 1.5pt 1pt 0px; border-style: none solid solid none; padding: 0cm 0.6pt; width: 507px; height: 32px;">
         <p align="center" style="text-align: center; line-height: normal;">&nbsp;</p>
         </td>
      </tr>
      <tr style="height: 32px;">
         <td style="background: rgb(255, 225, 225); border-width: 0px 1pt 1pt 1.5pt; border-style: none solid solid; padding: 0cm 0.6pt; width: 91px; height: 32px;">
         <p align="center" style="text-align: center; line-height: normal; -ms-word-break: keep-all;"><span style="font-family: ����ü;"><span style="font-size: medium;">��&nbsp; ��&nbsp; ��</span></span></p>
         </td>
         <td style="border-width: 0px 1.5pt 1pt 0px; border-style: none solid solid none; padding: 0cm 0.6pt; width: 507px; height: 32px;">
         <p align="center" style="text-align: center; line-height: normal;">&nbsp;</p>
         </td>
      </tr>
      <tr style="height: 40px;">
         <td style="background: rgb(255, 225, 225); border-width: 0px 1pt 1pt 1.5pt; border-style: none solid solid; padding: 0cm 0.6pt; width: 91px; height: 40px;">
         <p align="center" style="text-align: center; line-height: normal; -ms-word-break: keep-all;"><span style="font-family: ����ü;"><span style="font-size: medium;">���� ������</span></span></p>

         <p align="center" style="text-align: center; line-height: normal; -ms-word-break: keep-all;"><span style="font-family: ����ü;"><span style="font-size: medium;">��&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ��</span></span></p>
         </td>
         <td style="border-width: 0px 1.5pt 1pt 0px; border-style: none solid solid none; padding: 0cm 0.6pt; width: 507px; height: 40px;">
         <p align="center" style="text-align: center; line-height: normal;">&nbsp;</p>
         </td>
      </tr>
      <tr style="height: 32px;">
         <td style="background: rgb(255, 225, 225); border-width: 0px 1pt 1pt 1.5pt; border-style: none solid solid; padding: 0cm 0.6pt; width: 91px; height: 32px;">
         <p align="center" style="text-align: center; line-height: normal; -ms-word-break: keep-all;"><span style="font-family: ����ü;"><span style="font-size: medium;">��&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ��</span></span></p>
         </td>
         <td style="border-width: 0px 1.5pt 1pt 0px; border-style: none solid solid none; padding: 0cm 0.6pt; width: 507px; height: 32px;">
         <p align="center" style="text-align: center; line-height: normal;">&nbsp;</p>
         </td>
      </tr>
      <tr style="height: 32px;">
         <td style="background: rgb(255, 225, 225); border-width: 0px 1pt 1pt 1.5pt; border-style: none solid solid; padding: 0cm 0.6pt; width: 91px; height: 32px;">
         <p align="center" style="text-align: center; line-height: normal; -ms-word-break: keep-all;"><span style="font-family: ����ü;"><span style="font-size: medium;">��&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ��</span></span></p>
         </td>
         <td style="border-width: 0px 1.5pt 1pt 0px; border-style: none solid solid none; padding: 0cm 0.6pt; width: 507px; height: 32px;">
         <p align="center" style="text-align: center; line-height: normal;">&nbsp;</p>
         </td>
      </tr>
      <tr style="height: 398px;">
         <td colspan="2" style="border-width: 0px 1.5pt; border-style: none solid; padding: 0cm 0.6pt; width: 598px; height: 398px;">
         <p align="center" style="text-align: center; line-height: 122%; -ms-word-break: keep-all;"><span style="font-family: ����ü;"><span style="font-size: medium;">�Ʒ��� ���� ǰ���Ͽ��� �簡 �ٶ��ϴ�.</span></span></p>

         <p style="line-height: 122%; -ms-word-break: keep-all;">&nbsp;</p>

         <p style="line-height: 122%; -ms-word-break: keep-all;">&nbsp;</p>

         <p align="center" style="text-align: center; line-height: 122%; -ms-word-break: keep-all;"><span style="font-size: small;"><strong><span style="font-family: ����ü; font-size:1.5em;">- </span></strong></span><strong><span style="font-family: ����ü;">��&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; �� -</span></strong></p>

         <p style="line-height: 122%; -ms-word-break: keep-all;">&nbsp;</p>

         <p style="line-height: 122%; -ms-word-break: keep-all;">&nbsp;</p>

         <p style="line-height: 122%; -ms-word-break: keep-all;">&nbsp;</p>

         <p style="line-height: 122%; -ms-word-break: keep-all;">&nbsp;</p>

         <p style="line-height: 122%; text-indent: 5pt; -ms-word-break: keep-all;"><span style="font-size: small;"><span style="font-family: ����ü; font-size:1.5em;">1. </span></span><span style="font-family: ����ü; font-size:1.5em;">��&nbsp; �� : </span></p>

         <p style="line-height: 122%; text-indent: 5pt; -ms-word-break: keep-all;">&nbsp;</p>

         <p style="line-height: 122%; text-indent: 5pt; -ms-word-break: keep-all;"><span style="font-size: small;"><span style="font-family: ����ü; font-size:1.5em;">2. </span></span><span style="font-family: ����ü; font-size:1.5em;">��&nbsp; �� : </span></p>

         <p style="line-height: 122%; text-indent: 5pt; -ms-word-break: keep-all;">&nbsp;</p>

         <p style="line-height: 122%; text-indent: 5pt; -ms-word-break: keep-all;">&nbsp;</p>

         <p style="line-height: 122%; text-indent: 5pt; -ms-word-break: keep-all;">&nbsp;</p>

         <p style="line-height: 122%; text-indent: 5pt; -ms-word-break: keep-all;"><span style="font-size: small;"><span style="font-family: ����ü; font-size:1.5em;">3. </span></span><span style="font-family: ����ü; font-size:1.5em;">��&nbsp; �� : </span></p>

         <p style="line-height: 122%; text-indent: 5pt; -ms-word-break: keep-all;">&nbsp;</p>

         <p style="line-height: 122%; text-indent: 5pt; -ms-word-break: keep-all;"><span style="font-size: small;"><span style="font-family: ����ü; font-size:1.5em;">4. </span></span><span style="font-family: ����ü; font-size:1.5em;">������� : </span></p>

         <p style="line-height: 122%; text-indent: 5pt; -ms-word-break: keep-all;">&nbsp;</p>

         <p style="line-height: 122%; text-indent: 5pt; -ms-word-break: keep-all;"><span style="font-size: small;"><span style="font-family: ����ü; font-size:1.5em;">5. </span></span><span style="font-family: ����ü; font-size:1.5em;">������</span></p>
         </td>
      </tr>
      <tr style="height: 83px;">
         <td colspan="2" style="border-width: 0px 1.5pt 1.5pt; border-style: none solid solid; padding: 0cm 0.6pt; width: 598px; height: 83px; border-image: none;">
         <p align="center" style="margin: 0cm 15pt 0pt 0cm; text-align: center; line-height: normal; -ms-word-break: keep-all;"><span style="font-size: small;"><span style="font-family: ����ü; font-size:1.5em;">20&nbsp; </span></span><span style="font-family: ����ü; font-size:1.5em;">��&nbsp; ��&nbsp; ��</span></p>
         </td>
      </tr>
	<tr>
		<td colspan=2>
		<div style="clear: both; margin-left: 240px;"><span style="font-size: 9pt;"><span style="font-family: ���� ���; font-size:1.5em;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (��)Kosmo</span></span></div>

		<div style="clear: both;">&nbsp;</div>
		</td>
	</tr>
   </tbody>
</table>
<!-- </textarea> -->
</form>
	<!-- �����Է�  ��--> --%>
</div>
</div>
</body>
</html>