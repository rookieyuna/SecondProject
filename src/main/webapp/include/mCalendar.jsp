<%@page import="board.BoardDAO"%>
<%@page import="board.BoardDTO"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
   BoardDAO dao = new BoardDAO();
   Map<String, BoardDTO> calendar = dao.calList(data);
   dao.close();
%>

<table cellpadding="0" cellspacing="0" border="1" class="calendar"
	style="width:92%; height: 25px;">
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
   	 <th style="padding:0; color: red;"><%=a[i]%></th>
    <%
    	}
    	else if(i%7 == 6) {
    %>
     <th style="padding:0; color: #58b0d8;"><%=a[i]%></th>   	 
    <%
    	}
    	else {
    %>
     <th style="padding:0; color: black;"><%=a[i]%></th>
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
	<td>
		<% if(calendar.get(key) != null) { %>
	   	<div style="color: orange;" onclick="location.href='../space/board_view.jsp?y=<%=y%>&m=<%=m-1 %>&num=<%=calendar.get(key).getNum()%>&cate=proB';"><%=j%></div>
	   	<% 
	   		}
  			else {
  			%>
   		<div><%=j%></div>
   		<% 
    	}	
   		%>
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
