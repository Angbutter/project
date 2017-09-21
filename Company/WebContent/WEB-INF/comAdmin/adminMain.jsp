<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%
	String gubun = request.getParameter("gubun");
	if ( gubun==null ){
		gubun="emp";
	}
%>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<jsp:include page="../common/commonEasyUI.jsp" flush="false" />
<title>관리자 페이지</title>
<script type="text/javascript">
	// yyyy-mm-dd 형식으로 바꿔주기
	$.fn.datebox.defaults.formatter = function(date){
		var y = date.getFullYear();
		var m = date.getMonth()+1;
		var d = date.getDate();
		return y+'-'+(m<10?"0"+m:""+m)+'-'+(d<10?"0"+d:""+d);
	}
	// 선택한 날짜 가져오기
	$.fn.datebox.defaults.parser = function(s){
		var t = Date.parse(s);
		if (!isNaN(t)){
			return new Date(t);
		} else {
			return new Date();
		}
	}
	function empManager() {
		$("#dept").hide();
		$("#emp").show();		
		$("#dg_empManager").datagrid({
			url : './getEmployee.do',
			title : '사원 관리 시스템',
			singleSelect : true,
			toolbar : '#tbar_emp',
			columns : [ [ 
				{field : 'RNUM',	title : '인원',	width : 40,	align : 'center',	editor : 'text'}
			  , {field : 'EMP_NO',	title : '사번',	width : 80,	align : 'center',	editor : 'text'}
			  , {
				field : 'EMP_NAME',
				title : '사원명',
				width : 80,
				align : 'center',
				editor : 'text'
			}, {
				field : 'DEPTM_NAME',
				title : '부서명',
				width : 70,
				align : 'center',
				editor : 'text'
			}, {
				field : 'AUTHORITY_NO',
				title : '권한',
				width : 50,
				align : 'center',
				editor : 'text'
			}, {
				field : 'JIKUP',
				title : '직급',
				width : 60,
				align : 'center',
				editor : 'text'
			}, {
				field : 'SALARY',
				title : '연봉',
				width : 70,
				align : 'center',
				editor : 'text'
			}, {
				field : 'HIREDATE',
				title : '입사일',
				width : 90,
				align : 'center',
				editor : 'text'
			}, {
				field : 'PHONE_NUM',
				title : '전화번호',
				width : 120,
				align : 'center',
				editor : 'text'
			}, {
				field : 'EMAIL',
				title : '이메일',
				width : 176,
				align : 'center',
				editor : 'text'
			}, {
				field : 'EMP_PW',
				title : '비밀번호',
				width : 100,
				align : 'center',
				editor : 'text'
			}, {
				field : 'GENDER',
				title : '성별',
				width : 50,
				align : 'center',
				editor : 'text'
			}
			] ]
		});		
	}
	function deptManager() {
		$("#emp").hide();
		$("#dept").show();
		$("#dg_deptManager").datagrid({
			url : './getDeptList.do',
			title : '부서 관리 시스템',
			singleSelect : true,
			toolbar : '#tbar_dept',
			columns : [ [ {
				field : 'DEPTM_NO',
				title : '부서번호',
				width : 100,
				align : 'center',
				editor : 'numberbox'
			}, {
				field : 'DEPTM_NAME',
				title : '부서명',
				width : 150,
				align : 'center',
				editor : 'text'
			}
			]]
		});
	}
	
	function searchM(){
 		var combo_jikup = $("#jikup").combobox('getValue');
		var combo_dname = $("#combo_dname").combobox('getValue');
		var shiredate = $("#shiredate").datebox('getValue');
		var ehiredate = $("#ehiredate").datebox('getValue');
		//alert("combo_jikup : "+combo_jikup + ", combo_dname : "+combo_dname);
 		$("#dg_empManager").datagrid({
			url:"./getEmployee.do?jikup="+combo_jikup+"&deptm_name="+combo_dname+"&shiredate="+shiredate+"&ehiredate="+ehiredate
		}); 
	}
	function empInsertWindow(){
		$("#dl_empInsert").dialog('open');
	}
	function deptInsertWindow(){
		$("#dl_deptInsert").dialog('open');
	}
	function empUpdateWindow(){
		var row = $("#dg_empManager").datagrid('getSelected');
 		if ( row == null ){
			alert("수정할 사원을 선택해주세요.");
			return;
		}
		$("#d_emp_no2").textbox('setValue',row.EMP_NO);
		$("#d_deptm_name2").combobox('setValue',row.DEPTM_NAME);
		$("#d_authority_no2").textbox('setValue',row.AUTHORITY_NO);
		$("#d_emp_name2").textbox('setValue',row.EMP_NAME);
		$("#d_jikup2").combobox('setValue',row.JIKUP);
		$("#d_sal2").textbox('setValue',row.SALARY);
		$("#d_hiredate2").datebox('setValue',row.HIREDATE);
		$("#d_phone_num2").textbox('setValue',row.PHONE_NUM);
		$("#d_emp_pw2").textbox('setValue',row.EMP_PW);
		$("#d_gender2").combobox('setValue',row.GENDER);
		$("#d_email2").textbox('setValue',row.EMAIL);
		$("#dl_empUpdate").dialog('open');
	}
	function deptUpdateWindow(){
		var row = $("#dg_deptManager").datagrid('getSelected');
 		if ( row == null ){
			alert("수정할 부서를 선택해주세요.");
			return;
		}
		$("#deptm_no4").textbox('setValue',row.DEPTM_NO);
		$("#deptm_name4").textbox('setValue',row.DEPTM_NAME);
		$("#dl_deptUpdate").dialog('open');
	}
	function empInsert(){
		$("#f_empInsert").attr("method","get");
		$("#f_empInsert").attr("action","./empInsert.do");
		$("#f_empInsert").submit();
	}
	function empUpdate(){
		$("#f_empUpdate").attr("method","get");
		$("#f_empUpdate").attr("action","./empUpdate.do");
		$("#f_empUpdate").submit();
	}
	function empDelete(){
		var row = $("#dg_empManager").datagrid('getSelected');
 		if ( row == null ){
			alert("지울 사원을 선택해주세요.");
			return;
		}
		location.href="./empDelete.do?emp_no="+row.EMP_NO;
	}
	function deptInsert(){
		$("#f_deptInsert").attr("method","get");
		$("#f_deptInsert").attr("action","./deptInsert.do");
		$("#f_deptInsert").submit();
	}
	function deptUpdate(){
		$("#f_deptUpdate").attr("method","get");
		$("#f_deptUpdate").attr("action","./deptUpdate.do");
		$("#f_deptUpdate").submit();
	}
	function deptDelete(){
		var row = $("#dg_deptManager").datagrid('getSelected');
 		if ( row == null ){
			alert("지울 부서를 선택해주세요.");
			return;
		}
		location.href="./deptDelete.do?deptm_no="+row.DEPTM_NO;
	}
	function ref(){
		location.href="./adminMain.jsp?gubun=emp";
	}
	function ref2(){
		location.href="./adminMain.jsp?gubun=dept";
	}
	function logout(){
		location.href="./loginForm.jsp"
	}
