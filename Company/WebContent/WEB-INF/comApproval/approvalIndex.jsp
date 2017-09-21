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
 			data:'EMP_NAME'//vo:소문자, map:대문자
 			//emp테에블에 입력할 때 넘길 값 - 부서번호
 			,valueField:"EMP_NO"
 			//화면에 보열줄 값 = 부서이름
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
 			data:'EMP_NAME'//vo:소문자, map:대문자
 			//emp테에블에 입력할 때 넘길 값 - 부서번호
 			,valueField:"EMP_NO"
 			//화면에 보열줄 값 = 부서이름
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
		//alert("도장");
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
				//alert('선택');
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
		<td><input type="radio" name="lang"><span style="font-size: medium;">지출결의서</span></td>
		<td><input type="radio" name="lang"><span style="font-size: medium;">품의서</span></td>
	</tr>
</table>
<br> -->
<div class="easyui-tabs" data-options="tabWidth:300" style="width:1002px;">
<form id="fileChoice" name="fileChoice">
<input type="hidden" value="지출결의서" id="section" name="section">
<input type="hidden" value="900001" id="emp_no" name="emp_no">
<table border="1" width="1000px">
	<tr>
		<td>
		<label style="font-size: medium;">보안등급 : </label>
		<input type="radio" name="lang" ><span style="font-size: medium;">일반</span>&nbsp;&nbsp;
		<input type="radio" name="lang" ><span style="font-size: medium;">보안</span>
		
		<td style="font-size: medium;"><label style="font-size: medium;">기안일 : </label>
		<%= sf.format(nowTime) %>
		<!-- <input class="easyui-datebox" data-options="formatter:myformatter,parser:myparser" style="width:50%;"> -->
		</td>
	</tr>
	 <tr>
	 	<td>
	 	<label style="font-size: medium;">중요도 : </label>&nbsp;&nbsp;
		<input type="radio" id="approval_level" name="approval_level" ><span style="font-size: medium;">긴급</span>&nbsp;&nbsp;
		<input type="radio" id="approval_level" name="approval_level" ><span style="font-size: medium;">높음</span>&nbsp;&nbsp;
		<input type="radio" id="approval_level" name="approval_level" ><span style="font-size: medium;">보통</span>&nbsp;&nbsp;
		<input type="radio" id="approval_level" name="approval_level" ><span style="font-size: medium;">낮음</span>
		</td>
		<td>
			<label style="font-size: medium;">다음 결제자:</label>
            <select class="easyui-combobox" id="cb_dept" name="cb_dept" style="width:20%; font-size: medium;">
                	<option value="">부 서</option>
                	<option>----------</option>
                	<option>영업부</option>
                	<option>총무부</option>
                	<option>인사부</option>
                	<option>임원</option>
                	
            </select>
            <input class="easyui-combobox" id="deptm" name="deptm" data-options="valueField:'EMP_NO',textField:'EMP_NAME'" style="width:20%; font-size: medium;"></td>
	</tr>
	<tr>
	 	<td colspan="2">
	 	<label style="font-size: medium;">첨부파일 : </label>&nbsp;&nbsp;
	 	<input class="easyui-filebox" data-options="prompt:'Choose a file...'" style="width:500px">
		</td>
	</tr>
	<!-- 문서입력 시작 -->
	<tr>
	<td colspan="2">
	<!-- <textarea id="test" name="test" rows="70" cols="138" > -->
	<!-- 지출결의서 -->
