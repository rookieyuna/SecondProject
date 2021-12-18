<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/global_head.jsp" %>



 <body>
	<center>
	<div id="wrap">
		<%@ include file="../include/top.jsp" %>

		<img src="../images/product/sub_image.jpg" id="main_visual" />

		<div class="contents_box">
			<div class="left_contents">
				
				<%@ include file = "../include/product_leftmenu.jsp" %>
			</div>
			<div class="right_contents">
				<div class="top_title">
					<img src="../images/product/sub01_title.gif" alt="자체생산품" class="con_title" />
					<p class="location"><img src="../images/center/house.gif" />&nbsp;&nbsp;생산품 소개&nbsp;>&nbsp;자체생산품<p>
				</div>
				<ul class="tab_menu">
					<li><a href="sub01.jsp"><img src="../images/product/tab01.gif" /></a></li>
					<li><a href="sub01_02.jsp"><img src="../images/product/tab02.gif" /></a></li>
					<li><a href="sub01_03.jsp"><img src="../images/product/tab03_on.gif" /></a></li>
				</ul>
				<img src="../images/product/sub013_img01.jpg" style="margin:30px 0px;" />
			</div>
		</div>
		<%@ include file="../include/quick.jsp" %>
	</div>
	

	<%@ include file="../include/footer.jsp" %>
	</center>
 </body>
</html>
