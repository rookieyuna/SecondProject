<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/global_head.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>

<!-- 
1. 사진 억지로 늘리니까 화질이............ 
2. 돋보기 어뜨케 처리해
3. 주문정보 뭐쓰라는거지
4. 바로구매버튼, 장바구니버튼 나중에 구현되면 연결
 -->
<script>

    $(function(){
    	
    	 $(document).ready(function(){
    		
    		var p = $('#price').text();
    		var p_result1 = p.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
			$('#price').text(p_result1);
    		
    	}); 
    	
		$('#cartbtn').click(function(){
			if(sessionStorage.getItem("UserId")== null)
			{
				alert("로그인후 이용해주세요");
				return;
			} 
			$('#market_view').attr("action","../market/basketIns.do").submit();			
		})
		
		$('#orderbtn').click(function(){
			if(sessionStorage.getItem("UserId")== null)
			{
				alert("로그인후 이용해주세요");
				return;
			} 
			$('#market_view').attr("action","../market/basket2.do").submit();			
		})  
		
		$('#count').change(function(){
			
			
			var c = $('#count').val();

			
			var m = $('#org_milage').val();

			var m_result = m * c ;
			
			var p = $('#org_price').val();
			var p_result = p * c;
		

			var p_result1 = p_result.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
			$('#price').text(p_result1);
 			$('#milage').text(m_result);
 		});
		
		
	});

   
    
</script>
 <body>
<%-- 	<center> --%>
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
				<div class="market_view_box">
				
				<form action="" id="market_view">
					<div class="market_left">	
					
						<img src="../images/market/${boardList.product_sfile }" width="300px" height="200px"/>
						<p class="plus_btn"><a href=""><img src="../images/market/plus_btn.gif" /></a></p>
					</div>
					<div class="market_right">
					<!-- 장바구니에 저장할 데이터 파라미터 전달용 -->
						<input type="hidden" name="product_no" value="${boardList.product_no}"/>
						<input type="hidden" name="price" value="${boardList.price}"/>
						<input type="hidden" name="milage" value="${boardList.milage}"/>
						<input type="hidden" name="product_name" value="${boardList.product_name}"/>
						<input type="hidden" name="product_sfile" value="${boardList.product_sfile}"/>
						
<%-- 						<input type="hidden" name="id" value='${ session.getAttribute("UserId") }'/>
 --%>						
						<p class="m_title">${ boardList.product_name }
						<p>- ${ boardList.product_info }</p>
						<ul class="m_list">
							<li>
								<dl>
									<dt>가격</dt>
									<dd class="p_style" >
									<input type="hidden" id="org_price" value="${ boardList.price}" />
									<div id="price">${ boardList.price}</div></dd>
								</dl>
								<dl>
									<dt>적립금</dt>
									<dd> 
									<input type="hidden" id="org_milage" value="${ boardList.milage }" />
									<div id="milage" >${ boardList.milage }</div></dd>
								</dl> 
								<dl>
									<dt>수량</dt>
									<dd><input type="text" id="count" name="count_num" value="1" class="n_box" /></dd>
								</dl>
								<dl style="border-bottom:0px;">
									<dt>주문정보</dt>
									<dd><input type="text" name="" class="n_box" style="width:200px;" /></dd>
								</dl>
								<div style="clear:both;"></div>
							</li>
						</ul>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="image"  src="../images/market/m_btn01.gif" alt="바로구매" id="orderbtn" ></input>
						<!-- <p class="btn_box"><a href=""><img src="../images/market/m_btn01.gif" alt="바로구매" /></a> -->&nbsp;&nbsp;
						<!-- <img id="cartbtn" src="../images/market/m_btn02.gif" alt="장바구니" /> -->
						<input type="image"  src="../images/market/m_btn02.gif" alt="장바구니" id="cartbtn" ></input>
					</div> 
					</form>
				</div>
				<img src="../images/market/${boardList.product_sfile }" width="640px" height="426px"/>

			</div>
		</div>
		<%@ include file="../include/quick.jsp" %>
	</div>
	

	<%@ include file="../include/footer.jsp" %>
	<%-- </center> --%>
 </body>
</html>