<table border="0" cellpadding="0" cellspacing="0" style="margin: auto auto auto 4.2pt; width: 723px; height: 769px; border-collapse: collapse;">
   <tbody>
      <tr style="height: 27px;">
         <td colspan="14" nowrap="nowrap" rowspan="4" style="border-width: 1pt 0px 1pt 1pt; border-style: solid none solid solid; padding: 0cm 4.95pt; width: 422px; height: 27px;">
         <p align="center" style="text-align: center; -ms-word-break: keep-all;"><strong><span style="font-size: 18pt;"><span style="font-family: 굴림;font-size:2.0em;">지 출 결 의 서</span></span></strong></p>
         </td>
         <td colspan="2" rowspan="4" style="border-width: 1pt; border-style: solid; padding: 0cm 4.95pt; width: 27px; height: 27px; border-image: none;">
         <p align="center" style="text-align: center; -ms-word-break: keep-all;"><span style="font-family: 굴림;"><span style="font-size: medium;">결</span><br />
         &nbsp;<br />
         <span style="font-size: medium;">재</span></span></p>
         </td>
         <td colspan="3" nowrap="nowrap" style="border-width: 1pt 1pt 1pt 0px; border-style: solid solid solid none; padding: 0cm 4.95pt; width: 77px; height: 27px; border-image: none;">
         <p align="center" style="text-align: center; -ms-word-break: keep-all;"><span style="font-family: 굴림;"><span style="font-size: medium;">작성</span></span></p>
         </td>
         <td colspan="3" nowrap="nowrap" style="border-width: 1pt 1pt 1pt 0px; border-style: solid solid solid none; padding: 0cm 4.95pt; width: 77px; height: 27px; border-image: none;">
         <p align="center" style="text-align: center; -ms-word-break: keep-all;"><span style="font-family: 굴림;"><span style="font-size: medium;">검토</span></span></p>
         </td>
         <td colspan="2" nowrap="nowrap" style="border-width: 1pt 1pt 1pt 0px; border-style: solid solid solid none; padding: 0cm 4.95pt; width: 77px; height: 27px; border-image: none;">
         <p align="center" style="text-align: center; -ms-word-break: keep-all;"><span style="font-family: 굴림;"><span style="font-size: medium;">검토</span></span></p>
         </td>
         <td nowrap="nowrap" style="border-width: 1pt 1pt 1pt 0px; border-style: solid solid solid none; padding: 0cm 4.95pt; width: 77px; height: 27px;">
         <p align="center" style="text-align: center; -ms-word-break: keep-all;"><span style="font-family: 굴림;"><span style="font-size: medium;">승인</span></span></p>
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
         <p align="center" style="text-align: center; -ms-word-break: keep-all;">　</p>
         </td>
         <td colspan="2" nowrap="nowrap" rowspan="2" style="border-width: 0px 1pt 1pt 0px; border-style: none solid solid none; padding: 0cm 4.95pt; width: 70px; height: 31px;">
         <p align="center" style="text-align: center; -ms-word-break: keep-all;">　</p>
         </td>
         <td nowrap="nowrap" rowspan="2" style="border-width: 0px 1pt 1pt 0px; border-style: none solid solid none; padding: 0cm 4.95pt; width: 70px; height: 31px;">
         <p align="center" style="text-align: center; -ms-word-break: keep-all;">　</p>
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
         <p align="center" style="text-align: center; -ms-word-break: keep-all;"><span style="font-family: 굴림;"><span style="font-size: small;">/</span></span></p>
         </td>
         <td colspan="2" nowrap="nowrap" style="border-width: 0px 1pt 1pt 0px; border-style: none solid solid none; padding: 0cm 4.95pt; width: 57px; height: 27px;">
         <p align="center" style="text-align: center; -ms-word-break: keep-all;"><span style="font-family: 굴림;"><span style="font-size: small;">/</span></span></p>
         </td>
         <td nowrap="nowrap" style="border-width: 0px 1pt 1pt 0px; border-style: none solid solid none; padding: 0cm 4.95pt; width: 53px; height: 27px;">
         <p align="center" style="text-align: center; -ms-word-break: keep-all;"><span style="font-family: 굴림;"><span style="font-size: small;">/</span></span></p>
         </td>
         <td height="27" style="border: 0px rgb(0, 0, 0); height: 27px; border-image: none;">&nbsp;</td>
      </tr>
      <tr style="height: 27px;">
         <td colspan="2" nowrap="nowrap" rowspan="2" style="border-width: 0px 1pt 1pt; border-style: none solid solid; padding: 0cm 4.95pt; width: 135.25px; height: 27px; border-image: none;">
         <p style="text-align: center; text-indent: 10pt; -ms-word-break: keep-all;"><span style="font-family: 굴림;"><span style="font-size: medium;">문서번호</span></span></p>
         </td>
         <!-- 결재번호 입력란 -->
         <td align="center" colspan="5" nowrap="nowrap" rowspan="2" style="border-width: 0px 1pt 1pt 0px; border-style: none solid solid none; width: 185px; height: 27px;">
         <input class="easyui-text" id="report_approval_no" name="report_approval_no" style="width:98%;height:99%; text-align:center; font-size:1.5em;">
         <!-- <p id="report_approval_no" name="report_approval_no" align="center" style="text-align: center; -ms-word-break: keep-all;">&nbsp;</p> -->
         </td>
         <!-- 결재번호 입력끝 -->
         <td colspan="4" rowspan="2" nowrap="nowrap" style="border-width: 0px 1pt 1pt 0px; border-style: none solid solid none; padding: 0cm 4.95pt; width: 83.02px; height: 27px;">
         <p align="left" style="text-align: left; text-indent: 10pt; -ms-word-break: keep-all;"><span style="font-family: 굴림;"><span style="font-size: medium;">기안일</span></span></p>
         </td>
         <!-- 기안일 입력란  -->
         <td id="approval_date" name="approval_date" colspan="6" rowspan="2" nowrap="nowrap" style="border-width: 0px 1pt 1pt 0px; border-style: none solid solid none; padding: 0cm 4.95pt; width: 99px; height: 27px;">
         <input class="easyui-text" id="approval_date" name="approval_date" data-options="formatter:myformatter,parser:myparser" style="width:100%; text-align:center" value=<%= sf.format(nowTime) %>>
         <%-- <p id="approval_date" name="approval_date" align="center" style="text-align: center; -ms-word-break: keep-all;"><%= sf.format(nowTime) %></p --%>
         </td>
         <!-- 기안일 입력끝  -->
         <td colspan="5"  style="border-width: 0px 1pt 1pt 0px; border-style: none solid solid none; padding: 0cm 4.95pt; width: 129px; height: 27px;">
         <p style="text-align: center; -ms-word-break: keep-all;"><span style="font-family: 굴림;"><span style="font-size: medium;">직 급</span></span></p>

         <!-- <p style="text-align: center; text-indent: 10pt; -ms-word-break: keep-all;"><span style="font-family: 굴림;"><span style="font-size: medium;">(</span></span><span style="font-size: small;">직위성명</span><span style="font-size: small;">)</span></p> -->
         </td>
         <!-- 기안자(직위성명)란  -->
         <td colspan="3" nowrap="nowrap" style="border-width: 0px 1pt 1pt 0px; border-style: none solid solid none; padding: 0cm 4.95pt; width: 110px; height: 27px;">
         <input class="easyui-text" id="jikup" name="jikup" style="width:98%;height:99%; text-align:center; font-size:1.5em;">
         <!-- <p id="approval_emp_no" name="approval_emp_no" align="center" style="text-align: center; -ms-word-break: keep-all;">&nbsp;</p> -->
         </td>
         <!-- 기안자(직위성명)끝 -->
         <td height="27" style="border: 0px rgb(0, 0, 0); height: 27px; border-image: none;">&nbsp;</td>
      </tr>
      <tr style="height: 27px;">
         <td colspan="5" nowrap="nowrap" style="border-width: 0px 1pt 1pt 0px; border-style: none solid solid none; padding: 0cm 4.95pt; width: 129px; height: 27px;">
         <p align="center" style="text-align: center; -ms-word-break: keep-all;"><span style="font-family: 굴림;"><span style="font-size: medium;">기안자</span></span></p>
         </td>
         <!-- 지출수단란 -->
         <td colspan="3" nowrap="nowrap" style="border-width: 0px 1pt 1pt 0px; border-style: none solid solid none; padding: 0cm 4.95pt; width: 110px; height: 27px;">
         <input class="easyui-text" id="emp_name" name="emp_name" style="width:98%;height:99%; text-align:center; font-size:1.5em;">
         <!-- <p align="center" style="text-align: center; -ms-word-break: keep-all;">&nbsp;</p> -->
         </td>
         <!-- 지출수단끝 -->
         <td height="27" style="border: 0px rgb(0, 0, 0); height: 27px; border-image: none;">&nbsp;</td>
      </tr>
      <tr style="height: 27px;">
         <td colspan="2" nowrap="nowrap" style="border-width: 0px 1pt 1pt; border-style: none solid solid; padding: 0cm 4.95pt; width: 135.25px; height: 27px; border-image: none;">
         <p style="text-align: center; text-indent: 10pt; -ms-word-break: keep-all;"><span style="font-family: 굴림;"><span style="font-size: medium;">제목</span></span></p>
         </td>
         <!-- 제목란 -->
         <td align="center" colspan="23" nowrap="nowrap" style="border-width: 0px 1pt 1pt 0px; border-style: none solid solid none; width: 576.75px; height: 27px;">
         <input class="easyui-text" id="approval_title" name="approval_title" style="width:99%;height:99%; text-align:center; font-size:1.5em;">
         <p id="approval_title" name="approval_title" align="center" style="text-align: center; -ms-word-break: keep-all;">&nbsp;</p>
         </td>
         <!-- 제목끝 -->
         <td height="27" style="border: 0px rgb(0, 0, 0); height: 27px; border-image: none;">&nbsp;</td>
      </tr>
      <tr style="height: 27px;">
         <td colspan="2" rowspan="3" style="border-width: 0px 1pt 1pt; border-style: none solid solid; padding: 0cm 4.95pt; width: 135.25px; height: 27px;">
         <p style="text-align: center; text-indent: 10pt; -ms-word-break: keep-all;"><span style="font-family: 굴림;"><span style="font-size: medium;">지출사유</span></span></p>

         <p style="text-align: center; text-indent: 10pt; -ms-word-break: keep-all;"><span style="font-family: 굴림;"><span style="font-size: medium;">(</span></span><span style="font-size: small;">용도명기</span><span style="font-size: small;">)</span></p>
         </td>
        <!-- 지출사유(용도명기)란  -->
         <td align="center" colspan="23" nowrap="nowrap" rowspan="3" style="border-width: 0px 1pt 1pt 0px; border-style: none solid solid none; width: 576.75px; height: 27px;">
         <input class="easyui-text" id="approval_reason" name="approval_reason" style="width:99%;height:99%; text-align:center; font-size:1.5em;">
         <p id="approval_reason" name="approval_reason" align="center" style="text-align: center; -ms-word-break: keep-all;">&nbsp;</p>
         </td>
         <!-- 지출사유(용도명기)끝  -->
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
         <p align="center" style="text-align: center; -ms-word-break: keep-all;"><span style="font-family: 굴림;"><span style="font-size: medium;">지 출 목 록 내 역</span></span></p>
         </td>
         <td height="27" style="border: 0px rgb(0, 0, 0); height: 27px; border-image: none;">&nbsp;</td>
      </tr>
      <tr style="height: 27px;">
         <td colspan="8" nowrap="nowrap" style="border-width: 0px 1pt 1pt; border-style: none solid solid; padding: 0cm 4.95pt; width: 305px; height: 27px;">
         <p align="center" style="text-align: center; -ms-word-break: keep-all;"><span style="font-family: 굴림;"><span style="font-size: medium;">내</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <span style="font-size: medium;">역</span></span></p>
         </td>
         <td colspan="8" nowrap="nowrap" style="border-width: 0px 1pt 1pt 0px; border-style: none solid solid none; padding: 0cm 4.95pt; width: 145px; height: 27px;">
         <p align="center" style="text-align: center; -ms-word-break: keep-all;"><span style="font-family: 굴림;"><span style="font-size: medium;">지 출 처</span></span></p>
         </td>
         <td colspan="6" nowrap="nowrap" style="border-width: 0px 1pt 1pt 0px; border-style: none solid solid none; padding: 0cm 4.95pt; width: 156px; height: 27px;">
         <p align="center" style="text-align: center; -ms-word-break: keep-all;"><span style="font-family: 굴림;"><span style="font-size: medium;">금액</span><span style="font-size: small;">(</span></span><span style="font-size: medium;">부가세 포함</span><span style="font-size: small;">)</span></p>
         </td>
         <td colspan="3" nowrap="nowrap" style="border-width: 0px 1pt 1pt 0px; border-style: none solid solid none; padding: 0cm 4.95pt; width: 110px; height: 27px;">
         <p align="center" style="text-align: center; -ms-word-break: keep-all;"><span style="font-family: 굴림;"><span style="font-size: medium;">비고</span></span></p>
         </td>
         <td height="27" style="border: 0px rgb(0, 0, 0); height: 27px; border-image: none;">&nbsp;</td>
      </tr>
      <tr style="height: 40px;">
         <!-- 첫번째 내역 -->
         <td colspan="8" nowrap="nowrap" align="center" style="border-width: 0px 1pt 1pt; border-style: none solid solid; width: 305px; height: 27px;">
         <input class="easyui-text" id="approval_use" name="approval_use" style="width:99%;height:98%; text-align:center; font-size:1.5em;">
         <!-- <p align="center" style="text-align: center; -ms-word-break: keep-all; font-size:1.5em;">&nbsp;</p> -->
         </td>
         <!-- 첫번째 내역 끝-->
         <!-- 첫번째 지출처 -->
         <td colspan="8" nowrap="nowrap" align="center" style="border-width: 0px 1pt 1pt 0px; border-style: none solid solid none; width: 145px; height: 27px;">
         <input class="easyui-text" id="approval_expense" name="approval_expense" style="width:98%;height:98%; text-align:center; font-size:1.5em;">
         <!-- <p id="approval_use" name="approval_use" align="center" style="text-align: center; -ms-word-break: keep-all; font-size:1.5em;">&nbsp;</p> -->
         </td>
         <!-- 첫번째 지출처끝 -->
         <!-- 첫번재 금액 -->
         <td colspan="6" nowrap="nowrap" align="center" style="border-width: 0px 1pt 1pt 0px; border-style: none solid solid none; width: 156px; height: 27px;">
         <input class="easyui-text" id="approval_cash" name="approval_cash" style="width:98%;height:98%; text-align:center; font-size:1.5em;">
         <!-- <p id="approval_cash" name="approval_cash" align="center" style="text-align: center; -ms-word-break: keep-all; font-size:1.5em;">&nbsp;</p> -->
         </td>
         <!-- 첫번재 금액끝 -->
         <!-- 첫번째 비고 -->
         <td colspan="3" nowrap="nowrap" align="center" style="border-width: 0px 1pt 1pt 0px; border-style: none solid solid none; width: 110px; height: 27px;">
         <input class="easyui-text" id="approval_bigo" name="approval_bigo" style="width:97%;height:98%; text-align:center; font-size:1.5em;">
         <!-- <p id="approval_bigo" name="approval_bigo" align="center" style="text-align: center; -ms-word-break: keep-all; font-size:1.5em;">&nbsp;</p> -->
         </td>
         <!-- 첫번째 비고끝 -->
         <td height="27" style="border: 0px rgb(0, 0, 0); height: 27px; border-image: none;"></td>
      </tr>
      <tr style="height: 40px;">
      	 <!-- 두번째 내역 -->
         <td colspan="8" nowrap="nowrap" align="center" style="border-width: 0px 1pt 1pt; border-style: none solid solid; width: 305px; height: 27px;">
         <!-- <input class="easyui-text" style="width:99%;height:98%; text-align:center; font-size:1.5em;"> -->
         <p align="center" style="text-align: center; -ms-word-break: keep-all; font-size:1.5em;">&nbsp;</p>
         </td>
         <!-- 두번째 내역 끝 -->
	     <!-- 두번째 지출저  -->
         <td colspan="8" nowrap="nowrap" align="center" style="border-width: 0px 1pt 1pt 0px; border-style: none solid solid none; width: 145px; height: 27px;">
         <!-- <input class="easyui-text" style="width:98%;height:98%; text-align:center; font-size:1.5em;"> -->
         <p align="center" style="text-align: center; -ms-word-break: keep-all; font-size:1.5em;">&nbsp;</p>
         </td>
         <!-- 두번째 지출처 끝 -->
         <!-- 두번째 금액 -->
         <td colspan="6" nowrap="nowrap" align="center" style="border-width: 0px 1pt 1pt 0px; border-style: none solid solid none; width: 156px; height: 27px;">
         <!-- <input class="easyui-text" style="width:98%;height:98%; text-align:center; font-size:1.5em;"> -->
         <p align="center" style="text-align: center; -ms-word-break: keep-all; font-size:1.5em;">&nbsp;</p>
         </td>
         <!-- 두번째 금액 끝 -->
         <!-- 두번째 비고 -->
         <td colspan="3" nowrap="nowrap" align="center" style="border-width: 0px 1pt 1pt 0px; border-style: none solid solid none; width: 110px; height: 27px;">
         <!-- <input class="easyui-text" style="width:97%;height:98%; text-align:center; font-size:1.5em;"> -->
         <p align="center" style="text-align: center; -ms-word-break: keep-all; font-size:1.5em;">&nbsp;</p>
         </td>
         <!-- 두번째 비고 끝 -->
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
         <p align="center" style="text-align: center; -ms-word-break: keep-all;">　</p>
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
         <p align="center" style="text-align: center; -ms-word-break: keep-all;">　</p>
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
         <p align="center" style="text-align: center; -ms-word-break: keep-all;">　</p>
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
         <p align="center" style="text-align: center; -ms-word-break: keep-all;">　</p>
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
         <p align="center" style="text-align: center; -ms-word-break: keep-all;">　</p>
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
         <p align="center" style="text-align: center; -ms-word-break: keep-all;">　</p>
         </td>
         <td height="27" style="border: 0px rgb(0, 0, 0); height: 27px; border-image: none;">&nbsp;</td>
      </tr>
      <tr style="height: 40px;">
         <td colspan="16" nowrap="nowrap" style="border-width: 0px 1pt 1pt; border-style: none solid solid; padding: 0cm 4.95pt; width: 449px; height: 27px;">
         <p align="center" style="text-align: center; -ms-word-break: keep-all;"><span style="font-family: 굴림;"><span style="font-size: small;">계</span></span></p>
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
         <p align="left" style="text-align: left; text-indent: 10pt; -ms-word-break: keep-all;">참고사항</p>

         <p align="left" style="text-align: left; text-indent: 10pt; -ms-word-break: keep-all;">(관련 문서)</p>
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
         <p align="center" style="text-align: center; -ms-word-break: keep-all;"><u><span style="font-size: 11pt;"><span style="color: blue;"><span style="font-family: 맑은 고딕;">-----</span></span></span></u></p>
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
         <p align="left" style="text-align: left; -ms-word-break: keep-all;"><span style="font-size: 15px;"><strong><span style="font-family: 굴림;">(주)Kosmo</span></strong></span></p>
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
			<a href="javascript:approvalIns()" class="easyui-linkbutton" data-options="size:'large'" style="width:100px;">결 제 받 기</a>
			<a href="#" class="easyui-linkbutton" data-options="size:'large'" style="width: 100px;" onClick="back_approvalList()">취        소</a>
			<a href="#" class="easyui-linkbutton" data-options="size:'large'" style="width: 100px;" onClick="stamp_img()">승        인</a>
      	 </td>
      </tr>      
