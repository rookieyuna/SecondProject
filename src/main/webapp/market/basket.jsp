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
 			console.log(price);
 			document.getElementById("price_"+idx).innerHTML = (price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",")+ "원");			

 		}
 		function money1(){
 			var sum = document.getElementById("sum").innerHTML;
 			var sum1 = document.getElementById("sum1").innerHTML;
 			document.getElementById("sum1").innerHTML = sum1.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
 			document.getElementById("sum").innerHTML = (sum.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",")+ "원");
 			
 		}
 		
		function changePrice(idx) {
			
			console.log(idx);
			var count = document.getElementById("count_"+idx).value;
			var price = document.getElementById("price1_"+idx).value;
			var result = count * price ;
			console.log("count:"+count+"price:"+price+"result1:"+result);
			document.getElementById("total_"+idx).innerHTML = (result.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",") + "원");
			document.getElementById("total1_"+idx).value = result;
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
		
		function goCart(idx){
			document.getElementById("zlag").value = idx;
			 document.getElementById("form1").action="../market/basketUpDelete.do";
			document.getElementById("form1").submit(); 
		}
		
		$(function(){
			$('#orderbtn').click(function(){
			/* 	if(('.chk').val == null){
					alert("주문을 진행할 항목을 선택해주세요");
					return;
				} */
				 $('#form1').attr("action","../market/basket3.do").submit();		 
			})  		
		});
		
	</script>
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
						 <form action="" id="form1">  <!-- 폼 시작 -->
						<c:forEach items="${ carts }" var="row" varStatus="loop"> 
						<input type="hidden" id="zlag" name="zlag" value="${row.product_no }" />	
						<%-- <input type="hidden" name="cart_no_${row.product_no }" value="${row.cart_no }" />	 --%>				
						<c:set var="sum" value="${sum+row.total_price }"/>
						<tr>
							
							<td><input type="checkbox" name="chk" value="${row.cart_no }" /></td>
							<td><img src="../images/market/${row.product_sfile }" width="50px" height="50px"/>
							 <input type="hidden" name="sfile_${row.product_no }" value="${row.product_sfile }" /> </td>
							<td >${ row.product_name }
							 <input type="hidden" name="name_${row.product_name }" value="${row.product_name }" /> </td>
							<td ><span id ="price_${row.product_no }">${ row.price }</span>
							<!-- 제품의 고유 가격  -->
							<input type="hidden" id ="price1_${row.product_no }" name ="price1_${row.product_no }" value="${ row.price }"/>
							</td>
							<td><img src="../images/market/j_icon.gif" />&nbsp;${ row.milage }원
							 <input type="hidden" id="milage_${row.milage }" value="${row.milage }"/> </td>
							
							
							 <!-- 상품갯수 -->
							<td><input type="text" id="count_${row.product_no }" name="count_${row.product_no }" width="60px"
							 onchange="changePrice(${row.product_no })" value="${row.count_num }" class="basket_num" />
							&nbsp;
							<!-- 수정버튼을 누르면 update -->
							<!-- <a href=""><img src="../images/market/m_btn.gif" /></a> -->
							<input type="image" onclick="goCart(${row.product_no})" src="../images/market/m_btn.gif" ></input>
							<input type="hidden" id="count1_${row.product_no }" value="${row.count_num }" />
							</td>
							<td>무료배송</td>
							<td>[조건]</td>
							<td><span id="total_${row.product_no }">
							 ${ row.total_price }</span>
							 <input type="hidden" id="total1_${row.product_no }" name="total_${row.product_no }" value=" ${ row.total_price }"/></td>
							
						</tr>
						<script>money(${row.product_no });</script>
						</c:forEach> 
					 	</form> 
					</c:otherwise>
				</c:choose>
					</tbody>
				</table> 
				<input type="hidden" id="org_sum" value="${sum }" />
				<p class="basket_text">[ 기본 배송 ] <span>상품구매금액</span> 
				<span id="sum1">${ sum }</span> + <span>배송비</span> 0 = 합계 : 
				<span class="money" id="sum">${ sum }</span><br /><br />
				<script>money1();</script>
				<a href="../market/sub01.do"><img src="../images/market/basket_btn01.gif" /></a>&nbsp;
				<input type="image"  src="../images/market/basket_btn02.gif" alt="결제" id="orderbtn" ></input>
				</p>
			</div> 
		</div>
		<%@ include file="../include/quick.jsp" %>
	</div>
	

	<%@ include file="../include/footer.jsp" %>
	</center>
 </body>
</html>
