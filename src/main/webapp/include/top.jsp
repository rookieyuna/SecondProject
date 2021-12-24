<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div id="top" style="border:0px solid #000;"> 
	<a href="../main/main.jsp"><img src="../images/logo.gif" alt="마포구립장애인 직업재활센터" id="top_logo" /></a>
	<ul id="lnb">
		<%
		if (session.getAttribute("UserId")== null){//로그아웃 상태 
		%>
		<li><a href="../member/login.jsp"><img src="../images/lnb01.gif" alt="LOGIN" /></a></li>
		<li><a href="../member/join01.jsp"><img src="../images/lnb02.gif" alt="JOIN" /></a></li>
		<%	
		}
		else{//로그인상태
			if(!session.getAttribute("UserIdentity").equals("1")) { //직원로그인 된 상태
		%>
			<li><a href="../adminpage/index.jsp"><img src="../images/lnb00.gif" alt="ADMIN" /></a></li>	
		<%
		}
		%>
			<li><a href="../member/logout.jsp"><img src="../images/lnb05.gif" alt="LOGOUT" /></a></li>
			<li><a href="../member/join03.jsp"><img src="../images/lnb06.gif" alt="MODIFY" /></a></li>
		<%
		}
		%>
		<li><a href="../member/sitemap.jsp"><img src="../images/lnb03.gif" alt="SITEMAP" /></a></li>
		<li><a href="../center/sub06.jsp"><img src="../images/lnb04.gif" alt="CONTACT US" /></a></li>
		
	</ul>	 
	
	<!-- <a href="../center/sub01.jsp"><img src="../images/navi.jpg" id="navigation" /></a> -->
	<img src="../images/gnb.jpg" id="navigation"  width="753" height="65" usemap="#GNB"/>
	<map name="GNB">
		<area shape="rect" alt="" title="" coords="0,0,80,33" href="../center/sub01.jsp" target="" />
		<area shape="rect" alt="" title="" coords="86,0,188,33" href="../business/sub01.jsp" target="" />
		<area shape="rect" alt="" title="" coords="193,0,316,33" href="../product/sub01.jsp" target="" />
		<area shape="rect" alt="" title="" coords="321,0,420,33" href="../market/sub01.do" target="" />
		<area shape="rect" alt="" title="" coords="428,0,529,33" href="../space/board_list.jsp?cate=notB" target="" />
		<area shape="rect" alt="" title="" coords="536,0,638,33" href="../board2/list.do?cate=guardB" target="" />
		<area shape="rect" alt="" title="" coords="641,0,749,33" href="../volunteer/sub01.jsp" target="" />
	</map>
	
	<!--  <div style="position:absolute; margin:-25px 0 0 200px;  border:0px solid #000;">	
		<object type="application/x-shockwave-flash" data="../swf/navi.swf" width="753" height="65">
			<param name="wmode" value="transparent" />
		</object>		
	</div>  -->
</div>