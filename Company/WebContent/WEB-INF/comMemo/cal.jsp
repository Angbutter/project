<%@page import="javax.servlet.jsp.tagext.TryCatchFinally"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.List" %>
<%@page import="java.util.Map" %>
<%@page import="com.util.HangulConversion" %>
<%
	List<Map<String,Object>> calList = (List<Map<String,Object>>)request.getAttribute("calList");
	String emp_no = session.getAttribute("emp_no").toString();
	Calendar cal7 = Calendar.getInstance();
	int year7 = cal7.get(Calendar.YEAR);
	int month7 = cal7.get(Calendar.MONTH);
	int date7 = cal7.get(Calendar.DATE);
	int temp = 0;
	String month8 = "";
	String day8 = "";
	if ( month7 < 9){
		month8="0"+(month7+1);
	}
	else {
		month8=""+(month7+1);
	}
	if ( date7 < 10 ){
		day8="0"+date7;
	}
	else {
		day8=""+date7;
	}
	String today7 = year7 + "-" + month8 + "-" + day8;

	if (strYear7 != null)

	{
		year7 = Integer.parseInt(strYear7);
		month7 = Integer.parseInt(strMonth7);
	} else {

	}
	//�⵵/�� ����
	cal7.set(year7, month7, 1);
	int startDay = cal7.getMinimum(java.util.Calendar.DATE);
	int endDay = cal7.getActualMaximum(java.util.Calendar.DAY_OF_MONTH);
	int start = cal7.get(java.util.Calendar.DAY_OF_WEEK);

	int newLine = 0;

	//���� ��¥ ����.
	Calendar todayCal = Calendar.getInstance();
	SimpleDateFormat sdf = new SimpleDateFormat("yyyMMdd");
	int intToday = Integer.parseInt(sdf.format(todayCal.getTime()));
%>

