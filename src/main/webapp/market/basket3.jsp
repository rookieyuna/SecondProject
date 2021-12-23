<%@page import="java.text.DecimalFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/global_head.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<% pageContext.setAttribute("temp", 1); %>

<script>
	function money(idx){
		var total = document.getElementById("total_"+idx).innerHTML;
		document.getElementById("total_"+idx).innerHTML = (total.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",") + "원");
		
		var price = document.getElementById("price_"+idx).innerHTML;
		console.log(price);
		document.getElementById("price_"+idx).innerHTML = (price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",")+ "원");			

	}

	
</script>
 <body>
<!-- 	<center> -->
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
				<p class="con_tit"><img src="../images/market/basket_title01.gif" /></p>
				<table cellpadding="0" cellspacing="0" border="0" class="basket_list" style="margin-bottom:50px;">
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
						<c:when test="${ empty dto }">
							<tr>
								<td colspan="9" align="center">등록된 게시물이 없습니다^^*</td>
							</tr>
						</c:when>
						<c:otherwise>
							<form action="" id="order">
						 <c:forEach items="${ dto }" var="row" varStatus="loop"> 						
							<input type="hidden" id="total_price" value="${ row.total_price }" />
							<c:set var="sum" value="${sum+row.total_price }"/>
							<tr>
								<td><input type="checkbox" name="" value="" /></td>
								<td><img src="../images/market/${row.product_sfile }" width="50px" height="50px"/></td>
								<td>${ row.product_name }</td>
								<td><span id ="price_${row.product_no }">${ row.price }</span></td>
								<td><img src="../images/market/j_icon.gif" />&nbsp;${ row.milage }원</td>
								<td><input type="text" id="count_${row.product_no }" name="" value="${row.count_num }" class="basket_num" />
								</td>
								<td>무료배송</td>
								<td>[조건]</td>
								<td><span id="total_${row.product_no }">
								 ${ row.total_price }</span></td>
							</tr>
							<script>money(${row.product_no });</script>
							</c:forEach>
							</form>
						</c:otherwise>
						</c:choose>

					</tbody>
				</table>

				<p class="con_tit"><img src="../images/market/basket_title02.gif" /></p>
				<table cellpadding="0" cellspacing="0" border="0" class="con_table" style="width:100%;" style="margin-bottom:50px;">
					<colgroup>
						<col width="15%" />
						<col width="*" />
					</colgroup>
					<tbody>
						<tr>
							<th>성명</th>
							<td style="text-align:left;"><input type="text" name=""  value="" class="join_input" /></td>
						</tr>
						<tr>
							<th>주소</th>
							<td style="text-align:left;"><input type="text" name=""  value="" class="join_input" style="width:50px; margin-bottom:5px;" /> - <input type="text" name=""  value="" class="join_input" style="width:50px; margin-bottom:5px;" /> <a href=""><img src="../images/market/basket_btn03.gif" style="margin-bottom:5px;" /></a><br /><input type="text" name=""  value="" class="join_input" style="width:300px; margin-bottom:5px;" /> 기본주소<br /><input type="text" name=""  value="" class="join_input" style="width:300px;" /> 나머지주소</td>
						</tr>
						<tr>
							<th>휴대폰</th>
							<td style="text-align:left;"><input type="text" name=""  value="" class="join_input" style="width:50px;" /> - <input type="text" name=""  value="" class="join_input" style="width:50px;" /> - <input type="text" name=""  value="" class="join_input" style="width:50px;" /></td>
						</tr>
						<tr>
							<th>이메일주소</th>
							<td style="text-align:left;"><input type="text" name=""  value="" class="join_input" style="width:100px;" /> @ <input type="text" name=""  value="" class="join_input" style="width:100px;" /></td>
						</tr>
					</tbody>
				</table>

				<p class="con_tit"><img src="../images/market/basket_title03.gif" /></p>
				<p style="text-align:right">배송지 정보가 주문자 정보와 동일합니까? 예<input type="radio" /> 아니오<input type="radio" /></p>
				<table cellpadding="0" cellspacing="0" border="0" class="con_table" style="width:100%;" style="margin-bottom:50px;">
					<colgroup>
						<col width="15%" />
						<col width="*" />
					</colgroup>
					<tbody>
						<tr>
							<th>성명</th>
							<td style="text-align:left;"><input type="text" name=""  value="" class="join_input" /></td>
						</tr>
						<tr>
							<th>주소</th>
							<td style="text-align:left;"><input type="text" name=""  value="" class="join_input" style="width:50px; margin-bottom:5px;" /> - <input type="text" name=""  value="" class="join_input" style="width:50px; margin-bottom:5px;" /> <a href=""><img src="../images/market/basket_btn03.gif" style="margin-bottom:5px;" /></a><br /><input type="text" name=""  value="" class="join_input" style="width:300px; margin-bottom:5px;" /> 기본주소<br /><input type="text" name=""  value="" class="join_input" style="width:300px;" /> 나머지주소</td>
						</tr>
						<tr>
							<th>휴대폰</th>
							<td style="text-align:left;"><input type="text" name=""  value="" class="join_input" style="width:50px;" /> - <input type="text" name=""  value="" class="join_input" style="width:50px;" /> - <input type="text" name=""  value="" class="join_input" style="width:50px;" /></td>
						</tr>
						<tr>
							<th>이메일주소</th>
							<td style="text-align:left;"><input type="text" name=""  value="" class="join_input" style="width:100px;" /> @ <input type="text" name=""  value="" class="join_input" style="width:100px;" /></td>
						</tr>
						<tr>
							<th>배송메세지</th>
							<td style="text-align:left;"><input type="text" name=""  value="" class="join_input" style="width:500px;" /></td>
						</tr>
					</tbody>
				</table>
				
				<p class="con_tit"><img src="../images/market/basket_title04.gif" /></p>
				<table cellpadding="0" cellspacing="0" border="0" class="con_table" style="width:100%;" style="margin-bottom:30px;">
					<colgroup>
						<col width="15%" />
						<col width="*" />
					</colgroup>
					<tbody>
						<tr>
							<th>결제금액</th>
							
							<td style="text-align:left;"><span class="money" id="sum">
							<fmt:formatNumber value="${sum }" pattern="#,###"/>원		
							</span></td>
						</tr>
						<tr>
							<th>결제방식선택</th>
							<td style="text-align:left;"><input type="radio" /> 카드결제&nbsp;&nbsp;&nbsp;<input type="radio" /> 무통장입금&nbsp;&nbsp;&nbsp;<input type="radio" /> 실시간 계좌이체</td>
						</tr>
					</tbody>
				</table>
				<p style="text-align:right;"><a href=""><img src="../images/market/basket_btn04.gif" /></a></p>
			</div>
		</div>
		<%@ include file="../include/quick.jsp" %>
	</div>
	

	<%@ include file="../include/footer.jsp" %>
<!-- 	</center> -->
 </body>
</html>