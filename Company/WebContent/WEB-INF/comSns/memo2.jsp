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
	var c_no;//pk no를 담을 변수 선언
	var g_tab=<%=tabIndex%>;
	//자바스크립트에서 함수의 파라미터로 값을 넘길때는 반드시 싱글 혹은 더블 퀘이션을 붙여야 값취급을 받음.
	//만일 붙이지 않으면 변수 취급을 받아서 is not define(unfined)
	function cbGetNameList(vdept){
		$('#cb_name').combobox({
		     data:'EMP_NAME'//vo:소문자, map:대문자
			//emp테에블에 입력할 때 넘길 값 - 사원번호
			,valueField:"EMP_NO"
			//화면에 보열줄 값 = 부서이름
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
	    	alert('보고 싶은 쪽지 로우를 선택하시오.');
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
	    	alert('보고 싶은 쪽지 로우를 선택하시오.');
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
	
	function dgsendMessage(){//데이터 그리드 초기화
		$("#dg_sendMessage").datagrid({
			  url:'./sendMessageList.do?emp_no=<%=emp_no4%>',
		      columns:[[
		    	//{field:'CK',checkbox:true, width:20 ,align:'center'},
		       {field:'RECEIVE_EMP_NO',title:'받는 사원번호',width:100,editor:'text',align:'center'}
			   ,{field:'EMP_NAME',title:'사원이름',width:100,editor:'text',align:'center'}
			   ,{field:'MSG_TITLE',title:'제목',width:120,editor:'text',align:'center',
				   formatter:function(value,row,index){
					   var s = '<a href="#" onclick="messageRead()">'+row.MSG_TITLE+'</a>';
				       return s;
				   }////end of formatter
			   }
			   ,{field:'SEND_TIME',title:'보낸시간',width:120,editor:'text',align:'center'}
			   ,{field:'RECEPTION_YN',title:'개봉여부',width:80,editor:'text',align:'center'}
			]]
			,singleSelect:'true'
		});		
	}//////////////end of dgsendMessage
	function dgrecvMessage(){//데이터 그리드 초기화
		$("#dg_recvMessage").datagrid({
			url:'./recvMessageList.do?receive_emp_no=<%=emp_no4%>',
			columns:[[
				//{field:'CK',checkbox:true, width:20 ,align:'center'},
			   {field:'EMP_NO',title:'보낸 사원번호',width:100,editor:'text',align:'center'}
			   ,{field:'EMP_NAME',title:'보낸사원',width:100,editor:'text',align:'center'}
			   ,{field:'MSG_TITLE',title:'제목',width:120,editor:'text',align:'center',
				   formatter:function(value,row,index){
					   var t = '<a href="#" onclick="rmessageRead()">'+row.MSG_TITLE+'</a>';
					   return t;
				   }//////////end of formatter
			   }
			   ,{field:'SEND_TIME',title:'보낸시간',width:120,editor:'text',align:'center'}
			   ,{field:'RECEPTION_YN',title:'개봉여부',width:80,editor:'text',align:'center'}
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
$(document).ready(function (){//html코드에 대한 DOM구성이 완료되었을 때
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
	        if("보낸쪽지함"==title){
	        	//alert("보낸쪽지함.");
		        dgsendMessage();
	        }
	        else if("받은쪽지함"==title){
	        	//alert("받은쪽지함.");
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
<!-- 쪽지함 관련 메뉴 시작 -->		
			<tr height="30px">
				<td>
				<table width="100%" height="100%">
					<tr align="center">
						<td><h3>쪽지함</h3></td>
					</tr>
				</table>
				</td>
			</tr>
<!-- 쪽지함 관련 메뉴  끝  -->		
<!-- 쪽지함  메뉴 구현 시작 -->			
			<tr height="460px">
				<td align="center" valign="top" >
				<div id="tab_message" class="easyui-tabs" title="쪽지관리" style="width:915px;height:460px">
					<div id="d_recvMessage" title="받은쪽지함">
						<table id="dg_recvMessage" title="받은쪽지함" class="easyui-datagrid" border-right="none" border-left="none">
						</table>
					</div>
					<div id="d_sendMessage" title="보낸쪽지함">
						<table id="dg_sendMessage" title="보낸쪽지함" class="easyui-datagrid">
						</table>
					</div>
				</div>
				 	<div align="right">
		            <a href="javascript:deptform()" class="easyui-linkbutton" data-options="iconCls:'icon-ok'" style="width:90px" >쪽지보내기</a>
		            <a href="javascript:sendClose()" class="easyui-linkbutton" data-options="iconCls:'icon-cancel'" style="width:90px" >닫기</a>
		            </div>
				</td>
			</tr>
<!-- 쪽지함  메뉴 구현  끝  -->			
		</table>
		</td>
	</tr>
</table>
<!-- 받은 쪽지 내용 확인  시작  -->
    <div id="dl_msgContents" title="쪽지내용" class="easyui-dialog" buttons="#btn_msgContents" closed="true" style="width:600px;height:250px;border-right: hidden;">
    	<table align="center" width="500px" border-right="none" border-left="none" style="border-right: hidden;" frame="void">  		    
    		<tr>
    			<td width="40px">
    			<label>보낸사람 </label>
    			</td>
    			<td width="300px">
    			<input class="easyui-textbox" id="emp_no2" name="emp_no2" style="width:300px" required="true" disabled="disabled">
    			</td>
    		</tr>     		 				
    		<tr>
    			<td width="40px">
    			<label>제목 </label>
    			</td>
    			<td width="300px">
    			<input class="easyui-textbox" id="msg_title2" name="msg_title2" style="width:300px" required="true" disabled="disabled">
    			</td>
    		</tr>     		 				
    		<tr>
    			<td width="40px">
    			<label>내용 </label>
    			</td>
    			<td width="300px">
    			<input class="easyui-textbox" multiline="true" id="msg_contents2" name="msg_contents2" style="width:300px;height:120px" required="true" disabled="disabled">
    			</td>
    		</tr>     		 				
    	</table>
    </div>    
    <div id="btn_msgContents">
	<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-cancel'" onclick="messageReadClose()">닫기</a>
    </div>
   <!-- 쪽지 내용 확인  끝   -->
   <!-- 보낸 쪽지 내용 확인  시작  -->
    <div id="dl_msgContents3" title="쪽지내용" class="easyui-dialog" buttons="#btn_msgContents3" closed="true" style="width:600px;height:250px;border-right: hidden;">
    	<table align="center" width="500px" border-right="none" border-left="none" style="border-right: hidden;" frame="void">  		    
    		<tr>
    			<td width="40px">
    			<label>받는사람 </label>
    			</td>
    			<td width="300px">
    			<input class="easyui-textbox" id="emp_no3" name="emp_no3" style="width:300px" required="true" disabled="disabled">
    			</td>
    		</tr>     		 				
    		<tr>
    			<td width="40px">
    			<label>제목 </label>
    			</td>
    			<td width="300px">
    			<input class="easyui-textbox" id="msg_title3" name="msg_title3" style="width:300px" required="true" disabled="disabled">
    			</td>
    		</tr>     		 				
    		<tr>
    			<td width="40px">
    			<label>내용 </label>
    			</td>
    			<td width="300px">
    			<input class="easyui-textbox" multiline="true" id="msg_contents3" name="msg_contents3" style="width:300px;height:120px" required="true" disabled="disabled">
    			</td>
    		</tr>     		 				
    	</table>
    </div>    
    <div id="btn_msgContents3">
	<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-cancel'" onclick="messageReadClose3()">닫기</a>
    </div>
   <!-- 쪽지 내용 확인  끝   -->
    <!-- 부서 쪽지 쓰기 화면 시작 -->
     <div id="dl_deptmessage" class="easyui-dialog" title="쪽지보내기" closed="true" buttons="#eeee" style="width:100%;max-width:400px;padding:30px 60px;display:none;">
        <form id="ff" method="post">
        	<input type="hidden" id="emp_no" name="emp_no" value="<%=emp_no4%>">
        	<input type="hidden" id="emp_name" name="emp_name" value="<%=emp_name4%>">
            <div style="margin-bottom:20px">
                <select class="easyui-combobox" id="cb_dept" name="cb_dept" style="width:45%">
                	<option value="">부   서</option>   
                	<option>=========</option>
                	<option>영업부</option>
                	<option>총무부</option>
                	<option>인사부</option>
                	<option>임원</option>
                	
                </select>
                <select class="easyui-combobox" id="cb_name" name="cb_name" style="width:50%" >
                	<option value="">받는 사람</option>
                	<option>=========</option>
                </select>
            </div>
            <div style="margin-bottom:20px">
                <label>제목</label>
                <input class="easyui-textbox" id="msg_title" name="msg_title" style="width:100%" data-options="required:true">
            </div>
            <div style="margin-bottom:20px">
        		<label>내용</label>
                <input class="easyui-textbox" id="msg_contents" name="msg_contents" style="width:100%;height:100px" data-options="multiline:true">
            </div>
        </form>
        <div style="text-align:center;padding:5px 0">
            <a href="javascript:void(0)" class="easyui-linkbutton" onClick="sendForm()" style="width:80px">보내기</a>
            <a href="javascript:void(0)" class="easyui-linkbutton" onClick="clearForm()" style="width:80px">취소</a>
        </div>
    </div>
    <!-- 부서 쪽지 쓰기 화면 끝 -->
</body>
</html>