</table>
</td>
</tr>

	<!-- 문서입력  끝-->
</table>
</form>
</div>
<!-- 지출결의서 끝 -->







<!-- <table border="1" width="1000px" height="50px" data-option="singleSelect: true">
	<tr> 
		<td><input type="radio" name="lang" width="250px" ><span style="font-size: medium;">지출결의서</span></td>
		<td><input type="radio" name="lang" width="250px"><span style="font-size: medium;">시말서</span></td>
	</tr>
</table>
<br> -->
<%-- <div title="품의서">
<form id="fileChoice1" name="fileChoice1">
<table border="1">
	<tr>
		<td>
		<label style="font-size: medium;">보안등급 : </label>
		<input type="radio" name="lang" ><span style="font-size: medium;">일반</span>&nbsp;&nbsp;
		<input type="radio" name="lang" ><span style="font-size: medium;">보안</span>
		
		<td style="font-size: medium;"><label style="font-size: medium;">기안일 : </label>
		<%= sf.format(nowTime) %>
		<!-- <input class="easyui-datebox" data-options="formatter:myformatter,parser:myparser" style="width:50%;"> -->
		</td>
	</tr>
	 <tr>
	 	<td>
	 	<label style="font-size: medium;">중요도 : </label>&nbsp;&nbsp;
		<input type="radio" name="lang" ><span style="font-size: medium;">긴급</span>&nbsp;&nbsp;
		<input type="radio" name="lang" ><span style="font-size: medium;">높음</span>&nbsp;&nbsp;
		<input type="radio" name="lang" ><span style="font-size: medium;">보통</span>&nbsp;&nbsp;
		<input type="radio" name="lang" ><span style="font-size: medium;">낮음</span>
		</td>
		<td>
			<label style="font-size: medium;">다음 결제자:</label>
            <select class="easyui-combobox" id="cb_dept1" name="cb_dept1" style="width:20%; font-size: medium;">
                	<option value="">부 서</option>
                	<option>----------</option>
                	<option>영업부</option>
                	<option>총무부</option>
                	<option>인사부</option>
                	<option>임원</option>
                	
                </select>
                <select class="easyui-combobox" id="cb_name1" name="cb_name1" style="width:20%; font-size: medium;" ></select></td>
	</tr>
	<tr>
	 	<td colspan="2">
	 	<label style="font-size: medium;">첨부파일 : </label>&nbsp;&nbsp;
	 	<input class="easyui-filebox" data-options="prompt:'Choose a file...'" style="width:500px">
		</td>
	</tr>
	<!-- 문서입력 시작 -->
	<tr>
		<td colspan=2 align="center">
		<!-- <textarea id="test1" name="test1" style=width:990px;height:1050px;> -->
		<!-- 기안서 -->
