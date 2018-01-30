<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.util.List, java.util.Map" %>
<%
	List<Map<String,Object>> scList = (List<Map<String,Object>>)request.getAttribute("scList");
	if ( scList == null ) {
		
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html;charset=UTF-8"/>
<style type="text/css">
    body {
        margin: 40px 10px;
        padding: 0;
        font-family: "Lucida Grande",Helvetica,Arial,Verdana,sans-serif;
        font-size: 14px;
    }

    #calendar {
        max-width: 900px;
        margin: 0 auto;
    }
    
    .fc-day-number.fc-sat.fc-past { color:#0000FF; }    /* 토요일 */
    .fc-day-number.fc-sun.fc-past { color:#FF0000; }    /* 일요일 */
    .fc-day-number.fc-sat.fc-future { color:#0000FF; }    /* 일요일 */
    .fc-day-number.fc-sun.fc-future { color:#FF0000; }    /* 일요일 */
</style>
<link href="../css/fullcalendar.css" rel="stylesheet"/>
<link href="../css/fullcalendar.print.css" rel="stylesheet" media="print"/>
<script type="text/javascript" src="../lib/moment.min.js"></script>
<script type="text/javascript" src="../lib/jquery.min.js"></script>
<script type="text/javascript" src="../js/fullcalendar.js" charset="EUC-KR"></script>
<script type="text/javascript">
    $(document).ready(function() { 
    	var sc_no;
    	var size = <%=scList.size()%>;
		var dearr = [];
		var jearr = [];
		
		<%
		for ( int i=0; i<scList.size(); i++){
		%>
			dearr[<%=i%>] = "<%=scList.get(i).get("SC_DE")%>";
			jearr[<%=i%>] = "<%=scList.get(i).get("SC_JE")%>";
		<%
		}
		%>
		
		for(var i = 0, result = []; i < size ; i++){
			result.push({"start" : dearr[i], "title" : jearr[i] });
		}
		
		$("#calendar").fullCalendar({
			editable : false,
            eventLimit : true,
            dayClick: function(date) {
            	scIns(400,440,'일정추가',date.format(),<%=mem_no%>);
            },
			events: result,
			eventClick: function(event){
				var thisTitle = event.title;
				var thisDay = moment(event.start).format("YYYY-MM-DD");
				
				<%
				for ( int i=0; i<scList.size(); i++){
				%>
					if ( thisTitle == "<%=scList.get(i).get("SC_JE")%>"){
						if ( thisDay == "<%=scList.get(i).get("SC_DE")%>"){
							sc_no = <%=scList.get(i).get("SC_NO")%>;
						}
					}
				<%
				}
				%>
 	           	scUpd(400,440,'일정보기', thisTitle,thisDay,sc_no);
			}
		});
    });
    function scUpd(
			  popupwidth
			, popupheight
			, popupname
			, sc_je
			, sc_de
			, sc_no){
							Top = (window.screen.height-popupheight)/3;
							Left = (window.screen.width-popupwidth)/2;
							if ( Top < 0 ) Top = 0;
							if ( Left < 0 ) Left = 0;
							options = "location=no, fullscreen=no, status=yes, left=" + Left + ", top=" + Top + 
							", width=" + popupwidth + ", height=" + popupheight;
							popupname = window.open("./scUpd.jsp?sc_je="+encodeURI(encodeURIComponent(sc_je))+"&sc_de="+sc_de+"&sc_no="+sc_no, popupname, options);
							popupname.focus();
	}
    function scIns(
			  popupwidth
			, popupheight
			, popupname
			, ym
			, mem_no){
							Top = (window.screen.height-popupheight)/3;
							Left = (window.screen.width-popupwidth)/2;
							if ( Top < 0 ) Top = 0;
							if ( Left < 0 ) Left = 0;
							options = "location=no, fullscreen=no, status=yes, left=" + Left + ", top=" + Top + 
							", width=" + popupwidth + ", height=" + popupheight;
							popupname = window.open("./scIns.jsp?ym="+ym+"&mem_no="+mem_no, popupname, options);
							popupname.focus();
	}
</script>
<body>
	<div id="contact" class="text-center" style="width:100%; height:100%">
    	<div id="calendar"></div>
    </div>
</body>
</html>