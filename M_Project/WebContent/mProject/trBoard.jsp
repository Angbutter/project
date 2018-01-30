<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="Mproject.mvc.BoardDao" %>
<%@ page import="Mproject.util.KoreanConversion" %>
<%@ page import="java.util.List, java.util.Map" %>
<%
	String mem = session.getAttribute("mem_id").toString();
	BoardDao boardDao = new BoardDao();
	List<Map<String,Object>> trBoardList = boardDao.trBoardList();
	List<Map<String,Object>> trSearchBoard = (List<Map<String,Object>>)request.getAttribute("trSearchBoard");
	if ( trSearchBoard == null ){
		trSearchBoard = trBoardList;
	}
	int totalCount = 0;
	int countList = 10;
	int totalPage = 0;
	if( trSearchBoard == null ){
		totalCount = trBoardList.size();
		totalPage = totalCount/countList;
		if ( totalCount%countList>0){
			totalPage++;
		}
	}else{
		totalCount = trSearchBoard.size();
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
<!-- Testimonials Section -->
<div id="testimonials" class="text-center" style="height:100%"> <!-- style="height:100%" -->
  <div class="container">
    <div class="section-title center">
      <h2>거래게시판</h2>
      <hr class="hr1">
    </div>
    <div class="space"></div>
    <div class="row">
      <div>
			<table class="table" border="1">
				<thead>
					<tr>
						<th width="7%">번호</th>
						<th width="10">거래구분</th>
						<th width="41%">제목</th>
						<th width="10%">가격</th>
						<th width="10%">작성자</th>
						<th width="15%">날짜</th>
						<th width="7%">조회수</th>
					</tr>
				</thead>
				<tbody>
				<% 

				if ( trSearchBoard.size() == trBoardList.size() ){
					for( int i=trBoardList.size(); i>0; i--){
						if ( Integer.parseInt(trBoardList.get(i-1).get("RNUM").toString()) >= (page2*10-9) && Integer.parseInt(trBoardList.get(i-1).get("RNUM").toString()) <= (page2*10) ){ 
					%>
						<tr style="color:white;">
	 						<td><%=i %></td>
	 						<%
	 						if ( "sap".equals(trBoardList.get(i-1).get("TR_GB"))){
	 						%>
	 						<td>삽니다</td>
	 						<%
	 						}else{
	 						%>
	 						<td>팝니다</td>
	 						<%
	 						}
	 						if ( (KoreanConversion.toKor(mem)).equals(trBoardList.get(i-1).get("TR_ID"))) {
	 						%>
	 						<td><a href="javascript:trView(610,765,'보기','<%=trBoardList.get(i-1).get("TR_NO") %>','<%=page2 %>')" style="color:yellow;"><%=trBoardList.get(i-1).get("TR_JE") %></a></td>
	 						<%
	 						}else{
	 						%>
	 						<td><a href="javascript:trView(610,765,'보기','<%=trBoardList.get(i-1).get("TR_NO") %>','<%=page2 %>')" style="color:white;"><%=trBoardList.get(i-1).get("TR_JE") %></a></td>
	 						<%
	 						}
	 						%>
	 						<td><%=trBoardList.get(i-1).get("TR_PR") %></td>
							<td><%=trBoardList.get(i-1).get("TR_ID") %></td>
							<td><%=trBoardList.get(i-1).get("TR_DE") %></td>
							<td><%=trBoardList.get(i-1).get("TR_HI") %></td>
						</tr>
					<%
					}
					 } 
				}else{
					for( int i=trSearchBoard.size(); i>0; i--){
						if ( Integer.parseInt(trSearchBoard.get(i-1).get("RNUM").toString()) >= (page2*10-9) && Integer.parseInt(trSearchBoard.get(i-1).get("RNUM").toString()) <= (page2*10) ){
						%>
							<tr style="color:white;">
		 						<td><%=i %></td>
		 						<%
		 						if ( "sap".equals(trSearchBoard.get(i-1).get("TR_GB"))){
		 						%>
		 						<td>삽니다</td>
		 						<%
		 						}else{
		 						%>
		 						<td>팝니다</td>
		 						<%
		 						}
		 						if ( (KoreanConversion.toKor(mem)).equals(trSearchBoard.get(i-1).get("TR_ID"))) {
		 						%>
		 						<td><a href="javascript:trView(610,765,'보기','<%=trSearchBoard.get(i-1).get("TR_NO") %>','<%=page2 %>')" style="color:yellow;"><%=trSearchBoard.get(i-1).get("TR_JE") %></a></td>
		 						<%
		 						}else{
		 						%>
		 						<td><a href="javascript:trView(610,765,'보기','<%=trSearchBoard.get(i-1).get("TR_NO") %>','<%=page2 %>')" style="color:white;"><%=trSearchBoard.get(i-1).get("TR_JE") %></a></td>
		 						<%
		 						}
		 						%>
		 						<td><%=trSearchBoard.get(i-1).get("TR_PR") %></td>
								<td><%=trSearchBoard.get(i-1).get("TR_ID") %></td>
								<td><%=trSearchBoard.get(i-1).get("TR_DE") %></td>
								<td><%=trSearchBoard.get(i-1).get("TR_HI") %></td>
							</tr>
							<%
							}
				}
				}
				%>
				</tbody>
			</table>
			<!-- 페이지처리 -->
			<table align="center">
				<tr>
					<td>
						<%
						
						if (startPage > 1) {
						    %>
						    <a href="./start.jsp?gugu=tboard&page2=1"><font color="white">처음</font></a>
						    <%
						}
						if (page2 > 1) {
						    %>
						    <a href="./start.jsp?gugu=tboard&page2=<%=(page2-1)%>"><font color="white">이전</font></a>
						    <%
						}
						for (int iCount = startPage; iCount <= endPage; iCount++) {
						    if (iCount == page2) {
						    	%>
						        &nbsp;<b><font color="white"><%=iCount %></font></b>
						        <%
						    } else {
						    	%>
						    	&nbsp;<b><a href="./start.jsp?gugu=tboard&page2=<%=iCount%>"><font color="yellow"><%=iCount %></font></a></b>
						    	<%
						    }
						}
						if (page2 < totalPage) {
							%>
							<a href="./start.jsp?gugu=tboard&page2=<%=(page2+1) %>"><font color="white">다음</font></a>
							<%
						}
						if (endPage < totalPage) {
							%>
							<a href="./start.jsp?gugu=tboard&page2=<%=totalPage %>"><font color="white">끝</font></a>
							<%
						}
						
						%>
					</td>
				</tr>
			</table>
			<!-- 검색 및 글쓰기 -->
			<form id="f_tr_search" name="f_tr_search">
			<table align="center">
				<tr>
					<td width="350px">
					</td>
					<td>
						<select name="tr_option1" id="tr_option1" style="height:30px;color:black;">
							<option value="all" style="color:black;">전체</option>
						    <option value="pap" style="color:black;">팝니다</option>
						    <option value="sap" style="color:black;">삽니다</option>
  						</select>
					</td>
					<td>
						<select name="tr_option2" id="tr_option2" style="height:30px;color:black;">
						    <option value="tr_title" style="color:black;">제목</option>
						    <option value="tr_writer" style="color:black;">글쓴이</option>
  						</select>
					</td>
					<td>
						<input class="form-control input-sm" autocomplete="off"	name="tr_keyword" id="tr_keyword" type="text" placeholder="검색어">
					</td>
					<td>
						<a href="javascript:tr_search()" class="btnb btn-default page-scroll">검색</a>
					</td>
					<td width="350px">
					</td>
					<td>
						<a href="javascript:tr_write(610,810,'거래게시판 글쓰기')" class="btnb btn-default page-scroll">글쓰기</a>
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