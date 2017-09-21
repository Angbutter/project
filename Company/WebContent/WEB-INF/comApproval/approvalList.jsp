<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	//세션 값 가져오기
	int s_total = 0;
	if(session.getAttribute("total")!=null){
		s_total = Integer.parseInt(session.getAttribute("total").toString());
	}
	
	//out.print("글의 로우수:"+s_total);
%>     
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>지출결의서</title>
<jsp:include page="../common/commonEasyUI.jsp" flush="false"/>
<script type="text/javascript">
	var today = new Date();
	var p_board_no;
	<%-- var g_total=<%=s_total%>; --%>
	function approvalInsert(){
		$("#fileChoice").attr("method","get");
		$("#fileChoice").attr("action","./approvalInsert.do");
		$("#fileChoice").submit();
		location.href="./approvalIndex.jsp";
	}
	function approvalOpen(){
		//$("#emp_name").textbox('setValue',emp_name);
		//$("#emp_no").textbox('setValue',emp_no);
		location.href="./approvalIndex.jsp";
	}
	function approvalDelete(){
		var row = $("#dg_approval").datagrid('getSelected');
	    location.href="./approvalDelete.do?f_no="+row.REPORT_APPROVAL_NO;
	}
	function approvalDetailView(){
  		var row = $("#dg_approval").datagrid('getSelected');
  		if ( row==null){
  			alert("보고서를 선택해주세요.");
  		}
  		else{
/* 	  		$("#d_repot_approval_no2").val(row.REPORT_APPROVAL_NO);
	  		$("#d_emp_no2").textbox('setValue',row.EMP_NO);
	  		$("#d_emp_name2").textbox('setValue',row.EMP_NAME);
	  		$("#d_jikup2").textbox('setValue',row.JIKUP);
	  		$("#d_section2").textbox('setValue',row.SECTION);
	  		$("#d_approval_title2").textbox('setValue',row.APPROVAL_TITLE);
		    $("#d_approval_text2").textbox('setValue',row.APPROVAL_TEXT);
		    $("#d_approval_level2").textbox('setValue',row.APPROVAL_LEVEL);
		    $("#d_approval_reason2").textbox('setValue',row.APPROVAL_REASON);
		    $("#d_approval_use2").textbox('setValue',row.APPROVAL_USE);
		    $("#d_approval_expense2").textbox('setValue',row.APPROVAL_EXPENSE);
		    $("#d_approval_cash2").textbox('setValue',row.APPROVAL_CASH); */
		    location.href="./approvalIndex2.jsp?report_approval_no="+row.REPORT_APPROVAL_NO+"&emp_no="+row.EMP_NO+"&emp_name="+row.EMP_NAME+"&jikup="+row.JIKUP
		    			 +"&section="+row.SECTION+"&approval_title="+row.APPROVAL_TITLE+"&approval_text="+row.APPROVAL_TEXT+"&approval_level="+row.APPROVAL_LEVEL
		    			 +"&approval_reason="+row.APPROVAL_REASON+"&approval_use="+row.APPROVAL_USE+"&approval_expense="+row.APPROVAL_EXPENSE+"&approval_cash="+row.APPROVAL_CASH;
  		}
	    //location.href="./approvalIndex.jsp";
  	}
	$(document).ready(function(){
		$("#fileChoice").hide();
		$("#dg_approval").datagrid({
			idField:'itemid',
			url:'getApprovalList.do?page=1&pageSize=10',
        	columns:[[
	            {field:'REPORT_APPROVAL_NO',title:'문서번호', width:100 ,align:'center'}
	            ,{field:'EMP_NAME',title:'사원명',width:110,editor:'text',align:'center'}
	            ,{field:'JIKUP',title:'직급',width:110,editor:'text',align:'center'}
	            ,{field:'APPROVAL_TITLE',title:'제목',width:341,editor:'text',align:'center',
	            	formatter:function(value,row,index){
	                	var s = "<a href='javascript:approvalDetailView()'>"+row.APPROVAL_TITLE+"</a>";
	                    return s;
	                }////end of formatter
	             }
	            ,{field:'APPROVAL_DATE',title:'날짜',width:130,editor:'text',align:'center'}
	            ,{field:'APPROVAL_LEVEL',title:'중요도',width:130,editor:'text',align:'center'}
          	]],
		   //datagrid에 DB에서 불러들인 정보가 로드 되었을 때
		   //아래 이벤트가 호출 되었다면 datagrid에 대한 초기화가 이루졌다고 말할 수 있음.
		   onLoadSuccess: function(index,field,value){
				//alert("onLoadSuccess 호출 성공");
			}
		});//////////end of datagrid
		$("#pg_board").pagination({
			total:g_total,
			pageSize:10,
			//select콤보에 출력될 페이지 단위값
			pageList: [10,20,30,40],
			//pageNumber는  page이다(현재 내가 바라보는 페이지)
			//pageSize는 한 페이지에 출력할 로우 수
			//onSelectPage이벤트는 pagination에서 화살표를 클릭했을 때
             onSelectPage: function(pageNumber, pageSize){
             	$("#dg_board").datagrid({
            		url:"./getBoardList.do?page="+pageNumber
            				                +"&pageSize="+pageSize
            				                +"&total="+g_total
            	});
            }
			///////////////end of onSelectPage
		});/////////////////end of pagination
 		$("#dg_total").datagrid({
			url:'./getTotal.do',
		    columns:[[
			      {field:'TOTAL',width:200 ,editor:'text',align:'left',
 				   formatter:function(value,row,index){
					   var e;
					   g_total = row.TOTAL;
					   $("#pg_board").pagination({
							total:g_total
					   });
					   return e;							   
				   }////end of formatter	 		   
			   }//전체 로우수*
		   ]],
		   onLoadSuccess: function(index,field,value){
				//g_total = row.TOTAL;
				//alert("dg_total onLoadSuccess 호출 성공 index:"+index+",field:"+field+",value:"+value);
		   }
		});//////////end of datagrid
		var dd = today.getDate();
	    var mm = today.getMonth()+1; //January is 0!
	    var yyyy = today.getFullYear();
	    if(dd<10) {
	    	dd='0'+dd
	    } 
	    if(mm<10) {
	    	mm='0'+mm
	    } 
	    today = yyyy+'-' + mm+'-'+dd;
	});
	function back_approvalList(){
		
	}
