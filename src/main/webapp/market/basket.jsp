<%@page import="java.text.DecimalFormat"%>
<%@page import="market.basket.CartDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/global_head.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

 <body>
	<!-- <center> -->
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
				<table cellpadding="0" cellspacing="0" border="0" class="basket_list">
					<colgroup>
						<col width="7%" />
						<col width="10%" />
						<col width="*" />
						<col width="10%" />
						<col width="8%" />
						<col width="10%" />
						<col width="10%" />
						<col width="10%" />
						<col width="8%" />
					</colgroup>
					<thead>
						<tr>
							<th>선택</th>
							<th>이미지</th>
							<th>상품명</th>
							<th>판매가</th>
							<th>적립금</th>
							<th>수량</th>
							<th>배송구분</th>
							<th>배송비</th>
							<th>합계</th>
						</tr>
					</thead>
					<tbody>
				<c:choose>	
					<c:when test="${ empty carts }">
						<tr>
							<td colspan="9" align="center">등록된 게시물이 없습니다^^*</td>
						</tr>
					</c:when>
					<c:otherwise>
					
						<c:forEach items="${ carts }" var="row" varStatus="loop"> 						
<%-- 						<input type="hidden" id="total_price" value="${ row.total_price }" />
 --%>						<c:set var="sum" value="${sum+row.total_price }"/>
						<tr>
							<td><input type="checkbox" name="" value="" /></td>
							<td><img src="../images/market/${row.product_sfile }" width="50px" height="50px"/></td>
							<td>${ row.product_name }</td>
							<td>${ row.price }원</td>
							<td><img src="../images/market/j_icon.gif" />&nbsp;${ row.milage }원</td>
							<td><input type="text" name="" value="${row.count_num }" class="basket_num" />
							&nbsp;<a href=""><img src="../images/market/m_btn.gif" /></a></td>
							<td>무료배송</td>
							<td>[조건]</td>
							<% DecimalFormat formatter = new DecimalFormat("###,###"); %>
							<td><span>
							 <fmt:formatNumber value="${ row.total_price }" pattern="#,###"/>원<span></td>
							
						</tr>
						</c:forEach>
					</c:otherwise>
				</c:choose>
					</tbody>
				</table> 
				<p class="basket_text">[ 기본 배송 ] <span>상품구매금액</span> 
				<fmt:formatNumber value="${ sum }" pattern="#,###"/> + <span>배송비</span> 0 = 합계 : 
				<span class="money"><fmt:formatNumber value="${ sum }" pattern="#,###"/>원</span><br /><br />
				<a href=""><img src="../images/market/basket_btn01.gif" /></a>&nbsp;<a href="basket02.jsp"><img src="../images/market/basket_btn02.gif" /></a></p>
			</div> 
		</div>
		<%@ include file="../include/quick.jsp" %>
	</div>
	

	<%@ include file="../include/footer.jsp" %>
	<!-- </center> -->
 </body>
</html>