<table>
<tr>
<td>
<div style="clear: both;">&nbsp;</div>

<p style="-ms-word-break: keep-all;">&nbsp;</p>

<p><span style="font-family: 굴림체;"><span style="color: white;"><span style="font-size: small;">y</span></span></span></p>
</td>
</tr>
</table>
<table align="center" border="1" cellpadding="0" cellspacing="0" style="margin: auto auto auto 2pt; border: currentColor; border-collapse: collapse; border-image: none;">
   <tbody>
      <tr style="height: 25px;">
         <td rowspan="2" style="border-width: 0px 1.5pt 0px 0px; border-style: none solid none none; padding: 0cm 0.6pt; width: 318px; height: 25px; border-image: none;">
         <p align="center" style="text-align: center; line-height: normal; -ms-word-break: keep-all;"><strong><span style="font-size: 20pt;"><span style="font-family: 바탕체,serif;"><span style="color: rgb(0, 0, 255);">기안품의서</span></span></span></strong></p>
         </td>
         <td rowspan="2" style="border-width: 1.5pt 1pt 1.5pt 0px; border-style: solid solid solid none; padding: 0cm 0.6pt; width: 29px; height: 25px;">
         <p align="center" style="text-align: center; line-height: normal; -ms-word-break: keep-all;"><span style="font-family: 굴림체;"><span style="font-size: small;">결</span></span></p>

         <p align="center" style="text-align: center; line-height: normal; -ms-word-break: keep-all;">&nbsp;</p>

         <p align="center" style="text-align: center; line-height: normal; -ms-word-break: keep-all;"><span style="font-family: 굴림체;"><span style="font-size: small;">재</span></span></p>
         </td>
         <td style="border-width: 1.5pt 1pt 1pt 0px; border-style: solid solid solid none; padding: 0cm 0.6pt; width: 63px; height: 25px;">
         <p align="center" style="text-align: center; line-height: normal; -ms-word-break: keep-all;"><span style="font-family: 굴림체;"><span style="font-size: small;">담&nbsp; 당</span></span></p>
         </td>
         <td style="border-width: 1.5pt 1pt 1pt 0px; border-style: solid solid solid none; padding: 0cm 0.6pt; width: 63px; height: 25px;">
         <p align="center" style="text-align: center; line-height: normal; -ms-word-break: keep-all;"><span style="font-family: 굴림체;"><span style="font-size: small;">부서장</span></span></p>
         </td>
         <td style="border-width: 1.5pt 1.5pt 1pt 0px; border-style: solid solid solid none; padding: 0cm 0.6pt; width: 63px; height: 25px;">
         <p align="center" style="text-align: center; line-height: normal; -ms-word-break: keep-all;"><span style="font-family: 굴림체;"><span style="font-size: small;">이&nbsp;&nbsp; 사</span></span></p>
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

