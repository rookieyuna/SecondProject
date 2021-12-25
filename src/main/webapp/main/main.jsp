<%@page import="java.util.Calendar"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="board.BoardDTO"%>
<%@page import="board.BoardDAO"%>
<%@page import="utils.CookieManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<% 
//쿠키값 읽어오기
String loginId = CookieManager.readCookie(request, "loginId");
String loginPw = CookieManager.readCookie(request, "loginPw");
//앞에서 읽어온 쿠키값이 있다면 checked 속성값을 변수에 설정한다.
String cookieCheck="";
if (!loginId.equals("")){
	cookieCheck = "checked";
}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>마포구립장애인 직업재활센터</title>
<style type="text/css" media="screen">
@import url("../css/common.css");
@import url("../css/main.css");
@import url("../css/sub.css");
</style>
<script>
	/* 
	오픈마켓에서 케이크 주문 완료하면 main.jsp로 이동하게 하고 싶어서요
	*/
	$(function(){
		<%
		if((request.getAttribute("OrderSuccess") != null) ){
		 %> 		
			alert("주문 완료");
		<%
		}
		%>
	});
		
	function validateForm(form) {
		if(!form.user_id.value){
			alert("아이디를 입력하세요.");
			form.user_id.focus();
			return false;
		}
		if(form.user_pw.value==""){
			alert("패스워드를 입력하세요.");
			form.user_pw.focus();
			return false;
		}
	}
