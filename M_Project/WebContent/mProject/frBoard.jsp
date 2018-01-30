<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="Mproject.mvc.BoardDao" %>
<%@ page import="Mproject.util.KoreanConversion" %>
<%@ page import="java.util.List, java.util.Map" %>
<%
	String mem = session.getAttribute("mem_id").toString();
	BoardDao boardDao = new BoardDao();
	List<Map<String,Object>> frBoardList = boardDao.frBoardList();
	List<Map<String,Object>> frSearchBoard = (List<Map<String,Object>>)request.getAttribute("frSearchBoard");
	if ( frSearchBoard == null ){
		frSearchBoard = frBoardList;
	}
	int totalCount = 0;
	int countList = 10;
	int totalPage = 0;
	if( frSearchBoard == null ){
		totalCount = frBoardList.size();
		totalPage = totalCount/countList;
		if ( totalCount%countList>0){
			totalPage++;
		}
	}else{
		totalCount = frSearchBoard.size();
		totalPage = totalCount/countList;
		if ( totalCount%countList>0){
			totalPage++;
		}
	}
	int page2 = 1;
	if ( request.getParameter("page2")==null ){
		page2 = 1;
	}else if( request.getParameter("page2") != null){
		String aa = request.getParameter("page2");
		page2 = Integer.parseInt(aa);
	}
	
	int countPage = 10;
	int startPage = ((page2-1)/10)*10+1;
	int endPage = startPage+countPage-1;
	if  ( endPage > totalPage ){
		endPage = totalPage;
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
</head>
<body>
<!-- Services Section -->
<div id="services" class="text-center" style="height:100%"> <!-- style="height:100%" -->
  <div class="container">
    <div class="section-title center">
      <h2>�����Խ���</h2>
      <hr class="hr1">
    </div>
    <div class="space"></div>
    <div class="row">
    	<div>
			<table class="table" border="1">
				<thead>
					<tr>
						<th width="10%">��ȣ</th>
						<th width="50%">����</th>
						<th width="15%">�ۼ���</th>
						<th width="15%">��¥</th>
						<th width="10%">��ȸ��</th>
					</tr>
				</thead>
				<tbody>
				<% 
				if ( frSearchBoard.size() == frBoardList.size() ){
					for( int i=frBoardList.size(); i>0; i--){
						if ( Integer.parseInt(frBoardList.get(i-1).get("RNUM").toString()) >= (page2*10-9) && Integer.parseInt(frBoardList.get(i-1).get("RNUM").toString()) <= (page2*10 ) ){
					%>
					<tr style="color:white;">
						<td><%=i %></td>
						<%
						if ((KoreanConversion.toKor(mem)).equals(frBoardList.get(i-1).get("FR_ID"))){
						%>
						<td><a href="javascript:frView(610,670,'����','<%=frBoardList.get(i-1).get("FR_NO") %>','<%=page2 %>')" style="color:yellow;"><%=frBoardList.get(i-1).get("FR_JE") %></a></td>
						<%
						}else{
						%>
						<td><a href="javascript:frView(610,670,'����','<%=frBoardList.get(i-1).get("FR_NO") %>','<%=page2 %>')" style="color:white;"><%=frBoardList.get(i-1).get("FR_JE") %></a></td>
						<%
						}
						%>
						<td><%=frBoardList.get(i-1).get("FR_ID") %></td>
						<td><%=frBoardList.get(i-1).get("FR_DE") %></td>
						<td><%=frBoardList.get(i-1).get("FR_HI") %></td>
					</tr>
					<%
					}
					}
				}else{
					for( int i=frSearchBoard.size(); i>0; i--){
						if ( Integer.parseInt(frSearchBoard.get(i-1).get("RNUM").toString()) >= (page2*10-9) && Integer.parseInt(frSearchBoard.get(i-1).get("RNUM").toString()) <= (page2*10 ) ){
						%>
						<tr style="color:white;">
							<td><%=i %></td>
							<%
							if ((KoreanConversion.toKor(mem)).equals(frSearchBoard.get(i-1).get("FR_ID"))){
							%>
							<td><a href="javascript:frView(610,670,'����','<%=frSearchBoard.get(i-1).get("FR_NO") %>','<%=page2 %>')" style="color:yellow;"><%=frSearchBoard.get(i-1).get("FR_JE") %></a></td>
							<%
							}else{
							%>
							<td><a href="javascript:frView(610,670,'����','<%=frSearchBoard.get(i-1).get("FR_NO") %>','<%=page2 %>')" style="color:white;"><%=frSearchBoard.get(i-1).get("FR_JE") %></a></td>
							<%
							}
							%>
							<td><%=frSearchBoard.get(i-1).get("FR_ID") %></td>
							<td><%=frSearchBoard.get(i-1).get("FR_DE") %></td>
							<td><%=frSearchBoard.get(i-1).get("FR_HI") %></td>
						</tr>
						<%
						}
					}
				}
				%>
				</tbody>
			</table>
			<!-- ������ó�� -->
			<table align="center">
				<tr>
					<td>
						<%
						
						if (startPage > 1) {
						    %>
						    <a href="./start.jsp?gugu=fboard&page2=1"><font color="white">ó��</font></a>
						    <%
						}
						if (page2 > 1) {
						    %>
						    <a href="./start.jsp?gugu=fboard&page2=<%=(page2-1)%>"><font color="white">����</font></a>
						    <%
						}
						for (int iCount = startPage; iCount <= endPage; iCount++) {
						    if (iCount == page2) {
						    	%>
						        &nbsp;<b><font color="white"><%=iCount %></font></b>
						        <%
						    } else {
						    	%>
						    	&nbsp;<b><a href="./start.jsp?gugu=fboard&page2=<%=iCount%>"><font color="yellow"><%=iCount %></font></a></b>
						    	<%
						    }
						}
						if (page2 < totalPage) {
							%>
							<a href="./start.jsp?gugu=fboard&page2=<%=(page2+1) %>"><font color="white">����</font></a>
							<%
						}
						if (endPage < totalPage) {
							%>
							<a href="./start.jsp?gugu=fboard&page2=<%=totalPage %>"><font color="white">��</font></a>
							<%
						}
						
						%>
					</td>
				</tr>
			</table>
			<!-- �˻� �� �۾��� -->
			<form id="f_fr_search" name="f_fr_search">
			<table align="center">
				<tr>
					<td width="350px">
					</td>
					<td>
						<select name="fr_option" id="fr_option" style="height:30px;color:black;">
						    <option value="fr_title" style="color:black;">����</option>
						    <option value="fr_writer" style="color:black;">�۾���</option>
  						</select>
					</td>
					<td>
						<input class="form-control input-sm" autocomplete="off"	name="fr_keyword" id="fr_keyword" type="text" placeholder="�˻���">
					</td>
					<td>
						<a href="javascript:fr_search()" class="btnb btn-default page-scroll">�˻�</a>
					</td>
					<td width="350px">
					</td>
					<td>
						<a href="javascript:fr_write(610,720,'�����Խ��� �۾���')" class="btnb btn-default page-scroll">�۾���</a>
					</td>
				</tr>
			</table>
			</form>
		</div>
    </div>
	</div>
</div>
</body>
</html>