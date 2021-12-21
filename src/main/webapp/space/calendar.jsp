<%@page import="board.BoardDAO"%>
<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/global_head.jsp" %>
<%@ page import="java.util.*" %>
<%
	String cate = request.getParameter("cate");	
	String cateUrl = request.getRequestURI() + "?cate=" + cate;
	
	BoardDAO dao = new BoardDAO();
	Map<String, Object> param = new HashMap<String, Object>();
	
%>
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
				<%
				    Calendar cal = Calendar.getInstance();
				    int year = request.getParameter("y") == null ? 
				    		cal.get(Calendar.YEAR) : Integer.parseInt(request.getParameter("y"));
				    int month = request.getParameter("m") == null ? 
				    		cal.get(Calendar.MONTH) : (Integer.parseInt(request.getParameter("m")) - 1);
				
				    // 시작요일 확인
				    cal.set(year, month, 1);
				    int bgnWeek = cal.get(Calendar.DAY_OF_WEEK);
				
				    // 다음/이전월 계산
				    int prevYear = year;
				    int prevMonth = (month + 1) - 1;
				    int nextYear = year;
				    int nextMonth = (month  + 1) + 1;
				
				    // 1월인 경우 이전년 12월로 지정
				    if (prevMonth < 1) {
				        prevYear--;
				        prevMonth = 12;
				    }
				
				    // 12월인 경우 다음년 1월로 지정
				    if (nextMonth > 12) {
				        nextYear++;
				        nextMonth = 1;
				    }
				%>
				<table border="0" cellpadding="0" cellspacing="0">
				<tr>
				    <td align="center"><a href="./calendar.jsp?y=<%=prevYear%>&m=<%=prevMonth%>">◁</a> <%=year%>년 <%=month+1%>월 <a href="./calendar.jsp?y=<%=nextYear%>&m=<%=nextMonth%>">▷</a></td>
				</tr>
				<tr>
				    <td>
				
				        <table border="1" style="width: 700px; height: 300px;">
				        <tr>
				            <td align="center"><font color ="red">일</td>
				            <td align="center">월</td>
				            <td align="center">화</td>
				            <td align="center">수</td>
				            <td align="center">목</td>
				            <td align="center">금</td>
				            <td align="center"><font color ="skyblue">토</td>
				        </tr>
				        <tr>
						<%
						    // 시작요일까지 이동
						    for (int i=1; i<bgnWeek; i++) 
						    	out.println("<td>&nbsp;</td>");
						
						    //마지막날
						    while (cal.get(Calendar.MONTH) == month) {
						        out.println("<td>" + cal.get(Calendar.DATE) + "</td>");
						
						        // 토요일인 경우 줄바꿈
						        if (cal.get(Calendar.DAY_OF_WEEK) == Calendar.SATURDAY){
						        	out.println("</tr><tr>");
						        }
						
						        // 날짜 증가시키기
						        cal.set(cal.get(Calendar.YEAR), cal.get(Calendar.MONTH), 
						        		cal.get(Calendar.DATE)+1);
						    }
						
						    // 빈칸 처리
						    for (int i=cal.get(Calendar.DAY_OF_WEEK); i<=7; i++) 
						    	out.println("<td>&nbsp;</td>");
						    
						%>
				        </tr>
				        </table>
				
				    </td>
				</tr>
				</table>
				
			</div>
		</div>
		<%@ include file="../include/quick.jsp" %>
	</div>
	

	<%@ include file="../include/footer.jsp" %>
	</center>
 </body>
</html>