<p><span style="font-family: 굴림체;"><span style="color: white;"><span style="font-size: small;">y</span></span></span></p>
</td>
</tr>
</table>
<table align="center" border="1" cellpadding="0" cellspacing="0" style="margin: auto auto auto 2.15pt; border: currentColor; border-collapse: collapse; border-image: none;">
   <tbody>
      <tr style="height: 32px;">
         <td style="background: rgb(255, 225, 225); border-width: 1.5pt 1pt 1pt 1.5pt; border-style: solid; padding: 0cm 0.6pt; width: 91px; height: 32px;">
         <p align="center" style="text-align: center; line-height: normal; -ms-word-break: keep-all;"><span style="font-family: 굴림체;"><span style="font-size: medium;">문 서 번 호</span></span></p>
         </td>
         <td style="border-width: 1.5pt 1.5pt 1pt 0px; border-style: solid solid solid none; padding: 0cm 0.6pt; width: 507px; height: 32px;">
         <p align="center" style="text-align: center; line-height: normal;">&nbsp;</p>
         </td>
      </tr>
      <tr style="height: 32px;">
         <td style="background: rgb(255, 225, 225); border-width: 0px 1pt 1pt 1.5pt; border-style: none solid solid; padding: 0cm 0.6pt; width: 91px; height: 32px;">
         <p align="center" style="text-align: center; line-height: normal; -ms-word-break: keep-all;"><span style="font-family: 굴림체;"><span style="font-size: medium;">보 존 년 한</span></span></p>
         </td>
         <td style="border-width: 0px 1.5pt 1pt 0px; border-style: none solid solid none; padding: 0cm 0.6pt; width: 507px; height: 32px;">
         <p align="center" style="text-align: center; line-height: normal;">&nbsp;</p>
         </td>
      </tr>
      <tr style="height: 32px;">
         <td style="background: rgb(255, 225, 225); border-width: 0px 1pt 1pt 1.5pt; border-style: none solid solid; padding: 0cm 0.6pt; width: 91px; height: 32px;">
         <p align="center" style="text-align: center; line-height: normal; -ms-word-break: keep-all;"><span style="font-family: 굴림체;"><span style="font-size: medium;">기 안 일 자</span></span></p>
         </td>
         <td style="border-width: 0px 1.5pt 1pt 0px; border-style: none solid solid none; padding: 0cm 0.6pt; width: 507px; height: 32px;">
         <p align="center" style="text-align: center; line-height: normal;">&nbsp;</p>
         </td>
      </tr>
      <tr style="height: 32px;">
         <td style="background: rgb(255, 225, 225); border-width: 0px 1pt 1pt 1.5pt; border-style: none solid solid; padding: 0cm 0.6pt; width: 91px; height: 32px;">
         <p align="center" style="text-align: center; line-height: normal; -ms-word-break: keep-all;"><span style="font-family: 굴림체;"><span style="font-size: medium;">기 안 부 서</span></span></p>
         </td>
         <td style="border-width: 0px 1.5pt 1pt 0px; border-style: none solid solid none; padding: 0cm 0.6pt; width: 507px; height: 32px;">
         <p align="center" style="text-align: center; line-height: normal;">&nbsp;</p>
         </td>
      </tr>
      <tr style="height: 32px;">
         <td style="background: rgb(255, 225, 225); border-width: 0px 1pt 1pt 1.5pt; border-style: none solid solid; padding: 0cm 0.6pt; width: 91px; height: 32px;">
         <p align="center" style="text-align: center; line-height: normal; -ms-word-break: keep-all;"><span style="font-family: 굴림체;"><span style="font-size: medium;">기&nbsp; 안&nbsp; 자</span></span></p>
         </td>
         <td style="border-width: 0px 1.5pt 1pt 0px; border-style: none solid solid none; padding: 0cm 0.6pt; width: 507px; height: 32px;">
         <p align="center" style="text-align: center; line-height: normal;">&nbsp;</p>
         </td>
      </tr>
      <tr style="height: 40px;">
         <td style="background: rgb(255, 225, 225); border-width: 0px 1pt 1pt 1.5pt; border-style: none solid solid; padding: 0cm 0.6pt; width: 91px; height: 40px;">
         <p align="center" style="text-align: center; line-height: normal; -ms-word-break: keep-all;"><span style="font-family: 굴림체;"><span style="font-size: medium;">최종 결재자</span></span></p>

         <p align="center" style="text-align: center; line-height: normal; -ms-word-break: keep-all;"><span style="font-family: 굴림체;"><span style="font-size: medium;">지&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 시</span></span></p>
         </td>
         <td style="border-width: 0px 1.5pt 1pt 0px; border-style: none solid solid none; padding: 0cm 0.6pt; width: 507px; height: 40px;">
         <p align="center" style="text-align: center; line-height: normal;">&nbsp;</p>
         </td>
      </tr>
      <tr style="height: 32px;">
         <td style="background: rgb(255, 225, 225); border-width: 0px 1pt 1pt 1.5pt; border-style: none solid solid; padding: 0cm 0.6pt; width: 91px; height: 32px;">
         <p align="center" style="text-align: center; line-height: normal; -ms-word-break: keep-all;"><span style="font-family: 굴림체;"><span style="font-size: medium;">협&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 의</span></span></p>
         </td>
         <td style="border-width: 0px 1.5pt 1pt 0px; border-style: none solid solid none; padding: 0cm 0.6pt; width: 507px; height: 32px;">
         <p align="center" style="text-align: center; line-height: normal;">&nbsp;</p>
         </td>
      </tr>
      <tr style="height: 32px;">
         <td style="background: rgb(255, 225, 225); border-width: 0px 1pt 1pt 1.5pt; border-style: none solid solid; padding: 0cm 0.6pt; width: 91px; height: 32px;">
         <p align="center" style="text-align: center; line-height: normal; -ms-word-break: keep-all;"><span style="font-family: 굴림체;"><span style="font-size: medium;">제&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 목</span></span></p>
         </td>
         <td style="border-width: 0px 1.5pt 1pt 0px; border-style: none solid solid none; padding: 0cm 0.6pt; width: 507px; height: 32px;">
         <p align="center" style="text-align: center; line-height: normal;">&nbsp;</p>
         </td>
      </tr>
      <tr style="height: 398px;">
         <td colspan="2" style="border-width: 0px 1.5pt; border-style: none solid; padding: 0cm 0.6pt; width: 598px; height: 398px;">
         <p align="center" style="text-align: center; line-height: 122%; -ms-word-break: keep-all;"><span style="font-family: 굴림체;"><span style="font-size: medium;">아래와 같이 품의하오니 재가 바랍니다.</span></span></p>

         <p style="line-height: 122%; -ms-word-break: keep-all;">&nbsp;</p>

         <p style="line-height: 122%; -ms-word-break: keep-all;">&nbsp;</p>

         <p align="center" style="text-align: center; line-height: 122%; -ms-word-break: keep-all;"><span style="font-size: small;"><strong><span style="font-family: 굴림체; font-size:1.5em;">- </span></strong></span><strong><span style="font-family: 굴림체;">아&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 래 -</span></strong></p>

         <p style="line-height: 122%; -ms-word-break: keep-all;">&nbsp;</p>

         <p style="line-height: 122%; -ms-word-break: keep-all;">&nbsp;</p>

         <p style="line-height: 122%; -ms-word-break: keep-all;">&nbsp;</p>

         <p style="line-height: 122%; -ms-word-break: keep-all;">&nbsp;</p>

         <p style="line-height: 122%; text-indent: 5pt; -ms-word-break: keep-all;"><span style="font-size: small;"><span style="font-family: 굴림체; font-size:1.5em;">1. </span></span><span style="font-family: 굴림체; font-size:1.5em;">목&nbsp; 적 : </span></p>

         <p style="line-height: 122%; text-indent: 5pt; -ms-word-break: keep-all;">&nbsp;</p>

         <p style="line-height: 122%; text-indent: 5pt; -ms-word-break: keep-all;"><span style="font-size: small;"><span style="font-family: 굴림체; font-size:1.5em;">2. </span></span><span style="font-family: 굴림체; font-size:1.5em;">일&nbsp; 정 : </span></p>

         <p style="line-height: 122%; text-indent: 5pt; -ms-word-break: keep-all;">&nbsp;</p>

         <p style="line-height: 122%; text-indent: 5pt; -ms-word-break: keep-all;">&nbsp;</p>

         <p style="line-height: 122%; text-indent: 5pt; -ms-word-break: keep-all;">&nbsp;</p>

         <p style="line-height: 122%; text-indent: 5pt; -ms-word-break: keep-all;"><span style="font-size: small;"><span style="font-family: 굴림체; font-size:1.5em;">3. </span></span><span style="font-family: 굴림체; font-size:1.5em;">시&nbsp; 간 : </span></p>

         <p style="line-height: 122%; text-indent: 5pt; -ms-word-break: keep-all;">&nbsp;</p>

         <p style="line-height: 122%; text-indent: 5pt; -ms-word-break: keep-all;"><span style="font-size: small;"><span style="font-family: 굴림체; font-size:1.5em;">4. </span></span><span style="font-family: 굴림체; font-size:1.5em;">교육기관 : </span></p>

         <p style="line-height: 122%; text-indent: 5pt; -ms-word-break: keep-all;">&nbsp;</p>

         <p style="line-height: 122%; text-indent: 5pt; -ms-word-break: keep-all;"><span style="font-size: small;"><span style="font-family: 굴림체; font-size:1.5em;">5. </span></span><span style="font-family: 굴림체; font-size:1.5em;">교육비</span></p>
         </td>
      </tr>
      <tr style="height: 83px;">
         <td colspan="2" style="border-width: 0px 1.5pt 1.5pt; border-style: none solid solid; padding: 0cm 0.6pt; width: 598px; height: 83px; border-image: none;">
         <p align="center" style="margin: 0cm 15pt 0pt 0cm; text-align: center; line-height: normal; -ms-word-break: keep-all;"><span style="font-size: small;"><span style="font-family: 굴림체; font-size:1.5em;">20&nbsp; </span></span><span style="font-family: 굴림체; font-size:1.5em;">년&nbsp; 월&nbsp; 일</span></p>
         </td>
      </tr>
	<tr>
		<td colspan=2>
		<div style="clear: both; margin-left: 240px;"><span style="font-size: 9pt;"><span style="font-family: 맑은 고딕; font-size:1.5em;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (주)Kosmo</span></span></div>

		<div style="clear: both;">&nbsp;</div>
		</td>
	</tr>
   </tbody>
</table>
<!-- </textarea> -->
</form>
	<!-- 문서입력  끝--> --%>
</div>
</div>
</body>
</html>