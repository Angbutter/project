<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	//���� �� ��������
	int s_total = 0;
	if(session.getAttribute("total")!=null){
		s_total = Integer.parseInt(session.getAttribute("total").toString());
	}
	//out.print("���� �ο��:"+s_total);
	String emp_name3 = session.getAttribute("emp_name").toString();
	String emp_no3 = session.getAttribute("emp_no").toString();
%>      
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../common/commonEasyUI.jsp" flush="false"/>
<title>��������</title>
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
	            {field:'BOARD_NO',title:'��ȣ', width:70 ,align:'center'}
	            ,{field:'EMP_NAME',title:'�����',width:120,editor:'text',align:'center'}
	            ,{field:'EMP_NO',title:'�����ȣ',width:120,editor:'text',align:'center'}
	            ,{field:'JIKUP',title:'����',width:80,editor:'text',align:'center'}
	            ,{field:'BOARD_TITLE',title:'����',width:292,editor:'text',align:'center',
	            	formatter:function(value,row,index){
	                	var s = "<a href='javascript:boardDetailView()'>"+row.BOARD_TITLE+"</a>";
	                    return s;
	                    //var s = '<a href="#" onclick="boardDetailView()">'+row.BOARD_TITLE+'</a>';
	                   // return s;
	                }////end of formatter
	             }
	            ,{field:'BOARD_DATE',title:'��¥',width:120,editor:'text',align:'center'}
	            ,{field:'BOARD_LEVEL',title:'�߿䵵',width:120,editor:'text',align:'center'}
          	]],
		   //datagrid�� DB���� �ҷ����� ������ �ε� �Ǿ��� ��
		   //�Ʒ� �̺�Ʈ�� ȣ�� �Ǿ��ٸ� datagrid�� ���� �ʱ�ȭ�� �̷����ٰ� ���� �� ����.
		   onLoadSuccess: function(index,field,value){
				//alert("onLoadSuccess ȣ�� ����");
			}
		});//////////end of datagrid
		$("#pg_board").pagination({
			total:g_total,
			pageSize:10,
			//select�޺��� ��µ� ������ ������
			pageList: [10,20,30,40],
			//pageNumber��  page�̴�(���� ���� �ٶ󺸴� ������)
			//pageSize�� �� �������� ����� �ο� ��
			//onSelectPage�̺�Ʈ�� pagination���� ȭ��ǥ�� Ŭ������ ��
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
			   }//��ü �ο��*
		   ]],
		   onLoadSuccess: function(index,field,value){
				//g_total = row.TOTAL;
				//alert("dg_total onLoadSuccess ȣ�� ���� index:"+index+",field:"+field+",value:"+value);
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
			alert("������ ���� �����ϼ���.");
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
	<!-- �Խ��� ȭ�� ���� -->
    <div style="margin:20px 0;"></div>
    <div id="p_board" class="easyui-panel" title="�������� �Խ���" buttons="#btn_board" style="border:0px;width:925px;height:550px">
    <!-- ȭ�鿡 ����� �����ͱ׸��尡 �ƴ϶� ��ü �ο���� �ʱ�ȭ�� ����(����ó��:$(#dg_toal).hide())) -->
	<div id="d_total">
	<table id="dg_total" class="easyui-datagrid" style="width:200px"></table>
    </div>
    <table id="dg_board" class="easyui-datagrid" pagination="#pg_board" style="width:924px;height:276px" align="center" singleSelect="true">
    </table>
    <!-- �Խ��� ȭ�� �� -->
    <!-- ������ ���̼� �߰� ���� -->
	<div id="pg_board" class="easyui-pagination" style="border:1px solid #CCCCCC,width:890px"></div>
	<!-- ������ ���̼� �߰� �� -->
	    <!-- �˻� ���� �߰� ����(��������) -->
		<div id="btn_board">
			<table align="right">
				<tr>
					<td>
						<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-edit'" onclick="boardOpen()">�۾���</a>
						<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-add'" onclick="boardUpdateView()">����</a>
					</td>
				</tr>
			</table>
		</div>
		<!-- �˻� ���� �߰�  ��(��������)  -->       	
     </div>   
    </table>
    </div>
	<!-- �Խ��� ��� ȭ�� ���� -->
	<div id="dl_BoardInsert" modal="true" buttons="#btn_boardInsert" class="easyui-dialog" title="�۵��" closed="true" style="width:600px">
    <form id="f_BoardInsert" method="post" enctype="multipart/form-data" style="padding:20px 20px">  	
    	<table width="550px">
    		<tr>
    			<td width="100px">
    			<label>�ۼ��� : </label>
    			</td>
    			<td width="500px">
    			<input class="easyui-textbox" id="emp_name" name="emp_name" value="<%=emp_name3 %>" readonly="false" style="width:150px" required="true">
    			</td>
    		</tr>
    		<tr>
    			<td width="100px">
    			<label>��  ¥ : </label>
    			</td>
    			<td width="500px">
    			<input class="easyui-datebox" id="board_date" name="board_date" readonly="false" style="width:200px" required="true">
    			</td>
    		</tr>
    		<tr>
    			<td width="100px">
    			<label>�����ȣ : </label>
    			</td>
    			<td width="500px">
    			<input class="easyui-textbox" id="emp_no" name="emp_no" value="<%=emp_no3 %>" style="width:150px" required="true">
    			</td>
    		</tr>
    		<tr>
    			<td width="100px">
    			<label>��  �� : </label>
    			</td>
    			<td width="500px">
    			<select class="easyui-combobox" data-options="panelHeight:'auto'" id="jikup" name="jikup" style="width:70px" required="true">
    				<option>����</option>
    				<option>����</option>
    				<option>����</option>
    				<option>����</option>
    				<option>�븮</option>
    				<option>���</option>
    			</select>
    			</td>
    		</tr>
    		<tr>
    			<td width="100px">
    			<label>��  �� : </label>
    			</td>
    			<td width="500px">
    			<input class="easyui-textbox" id="board_title" name="board_title" style="width:300px" required="true">
    			</td>
    		</tr>
    		<tr>
    			<td width="100px">
    			<label>��  �� : </label>
    			</td>
    			<td width="500px">
    			<input class="easyui-textbox" id="board_text" name="board_text" style="width:400px;height:340px" required="true" multiline="true">
    			</td>
    		</tr>
    		<tr>
    			<td width="100px">
    			<label>�߿䵵 : </label>
    			</td>
    			<td width="500px">
    			<select class="easyui-combobox" data-options="panelHeight:'auto'" id="board_level" name="board_level" style="width:100px" required="true">
    				<option>����</option>
    				<option>����</option>
    				<option>����</option>
    				<option>���</option>
    			</select>
    			</td>
    		</tr>
    	</table>
    </form>
    <table width="150px" align="center">
    	<tr>
    		<td>
    		<a href="javascript:boardInsert()" class="easyui-linkbutton" iconCls="icon-save" >����</a>
			<a href="#" class="easyui-linkbutton" iconCls="icon-cancel" onClick="javascript:$('#dl_BoardInsert').dialog('close')">�ݱ�</a>
    		</td>
    	</tr>
    </table>
    </div>
   <!-- �Խ��� ��� ȭ�� �� -->
   <!-- �Խ��� ���� ȭ�� ���� -->
   <div id="dl_BoardUpdate" modal="true" buttons="#btn_boardUpdate" class="easyui-dialog" title="�ۼ���" closed="true" style="width:600px">
   <form id="f_BoardUpdate" style="padding:20px 20px">
   <input type="hidden" id="d_board_no" name="board_no">
   <table width="550px">
    		<tr>
    			<td width="100px">
    			<label>�ۼ��� : </label>
    			</td>
    			<td width="500px">
    			<input class="easyui-textbox" id="u_emp_name" name="emp_name" style="width:150px" readonly="false">
    			</td>
    		</tr>
    		<tr>
    			<td width="100px">
    			<label>�����ȣ : </label>
    			</td>
    			<td width="500px">
    			<input class="easyui-textbox" id="u_emp_no" name="emp_no" style="width:150px" readonly="false">
    			</td>
    		</tr>
    		<tr>
    			<td width="100px">
    			<label>��  �� : </label>
    			</td>
    			<td width="500px">
    			<input class="easyui-textbox" id="u_jikup" name="jikup" style="width:70px" readonly="false">
    			</td>
    		</tr>
    		<tr>
    			<td width="100px">
    			<label>��  �� : </label>
    			</td>
    			<td width="500px">
    			<input class="easyui-textbox" id="u_board_title" name="board_title" style="width:300px" required="true">
    			</td>
    		</tr>
    		<tr>
    			<td width="100px">
    			<label>��  �� : </label>
    			</td>
    			<td width="500px">
    			<input class="easyui-textbox" id="u_board_text" name="board_text" style="width:400px;height:340px" multiline="true">
    			</td>
    		</tr>
    		<tr>
    			<td width="100px">
    			<label>�߿䵵 : </label>
    			</td>
    			<td width="500px">
    			<select class="easyui-combobox" data-options="panelHeight:'auto'" id="u_board_level" name="board_level" style="width:70px">
    				<option>����</option>
    				<option>����</option>
    				<option>����</option>
    				<option>���</option>
    			</select>
    			</td>
    		</tr>
    	</table>
    </form>
    <table width="150px" align="center">
    	<tr>
    		<td>
    		<a href="#" class="easyui-linkbutton" iconCls="icon-save" onClick="boardUpdate()" >����</a>
			<a href="#" class="easyui-linkbutton" iconCls="icon-cancel" onClick="javascript:$('#dl_BoardUpdate').dialog('close')">�ݱ�</a>
    		</td>
    	</tr>
    </table>
    </div>
   <!-- �Խ��� ���� ȭ�� �� -->
   <!-- �󼼺��� ���� -->
   <div id="dl_BoardDetail" modal="true" buttons="#btn_boardDetail" class="easyui-dialog" title="����ȸ" closed="true" style="width:600px">
   <form id="f_BoardDetail" style="padding:20px 20px">
   <table width="550px">
    		<tr>
    			<td width="100px">
    			<label>�ۼ��� : </label>
    			</td>
    			<td width="500px">
    			<input class="easyui-textbox" id="d_emp_name" name="emp_name" style="width:150px" readonly="false">
    			</td>
    		</tr>
    		<tr>
    			<td width="100px">
    			<label>��  �� : </label>
    			</td>
    			<td width="500px">
    			<input class="easyui-textbox" id="d_jikup" name="jikup" style="width:150px" readonly="false">
    			</td>
    		</tr>
    		<tr>
    			<td width="100px">
    			<label>��  �� : </label>
    			</td>
    			<td width="500px">
    			<input class="easyui-textbox" id="d_board_title" name="board_title" style="width:300px" required="true" readonly="false">
    			</td>
    		</tr>
    		<tr>
    			<td width="100px">
    			<label>��  �� : </label>
    			</td>
    			<td width="500px">
    			<input class="easyui-textbox" id="d_board_text" name="board_text" style="width:400px;height:340px" multiline="true" readonly="false">
    			</td>
    		</tr>
    		<tr>
    			<td width="100px">
    			<label>�߿䵵 : </label>
    			</td>
    			<td width="500px">
    			<select class="easyui-combobox" data-options="panelHeight:'auto'" id="d_board_level" name="board_level" style="width:70px" readonly="false">
    				<option>����</option>
    				<option>����</option>
    				<option>����</option>
    				<option>���</option>
    			</select>
    			</td>
    		</tr>
    	</table>
    </form>
    <table width="150px" align="center">
    	<tr>
    		<td>
			<a href="#" class="easyui-linkbutton" iconCls="icon-cancel" onClick="javascript:$('#dl_BoardDetail').dialog('close')">�ݱ�</a>
    		</td>
    	</tr>
    </table>
    </div>
   <!-- �󼼺��� �� -->
</body>
</html>