<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.util.List, java.util.Map" %>
<%@ page import="com.util.PageBar" %>
<%@page import="java.util.Calendar"%>
<%	
	int size=0;
	List<Map<String,Object>> boardEmpList = (List<Map<String,Object>>)request.getAttribute("boardEmpList");
	if ( boardEmpList== null || boardEmpList.size()==0 ){
		response.sendRedirect("./getBoardEmp.do");
	}
	else{
		if ( boardEmpList.size() > 0 && boardEmpList!=null) {
			size = boardEmpList.size();
		}
	}
/* 페이징 처리 시작  */
	int pagecount = 0;//총 페이지 수
	int pagesize = 5;//한 페이지에 뿌려질 로우 수
	int mypage = 0;//내가 바라보는 페이지
	if(request.getParameter("page") != null){
		mypage = Integer.parseInt(request.getParameter("page"));
	}
	String imagePath = "../images/";
	String emp_name2 = session.getAttribute("emp_name").toString();
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
/* 페이징 처리 끝  */
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	  	
		<!-- <link rel="stylesheet" href="../css/font-awesome.min.css">                                                                                        
      	<link href='https://fonts.googleapis.com/css?family=Passion+One' rel='stylesheet' type='text/css'>                                                
      	<link href='https://fonts.googleapis.com/css?family=Oxygen' rel='stylesheet' type='text/css'>                                                     
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">   
                                                
        <link href="../css/bootstrap.min.css" rel="stylesheet" media="screen">                                  
                                                  
        <link href="../css/font-awesome.min.css" rel="stylesheet">                                                                                        
        <link href="../fonts/icon-7-stroke/css/pe-icon-7-stroke.css" rel="stylesheet">   
                                                                         
        <link href="../css/animate.css" rel="stylesheet" media="screen">                                                                                  
        <link href="../css/owl.theme.css" rel="stylesheet">                                                                                               
        <link href="../css/owl.carousel.css" rel="stylesheet">                                                                  
        <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Lato:100,300,400,700,900,100italic,300italic,400italic,700italic,900italic" /> -->
        <link href="../css/css-index2.css?022" rel="stylesheet" media="screen">
        
        <script type="text/javascript">
        	$(document).ready(function(){
        		
        	});
        	function view(bbb
        				, emp_no
        			    , emp_name
        			    , board_emp_title
        			    , board_emp_hit
        			    , board_emp_content){
        		$("#board_emp_no").val(bbb);
        		$("#board_emp_hit").val(board_emp_hit);
         		$("#d_name2").val(emp_name);
        		$("#d_title2").val(board_emp_title);
        		$("#d_content2").val(board_emp_content); 
         		$('#dl_boardUpd').dialog('open');
        	}
        	function boardInsOpen(){
        		$("#dl_boardIns").dialog("open");
        	}
        	function close(){
        		$("#d_title").val('');
        		$("#d_content").val('');
        		$("#d_pw").val('');
        		$('#dl_boardIns').dialog('close');
        	}
        	function save(){
        		if ( $("#d_pw").val() == null || ""==$("#d_pw").val() ){
        			$.messager.alert({
        				title: '알림',
        				msg: '비밀번호를 입력하세요.',
        				fn: function(){
        				}
        			});
        			return;
        		}
        		$("#f_boardIns").attr("method","get");
        		$("#f_boardIns").attr("action","./boardIns.do");
        		$("#f_boardIns").submit();
        	}
        	function Updclose(){
        		$("#d_title2").val('');
        		$("#d_content2").val('');
        		$("#d_pw2").val('');
        		$('#dl_boardUpd').dialog('close');
        		location.href="./hitUpdate.do?board_emp_no="+$("#board_emp_no").val()+"&board_emp_hit="+board_emp_hit
        	}
        	function boardUp(){
         		$("#f_boardUpd").attr("method","get");
        		$("#f_boardUpd").attr("action","./boardUpd.do");
        		$("#f_boardUpd").submit();
        		//location.href="./hitUpdate.do?board_emp_no="+$("#board_emp_no").val()+"&board_emp_hit="+board_emp_hit
        	}
        	function boardDelete(){
        		$("#f_boardUpd").attr("method","get");
        		$("#f_boardUpd").attr("action","./boardDel.do");
        		$("#f_boardUpd").submit();
        	}
        </script>
</head>
<body>

<div class="container">
	<table class="table table-scriped" style="width:1000px;height:200px">
		<thead>
		<tr>
			<th width="10%">번호</th>
			<th width="50%">제목</th>
			<th width="10%">작성자</th>
			<th width="20%">작성일</th>
			<th width="10%">조회수</th>
		</tr>
		</thead>
		<tbody>
		<%
		int num = size-(pagesize*((mypage+1)-1));	
		for(int j=mypage*pagesize;j<(mypage*pagesize)+pagesize;j++){
			if(j == size) break;
			//for ( int i=0; i<size;i++){
			Map<String,Object> rMap = boardEmpList.get(j);
		%>
			<tr height="20px">
				<td><%=rMap.get("RNUM") %></td>
				<td><a href="javascript:view('<%=rMap.get("BOARD_EMP_NO") %>','<%=rMap.get("EMP_NO") %>','<%=rMap.get("EMP_NAME")%>','<%=rMap.get("BOARD_EMP_TITLE")%>','<%=rMap.get("BOARD_EMP_HIT")%>','<%=rMap.get("BOARD_EMP_CONTENT")%>')"><%=rMap.get("BOARD_EMP_TITLE") %></a></td>
				<td><%=rMap.get("EMP_NAME") %></td>
				<td><%=rMap.get("BOARD_EMP_DATE") %></td>
				<td><%=rMap.get("BOARD_EMP_HIT") %></td>
			</tr>
		<%
			}
		%>
		</tbody>
	</table>


	<hr/>
		<!----------------------------- 페이징 ---------------------------->
		<table width=700px BGCOLOR=ffffff border=1 cellpadding=0 cellspacing=0 align="center">
		<tr BGCOLOR=FFFFFF>
		<td width=500px  align=center valign=middle height=30>
