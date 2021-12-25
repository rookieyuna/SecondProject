<%@page import="board.BoardDTO"%>
<%@page import="board.BoardDAO"%>
<%@page import="java.util.Calendar"%>
<%@ page import="java.util.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/global_head.jsp" %>
<%
	String cate = request.getParameter("cate");	
	String cateUrl = request.getRequestURI() + "?cate=" + cate;
	
	BoardDAO dao = new BoardDAO();
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
				
				
					<!-- 달력 뿌리는 부분 -->
					<%
					//현재 년/월/일을 구하기 위한 인스턴스 생성
					Calendar tDay = Calendar.getInstance();
					
					/*
					파라미터가 있는 경우 : 파라미터에 해당하는 년/월을 표현
					파라미터가 없는 경우 : 무조건 현재 년/월을 표현
					*/
					int y = (request.getParameter("y")==null) ?
					    tDay.get(Calendar.YEAR) :
					    Integer.parseInt(request.getParameter("y"));
					int m = (request.getParameter("m")==null) ?
					    tDay.get(Calendar.MONTH) :
					    Integer.parseInt(request.getParameter("m"));
					int d = tDay.get(Calendar.DATE);
					
					/*
					날자설정을 위한 객체생성 : 현재 년/월 그리고 1일로 설정
					한다. 즉 현재월의 1일로 설정한다.
					*/
					Calendar dSet = Calendar.getInstance();
					
					dSet.set(y, m, 1);//현재 년/월/1 일로 설정함
					//오늘이 어떤 요일인지 구한다.
					int yo = dSet.get(Calendar.DAY_OF_WEEK);
					//현재월의 마지막 날자를 구한다.(7월->31, 9월->30)
					int last_day = dSet.getActualMaximum(Calendar.DATE);
					
					int prevY, prevM, nextY, nextM;
					
					
					if(m==0) {
						prevY = y-1;
						prevM = 11;
					}
					else {
						prevY = y;
						prevM = m-1;
					}
					
					if(m==11) {
						nextY = y+1;
						nextM = 0;
					}
					else {
						nextY = y;
						nextM = m+1;
					}
					
					m++;
				    String mo = (m<10) ? "0"+m : ""+m;
				    String data = y+"-"+mo;
				    Map<String, BoardDTO> calendar = dao.calList(data);
				    dao.close();
					%>
					
					<!-- 이전달,다음달로 넘기는 부분 -->
					<div style="text-align: center">
						<a href="./calendar.jsp?cate=proB&y=<%=prevY%>&m=<%=prevM%>">◁</a>
						&nbsp;&nbsp;&nbsp;
						<%=y %>년 <%=m %>월
						&nbsp;&nbsp;&nbsp;
						<a href="./calendar.jsp?cate=proB&y=<%=nextY %>&m=<%=nextM%>">▷</a>							
					</div>
					<br />		
					
					<table cellpadding="0" cellspacing="0" border="1" class="calendar"
						style="width:100%; height: 350px;">
					    <colgroup>
					   	 <col width="14%" />
					   	 <col width="14%" />
					   	 <col width="14%" />
					   	 <col width="14%" />
					   	 <col width="14%" />
					   	 <col width="14%" />
					   	 <col width="14%" />
					    </colgroup>
					    <tr>
    					<%
					    int yoill = yo;
					    String[] a = { "일", "월", "화", "수", "목", "금", "토" };
					    for (int i = 0; i < 7; i++) {
					    	if(i%7 == 0) {
					    %>
					   	 <%-- <th style="padding:5px 0;"><img src="../images/day0<%=i+1 %>.gif" alt="<%=a[i]%>" /></th> --%>
					   	 <th style="padding:5px 0; color: red;"><%=a[i]%></th>
					    <%
					    	}
					    	else if(i%7 == 6) {
					    %>
					     <th style="padding:5px 0; color: #58b0d8;"><%=a[i]%></th>   	 
					    <%
					    	}
					    	else {
					    %>
					     <th style="padding:5px 0; color: black;"><%=a[i]%></th>
					    <%
					    	}
					    }
					    %>		 
					    </tr>
					    <tr>
					    <%
					    for (int k = 1; k < yo; k++) {
					    %>
					   	 <td></td>
					    <%
					    }
					    %>
					    <%
						String tColor;
					    for (int j = 1; j <= last_day; j++) {
					    	yoill++; //날짜 반복시 증가
					    	if((yo+j-1) % 7 == 0) tColor="table-primary";
					    	else if((yo+j-1) % 7 == 1) tColor="table-danger";
					    	else tColor="";
				    	
					    	// 페이지 소스에서 출력 날짜 확인하려고 만든 코드
					    	String nal = (j<10) ? "0"+j : ""+j;
					    	String key = y+"-"+mo+"-"+nal;
					    %>
					   	<!-- 날짜가 출력되는 부분  <%=key%>-->
				   			<td style="height: 80px;" class="<%=tColor %>">
							   	<div><%=j%></div>
						   		<div>
						   			<% if(calendar.get(key) != null) { %>
						   				<a style="color: rgb(212, 121, 2);" href="./board_view.jsp?y=<%=y %>&m=<%=m-1 %>&num=<%=calendar.get(key).getNum() %>&cate=proB"><%=calendar.get(key).getTitle() %></a>
						   			<% 
						   				}
						   			else {
						   			%>
						   				<div style="visibility: hidden;">center</div>
						   			<% 
						   			}
						   			%>
						   		</div>
					   		</td>
					    <%if ((yo+j-1) % 7 == 0) {%>
					    </tr>
					    <tr>
					    <%
					    	yoill = 0;
					   	 	}
					    }
					    for(int e=1; e<(7-yo)-1; e++){
					    %>
					   	 <td></td>
					    <%
					    }
					    %>
					    </tr>
					</table>
					<%
					/*
					Calendar 클래스는 추상 클래스로 생성자를 제공하지 않는다.
					따라서, 객체를 생성하기 위해 new 연산자를 사용할 수 없다.  
					대신 getInstance() 메소드를 사용하여 현재 날짜와 시간의
					객체를 얻어올 수 있다.
					*/
					//Calendar nowDay = Calendar.getInstance();
					
					/* 년/월/일 */
					/* 월 : 0~11까지 반환하므로 +1해줘야 함 */
					/* out.println("년="+ nowDay.get(Calendar.YEAR) +"<br/>");
					out.println("월="+ (nowDay.get(Calendar.MONTH)+1) +"<br/>");
					out.println("일="+ nowDay.get(Calendar.DAY_OF_MONTH) +"<br/>");
					out.println("일="+ nowDay.get(Calendar.DATE) +"<br/>"); */
					
					//1년중 오늘이 몇번째 날인지 반환
					//out.println(nowDay.get(Calendar.DAY_OF_YEAR)+"<br/>");
					
					//오늘이 이번주의 몇번째 날인지 반환
					//일요일1, 월요일2.....
					//out.println(nowDay.get(Calendar.DAY_OF_WEEK)+"<br/>");
					%>
                                
					<br />
					<br />
			</div>
		</div>
		<%@ include file="../include/quick.jsp" %>
	</div>
	

	<%@ include file="../include/footer.jsp" %>
	</center>
 </body>
</html>
