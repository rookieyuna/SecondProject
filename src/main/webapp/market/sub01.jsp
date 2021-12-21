<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/global_head.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!--

1. 
2. 원본은 체크박스였는데 쓸모없을거 같아서 임시로 가상번호로 수정한부분 어찌할지......... 수정
3. 페이징 처리 부분 이쁘게 
4. 바로구매버튼 : basket2.jsp 구현 후에 연결
5. 장바구니버튼 : basket.jsp 구현 후에 연결
  -->

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>

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
										 <td class="p_style"><fmt:formatNumber value="${ row.price }" pattern="#,###"/></td>
										<!-- 수량텍스트박스 -->
										<td><input type="text" name="" value="1" class="n_box" /></td>
										<!-- 구매버튼2개 -->
										<td><a href=""><img src="../images/market/btn01.gif"
												style="margin-bottom: 5px;" /></a><br />
										<a href="basket.jsp"><img src="../images/market/btn02.gif" /></a></td>
									</tr>
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
