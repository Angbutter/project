<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	//세션 값 가져오기
	int s_total = 0;
	if(session.getAttribute("total")!=null){
		s_total = Integer.parseInt(session.getAttribute("total").toString());
	}
	//out.print("글의 로우수:"+s_total);
	String emp_name3 = session.getAttribute("emp_name").toString();
	String emp_no3 = session.getAttribute("emp_no").toString();
%>      
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../common/commonEasyUI.jsp" flush="false"/>
<title>공지사항</title>
<script type="text/javascript">
	var today = new Date();
	var p_board_no;
	var g_total=<%=s_total%>;
	function boardInsert(){
		$("#f_BoardInsert").attr("method","get");
		$("#f_BoardInsert").attr("action","./boardInsert.do");
		$("#f_BoardInsert").submit();
	}
	function boardOpen(){
		//$("#emp_name").textbox('setValue',emp_name);
		//$("#emp_no").textbox('setValue',emp_no);
		$("#board_date").textbox('setValue',today);
		$("#dl_BoardInsert").dialog('open');
	}
	$(document).ready(function(){
		$("#d_total").hide();
		$("#dg_board").datagrid({
			idField:'itemid',
			url:'getBoardList.do?page=1&pageSize=10',
        	columns:[[
	            {field:'BOARD_NO',title:'번호', width:70 ,align:'center'}
	            ,{field:'EMP_NAME',title:'사원명',width:120,editor:'text',align:'center'}
	            ,{field:'EMP_NO',title:'사원번호',width:120,editor:'text',align:'center'}
	            ,{field:'JIKUP',title:'직급',width:80,editor:'text',align:'center'}
	            ,{field:'BOARD_TITLE',title:'제목',width:292,editor:'text',align:'center',
	            	formatter:function(value,row,index){
	                	var s = "<a href='javascript:boardDetailView()'>"+row.BOARD_TITLE+"</a>";
	                    return s;
	                    //var s = '<a href="#" onclick="boardDetailView()">'+row.BOARD_TITLE+'</a>';
	                   // return s;
	                }////end of formatter
	             }
	            ,{field:'BOARD_DATE',title:'날짜',width:120,editor:'text',align:'center'}
	            ,{field:'BOARD_LEVEL',title:'중요도',width:120,editor:'text',align:'center'}
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
	function boardUpdateView(){
		var row = $("#dg_board").datagrid('getSelected');
		if(row == null){
			alert("수정할 행을 선택하세요.");
			return;
		}
		//alert(row.BOARD_NO);
		$("#u_board_no").val(row.BOARD_NO);
	    $("#u_emp_no").textbox('setValue',row.EMP_NO);
	    $("#u_emp_name").textbox('setValue',row.EMP_NAME);
	    $("#u_jikup").textbox('setValue',row.JIKUP);
	    $("#u_board_title").textbox('setValue',row.BOARD_TITLE);
	    $("#u_board_text").textbox('setValue',row.BOARD_TEXT);
	    $("#u_board_level").combobox('setValue',row.BOARD_LEVEL);
  		$("#dg_board").datagrid('reload',{url:'./getBoardList.do'});
		$("#dl_BoardUpdate").dialog('open');
	} 
  	function boardUpdate(){
		$("#f_BoardUpdate").attr("method","get");
		$("#f_BoardUpdate").attr("action","./boardUpdate.do");
		$("#f_BoardUpdate").submit();
	}
  	function boardDetailView(){
  		var row = $("#dg_board").datagrid('getSelected');
  		$("#d_board_no").val(row.BOARD_NO);
	    $("#d_emp_no").textbox('setValue',row.EMP_NO);
	    $("#d_emp_name").textbox('setValue',row.EMP_NAME);
	    $("#d_jikup").textbox('setValue',row.JIKUP);
	    $("#d_board_title").textbox('setValue',row.BOARD_TITLE);
	    $("#d_board_text").textbox('setValue',row.BOARD_TEXT);
	    $("#d_board_level").combobox('setValue',row.BOARD_LEVEL);
  		$("#dl_BoardDetail").dialog('open');
  	}
</script>
</head>
<body>
	<!-- 게시판 화면 시작 -->
    <div style="margin:20px 0;"></div>
    <div id="p_board" class="easyui-panel" title="공지사항 게시판" buttons="#btn_board" style="border:0px;width:925px;height:550px">
    <!-- 화면에 출력할 데이터그리드가 아니라 전체 로우수를 초기화할 것임(숨김처리:$(#dg_toal).hide())) -->
	<div id="d_total">
	<table id="dg_total" class="easyui-datagrid" style="width:200px"></table>
    </div>
    <table id="dg_board" class="easyui-datagrid" pagination="#pg_board" style="width:924px;height:276px" align="center" singleSelect="true">
    </table>
    <!-- 게시판 화면 끝 -->
    <!-- 페이지 네이션 추가 시작 -->
	<div id="pg_board" class="easyui-pagination" style="border:1px solid #CCCCCC,width:890px"></div>
	<!-- 페이지 네이션 추가 끝 -->
	    <!-- 검색 조건 추가 시작(툴바포함) -->
		<div id="btn_board">
			<table align="right">
				<tr>
					<td>
						<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-edit'" onclick="boardOpen()">글쓰기</a>
						<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-add'" onclick="boardUpdateView()">수정</a>
					</td>
				</tr>
			</table>
		</div>
		<!-- 검색 조건 추가  끝(툴바포함)  -->       	
     </div>   
    </table>
    </div>
	<!-- 게시판 등록 화면 시작 -->
	<div id="dl_BoardInsert" modal="true" buttons="#btn_boardInsert" class="easyui-dialog" title="글등록" closed="true" style="width:600px">
    <form id="f_BoardInsert" method="post" enctype="multipart/form-data" style="padding:20px 20px">  	
    	<table width="550px">
    		<tr>
    			<td width="100px">
    			<label>작성자 : </label>
    			</td>
    			<td width="500px">
    			<input class="easyui-textbox" id="emp_name" name="emp_name" value="<%=emp_name3 %>" readonly="false" style="width:150px" required="true">
    			</td>
    		</tr>
    		<tr>
    			<td width="100px">
    			<label>날  짜 : </label>
    			</td>
    			<td width="500px">
    			<input class="easyui-datebox" id="board_date" name="board_date" readonly="false" style="width:200px" required="true">
    			</td>
    		</tr>
    		<tr>
    			<td width="100px">
    			<label>사원번호 : </label>
    			</td>
    			<td width="500px">
    			<input class="easyui-textbox" id="emp_no" name="emp_no" value="<%=emp_no3 %>" style="width:150px" required="true">
    			</td>
    		</tr>
    		<tr>
    			<td width="100px">
    			<label>직  급 : </label>
    			</td>
    			<td width="500px">
    			<select class="easyui-combobox" data-options="panelHeight:'auto'" id="jikup" name="jikup" style="width:70px" required="true">
    				<option>사장</option>
    				<option>부장</option>
    				<option>차장</option>
    				<option>과장</option>
    				<option>대리</option>
    				<option>사원</option>
    			</select>
    			</td>
    		</tr>
    		<tr>
    			<td width="100px">
    			<label>제  목 : </label>
    			</td>
    			<td width="500px">
    			<input class="easyui-textbox" id="board_title" name="board_title" style="width:300px" required="true">
    			</td>
    		</tr>
    		<tr>
    			<td width="100px">
    			<label>내  용 : </label>
    			</td>
    			<td width="500px">
    			<input class="easyui-textbox" id="board_text" name="board_text" style="width:400px;height:340px" required="true" multiline="true">
    			</td>
    		</tr>
    		<tr>
    			<td width="100px">
    			<label>중요도 : </label>
    			</td>
    			<td width="500px">
    			<select class="easyui-combobox" data-options="panelHeight:'auto'" id="board_level" name="board_level" style="width:100px" required="true">
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
    		<a href="javascript:boardInsert()" class="easyui-linkbutton" iconCls="icon-save" >저장</a>
			<a href="#" class="easyui-linkbutton" iconCls="icon-cancel" onClick="javascript:$('#dl_BoardInsert').dialog('close')">닫기</a>
    		</td>
    	</tr>
    </table>
    </div>
   <!-- 게시판 등록 화면 끝 -->
   <!-- 게시판 수정 화면 시작 -->
   <div id="dl_BoardUpdate" modal="true" buttons="#btn_boardUpdate" class="easyui-dialog" title="글수정" closed="true" style="width:600px">
   <form id="f_BoardUpdate" style="padding:20px 20px">
   <input type="hidden" id="d_board_no" name="board_no">
   <table width="550px">
    		<tr>
    			<td width="100px">
    			<label>작성자 : </label>
    			</td>
    			<td width="500px">
    			<input class="easyui-textbox" id="u_emp_name" name="emp_name" style="width:150px" readonly="false">
    			</td>
    		</tr>
    		<tr>
    			<td width="100px">
    			<label>사원번호 : </label>
    			</td>
    			<td width="500px">
    			<input class="easyui-textbox" id="u_emp_no" name="emp_no" style="width:150px" readonly="false">
    			</td>
    		</tr>
    		<tr>
    			<td width="100px">
    			<label>직  급 : </label>
    			</td>
    			<td width="500px">
    			<input class="easyui-textbox" id="u_jikup" name="jikup" style="width:70px" readonly="false">
    			</td>
    		</tr>
    		<tr>
    			<td width="100px">
    			<label>제  목 : </label>
    			</td>
    			<td width="500px">
    			<input class="easyui-textbox" id="u_board_title" name="board_title" style="width:300px" required="true">
    			</td>
    		</tr>
    		<tr>
    			<td width="100px">
    			<label>내  용 : </label>
    			</td>
    			<td width="500px">
    			<input class="easyui-textbox" id="u_board_text" name="board_text" style="width:400px;height:340px" multiline="true">
    			</td>
    		</tr>
    		<tr>
    			<td width="100px">
    			<label>중요도 : </label>
    			</td>
    			<td width="500px">
    			<select class="easyui-combobox" data-options="panelHeight:'auto'" id="u_board_level" name="board_level" style="width:70px">
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
    		<a href="#" class="easyui-linkbutton" iconCls="icon-save" onClick="boardUpdate()" >수정</a>
			<a href="#" class="easyui-linkbutton" iconCls="icon-cancel" onClick="javascript:$('#dl_BoardUpdate').dialog('close')">닫기</a>
    		</td>
    	</tr>
    </table>
    </div>
   <!-- 게시판 수정 화면 끝 -->
   <!-- 상세보기 시작 -->
   <div id="dl_BoardDetail" modal="true" buttons="#btn_boardDetail" class="easyui-dialog" title="상세조회" closed="true" style="width:600px">
   <form id="f_BoardDetail" style="padding:20px 20px">
   <table width="550px">
    		<tr>
    			<td width="100px">
    			<label>작성자 : </label>
    			</td>
    			<td width="500px">
    			<input class="easyui-textbox" id="d_emp_name" name="emp_name" style="width:150px" readonly="false">
    			</td>
    		</tr>
    		<tr>
    			<td width="100px">
    			<label>직  급 : </label>
    			</td>
    			<td width="500px">
    			<input class="easyui-textbox" id="d_jikup" name="jikup" style="width:150px" readonly="false">
    			</td>
    		</tr>
    		<tr>
    			<td width="100px">
    			<label>제  목 : </label>
    			</td>
    			<td width="500px">
    			<input class="easyui-textbox" id="d_board_title" name="board_title" style="width:300px" required="true" readonly="false">
    			</td>
    		</tr>
    		<tr>
    			<td width="100px">
    			<label>내  용 : </label>
    			</td>
    			<td width="500px">
    			<input class="easyui-textbox" id="d_board_text" name="board_text" style="width:400px;height:340px" multiline="true" readonly="false">
    			</td>
    		</tr>
    		<tr>
    			<td width="100px">
    			<label>중요도 : </label>
    			</td>
    			<td width="500px">
    			<select class="easyui-combobox" data-options="panelHeight:'auto'" id="d_board_level" name="board_level" style="width:70px" readonly="false">
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
			<a href="#" class="easyui-linkbutton" iconCls="icon-cancel" onClick="javascript:$('#dl_BoardDetail').dialog('close')">닫기</a>
    		</td>
    	</tr>
    </table>
    </div>
   <!-- 상세보기 끝 -->
</body>
</html>