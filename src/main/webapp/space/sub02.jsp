<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/global_head.jsp" %>
<%@page import="java.util.Calendar"%>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/js/bootstrap.bundle.min.js"></script>

<script type="text/javascript">
var today = new Date();
function buildCalendar(){
	var row = null
	var cnt = 0;
	var calendarTable = document.getElementById("calendar");
	var calendarTableTitle = document.getElementById("calendarTitle");
	calendarTableTitle.innerHTML = today.getFullYear()+"년"+(today.getMonth()+1)+"월";
	 
	var firstDate = new Date(today.getFullYear(), today.getMonth(), 1);
	var lastDate = new Date(today.getFullYear(), today.getMonth()+1, 0);
	while(calendarTable.rows.length > 2){
	 	calendarTable.deleteRow(calendarTable.rows.length -1);
  	}

	row = calendarTable.insertRow();
	
	for(i = 0; i < firstDate.getDay(); i++){
	 	cell = row.insertCell();
	 	cnt += 1;
	}
	
	
	for(i = 1; i <= lastDate.getDate(); i++){
		cell = row.insertCell();
		cnt += 1;
	
	  	cell.setAttribute('id', i);
		cell.innerHTML = i;
		cell.align = "center";
	
	 	cell.onclick = function(){
		  	clickedYear = today.getFullYear();
		  	clickedMonth = ( 1 + today.getMonth() );
		  	clickedDate = this.getAttribute('id');
		
		  	clickedDate = clickedDate >= 10 ? clickedDate : '0' + clickedDate;
		  	clickedMonth = clickedMonth >= 10 ? clickedMonth : '0' + clickedMonth;
		  	clickedYMD = clickedYear + "-" + clickedMonth + "-" + clickedDate;
		
		  	opener.document.getElementById("date").value = clickedYMD;
		  	self.close();
		}
	
		if (cnt % 7 == 1) {
		   cell.innerHTML = "<font color=#F79DC2>" + i + "</font>";
		}
	
		if (cnt % 7 == 0){
		   cell.innerHTML = "<font color=skyblue>" + i + "</font>";
		   row = calendar.insertRow();
		}
	}
	
	if(cnt % 7 != 0){
		for(i = 0; i < 7 - (cnt % 7); i++){
			cell = row.insertCell();
		}
	}
}

function prevCalendar(){
	today = new Date(today.getFullYear(), today.getMonth()-1, today.getDate());
	buildCalendar();
}

function nextCalendar(){
	today = new Date(today.getFullYear(), today.getMonth()+1, today.getDate());
	buildCalendar();
}
</script>
</head>
<body>
	<center>
	<div id="wrap">
		<%@ include file="../include/top.jsp" %>

		<img src="../images/space/sub_image.jpg" id="main_visual" />

		<div class="contents_box">
			<div class="left_contents">
				
				<%@ include file = "../include/space_leftmenu.jsp" %>
			</div>
			<div class="right_contents">
				<div class="top_title">
					<img src="../images/space/sub02_title.gif" alt="프로그램일정" class="con_title" />
					<p class="location"><img src="../images/center/house.gif" />&nbsp;&nbsp;열린공간&nbsp;>&nbsp;프로그램일정<p>
				</div>
				<!-- 달력 나오는 부분 -->
				<table id="calendar" align="center" 
                    style="width: 770px; height: 400px;">
					<tr>
						<td align="center"><label onclick="prevCalendar()"> ◀ </label></td>
						<td colspan="5" align="center" id="calendarTitle">yyyy년 m월</td>
						<td align="center"><label onclick="nextCalendar()"> ▶ </label></td>
					</tr>
					<tr>
						<td align="center"><font color ="#F79DC2">일</td>
						<td align="center">월</td>
						<td align="center">화</td>
						<td align="center">수</td>
						<td align="center">목</td>
						<td align="center">금</td>
						<td align="center"><font color ="skyblue">토</td>
					</tr>
					<script type="text/javascript">buildCalendar();</script>
				</table>
			</div>
			
			
		</div>
		<%@ include file="../include/quick.jsp" %>
	</div>
		
	
		<%@ include file="../include/footer.jsp" %>
	</center>
 </body>
</html>
