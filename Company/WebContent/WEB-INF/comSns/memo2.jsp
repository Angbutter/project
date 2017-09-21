<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.util.List, java.util.Map" %>
<%
	String tabIndex = request.getParameter("tab");
	List<Map<String,Object>> memList = (List<Map<String,Object>>)request.getAttribute("memList");
	if (memList==null){
	
	}
	String emp_no4 = session.getAttribute("emp_no").toString();
	String emp_name4 = session.getAttribute("emp_name").toString();
%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<jsp:include page="../common/commonEasyUI.jsp" flush="false"/>
<style type="text/css">
a {text-decoration: none;color:black;}
a.noul:hover { text-decoration:none !important }

</style>
<script type="text/javascript">
	var c_no;//pk no�� ���� ���� ����
	var g_tab=<%=tabIndex%>;
	//�ڹٽ�ũ��Ʈ���� �Լ��� �Ķ���ͷ� ���� �ѱ涧�� �ݵ�� �̱� Ȥ�� ���� ���̼��� �ٿ��� ������� ����.
	//���� ������ ������ ���� ����� �޾Ƽ� is not define(unfined)
	function cbGetNameList(vdept){
		$('#cb_name').combobox({
		     data:'EMP_NAME'//vo:�ҹ���, map:�빮��
			//emp�׿��� �Է��� �� �ѱ� �� - �����ȣ
			,valueField:"EMP_NO"
			//ȭ�鿡 ������ �� = �μ��̸�
			,textField:"EMP_NAME"
			,url:'./getDeptmList.do?deptm_name='+vdept
			,required:true
			,onSelect:function(param){
				deptno = param.deptno;
			}
			,onChange:function(newValue,oldValue){
				deptno = newValue;
			}
		});
	}
	function deptform(){
		$('#dl_deptmessage').dialog('open');  
	} 
	function sendForm(){
    	/* alert($('#cb_name').combobox('getValue'));
    	var employee = $('#cb_name').combobox('getValue'); */
    	$("#ff").attr("method","post");
    	$("#ff").attr("action","./sendMessage.do");
    	$("#ff").submit();
    }
    function clearForm(){
    	$("#msg_title").textbox('setValue','');
    	$("#msg_contents").textbox('setValue','');
    	$('#dl_deptmessage').dialog('close');
    }
	function messageRead(){
	    var row = $("#dg_sendMessage").datagrid('getSelected');
	    //alert("row.Message_CONTENT:"+row.MEMO_CONTENT);
	    if(row){
		    c_no = row.MSG_NO;
		    $('#dl_msgContents3').dialog('open');
		    $("#emp_no3").textbox('setValue',row.EMP_NAME);
		    $("#msg_title3").textbox('setValue',row.MSG_TITLE);
		    $("#msg_contents3").textbox('setValue',row.MSG_CONTENTS);
	    }
	    else{
	    	alert('���� ���� ���� �ο츦 �����Ͻÿ�.');
	    	return;
	    }
	}
	function rmessageRead(){
	    var row = $("#dg_recvMessage").datagrid('getSelected');
	    if(row){
		    c_no = row.MSG_NO;
		    $('#dl_msgContents').dialog('open');
		    $("#emp_no2").textbox('setValue',row.EMP_NAME);
		    $("#msg_title2").textbox('setValue',row.MSG_TITLE);
		    $("#msg_contents2").textbox('setValue',row.MSG_CONTENTS);
	    }
	    else{
	    	alert('���� ���� ���� �ο츦 �����Ͻÿ�.');
	    	return;
	    }
	}
	function messageReadClose(){
		//dgempList();
		$("#dl_msgContents").dialog('close');
		location.href="./messageContentUpdate.do?msg_no="+c_no;
		//dgrecvMessage();// tab = 0 ;
	}
	function messageReadClose3(){
		//dgempList();
		$("#dl_msgContents3").dialog('close');
		//location.href="./messageContentUpdate.do?msg_no="+c_no;
		//dgrecvMessage();// tab = 0 ;
	}
	
	function dgsendMessage(){//������ �׸��� �ʱ�ȭ
		$("#dg_sendMessage").datagrid({
			  url:'./sendMessageList.do?emp_no=<%=emp_no4%>',
		      columns:[[
		    	//{field:'CK',checkbox:true, width:20 ,align:'center'},
		       {field:'RECEIVE_EMP_NO',title:'�޴� �����ȣ',width:100,editor:'text',align:'center'}
			   ,{field:'EMP_NAME',title:'����̸�',width:100,editor:'text',align:'center'}
			   ,{field:'MSG_TITLE',title:'����',width:120,editor:'text',align:'center',
				   formatter:function(value,row,index){
					   var s = '<a href="#" onclick="messageRead()">'+row.MSG_TITLE+'</a>';
				       return s;
				   }////end of formatter
			   }
			   ,{field:'SEND_TIME',title:'�����ð�',width:120,editor:'text',align:'center'}
			   ,{field:'RECEPTION_YN',title:'��������',width:80,editor:'text',align:'center'}
			]]
			,singleSelect:'true'
		});		
	}//////////////end of dgsendMessage
	function dgrecvMessage(){//������ �׸��� �ʱ�ȭ
		$("#dg_recvMessage").datagrid({
			url:'./recvMessageList.do?receive_emp_no=<%=emp_no4%>',
			columns:[[
				//{field:'CK',checkbox:true, width:20 ,align:'center'},
			   {field:'EMP_NO',title:'���� �����ȣ',width:100,editor:'text',align:'center'}
			   ,{field:'EMP_NAME',title:'�������',width:100,editor:'text',align:'center'}
			   ,{field:'MSG_TITLE',title:'����',width:120,editor:'text',align:'center',
				   formatter:function(value,row,index){
					   var t = '<a href="#" onclick="rmessageRead()">'+row.MSG_TITLE+'</a>';
					   return t;
				   }//////////end of formatter
			   }
			   ,{field:'SEND_TIME',title:'�����ð�',width:120,editor:'text',align:'center'}
			   ,{field:'RECEPTION_YN',title:'��������',width:80,editor:'text',align:'center'}
				]]
				,singleSelect:'true'
		});
	}//////////////end of dgrecvMessage
	function sendClose(){
		window.close();
	}
