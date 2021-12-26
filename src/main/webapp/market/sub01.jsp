<%@page import="utils.JSFunction"%>
<%@page import="market.MKProductDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/global_head.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<script>

	function money(idx){		
		
		var price = document.getElementById("price_"+idx).innerHTML;
		document.getElementById("price_"+idx).innerHTML = (price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",")+ "원");			

	}

	function changePrice(idx) {
		console.log(idx);
		console.log("changeprice");
		var count = document.getElementById("count_"+idx).value;
		console.log(count);
		var price = document.getElementById("price1_"+idx).value;
					
		var result = count * price ;
		console.log("result:"+result);
		document.getElementById("price_"+idx).innerHTML = (result.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",") + "원");
		document.getElementById("pricetotal_"+idx).innerHTML = result;
					
	}

	//장바구니 버튼 누르면 zlag라는 히든박스에 idx값이 전달댐! idx = product_no
	function goCart(idx){
		
		document.getElementById("zlag").value = idx;
		document.getElementById("form1").action="../market/basketIns01.do";
	}
	
	//바로 구매 버튼 누르면(위와 동일)  orderIns.do <- 로 가도록 링크 수정하고 서블릿 만들어서 작업해야함
	function goBuy(idx){ 
		document.getElementById("zlag").value = idx;
		document.getElementById("form1").action="../market/basket2.do";
	}

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
							<th>번호</th>
							<th>상품이미지</th>
							<th>상품명</th>
							<th>가격</th>
							<th>수량</th>
							<th>구매</th>
						</tr>

						<c:choose>
							<c:when test="${ empty boardLists }">
								<!-- 게시물이 없을 때 -->
								<tr>
									<td colspan="6" align="center">등록된 게시물이 없습니다^^*</td>
								</tr>
							</c:when>
							<c:otherwise>
								<!-- 출력할 게시물이 있을때 -->
								<form name="orderFrm" id="form1" action="" type="post">
								<c:forEach items="${ boardLists }" var="row" varStatus="loop">
									<tr align="center">
										<td><!-- 원본은 체크박스인데.... 흠 필요없..어서 일단은 가상번호 -->
										 	${ map.totalCount - (((map.pageNum-1) * map.pageSize) + loop.index)}
										</td>
										<td>
											<!-- 이미지 (이미지 scr속성 바꿔야댐)--> 
											<a href="../market/market_view.do?product_no=${row.product_no }"><img src="../images/market/${row.product_sfile }" width="120px" height="80px"/></a>
										</td>
										<!-- 제목 -->
									 	 <td class="t_left"><a href="../market/market_view.do?product_no=${row.product_no }">${ row.product_name }</a>
										 	 <!-- 장바구니/최종구매 추가에 필요한 파라미터 전달용 히든박스들 -->
										 	 <input type="hidden" name="name_${row.product_no }" value="${row.product_name }" />
										 	 <input type="hidden" name="milage_${row.product_no }" value="${row.milage }" />
										 	 <input type="hidden" name="sfile_${row.product_no }" value="${row.product_sfile }"/>
										 	 <!-- 제품 고유 가격 -->
										 	 <input type="hidden" name="price1_${row.product_no }" id="price1_${row.product_no}" value="${ row.price }" />
										 	 <input  type="hidden" name="product_${row.product_no }" value="${ row.product_no }" />
										 	 <input type="hidden" id="zlag" name="zlag" value="0"/>
									 	 </td>
										<!-- 가격 -->						
										 <td class="p_style" id="price_${row.product_no }">${ row.price }
											 <!-- 제품의 총 가격 ( 파라미터 전달용 히든박스) -->
											 <input type="hidden" name="pricetotal_${row.product_no }" id="pricetotal_${row.product_no }" value="${row.price }" />
										</td>
										<!-- 수량텍스트박스 -->
										<td>
											<input type="text" onchange="changePrice(${row.product_no })" name="count_${row.product_no }" id="count_${row.product_no }" value="1" class="n_box" />
										</td>
										<!-- 구매버튼2개 -->
										<td>
											<!-- 최종 구매 버튼 -->
											<input type="image" onclick="goBuy(${row.product_no})" class="cart" src="../images/market/btn01.gif" alt="바로구매" ></input><br />
											<!-- 장바구니버튼 !  온클릭이벤트 ! -->
											<input type="image" onclick="goCart(${row.product_no})" class="cart" src="../images/market/btn02.gif" alt="장바구니" ></input>
										</td>
									</tr>
									<script>money(${row.product_no});</script>
								</c:forEach>
								</form>
							</c:otherwise> 
						</c:choose>
					</table>

					<table width="90%">
						<tr align="center">
							<td>${ map.pagingImg }</td>
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