<%
	String pagePath = "getBoardEmp.do";
	PageBar pg = new PageBar(pagesize, size, mypage, pagePath);
	out.print(pg.getPageBar());
%>	
		</td>
		<td>
		<a class="btn btn-default pull-right" onClick="boardInsOpen()">글쓰기</a>
		</td>
		</tr>		
		</table>
		
</div>
	<!-- 글 추가 -->
	<div id="dl_boardIns" buttons="#btn_boardIns" modal="true" class="easyui-dialog" title="글쓰기" closed="true" style="width:600px;height:605px">
		<form id="f_boardIns" method="post" enctype="multipart/form-data" style="padding:20px 20px">  	
		<table>
		    <thead>
	        	<caption><font size="3">글쓰기</font></caption>
	    	</thead>
	    	<tbody>
	            	<tr style="height:40px">
		                <th>작성자  </th>
	                	<td><input type="text" id="d_name" name="d_name" class="form-control" style="width:200px" value="<%=emp_name2%>" readonly="false"/></td>
	            	</tr>
	            	<tr style="height:40px">
		                <th>작성일  </th>
	                	<td><input type="text" id="d_date" name="d_date" class="form-control" style="width:200px" value="<%=today7%>" readonly="false"/></td>
	            	</tr>
	            	<tr style="height:40px">
		                <th>제목  </th>
	                	<td><input type="text" placeholder="제목을 입력하세요. " id="d_title" name="d_title" class="form-control" style="width:250px" /></td>
	            	</tr>
	            	<tr style="height:70px">
		                <th>내용  </th>
	                	<td><textarea cols="10" placeholder="내용을 입력하세요. " id="d_content" name="d_content" class="form-control" style="width:250;height:125px"></textarea></td>
	            	</tr>
	            	<tr style="height:40px">
		                <th width="100px">비밀번호 </th>
	                	<td><input type="password" placeholder="비밀번호를 입력하세요" id="d_pw" name="d_pw" class="form-control"/></td>
	            	</tr>
	    	</tbody>
		</table>
	    </form>
	</div>
    <div id="btn_boardIns">
		<a href="javascript:save()" class="easyui-linkbutton" data-options="iconCls:'icon-save'">저장</a>
		<a href="javascript:close()" class="easyui-linkbutton" data-options="iconCls:'icon-cancel'">닫기</a>
    </div>
    
    <!-- 글 수정 -->
	<div id="dl_boardUpd" buttons="#btn_boardUpd" modal="true" class="easyui-dialog" title="글수정" closed="true" style="width:600px;height:605px">
		<form id="f_boardUpd" method="post" enctype="multipart/form-data" style="padding:20px 20px">  	
		<input type="hidden" id="emp_no" name="emp_no" value="<%=emp_no %>" />
		<input type="hidden" id="board_emp_no" name="board_emp_no"/>
		<input type="hidden" id="board_emp_hit" name="board_emp_hit"/>
		<table>
		    <thead>
	        	<caption><font size="3">수정</font></caption>
	    	</thead>
	    	<tbody>
	            	<tr style="height:40px">
		                <th>작성자  </th>
	                	<td><input type="text" id="d_name2" name="d_name2" class="form-control" style="width:200px" value="<%=emp_name2%>" readonly="false"/></td>
	            	</tr>
	            	<tr style="height:40px">
		                <th>작성일  </th>
	                	<td><input type="text" id="d_date2" name="d_date2" class="form-control" style="width:200px" value="<%=today7%>" readonly="false"/></td>
	            	</tr>
	            	<tr style="height:40px">
		                <th>제목  </th>
	                	<td><input type="text" placeholder="제목을 입력하세요. " id="d_title2" name="d_title2" class="form-control" style="width:250px" /></td>
	            	</tr>
	            	<tr style="height:70px">
		                <th>내용  </th>
	                	<td><textarea cols="10" placeholder="내용을 입력하세요. " id="d_content2" name="d_content2" class="form-control" style="width:250;height:125px"></textarea></td>
	            	</tr>
	            	<tr style="height:40px">
		                <th width="100px">비밀번호 </th>
	                	<td><input type="password" placeholder="비밀번호를 입력하세요" id="d_pw2" name="d_pw2" class="form-control"/></td>
	            	</tr>
	    	</tbody>
		</table>
	    </form>
	</div>
    <div id="btn_boardUpd">
		<a href="javascript:boardUp()" class="easyui-linkbutton" data-options="iconCls:'icon-save'">저장</a>
		<a href="javascript:boardDelete()" class="easyui-linkbutton" data-options="iconCls:'icon-remove'">삭제</a>
		<a href="javascript:Updclose()" class="easyui-linkbutton" data-options="iconCls:'icon-cancel'">닫기</a>
    </div>
</body>
</html>