<%@page import="java.text.DecimalFormat"%>
<%@page import="market.basket.CartDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/global_head.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

 
 <script>
 		function money(idx){
 			var total = document.getElementById("total_"+idx).innerHTML;
 			document.getElementById("total_"+idx).innerHTML = (total.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",") + "원");
 			
 			var price = document.getElementById("price_"+idx).innerHTML;
 			document.getElementById("price_"+idx).innerHTML = (price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",")+ "원");			

 		}
 		function money1(){
 			var sum = document.getElementById("sum").innerHTML;
 			var sum1 = document.getElementById("sum1").innerHTML;
 			document.getElementById("sum1").innerHTML = sum1.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
 			document.getElementById("sum").innerHTML = (sum.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",")+ "원");
 			
 		}
 		
		function changePrice(idx) {
			
			var count = document.getElementById("count_"+idx).value;
			var price = document.getElementById("price1_"+idx).value;
			var result = count * price ;
			document.getElementById("total_"+idx).innerHTML = (result.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",") + "원");
				
			//최종합계 구현
			var i = document.getElementById("count1_"+idx).value; //바꾸기전 갯수		
			document.getElementById("count1_"+idx).value = count;
			
			//바꾼후 갯수랑 바꾸기전 갯수랑 비교해서 
			var j = count - i;
			
			
			
			var sum = document.getElementById("org_sum").value; 
			var sum_r = parseInt(sum) + parseInt( price * j);
	
			document.getElementById("sum").innerHTML = (sum_r.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",") +"원");
			document.getElementById("sum1").innerHTML = (sum_r.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",") +"원");
			document.getElementById("org_sum").value = sum_r;
		
		}
		
		
		
		
	</script>
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
						<c:set var="sum" value="${sum+row.total_price }"/>
						<tr>
							
							<td><input type="checkbox" name="" value="" /></td>
							<td><img src="../images/market/${row.product_sfile }" width="50px" height="50px"/></td>
							<td >${ row.product_name }</td>
							<td ><span id ="price_${row.product_no }">${ row.price }</span>
							<input type="hidden" id ="price1_${row.product_no }" value="${ row.price }"/>
							</td>
							<td><img src="../images/market/j_icon.gif" />&nbsp;${ row.milage }원</td>
							
							
							 
							<td><input type="text" id="count_${row.product_no }" width="60px"
							 onchange="changePrice(${row.product_no })" value="${row.count_num }" class="basket_num" />
							&nbsp;
							<!-- 수정버튼을 누르면 update -->
							<a href=""><img src="../images/market/m_btn.gif" /></a>
							<input type="hidden" id="count1_${row.product_no }" value="${row.count_num }" />
							</td>
							<td>무료배송</td>
							<td>[조건]</td>
							<td><span id="total_${row.product_no }">
							 ${ row.total_price }</span></td>
							
						</tr>
						<<script>money(${row.product_no });</script>
						</c:forEach> 
					</c:otherwise>
				</c:choose>
					</tbody>
				</table> 
				<input type="hidden" id="org_sum" value="${sum }" />
				<p class="basket_text">[ 기본 배송 ] <span>상품구매금액</span> 
				<span id="sum1">${ sum }</span> + <span>배송비</span> 0 = 합계 : 
				<span class="money" id="sum">${ sum }</span><br /><br />
				<<script>money1();</script>
				<a href=""><img src="../images/market/basket_btn01.gif" /></a>&nbsp;<a href="basket02.jsp"><img src="../images/market/basket_btn02.gif" /></a></p>
			</div> 
		</div>
		<%@ include file="../include/quick.jsp" %>
	</div>
	

	<%@ include file="../include/footer.jsp" %>
	<!-- </center> -->
 </body>
</html>
