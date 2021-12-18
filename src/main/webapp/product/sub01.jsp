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
					<li><a href="#"><img src="../images/product/tab01_on.gif" /></a></li>
					<li><a href="sub01_02.jsp"><img src="../images/product/tab02.gif" /></a></li>
					<li><a href="sub01_03.jsp"><img src="../images/product/tab03.gif" /></a></li>
				</ul>
				<img src="../images/business/sub01_img01.gif" style="clear:both;" class="con_img" />
				<p class="con_tit"><img src="../images/product/sub01_tit01.gif" alt="수아밀 제품" /></p>
				<p class="dot_tit">간식류</p>
				<table cellpadding="0" cellspacing="0" border="0" class="con_table">
					<colgroup>
						<col width="*" />
						<col width="20%" />
						<col width="20%" />
						<col width="20%" />
					</colgroup>
					<thead>
						<tr>
							<th>이미지</th>
							<th>이름</th>
							<th>가격</th>
							<th>구매</th>
						</tr>
					</thead>
					<tr>
						<td><img src="../images/product/pro_img01.jpg" /></td>
						<td>햄롤/치즈롤/쌀빵</td>
						<td><img src="../images/product/won.gif" />&nbsp;&nbsp;600원</td>
						<td><a href=""><img src="../images/market/btn01.gif" style="margin-bottom:5px;" /></a><br /><a href=""><img src="../images/market/btn02.gif" /></a></td>
					</tr>
					<tr>
						<td><img src="../images/product/pro_img02.jpg" /></td>
						<td>햄롤/치즈롤/쌀빵</td>
						<td><img src="../images/product/won.gif" />&nbsp;&nbsp;600원</td>
						<td><a href=""><img src="../images/market/btn01.gif" style="margin-bottom:5px;" /></a><br /><a href=""><img src="../images/market/btn02.gif" /></a></td>
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
