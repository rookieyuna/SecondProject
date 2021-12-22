<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/global_head.jsp" %>

<script>
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
 <body>
	<center>
	<div id="wrap">
		<%@ include file="../include/top.jsp" %>

		<img src="../images/member/sub_image.jpg" id="main_visual" />

		<div class="contents_box">
			<div class="left_contents">
				<%@ include file = "../include/member_leftmenu.jsp" %>
			</div>
			<div class="right_contents">
				<div class="top_title">
					<img src="../images/login_title.gif" alt="인사말" class="con_title" />
					<p class="location"><img src="../images/center/house.gif" />&nbsp;&nbsp;멤버쉽&nbsp;>&nbsp;로그인<p>
				</div>
				<form name="loginFrm" action="LoginProcess.jsp" method="post" onsubmit="return validateForm(this);">
				<div class="login_box01">
					<img src="../images/login_tit.gif" style="margin-bottom:30px;" />
					<ul>
						<li><img src="../images/login_tit001.gif" alt="아이디" style="margin-right:15px;"/><input type="text" name="user_id" value="" class="login_input01" tabindex="1"/></li>
						<li><img src="../images/login_tit002.gif" alt="비밀번호" style="margin-right:15px;" /><input type="password" name="user_pw" value="" class="login_input01" tabindex="2" /></li>
					</ul>
					<button type="submit" tabindex="3"><img src="../images/login_btn.gif" class="login_btn01" /></button>
				</div>
				</form>
				 <div align="center" style="margin-top:15px; color: red">
                	<%=request.getAttribute("LoginErrMsg") == null? "":request.getAttribute("LoginErrMsg") %></div>
                <div style="margin-top:15px;"></div>
				<p style="text-align:center; margin-bottom:50px;"><a href=""><img src="../images/login_btn02.gif" alt="아이디/패스워드찾기" /></a>&nbsp;<a href=""><img src="../images/login_btn03.gif" alt="회원가입" /></a></p>
			</div>
		</div>
		<%@ include file="../include/quick.jsp" %>
	</div>
	

	<%@ include file="../include/footer.jsp" %>
	</center>
 </body>
</html>