<html lang="ko">
<HEAD>
       <TITLE>Ķ����</TITLE>
       <meta http-equiv="content-type" content="text/html; charset=utf-8">
       <script type="text/javaScript" language="javascript"> 
       </script>
       <style TYPE="text/css">
             body {
             scrollbar-face-color: #F6F6F6;
             scrollbar-highlight-color: #bbbbbb;
             scrollbar-3dlight-color: #FFFFFF;
             scrollbar-shadow-color: #bbbbbb;
             scrollbar-darkshadow-color: #FFFFFF;
             scrollbar-track-color: #FFFFFF;
             scrollbar-arrow-color: #bbbbbb;
             margin-left:"0px"; margin-right:"0px"; margin-top:"0px"; margin-bottom:"0px";
             }

            td {font-family: "����"; font-size: 9pt; color:#595959;}
             th {font-family: "����"; font-size: 9pt; color:#000000;}
             select {font-family: "����"; font-size: 9pt; color:#595959;}
             .divDotText {
             overflow:hidden;
             text-overflow:ellipsis;
             }
            A:link { font-size:9pt; font-family:"����";color:#000000; text-decoration:none; }
            A:visited { font-size:9pt; font-family:"����";color:#000000; text-decoration:none; }
            A:active { font-size:9pt; font-family:"����";color:red; text-decoration:none; }
            A:hover { font-size:9pt; font-family:"����";color:red;text-decoration:none;}
       </style>
<script type="text/javascript">
	$.fn.datebox.defaults.formatter = function(date){
	    var y = date.getFullYear();
	    var m = date.getMonth()+1;
	    var d = date.getDate();
	    return y+'-'+(m<10?"0"+m:""+m)+'-'+(d<10?"0"+d:""+d);
	 }
	 // ������ ��¥ ��������
	 $.fn.datebox.defaults.parser = function(s){
	    var t = Date.parse(s);
	    if (!isNaN(t)){
	       return new Date(t);
	    } else {
	       return new Date();
	    }
	 }
	function today(){
		location.href="./getCalList.do";
	}
	function ss(aa){
		var day9 = aa;
		var month0 = "";
		var day0 = "";
		if (<%=month7+1%> < 10) {
			month0 = "0"+<%=month7+1%>;
		}
		else {
			month0 = ""+<%=month7+1%>;
		}
		if (day9<10){
			day0 = "0"+day9;
		}
		else{
			day0 = ""+day9;
		}
		var ym = <%=year7%>+"-"+month0+"-"+day0;
		$("#calday").textbox('setValue',ym);
		$("#insert").dialog('open');
	}
	function save(){
		 $("#f_insert").attr("method","get");
	     $("#f_insert").attr("action","./insert.do");
	     $("#f_insert").submit();
	}
	function closed(){
		$('#insert').dialog('close');
		$('#calcontent').textbox('setValue','');
		$('#calday').textbox('setValue','');
		$('#caltitle').textbox('setValue','');
	}
	function calUpdate(a,b,c){
  		$("#calday2").textbox('setValue',a);
		$("#caltitle2").textbox('setValue',b);
		$("#calcontent2").textbox('setValue',c);
		$("#update").dialog('open');
	}
	function caUpdate(){
		$("#f_update").attr("method","get");
		$("#f_update").attr("action","./update.do");
		$("#f_update").submit();
	}
	function caDelete(){
		$("#f_update").attr("method","get");
		$("#f_update").attr("action","./delete.do");
		$("#f_update").submit();
	}
	$(document).ready(function(){
		$('#calcontent').textbox('textbox').bind('keyup', function(e){
			var temp = $(this).val();
			var templen = temp.length;
			//alert("templen:"+templen);
			if(templen>200){
				alert('200�ڸ��� �Է°���.');
				$('#calcontent').textbox('setValue',temp.substring(0,200));
			}
		});
	});

</script>
</HEAD>
<BODY>
<form name="calendarFrm" id="calendarFrm" action="" method="post">
<DIV id="content" style="width:712px;">
<!--��¥ �׺���̼�  -->
<table width="100%" border="0" cellspacing="1" cellpadding="1" id="KOO" bgcolor="#F3F9D7" style="border:1px solid #CED99C">
	<tr>
		<td height="60">
     		<table border=0> 
   				<tr>
    <% 
    String month3 = "";
    if(month7<0 ) {
    	month7=11;
    	year7-=1;
    }
    else if ( month7>11 ){
    	month7=0;
    	year7+=1;
    }
    if (month7<9){
    	month3 = "0"+(month7+1);
    }
    else{
    	month3 = ""+(month7+1);
    }
    %>
    
    <!-- �� -->
    				<td align=left width=200>
    					<a href="getCalList.do?year=<%out.print(year7-1);%>&month=<%out.print(month7);%>"><font size="4">��</font></a>
    					<font size="4"><% out.print(year7); %>��</font>
    					<a href="getCalList.do?year=<%out.print(year7+1);%>&month=<%out.print(month7);%>"><font size="4">��</font></a>
    				</td>
    				<!-- �� -->
    				<td align=center width=200> 
    					<a href="getCalList.do?year=<%out.print(year7);%>&month=<%out.print(month7-1);%>"><font size="4">��</font></a>
    					<font size="4"><% out.print(month7+1); %>��</font>
    					<a href="getCalList.do?year=<%out.print(year7);%>&month=<%out.print(month7+1);%>"><font size="4">��</font></a>
    				</td>
    				<!-- �� -->
    				<td align=right width=200><font size="4"><%out.print(today7);%></font>
    				</td>
					<td align ="right">
						<input class="easyui-linkbutton" iconCls="icon-search" onclick="javascript:today()" value="����"/>
    				</td>
   				</tr>
  			</table>
		</td>
	</tr>
</table>
<table border="0" cellspacing="1" cellpadding="1" bgcolor="#FFFFFF">
<THEAD>
<TR bgcolor="#FFFFA1"> <!-- ��� �� -->
       <TD width='100px'>
       <DIV align="center"><font color="red">��</font></DIV>
       </TD>
       <TD width='100px'>
       <DIV align="center">��</DIV>
       </TD>
       <TD width='100px'>
       <DIV align="center">ȭ</DIV>
       </TD>
       <TD width='100px'>
       <DIV align="center">��</DIV>
       </TD>
       <TD width='100px'>
       <DIV align="center">��</DIV>
       </TD>
       <TD width='100px'>
       <DIV align="center">��</DIV>
       </TD>
       <TD width='100px'>
       <DIV align="center"><font color="blue">��</font></DIV>
       </TD>
</TR>
</THEAD>
<TBODY>
<TR>
<%
//ó�� ����� ǥ��
for(int index = 1; index < start ; index++ )
{
  out.println("<TD >&nbsp;</TD>");
  newLine++;
}
for(int index = 1; index <= endDay; index++)
{
       String color = "";
       if(newLine == 0){          color = "RED";
       }else if(newLine == 6){    color = "BLUE";
       }else{                     color = "BLACK"; };
       String sUseDate = Integer.toString(year7); 
       sUseDate += Integer.toString(month7+1).length() == 1 ? "0" + Integer.toString(month7+1) : Integer.toString(month7+1);
       sUseDate += Integer.toString(index).length() == 1 ? "0" + Integer.toString(index) : Integer.toString(index);
       int iUseDate = Integer.parseInt(sUseDate);
       String backColor = "#FFFFF6"; // ���ϸ��� ��
       if(iUseDate == intToday ) {
             backColor = "#FFFFC5"; // ���� ��¥ ��
       } 
       out.println("<TD valign='top' align='left' height='92px' bgcolor='"+backColor+"' nowrap>");
       %>

       
       <%
       		String day3 = "";
       		if ( index<10){
       			day3 = "0"+index;
       		}
       		else{
       			day3 = ""+index;
       		}
       %>
            <a href="#" onClick="ss(<%=day3%>)"><font color="<%=color%>"><%=day3 %></font></a>
            <%-- <a href="#"><%=year7 %>-<%=month3 %>-<%=day3 %></a> --%>
            <%
            	int j=0;
            	for ( int i=0; i<calList.size(); i++){
            		if (  (year7+"-"+month3+"-"+day3).equals(calList.get(i).get("CALDAY")) ){
            %>			
            		
            			<a href="javascript:calUpdate('<%=calList.get(i).get("CALDAY")%>','<%=calList.get(i).get("CALTITLE")%>','<%=calList.get(i).get("CALCONTENT")%>')"><font color="#FF2424"><%=calList.get(i).get("CALTITLE") %></font></a>
            <%		
            		}
            	}
            %>

       <%
       //��� ����  
       out.println("</TD>");
       newLine++;
       if(newLine == 7)
       {
         out.println("</TR>");
         if(index <= endDay)
         {
           out.println("<TR>");
         }
         newLine=0;
       }
}
//������ ���� LOOP
while(newLine > 0 && newLine < 7)
{
	out.println("<TD>&nbsp;</TD>");
	newLine++;
}
%>
</TR>
</TBODY>
</TABLE>
</DIV>
</form>
	<div id="insert" buttons="#btn_insert" modal="true" class="easyui-dialog" title="����" closed="true" style="width:400px;height:450px">
		<form id="f_insert" method="post" enctype="multipart/form-data"
			style="padding: 20px 20px">
			<input type="hidden" id="emp_no" name="emp_no" value="<%=emp_no%>">
			<table width="350px">
				<tr style="height: 35px">
					<td width="50px" height="25px"><label>��¥ : </label></td>
					<td width="100px"><input class="easyui-textbox" id="calday", readonly="false"
						name="calday" style="width: 250px" required="true"></td>
				</tr>
				<tr style="height: 35px">
					<td width="50px" height="25px"><label>���� : </label></td>
					<td width="100px"><input class="easyui-textbox" id="caltitle"
						name="caltitle" style="width: 250px" required="true"></td>
				</tr>
				<tr>
					<td width="50px"><label>���� : </label></td>
					<td width="250px"><input class="easyui-textbox" id="calcontent"
						name="calcontent" multiline="true"
						style="width: 250px; height: 150px" required="true"></td>
				</tr>
			</table>
		</form>
	</div>
	<div id="btn_insert">
      	<a href="javascript:save()" class="easyui-linkbutton" data-options="iconCls:'icon-save'">����</a>
      	<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-cancel'" onclick="closed()">�ݱ�</a>
    </div> 
    
    <div id="update" buttons="#btn_update" modal="true" class="easyui-dialog" title="����" closed="true" style="width:400px;height:450px">
		<form id="f_update" method="post" enctype="multipart/form-data"
			style="padding: 20px 20px">
			<input type="hidden" id="emp_no2" name="emp_no2" value="<%=emp_no%>">
			<table width="350px">
				<tr style="height: 35px">
					<td width="50px" height="25px"><label>��¥ : </label></td>
					<td width="100px"><input class="easyui-textbox" id="calday2", readonly="false"
						name="calday2" style="width: 250px" required="true"></td>
				</tr>
				<tr style="height: 35px">
					<td width="50px" height="25px"><label>���� : </label></td>
					<td width="100px"><input class="easyui-textbox" id="caltitle2"
						name="caltitle2" style="width: 250px" required="true"></td>
				</tr>
				<tr>
					<td width="50px"><label>���� : </label></td>
					<td width="250px"><input class="easyui-textbox" id="calcontent2"
						name="calcontent2" multiline="true"
						style="width: 250px; height: 150px" required="true"></td>
				</tr>
			</table>
		</form>
	</div>
	<div id="btn_update">
      	<a href="javascript:caDelete()" class="easyui-linkbutton" data-options="iconCls:'icon-remove'">����</a>
      	<a href="javascript:caUpdate()" class="easyui-linkbutton" data-options="iconCls:'icon-save'">����</a>
      	<a href="javascript:$('#update').dialog('close')" class="easyui-linkbutton" data-options="iconCls:'icon-cancel'">�ݱ�</a>
    </div> 
</BODY>
</HTML>