</script>
</head>
<body>
<script type="text/javascript">
$(document).ready(function (){//html�ڵ忡 ���� DOM������ �Ϸ�Ǿ��� ��
	if(g_tab==null){
		g_tab = 0;
		dgrecvMessage();
	}
	else if(g_tab!=null){
		g_tab = 1;
		dgsendMessage();
	}
	$('#cb_dept').combobox({
		onChange: function(param){
			var vdept = $("#cb_dept").combobox('getValue');
			cbGetNameList(vdept);
		}
	});
	$('#tab_message').tabs({
		onSelect:function(title){
	        if("����������"==title){
	        	//alert("����������.");
		        dgsendMessage();
	        }
	        else if("����������"==title){
	        	//alert("����������.");
		        dgrecvMessage();
	        }		        
	    }
		});		
});
</script>
<table border="1" bordercolor="Black" width="100%" height="100%">
	<tr>
		<td align="center" valign="top">
		<table width="700px" height="490px">
<!-- ������ ���� �޴� ���� -->		
			<tr height="30px">
				<td>
				<table width="100%" height="100%">
					<tr align="center">
						<td><h3>������</h3></td>
					</tr>
				</table>
				</td>
			</tr>
<!-- ������ ���� �޴�  ��  -->		
<!-- ������  �޴� ���� ���� -->			
			<tr height="460px">
				<td align="center" valign="top" >
				<div id="tab_message" class="easyui-tabs" title="��������" style="width:915px;height:460px">
					<div id="d_recvMessage" title="����������">
						<table id="dg_recvMessage" title="����������" class="easyui-datagrid" border-right="none" border-left="none">
						</table>
					</div>
					<div id="d_sendMessage" title="����������">
						<table id="dg_sendMessage" title="����������" class="easyui-datagrid">
						</table>
					</div>
				</div>
				 	<div align="right">
		            <a href="javascript:deptform()" class="easyui-linkbutton" data-options="iconCls:'icon-ok'" style="width:90px" >����������</a>
		            <a href="javascript:sendClose()" class="easyui-linkbutton" data-options="iconCls:'icon-cancel'" style="width:90px" >�ݱ�</a>
		            </div>
				</td>
			</tr>
<!-- ������  �޴� ����  ��  -->			
		</table>
		</td>
	</tr>