</script>
</head>
<body>
<!-- 게시판 화면 시작 -->
    <div style="margin:20px 0;"></div>
    <div id="p_approval" class="easyui-panel" title="지출결의서" buttons="#btn_approval" style="border:0px;width:925px;height:550px">
    <!-- 화면에 출력할 데이터그리드가 아니라 전체 로우수를 초기화할 것임(숨김처리:$(#dg_toal).hide())) -->
	<!-- <div id="d_total">
	<table id="dg_total" class="easyui-datagrid" style="width:200px"></table>
    </div> -->
    <table id="dg_approval" class="easyui-datagrid" pagination="#pg_approval" style="width:924px;height:276px" align="center" singleSelect="true">
    </table>
    <!-- 게시판 화면 끝 -->
    <!-- 페이지 네이션 추가 시작 -->
	<div id="pg_approval" class="easyui-pagination" style="border:1px solid #CCCCCC,width:890px"></div>
	<!-- 페이지 네이션 추가 끝 -->
	    <!-- 검색 조건 추가 시작(툴바포함) -->
		<div id="btn_approval">
			<table align="right">
				<tr>
					<td>
						<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-edit'" onclick="approvalOpen()">글쓰기</a>
						<!-- <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-add'" onclick="approvalDelete()">삭제</a> -->
					</td>
				</tr>
			</table>
		</div>
		<!-- 검색 조건 추가  끝(툴바포함)  -->       	
     </div>   
    </table>
    </div>
    <!-- 게시판 등록 화면 시작 -->
	<div id="dl_ApprovalInsert" modal="true" buttons="#btn_approvalInsert" class="easyui-dialog" title="등록" closed="true" style="width:600px">
    <form id="f_ApprovalInsert" method="post" enctype="multipart/form-data" style="padding:20px 20px">  	
    	<table width="550px">
    		<tr>
    			<td width="100px">
    			<label>문서번호 : </label>
    			</td>
    			<td width="500px">
    			<input class="easyui-textbox" id="report_approval_no" name="report_approval_no" style="width:150px" required="true">
    			</td>
    		</tr>
    		<tr>
    			<td width="100px">
    			<label>사 원 명 : </label>
    			</td>
    			<td width="500px">
    			<input class="easyui-datebox" id="emp_no" name="emp_no" readonly="false" style="width:200px" required="true">
    			</td>
    		</tr>
    		<tr>
    			<td width="100px">
    			<label>직  급 : </label>
    			</td>
    			<td width="500px">
    			<input class="easyui-textbox" id="jikup" name=""jikup"" style="width:150px" required="true">
    			</td>
    		</tr>
    		<tr>
    			<td width="100px">
    			<label>제  목 : </label>
    			</td>
    			<td width="500px">
    			<input class="easyui-textbox" id="approval_title" name="approval_title" style="width:150px" required="true">
    			</td>
    		</tr>
    		<tr>
    			<td width="100px">
    			<label>결 재 일 : </label>
    			</td>
    			<td width="500px">
    			<input class="easyui-datebox" id="approval_date" name="approval_date" style="width:300px" required="true">
    			</td>
    		</tr>
    		<tr>
    			<td width="100px">
    			<label>중요도 : </label>
    			</td>
    			<td width="500px">
    			<select class="easyui-combobox" data-options="panelHeight:'auto'" id="approval_level" name="approval_level" style="width:100px" required="true">
    				<option>낮음</option>
    				<option>보통</option>
    				<option>높음</option>
    				<option>긴급</option>
    			</select>
    			</td>
    		</tr>
    	</table>
    </form>
    <table width="150px" align="center">
    	<tr>
    		<td>
    		<a href="javascript:approvalInsert()" class="easyui-linkbutton" iconCls="icon-save" >저장</a>
			<a href="#" class="easyui-linkbutton" iconCls="icon-cancel" onClick="javascript:$('#dl_ApprovalInsert').dialog('close')">닫기</a>
    		</td>
    	</tr>
    </table>
    </div>
   <!-- 게시판 등록 화면 끝 -->
<div id="dd" class="easyui-tabs" data-options="tabWidth:300" style="width:1002px;">
<form id="fileChoice" name="fileChoice">
<input type="hidden" value="지출결의서" id="section2" name="section2">
<input type="hidden" value="900001" id="emp_no2" name="emp_no2">
<table border="1" width="1000px">
	<tr>
		<td>
		<label style="font-size: medium;">보안등급 : </label>
		<input type="radio" name="lang" ><span style="font-size: medium;">일반</span>&nbsp;&nbsp;
		<input type="radio" name="lang" ><span style="font-size: medium;">보안</span>
		
		<td style="font-size: medium;"><label style="font-size: medium;">기안일 : </label>
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
         <input class="easyui-text" id="report_approval_no2" name="report_approval_no2" style="width:98%;height:99%; text-align:center; font-size:1.5em;">
         <!-- <p id="report_approval_no" name="report_approval_no" align="center" style="text-align: center; -ms-word-break: keep-all;">&nbsp;</p> -->
         </td>
         <!-- 결재번호 입력끝 -->
         <td colspan="4" rowspan="2" nowrap="nowrap" style="border-width: 0px 1pt 1pt 0px; border-style: none solid solid none; padding: 0cm 4.95pt; width: 83.02px; height: 27px;">
         <p align="left" style="text-align: left; text-indent: 10pt; -ms-word-break: keep-all;"><span style="font-family: 굴림;"><span style="font-size: medium;">기안일</span></span></p>
         </td>
         <!-- 기안일 입력란  -->
         <td id="approval_date" name="approval_date" colspan="6" rowspan="2" nowrap="nowrap" style="border-width: 0px 1pt 1pt 0px; border-style: none solid solid none; padding: 0cm 4.95pt; width: 99px; height: 27px;">
         <input class="easyui-text" id="approval_date2" name="approval_date2" data-options="formatter:myformatter,parser:myparser" style="width:100%; text-align:center">
         <%-- <p id="approval_date" name="approval_date" align="center" style="text-align: center; -ms-word-break: keep-all;"><%= sf.format(nowTime) %></p --%>
         </td>
         <!-- 기안일 입력끝  -->
         <td colspan="5"  style="border-width: 0px 1pt 1pt 0px; border-style: none solid solid none; padding: 0cm 4.95pt; width: 129px; height: 27px;">
         <p style="text-align: center; -ms-word-break: keep-all;"><span style="font-family: 굴림;"><span style="font-size: medium;">직 급</span></span></p>

         <!-- <p style="text-align: center; text-indent: 10pt; -ms-word-break: keep-all;"><span style="font-family: 굴림;"><span style="font-size: medium;">(</span></span><span style="font-size: small;">직위성명</span><span style="font-size: small;">)</span></p> -->
         </td>
         <!-- 기안자(직위성명)란  -->
         <td colspan="3" nowrap="nowrap" style="border-width: 0px 1pt 1pt 0px; border-style: none solid solid none; padding: 0cm 4.95pt; width: 110px; height: 27px;">
         <input class="easyui-text" id="jikup2" name="jikup2" style="width:98%;height:99%; text-align:center; font-size:1.5em;">
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
         <input class="easyui-text" id="emp_name2" name="emp_name2" style="width:98%;height:99%; text-align:center; font-size:1.5em;">
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
         <input class="easyui-text" id="approval_title2" name="approval_title2" style="width:99%;height:99%; text-align:center; font-size:1.5em;">
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
         <input class="easyui-text" id="approval_reason2" name="approval_reason2" style="width:99%;height:99%; text-align:center; font-size:1.5em;">
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
         <input class="easyui-text" id="approval_use2" name="approval_use2" style="width:99%;height:98%; text-align:center; font-size:1.5em;">
         <!-- <p align="center" style="text-align: center; -ms-word-break: keep-all; font-size:1.5em;">&nbsp;</p> -->
         </td>
         <!-- 첫번째 내역 끝-->
         <!-- 첫번째 지출처 -->
         <td colspan="8" nowrap="nowrap" align="center" style="border-width: 0px 1pt 1pt 0px; border-style: none solid solid none; width: 145px; height: 27px;">
         <input class="easyui-text" id="approval_expense2" name="approval_expense2" style="width:98%;height:98%; text-align:center; font-size:1.5em;">
         <!-- <p id="approval_use" name="approval_use" align="center" style="text-align: center; -ms-word-break: keep-all; font-size:1.5em;">&nbsp;</p> -->
         </td>
         <!-- 첫번째 지출처끝 -->
         <!-- 첫번재 금액 -->
         <td colspan="6" nowrap="nowrap" align="center" style="border-width: 0px 1pt 1pt 0px; border-style: none solid solid none; width: 156px; height: 27px;">
         <input class="easyui-text" id="approval_cash2" name="approval_cash2" style="width:98%;height:98%; text-align:center; font-size:1.5em;">
         <!-- <p id="approval_cash" name="approval_cash" align="center" style="text-align: center; -ms-word-break: keep-all; font-size:1.5em;">&nbsp;</p> -->
         </td>
         <!-- 첫번재 금액끝 -->
         <!-- 첫번째 비고 -->
         <td colspan="3" nowrap="nowrap" align="center" style="border-width: 0px 1pt 1pt 0px; border-style: none solid solid none; width: 110px; height: 27px;">
         <input class="easyui-text" id="approval_bigo2" name="approval_bigo2" style="width:97%;height:98%; text-align:center; font-size:1.5em;">
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
</body>
</html>