</script>
</head>
<body>
	<script type="text/javascript">
		$(document).ready(function(){
<%
			if("emp".equals(gubun)){
%>
				empManager();
<%
			}
			else if ("dept".equals(gubun)){
		
%>
				deptManager();
<%
			}
%>		

		});
	</script>
	<div class="easyui-layout" style="width: 1200px; height: 650px;">
		<!-- 서쪽 메뉴 시작 -->
		<div region="west" split="true" title="관리자" style="width: 150px;">
			<p style="padding: 5px; margin: 0;">목록</p>
			<ul>
				<li><a href="javascript:void(0)" onclick="empManager()">사원관리</a></li>
				<li><a href="javascript:void(0)" onclick="deptManager()">부서관리</a></li>
				<li><a href="javascript:void(0)" onclick="logout()">로그아웃</a></li>
			</ul>
		</div>
		<!-- 서쪽 메뉴  끝  -->
		<!-- 내용 시작 -->
		<div id="content" region="center" title="관리" style="width: 950px; padding: 5px;">
			<!-- ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ 사원 관리 ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ -->
			<div id="emp">
				<!-- 검색 조건 추가 시작(툴바포함) -->
				<div id="tbar_emp">
					<table>
						<tr>
							<td>
								<a href="javascript:ref()" class="easyui-linkbutton" iconCls="icon-search">전체조회</a> 
								<a href="javascript:empInsertWindow()" class="easyui-linkbutton" iconCls="icon-add">사원추가</a> 
								<a href="javascript:empUpdateWindow()" class="easyui-linkbutton" iconCls="icon-edit">정보수정</a>
								<a href="javascript:empDelete()" class="easyui-linkbutton" iconCls="icon-remove">사원제거</a>
							</td>
						</tr>
						<tr>
							<td>
								<select id="jikup" class="easyui-combobox" style="width:100px;">
									<option value="">직급</option>
									<option>사장</option>
									<option>부장</option>
									<option>차장</option>
									<option>과장</option>
									<option>대리</option>
									<option>사원</option>
								</select>
								<select id="combo_dname" class="easyui-combobox" name="combo_dname" style="width:100px;">
									<option value="">부서</option>
									<option>영업부</option>
									<option>인사부</option>
									<option>총무부</option>
									<option>임원</option>
								</select>
           						<label width="80px">입사일자</label>
          						<input id="shiredate" name="shiredate" class="easyui-datebox" style="width:120px">
           						<label width="80px">&nbsp;~&nbsp;</label>
           						<input id="ehiredate" name="ehiredate" class="easyui-datebox" style="width:120px">
								<a href="javascript:searchM()" class="easyui-linkbutton" iconCls="icon-search">조회</a>
							</td>
    					</tr>
					</table>
				</div>
				<!-- 검색 조건 추가  끝(툴바포함)  -->
				<table id="dg_empManager" toolbar="#tbar_emp" class="easyui-datagrid" title="사원관리" style="width: 990px">
				</table>
			</div>
			<!-- ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ 부서 관리 ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ -->
			<div id="dept">
				<!-- 검색 조건 추가 시작(툴바포함) -->
				<div id="tbar_dept">
					<table>
						<tr>
							<td>
								<a href="javascript:ref2()" class="easyui-linkbutton" iconCls="icon-search">전체조회</a> 
								<a href="javascript:deptInsertWindow()" class="easyui-linkbutton" iconCls="icon-add">부서추가</a> 
								<a href="javascript:deptUpdateWindow()" class="easyui-linkbutton" iconCls="icon-edit">부서수정</a>
								<a href="javascript:deptDelete()" class="easyui-linkbutton" iconCls="icon-remove" onClick="">부서삭제</a>
							</td>
						</tr>
					</table>
				</div>
				<!-- 검색 조건 추가  끝(툴바포함)  -->
				<table id="dg_deptManager" toolbar="#tbar_dept" class="easyui-datagrid" title="부서관리"></table>
			</div>
		</div>
	</div>
	<div id="dl_empInsert" buttons="#btn_empInsert" modal="true" class="easyui-dialog" title="사원추가" closed="true" style="width:450px;height:600px">
	<form id="f_empInsert" method="post" enctype="multipart/form-data" style="padding:20px 20px">  	
    	<table width="400px">
    		<tr style="height:35px">
    			<td width="100px">
    			<label>사&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 번 : </label>
    			</td>
    			<td width="350px">
    			<input class="easyui-textbox" id="d_emp_no" name="d_emp_no" style="width:250px" required="true">
    			</td>
    		</tr>
    		<tr style="height:35px">
    			<td width="100px">
    			<label>권&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 한 : </label>
    			</td>
    			<td width="350px">
    			<select id="d_authority_no" name="d_authority_no" class="easyui-combobox" style="width:100px;">
					<option value="">0</option>
					<option>1</option>
					<option>2</option>
					<option>3</option>
					<option>4</option>
					<option>5</option>
					<option>6</option>
				</select>
    			</td>
    		</tr>
    		<tr  style="height:35px">
    			<td width="100px">
    			<label>이&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 름 : </label>
    			</td>
    			<td width="350px">
    			<input class="easyui-textbox" id="d_emp_name" name="d_emp_name" multiline="true" style="width:250px" required="true">
    			</td>
    		</tr>
    		<tr  style="height:35px">
    			<td width="100px">
    			<label>직&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 급 : </label>
    			</td>
    			<td width="350px">
    			<select id="d_jikup" name="d_jikup" class="easyui-combobox" style="width:100px;">
					<option value="">직급</option>
					<option>사장</option>
					<option>부장</option>
					<option>차장</option>
					<option>과장</option>
					<option>대리</option>
					<option>사원</option>
				</select>
    			</td>
    		</tr>
    		<tr  style="height:35px">
    			<td width="100px">
    			<label>연&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 봉 : </label>
    			</td>
    			<td width="350px">
    			<input class="easyui-textbox" id="d_sal" name="d_sal" multiline="true" style="width:250px" required="true">
    			</td>
    		</tr>
    		<tr  style="height:35px">
    			<td width="100px">
    			<label>이&nbsp;&nbsp;메&nbsp;&nbsp;일 : </label>
    			</td>
    			<td width="350px">
    			<input id="d_email" name="d_email" type="email" class="easyui-textbox" style="width:250px">
    			</td>
    		</tr>
    		<tr  style="height:35px">
    			<td width="100px">
    			<label>입&nbsp;&nbsp;사&nbsp;&nbsp;일 : </label>
    			</td>
    			<td width="350px">
    			<input id="d_hiredate" name="d_hiredate" class="easyui-datebox" style="width:250px">
    			</td>
    		</tr>
    		<tr  style="height:35px">
    			<td width="100px">
    			<label>부&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 서 : </label>
    			</td>
    			<td width="350px">
    			<select id="d_deptm_name" name="d_deptm_name" class="easyui-combobox" name="combo_dname" style="width:100px;">
					<option value="">부서</option>
					<option>영업부</option>
					<option>인사부</option>
					<option>총무부</option>
					<option>임원</option>
				</select>
    			</td>
    		</tr>
    		<tr  style="height:35px">
    			<td width="100px">
    			<label>전화번호 : </label>
    			</td>
    			<td width="350px">
    			<input class="easyui-textbox" id="d_phone_num" name="d_phone_num" multiline="true" style="width:250px" required="true">
    			</td>
    		</tr>
    		<tr style="height:35px">
    			<td width="100px">
    			<label>성&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 별 : </label>
    			</td>
    			<td width="350px">
    			<select id="d_gender" class="easyui-combobox" name="d_gender" style="width:100px;">
					<option value="">성별</option>
					<option>남</option>
					<option>여</option>
				</select>
    			</td>
    		</tr>
    		<tr style="height:35px">
    			<td width="100px">
    			<label>비밀번호 : </label>
    			</td>
    			<td width="350px">
    			<input class="easyui-textbox" id="d_emp_pw" name="d_emp_pw" multiline="true" style="width:250px" required="true">
    			</td>
    		</tr>
    	</table>
    </form>
    </div>
    <div id="btn_empInsert">
		<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-save'" onclick="empInsert()">저장</a>
		<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-cancel'" onclick="javascript:$('#dl_empInsert').dialog('close')">닫기</a>
    </div> 
    <!-- 수정 -->
    <div id="dl_empUpdate" buttons="#btn_empUpdate" modal="true" class="easyui-dialog" title="사원정보수정" closed="true" style="width:450px;height:600px">
	<form id="f_empUpdate" method="post" enctype="multipart/form-data" style="padding:20px 20px">  	
    	<table width="400px">
    		<tr style="height:35px">
    			<td width="100px">
    			<label>사&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 번 : </label>
    			</td>
    			<td width="350px">
    			<input class="easyui-textbox" id="d_emp_no2" name="d_emp_no2" style="width:250px" readonly="false" required="true">
    			</td>
    		</tr>
    		<tr style="height:35px">
    			<td width="100px">
    			<label>권&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 한 : </label>
    			</td>
    			<td width="350px">
    			<select id="d_authority_no2" name="d_authority_no2" class="easyui-combobox" style="width:100px;">
					<option value="">0</option>
					<option>1</option>
					<option>2</option>
					<option>3</option>
					<option>4</option>
					<option>5</option>
					<option>6</option>
				</select>
    			</td>
    		</tr>
    		<tr  style="height:35px">
    			<td width="100px">
    			<label>이&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 름 : </label>
    			</td>
    			<td width="350px">
    			<input class="easyui-textbox" id="d_emp_name2" name="d_emp_name2" multiline="true" style="width:250px" required="true">
    			</td>
    		</tr>
    		<tr  style="height:35px">
    			<td width="100px">
    			<label>직&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 급 : </label>
    			</td>
    			<td width="350px">
    			<select id="d_jikup2" name="d_jikup2" class="easyui-combobox" style="width:100px;">
					<option value="">직급</option>
					<option>사장</option>
					<option>부장</option>
					<option>차장</option>
					<option>과장</option>
					<option>대리</option>
					<option>사원</option>
				</select>
    			</td>
    		</tr>
    		<tr  style="height:35px">
    			<td width="100px">
    			<label>연&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 봉 : </label>
    			</td>
    			<td width="350px">
    			<input class="easyui-textbox" id="d_sal2" name="d_sal2" multiline="true" style="width:250px" required="true">
    			</td>
    		</tr>
    		<tr  style="height:35px">
    			<td width="100px">
    			<label>입&nbsp;&nbsp;사&nbsp;&nbsp;일 : </label>
    			</td>
    			<td width="350px">
    			<input id="d_hiredate2" name="d_hiredate2" class="easyui-datebox" style="width:250px">
    			</td>
    		</tr>
    		<tr  style="height:35px">
    			<td width="100px">
    			<label>이&nbsp;&nbsp;메&nbsp;&nbsp;일 : </label>
    			</td>
    			<td width="350px">
    			<input id="d_email2" name="d_email2" type="email" class="easyui-textbox" style="width:250px">
    			</td>
    		</tr>
    		<tr  style="height:35px">
    			<td width="100px">
    			<label>부&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 서 : </label>
    			</td>
    			<td width="350px">
    			<select id="d_deptm_name2" name="d_deptm_name2" class="easyui-combobox" name="combo_dname" style="width:100px;">
					<option value="">부서</option>
					<option>영업부</option>
					<option>인사부</option>
					<option>총무부</option>
					<option>임원</option>
				</select>
    			</td>
    		</tr>
    		<tr  style="height:35px">
    			<td width="100px">
    			<label>전화번호 : </label>
    			</td>
    			<td width="350px">
    			<input class="easyui-textbox" id="d_phone_num2" name="d_phone_num2" multiline="true" style="width:250px" required="true">
    			</td>
    		</tr>
    		<tr style="height:35px">
    			<td width="100px">
    			<label>성&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 별 : </label>
    			</td>
    			<td width="350px">
    			<select id="d_gender2" class="easyui-combobox" name="d_gender2" style="width:100px;">
					<option value="">성별</option>
					<option>남</option>
					<option>여</option>
				</select>
    			</td>
    		</tr>
    		<tr style="height:35px">
    			<td width="100px">
    			<label>비밀번호 : </label>
    			</td>
    			<td width="350px">
    			<input class="easyui-textbox" id="d_emp_pw2" name="d_emp_pw2" multiline="true" style="width:250px" required="true">
    			</td>
    		</tr>
    	</table>
    </form>
    </div>
    <div id="btn_empUpdate">
		<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-save'" onclick="empUpdate()">저장</a>
		<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-cancel'" onclick="javascript:$('#dl_empUpdate').dialog('close')">닫기</a>
    </div> 
    
    <!-- 부서추가 -->
    <div id="dl_deptInsert" buttons="#btn_deptInsert" modal="true" class="easyui-dialog" title="부서추가" closed="true" style="width:350px;height:200px">
	<form id="f_deptInsert" method="post" enctype="multipart/form-data" style="padding:20px 20px">  	
    	<table width="270px">
    		<tr style="height:35px">
    			<td width="100px">
    			<label>부서번호 : </label>
    			</td>
    			<td width="150px">
    			<input class="easyui-textbox" id="deptm_no3" name="deptm_no3" multiline="true" style="width:150px" required="true">
    			</td>
    		</tr>
    		<tr style="height:35px">
    			<td width="100px">
    			<label>부&nbsp; 서&nbsp;명 : </label>
    			</td>
    			<td width="150px">
    			<input class="easyui-textbox" id="deptm_name3" name="deptm_name3" multiline="true" style="width:150px" required="true">
    			</td>
    		</tr>
    	</table>
    </form>
    </div>
    <div id="btn_deptInsert">
		<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-save'" onclick="deptInsert()">저장</a>
		<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-cancel'" onclick="javascript:$('#dl_deptInsert').dialog('close')">닫기</a>
    </div> 
    
    <!-- 부서업뎃 -->
    <div id="dl_deptUpdate" buttons="#btn_deptUpdate" modal="true" class="easyui-dialog" title="부서수정" closed="true" style="width:350px;height:200px">
	<form id="f_deptUpdate" method="post" enctype="multipart/form-data" style="padding:20px 20px">  	
    	<table width="270px">
    		<tr style="height:35px">
    			<td width="100px">
    			<label>부서번호 : </label>
    			</td>
    			<td width="150px">
    			<input class="easyui-textbox" id="deptm_no4" name="deptm_no4" readonly="false" multiline="true" style="width:150px" required="true">
    			</td>
    		</tr>
    		<tr style="height:35px">
    			<td width="100px">
    			<label>부&nbsp; 서&nbsp;명 : </label>
    			</td>
    			<td width="150px">
    			<input class="easyui-textbox" id="deptm_name4" name="deptm_name4" multiline="true" style="width:150px" required="true">
    			</td>
    		</tr>
    	</table>
    </form>
    </div>
    <div id="btn_deptUpdate">
		<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-save'" onclick="deptUpdate()">저장</a>
		<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-cancel'" onclick="javascript:$('#dl_deptUpdate').dialog('close')">닫기</a>
    </div> 
</body>
</html>