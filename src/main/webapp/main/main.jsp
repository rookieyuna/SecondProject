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
					List<BoardDTO> lists = dao.mainViewtList("notB", 4);

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
					lists = dao.mainViewtList("freeB", 4);
				
					for(BoardDTO dto : lists){
						if(dto.getTitle()!=null){
				%>
					<li >
						<a href="../space/board_view.jsp?cate=freeB&num=<%= dto.getNum() %>">
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
					Calendar now = Calendar.getInstance();
					int nowY = now.get(Calendar.YEAR);
					int nowM= now.get(Calendar.MONTH);
					%>
					<table>
						<colgroup>
							<col width="13px;" />
							<col width="*" />
							<col width="13px;" />
						</colgroup>
						<tr>
							<td><img src="../images/cal_a01.gif" 
								style="margin-top:3px;cursor:pointer;" id="m_prev" /></td>
							<td style="font-weight: bold;" id="calNow">
								<%= nowY %>년
								<%=(nowM+ 1) %>월
							</td>
							<td><img src="../images/cal_a02.gif" 
								style="margin-top:3px;cursor:pointer;" id="m_next" /></td>
						</tr>
					</table>
					
				</div>
				<div class="cal_bottom" id="calendar_view">
					
				</div>
			</div>
			<div class="main_con_right">
				<p class="main_title"><img src="../images/main_title06.gif" alt="사진게시판 PHOTO BOARD" /><a href="../space/board_list.jsp?cate=photoB"><img src="../images/more.gif" alt="more" class="more_btn" /></a></p>
				<ul class="main_photo_list">
					
					<%
					lists = dao.mainViewtList("photoB", 6);
				
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
	
	<script type="text/javascript">
	$(function(){
		//현재월을 출력하는 달력 로드하기
		$('#calendar_view').load('../include/mCalendar.jsp');
		
		//이전달
		$('#m_prev').click(function(){
			
			//히든폼에 입력된 값 가져오기
			var nowYear = parseInt($('#nowY').val());
			var nowMonth = parseInt($('#nowM').val());
			
			//1월의 이전달은 12월이므로 년도-1,12월로 변경한다.
			if(nowMonth==0){
				nowYear--;
				nowMonth=11;
			}
			else{
				nowMonth--;
			}
			
			//계산된 년/월을 히든폼에 입력
			$('#nowY').val(nowYear);
			$('#nowM').val(nowMonth);
			
			//계산된 년/월을 켈린더 상단에 표현
			$('#calNow').html(nowYear+"년 "+
					(nowMonth+1)+'월');
			
			//calendar.jsp로 위값을 파라미터로 전달
			$.get('../include/mCalendar.jsp',
				{
					y : nowYear,
					m : nowMonth
				},
				function(d){
					$('#calendar_view').html(d);
				}	
			);
		});
		$('#m_next').click(function(){
			//다음달
			var nowYear = parseInt($('#nowY').val());
			var nowMonth = parseInt($('#nowM').val());
			
			//12월이 되었을때 년+1, 월은 0으로 초기화한다.
			if(nowMonth==11){
				nowYear++;
				nowMonth=0;
			}
			else{
				nowMonth++;	
			}
			
			$('#nowY').val(nowYear) ;
			$('#nowM').val(nowMonth) ;
			$('#calNow').html(nowYear+'년 '+(nowMonth+1)+'월') ;
			
			$.ajax({
				url : "../include/mCalendar.jsp",
				dataType : "html",
				type : "post",
				//전송방식이 post인 경우 아래 컨텐츠타입을
				//사용해야 함
				contentType : "application/x-www-form-urlencoded;charset=UTF-8",
				data : {
					y : nowYear, m : nowMonth
				},			
				success:function(responseData){
					$('#calendar_view').html(responseData);
				},
				error:function(errorData){
					alert("오류발생:"+errorData.status+":"+errorData.statusText);
				}
			});
		});
	});
	
	</script>

<input type="hidden" id="nowY" value="<%=nowY %>" />
<input type="hidden" id="nowM" value="<%=nowM%>" />	
</center>
</body>
</html>