<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/global_head.jsp" %>


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
					<img src="../images/member/sitemap_title.gif" alt="" class="con_title" />
					<p class="location"><img src="../images/center/house.gif" />&nbsp;&nbsp;멤버쉽&nbsp;>&nbsp;사이트맵<p>
				</div>
                <div style="text-align:center; padding:30px 0px;">
				<img src="../images/member/sitemap_img.gif" border="0" usemap="#Map" />
				<map name="Map">
					<area shape="rect" coords="53,48,123,70" href="../center/sub01.jsp">
					<area shape="rect" coords="52,81,130,104" href="../center/sub02.jsp">
					<area shape="rect" coords="52,115,135,139" href="../center/sub03.jsp">
					<area shape="rect" coords="51,147,135,171" href="../center/sub04.jsp">
					<area shape="rect" coords="51,181,143,207" href="../center/sub05.jsp">
					<area shape="rect" coords="49,211,140,237" href="../center/sub06.jsp">
					<area shape="rect" coords="306,50,418,71" href="../business/sub01.jsp">
					<area shape="rect" coords="306,80,419,103" href="../business/sub02.jsp">
					<area shape="rect" coords="305,112,393,138" href="../business/sub03.jsp">
					<area shape="rect" coords="304,147,393,171" href="../business/sub04.jsp">
					<area shape="rect" coords="305,181,401,202" href="../business/sub05.jsp">
					<area shape="rect" coords="305,211,378,235" href="../business/sub06.jsp">
					<area shape="rect" coords="556,45,657,73" href="../product/sub01.jsp">
					<area shape="rect" coords="558,82,656,105" href="../product/sub02.jsp">
					<area shape="rect" coords="52,320,171,342" href="../market/sub01.jsp">
					<area shape="rect" coords="52,352,164,373" href="../market/sub02.jsp">
					<area shape="rect" coords="53,386,196,407" href="../market/sub03.jsp">
					<area shape="rect" coords="53,418,163,441" href="../market/sub04.jsp">
					<area shape="rect" coords="54,448,155,474" href="../market/sub05.jsp">
					<area shape="rect" coords="304,319,393,341" href="../space/sub01.jsp">
					<area shape="rect" coords="304,352,400,375" href="../space/sub02.jsp">
					<area shape="rect" coords="304,385,397,407" href="../space/sub03.jsp">
					<area shape="rect" coords="304,420,394,439" href="../space/sub04.jsp">
					<area shape="rect" coords="305,452,392,474" href="../space/sub05.jsp">
					<area shape="rect" coords="559,320,660,343" href="../community/sub01.jsp">
					<area shape="rect" coords="560,352,665,376" href="../community/sub01.jsp">
					<area shape="rect" coords="53,561,141,584" href="../volunteer/sub01.jsp">
					<area shape="rect" coords="53,594,147,615" href="../volunteer/sub02.jsp">
					<area shape="rect" coords="305,563,373,584" href="../member/login.jsp">
					<area shape="rect" coords="304,594,374,617" href="../member/join01.jsp">
					<area shape="rect" coords="305,625,433,653" href="../member/id_pw.jsp">
					<area shape="rect" coords="304,659,383,684" href="../member/sitemap.jsp">
				</map>
                </div>
		  </div>
		</div>
		<%@ include file="../include/quick.jsp" %>
	</div>
	

	<%@ include file="../include/footer.jsp" %>
	</center>
 </body>
</html>
