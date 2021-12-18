<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/global_head.jsp" %>


 <body>
	<center>
	<div id="wrap">
		<%@ include file="../include/top.jsp" %>

		<img src="../images/market/sub_image.jpg" id="main_visual" />

		<div class="contents_box">
			<div class="left_contents">
				
				<%@ include file = "../include/market_leftmenu.jsp" %>
			</div>
			<div class="right_contents">
				<div class="top_title">
					<img src="../images/market/sub01_title.gif" alt="수아밀 제품 주문" class="con_title" />
					<p class="location"><img src="../images/center/house.gif" />&nbsp;&nbsp;열린장터&nbsp;>&nbsp;수아밀 제품 주문<p>
				</div>
				<table cellpadding="0" cellspacing="0" border="0" class="market_board01">
					<colgroup>
						<col width="5%" />
						<col width="20%" />
						<col width="*" />
						<col width="10%" />
						<col width="10%" />
						<col width="15%" />
					</colgroup>
					<tr>
						<th>선택</th>
						<th>상품이미지</th>
						<th>상품명</th>
						<th>가격</th>
						<th>수량</th>
						<th>구매</th>
					</tr>
					<tr>
						<td><input type="checkbox" name="" value="" /></td>
						<td><a href="market_view.jsp"><img src="../images/market/img01.jpg" /></a></td>
						<td class="t_left"><a href="market_view.jsp">녹차 쌀 무스케잌</a></td>
						<td class="p_style">30,000</td>
						<td><input type="text" name="" value="1" class="n_box" /></td>
						<td><a href=""><img src="../images/market/btn01.gif" style="margin-bottom:5px;" /></a><br /><a href="basket.jsp"><img src="../images/market/btn02.gif" /></a></td>
					</tr>
					<tr>
						<td><input type="checkbox" name="" value="" /></td>
						<td><a href="market_view.jsp"><img src="../images/market/img01.jpg" /></a></td>
						<td class="t_left"><a href="market_view.jsp">녹차 쌀 무스케잌</a></td>
						<td class="p_style">30,000</td>
						<td><input type="text" name="" value="1" class="n_box" /></td>
						<td><a href=""><img src="../images/market/btn01.gif" style="margin-bottom:5px;" /></a><br /><a href="basket.jsp"><img src="../images/market/btn02.gif" /></a></td>
					</tr>
					<tr>
						<td><input type="checkbox" name="" value="" /></td>
						<td><a href="market_view.jsp"><img src="../images/market/img01.jpg" /></a></td>
						<td class="t_left"><a href="market_view.jsp">녹차 쌀 무스케잌</a></td>
						<td class="p_style">30,000</td>
						<td><input type="text" name="" value="1" class="n_box" /></td>
						<td><a href=""><img src="../images/market/btn01.gif" style="margin-bottom:5px;" /></a><br /><a href="basket.jsp"><img src="../images/market/btn02.gif" /></a></td>
					</tr>
					<tr>
						<td><input type="checkbox" name="" value="" /></td>
						<td><a href="market_view.jsp"><img src="../images/market/img01.jpg" /></a></td>
						<td class="t_left"><a href="market_view.jsp">녹차 쌀 무스케잌</a></td>
						<td class="p_style">30,000</td>
						<td><input type="text" name="" value="1" class="n_box" /></td>
						<td><a href=""><img src="../images/market/btn01.gif" style="margin-bottom:5px;" /></a><br /><a href="basket.jsp"><img src="../images/market/btn02.gif" /></a></td>
					</tr>
					<tr>
						<td><input type="checkbox" name="" value="" /></td>
						<td><a href="market_view.jsp"><img src="../images/market/img01.jpg" /></a></td>
						<td class="t_left"><a href="market_view.jsp">녹차 쌀 무스케잌</a></td>
						<td class="p_style">30,000</td>
						<td><input type="text" name="" value="1" class="n_box" /></td>
						<td><a href=""><img src="../images/market/btn01.gif" style="margin-bottom:5px;" /></a><br /><a href="basket.jsp"><img src="../images/market/btn02.gif" /></a></td>
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