</script>
</head>
<body>
<center>
	<div id="wrap">
		<%@ include file="../include/top.jsp"%>
		
		<div id="main_visual">
		<a href="../product/sub01.jsp"><img src="../images/main_image_01.jpg" /></a><a href="../product/sub01_02.jsp"><img src="../images/main_image_02.jpg" /></a><a href="../product/sub01_03.jsp"><img src="../images/main_image_03.jpg" /></a><a href="../product/sub02.jsp"><img src="../images/main_image_04.jpg" /></a>
		</div>

		<div class="main_contents">
			<div class="main_con_left">
				
				<p class="main_title" style="border:0px; margin-bottom:0px;"><img src="../images/main_title01.gif" alt="로그인 LOGIN" /></p>
				<form name="loginFrm" action="../member/LoginProcess.jsp" method="post" onsubmit="return validateForm(this);">
				<div class="login_box">
					<%
					if (session.getAttribute("UserId")== null){//로그아웃 상태 
					%>
					<table cellpadding="0" cellspacing="0" border="0">
						<colgroup>
							<col width="45px" />
							<col width="120px" />
							<col width="55px" />
						</colgroup>
						<tr>
							<th><img src="../images/login_tit01.gif" alt="아이디" /></th>
							<td><input type="text" name="user_id" value="<%= loginId %>" class="login_input" tabindex="1"/></td>
							<td rowspan="2"><input type="image" src="../images/login_btn01.gif" alt="로그인" tabindex="4"/></td>
						</tr>
						<tr>
							<th><img src="../images/login_tit02.gif" alt="패스워드" /></th>
							<td><input type="password" name="user_pw" value="<%= loginPw %>" class="login_input" tabindex="2"/></td>
						</tr>
					</table>
					<p>
						<input type="checkbox" name="save_check" value="Y" <%= cookieCheck %> /><img src="../images/login_tit03.gif" alt="저장" tabindex="3"/>
						<a href="../member/id_pw.jsp"><img src="../images/login_btn02.gif" alt="아이디/패스워드찾기" /></a>
						<a href="../member/join01.jsp"><img src="../images/login_btn03.gif" alt="회원가입" /></a>
					</p>
					<%	
					} else { //로그인 된 상태
					%>
					<!-- 로그인 후 -->
					<p style="padding:10px 0px 10px 10px"><span style="font-weight:bold; color:#333;">${UserName } 님</span> 반갑습니다.<br />로그인 하셨습니다.</p>
					<p style="text-align:right; padding-right:10px;">
						<a href="../member/join03.jsp"><img src="../images/login_btn04.gif" /></a>
						<a href="../member/logout.jsp"><img src="../images/login_btn05.gif" /></a>
					</p>
				 	<%	
					}
					%>
				</div>
				</form>
			</div>
			<div class="main_con_center">
				<p class="main_title"><img src="../images/main_title02.gif" alt="공지사항 NOTICE" /><a href="../space/board_list.jsp?cate=notB"><img src="../images/more.gif" alt="more" class="more_btn" /></a></p>
				<ul class="main_board_list">
				<%
				    BoardDAO dao = new BoardDAO();
					List<BoardDTO> lists = dao.mainViewtList("notB");

					for(BoardDTO dto : lists){
						if(dto.getTitle()!=null){
				%>
					<li><p><a href="../space/board_view.jsp?cate=notB&num=<%= dto.getNum() %>">
					<div style="width:160px; overflow:hidden;text-overflow:ellipsis; white-space:nowrap;"><%=dto.getTitle() %></div></a>
					<span><%=dto.getPostdate()%></span></p></li>
				<%	
						}
					}
					
				%>
				</ul>
			</div>
			<div class="main_con_right">
				<p class="main_title"><img src="../images/main_title03.gif" alt="자유게시판 FREE BOARD" /><a href="../space/board_list.jsp?cate=freeB"><img src="../images/more.gif" alt="more" class="more_btn" /></a></p>
				<ul class="main_board_list">
				<%
					lists = dao.mainViewtList("freeB");
				
					for(BoardDTO dto : lists){
						if(dto.getTitle()!=null){
				%>
					<li >
						<a href="../space/board_view.jsp?cate=freetB&num=<%= dto.getNum() %>">
						<div style="width:160px; overflow:hidden;text-overflow:ellipsis; white-space:nowrap;"><%=dto.getTitle() %></div></a>
						<span><%=dto.getPostdate()%></span>
					</li>
				<%
						}
					}
				%>
				</ul>
			</div>
		</div>

		<div class="main_contents">
			<div class="main_con_left">
				<p class="main_title"><img src="../images/main_title04.gif" alt="월간일정 CALENDAR" /></p>
				<img src="../images/main_tel.gif" />
			</div>
			<div class="main_con_center">
				<p class="main_title" style="border:0px; margin-bottom:0px;"><img src="../images/main_title05.gif" alt="월간일정 CALENDAR" /></p>
				<div class="cal_top">
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
					<div style="text-align: center; font-size: 1em;">
						<a href="./main.jsp?cate=proB&y=<%=prevY%>&m=<%=prevM%>">◀</a>
						&nbsp;&nbsp;&nbsp;
						<%=y %>년 <%=m %>월
						&nbsp;&nbsp;&nbsp;
						<a href="./main.jsp?cate=proB&y=<%=nextY %>&m=<%=nextM%>">▶</a>							
					</div>
				</div>
				<div class="cal_bottom">
					<table cellpadding="0" cellspacing="0" border="1" class="calendar"
						style="width:90%; height: 25px;">
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
					   	 <th style="padding: 0; color: red;"><%=a[i]%></th>
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
					    	yoill++; //날짜가 반복될때 증가
					    	if((yo+j-1) % 7 == 0) {
					    		tColor="text-danger";
					    	}
					    	else if((yo+j-1) % 7 == 1) {
					    		tColor="text-primary";
					    	}
					    	else tColor="";
					    	
					    	// 페이지 소스에서 출력 날짜 확인하려고 만든 코드
					    	String jj = (j<10) ? "0"+j : ""+j;
					    	String key = y+"-"+mo+"-"+jj;
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
				</div>
			</div>
			<div class="main_con_right">
				<p class="main_title"><img src="../images/main_title06.gif" alt="사진게시판 PHOTO BOARD" /><a href="../space/board_list.jsp?cate=photoB"><img src="../images/more.gif" alt="more" class="more_btn" /></a></p>
				<ul class="main_photo_list">
					
					<%
					lists = dao.mainViewtList("photoB");
				
					for(BoardDTO dto : lists){
						if(dto.getTitle()!=null){
					%>					
					<li>
						<dl>
							<dt><a href="../space/board_view.jsp?cate=photoB&num=<%= dto.getNum() %>"><img src="../Uploads/<%= dto.getSfile() %>" alt="" width=95 height=63></a></dt>
							<dd style="padding:0 2px; overflow:hidden;text-overflow:ellipsis; white-space:nowrap;"><a href=""><%=dto.getTitle() %></a></dd>
							<!--
							overflow:hidden : 넓이가 70px를 넒어서는 내용에 대해서는 보이지 않게 처리함
							text-overflow:ellipsis : 글자가 넓이 70px를 넘을 경우 생략부호를 표시함
							white-space:nowrap : 공백문자가 있는 경우 줄바꿈하지 않고 한줄로 나오게 처리함 (\A로 줄바꿈가능) -->
						</dl>
					</li>
					<%
						}
					}
					dao.close();
					%>
				</ul>
			</div>
		</div>
		<%@ include file="../include/quick.jsp"%>
	</div>

	<%@ include file="../include/footer.jsp"%>
	
</center>
</body>
</html>