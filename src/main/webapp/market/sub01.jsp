<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/global_head.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<!--

1. 수량 수정하면 가격 변경되는부분 
-> formatter로 해뒀는데 value값으로 바로 접근안댐

3. 페이징 처리 부분 이쁘게 
4. 바로구매버튼 : basket2.jsp 구현 후에 연결
5. 장바구니버튼 : basket.jsp 구현 후에 연결
->  장바구니 버튼을 누르면 포워드하면서 파라미터를 전달해줘야하는데 
foreach문으로 루프가 돌아가서 id로 값에 접근이 안됨.... 어캐함?
  -->

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<script>
$(function(){
/* 	$('.n_box').change(function(){
		alert("asdf");
		
	}); */
		
	//// 온클릭이벤트 안댐 ... 장바구니로 이동
	/* $('#cartbtn').click(function(){
		alert("asdf");
		$('#market_view').attr("action","../market/basketIns.do").submit();			
	}); */
	
	
});

	function money(idx){		
		
		var price = document.getElementById("price_"+idx).innerHTML;
		document.getElementById("price_"+idx).innerHTML = (price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",")+ "원");			

	}

	function changePrice(idx) {
		
		var count = document.getElementById("count_"+idx).value;
		var price = document.getElementById("price1_"+idx).value;
					
		var result = count * price ;
		document.getElementById("price_"+idx).innerHTML = (result.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",") + "원");
			
		
		
	}


</script>
 <body>
	<%-- <center> --%>
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
									 	 <td class="t_left"><a href="../market/market_view.do?product_no=${row.product_no }">${ row.product_name }</a></td>
										<!-- 가격 -->
											<input type="hidden" id="price1_${row.product_no }" value="${ row.price }" />
										 <td class="p_style" id="price_${row.product_no }">
										 ${ row.price }</td>
										<!-- 수량텍스트박스 -->
										<td><input type="text" onchange="changePrice(${row.product_no })" id="count_${row.product_no }" value="1" class="n_box" /></td>
										<!-- 구매버튼2개 -->
										<td><a href=""><img src="../images/market/btn01.gif"
												style="margin-bottom: 5px;" /></a><br />
										<!--  <a href=""><img src="../images/market/btn02.gif" /></a>-->
										<input type="image"  class="cart" src="../images/market/btn02.gif" alt="장바구니" ></input>
										</td>
									</tr>
									<<script>money(${row.product_no});</script>
								</c:forEach>
							</c:otherwise>
						</c:choose>
					</table>

					<table border="1" width="90%">
						<tr align="center">
							<td>${ map.pagingImg }</td>
					
						</tr>
					</table>
				</div>
		</div>
		<%@ include file="../include/quick.jsp" %>
	</div>
	

	<%@ include file="../include/footer.jsp" %>
	<%-- </center> --%>
 </body>
</html>