</table>
<!-- ���� ���� ���� Ȯ��  ����  -->
    <div id="dl_msgContents" title="��������" class="easyui-dialog" buttons="#btn_msgContents" closed="true" style="width:600px;height:250px;border-right: hidden;">
    	<table align="center" width="500px" border-right="none" border-left="none" style="border-right: hidden;" frame="void">  		    
    		<tr>
    			<td width="40px">
    			<label>������� </label>
    			</td>
    			<td width="300px">
    			<input class="easyui-textbox" id="emp_no2" name="emp_no2" style="width:300px" required="true" disabled="disabled">
    			</td>
    		</tr>     		 				
    		<tr>
    			<td width="40px">
    			<label>���� </label>
    			</td>
    			<td width="300px">
    			<input class="easyui-textbox" id="msg_title2" name="msg_title2" style="width:300px" required="true" disabled="disabled">
    			</td>
    		</tr>     		 				
    		<tr>
    			<td width="40px">
    			<label>���� </label>
    			</td>
    			<td width="300px">
    			<input class="easyui-textbox" multiline="true" id="msg_contents2" name="msg_contents2" style="width:300px;height:120px" required="true" disabled="disabled">
    			</td>
    		</tr>     		 				
    	</table>
    </div>    
    <div id="btn_msgContents">
	<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-cancel'" onclick="messageReadClose()">�ݱ�</a>
    </div>
   <!-- ���� ���� Ȯ��  ��   -->
   <!-- ���� ���� ���� Ȯ��  ����  -->
    <div id="dl_msgContents3" title="��������" class="easyui-dialog" buttons="#btn_msgContents3" closed="true" style="width:600px;height:250px;border-right: hidden;">
    	<table align="center" width="500px" border-right="none" border-left="none" style="border-right: hidden;" frame="void">  		    
    		<tr>
    			<td width="40px">
    			<label>�޴»�� </label>
    			</td>
    			<td width="300px">
    			<input class="easyui-textbox" id="emp_no3" name="emp_no3" style="width:300px" required="true" disabled="disabled">
    			</td>
    		</tr>     		 				
    		<tr>
    			<td width="40px">
    			<label>���� </label>
    			</td>
    			<td width="300px">
    			<input class="easyui-textbox" id="msg_title3" name="msg_title3" style="width:300px" required="true" disabled="disabled">
    			</td>
    		</tr>     		 				
    		<tr>
    			<td width="40px">
    			<label>���� </label>
    			</td>
    			<td width="300px">
    			<input class="easyui-textbox" multiline="true" id="msg_contents3" name="msg_contents3" style="width:300px;height:120px" required="true" disabled="disabled">
    			</td>
    		</tr>     		 				
    	</table>
    </div>    
    <div id="btn_msgContents3">
	<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-cancel'" onclick="messageReadClose3()">�ݱ�</a>
    </div>
   <!-- ���� ���� Ȯ��  ��   -->
    <!-- �μ� ���� ���� ȭ�� ���� -->
     <div id="dl_deptmessage" class="easyui-dialog" title="����������" closed="true" buttons="#eeee" style="width:100%;max-width:400px;padding:30px 60px;display:none;">
        <form id="ff" method="post">
        	<input type="hidden" id="emp_no" name="emp_no" value="<%=emp_no4%>">
        	<input type="hidden" id="emp_name" name="emp_name" value="<%=emp_name4%>">
            <div style="margin-bottom:20px">
                <select class="easyui-combobox" id="cb_dept" name="cb_dept" style="width:45%">
                	<option value="">��   ��</option>   
                	<option>=========</option>
                	<option>������</option>
                	<option>�ѹ���</option>
                	<option>�λ��</option>
                	<option>�ӿ�</option>
                	
                </select>
                <select class="easyui-combobox" id="cb_name" name="cb_name" style="width:50%" >
                	<option value="">�޴� ���</option>
                	<option>=========</option>
                </select>
            </div>
            <div style="margin-bottom:20px">
                <label>����</label>
                <input class="easyui-textbox" id="msg_title" name="msg_title" style="width:100%" data-options="required:true">
            </div>
            <div style="margin-bottom:20px">
        		<label>����</label>
                <input class="easyui-textbox" id="msg_contents" name="msg_contents" style="width:100%;height:100px" data-options="multiline:true">
            </div>
        </form>
        <div style="text-align:center;padding:5px 0">
            <a href="javascript:void(0)" class="easyui-linkbutton" onClick="sendForm()" style="width:80px">������</a>
            <a href="javascript:void(0)" class="easyui-linkbutton" onClick="clearForm()" style="width:80px">���</a>
        </div>
    </div>
    <!-- �μ� ���� ���� ȭ�� �� -->
</body>
</html>
