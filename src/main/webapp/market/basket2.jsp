<%@page import="utils.JSFunction"%>
<%@page import="membership.MemberDTO"%>
<%@page import="membership.MemberDAO"%>
<%@page import="java.text.DecimalFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/global_head.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<% pageContext.setAttribute("temp", 1); %>
<%
String id = session.getAttribute("UserId").toString(); //로그인 id
String pass = session.getAttribute("UserPwd").toString(); //로그인 pass
MemberDAO dao = new MemberDAO(); //DB연결
MemberDTO dto = dao.allMemberDTO(id, pass); //계정정보조회
dao.close();

//전화번호, 핸드폰번호, 이메일
if(dto.getPhone1()!=null){
	String[] phone1Arr = dto.getPhone1().split("-");
	pageContext.setAttribute("tel", phone1Arr); //page영역에 저장
}
String[] phone2Arr = dto.getPhone2().split("-");
String[] emailArr = dto.getEmail().split("@");
%>

<script>
function insertData(){
	
	document.getElementById("name2").value= document.getElementById("name1").value;
	document.getElementById("postcode2").value = document.getElementById("postcode1").value;
	document.getElementById("addr2_1").value = document.getElementById("addr1_1").value;
	document.getElementById("addr2_2").value = document.getElementById("addr1_2").value;
	
	document.getElementById("phone2_1").value = document.getElementById("phone1_1").value;	
	document.getElementById("phone2_2").value = document.getElementById("phone1_2").value;	
	document.getElementById("phone2_3").value = document.getElementById("phone1_3").value;
	document.getElementById("email2_1").value = document.getElementById("email1_1").value;
	document.getElementById("email2_2").value = document.getElementById("email1_2").value;

	
}
function deleteData(){
	
	document.getElementById("name2").value= "";
	document.getElementById("postcode2").value = "";
	document.getElementById("addr2_1").value = "";
	document.getElementById("addr2_2").value = "";
	
	document.getElementById("phone2_1").value = "";	
	document.getElementById("phone2_2").value = "";	
	document.getElementById("phone2_3").value = "";
	document.getElementById("email2_1").value = "";
	document.getElementById("email2_2").value = "";

	
}
function goOrder(){ 
	 document.getElementById("form1").action="../market/order1.do"; 
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
				<p class="con_tit"><img src="../images/market/basket_title01.gif" /></p>
				
				
				<form name="orderFrm" id="form1" action="">
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
							<tr>
								<td><input type="checkbox" name="" value="" />
								<input type="hidden" name="product_no" value="${dto.product_no } "/></td>
								<td><img src="../images/market/${dto.product_sfile }" width="50px" height="50px"/></td>
								<td>${ dto.product_name }</td>
								<td><fmt:formatNumber value="${ dto.price }" pattern="#,###"/>원
								</td>
								<td><img src="../images/market/j_icon.gif" />&nbsp;${ dto.milage }원</td>
								<td><input type="text" name="total_count" value="${quantity }" class="basket_num" />
								</td>
								<td>무료배송</td>
								<td>[조건]</td>
								<td><span>
								<fmt:formatNumber value="${ total_price }" pattern="#,###"/>원
								 </span></td>
							</tr>
						
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
							<td style="text-align:left;"><input type="text" id="name1" name="name1"  value="${member_info.name }" class="join_input" /></td>
						</tr>
						<tr>
							<th>주소</th>
							<td style="text-align:left;"><input type="text" id="postcode1" name="postcode"  value="${member_info.postcode }" class="join_input" style="width:50px; margin-bottom:5px;" /> 
							 <a href=""><img src="../images/market/basket_btn03.gif" style="margin-bottom:5px;" /></a><br />
							 <input type="text" id="addr1_1" name="addr1"  value="${member_info.addr1 }" class="join_input" style="width:300px; margin-bottom:5px;" /> 기본주소<br />
							 <input type="text" id="addr1_2" name="addr2"  value="${member_info.addr2 }" class="join_input" style="width:300px;" /> 나머지주소</td>
						</tr>
						<tr>
							<th>휴대폰</th>
							<td style="text-align:left;"><input type="text" id="phone1_1"name=""  value="<%=phone2Arr[0] %>" class="join_input" style="width:50px;" /> - 
							<input type="text" id="phone1_2" name=""  value="<%=phone2Arr[1] %>" class="join_input" style="width:50px;" /> - 
							<input type="text" id="phone1_3" name=""  value="$<%=phone2Arr[2] %>" class="join_input" style="width:50px;" /></td>
						</tr>
						<tr>
							<th>이메일주소</th>
							<td style="text-align:left;"><input type="text" id="email1_1" name=""  value="<%=emailArr[0] %>" class="join_input" style="width:100px;" /> @ 
							<input type="text" id="email1_2" name=""  value="<%=emailArr[1] %>" class="join_input" style="width:100px;" /></td>
						</tr>
					</tbody>
				</table>

				<p class="con_tit"><img src="../images/market/basket_title03.gif" /></p>
				<p style="text-align:right">배송지 정보가 주문자 정보와 동일합니까? 예<input type="radio" name="check" onclick="insertData();"/> 아니오<input type="radio" name="check" onclick="deleteData();"/></p>
				<table cellpadding="0" cellspacing="0" border="0" class="con_table" style="width:100%;" style="margin-bottom:50px;">
					<colgroup>
						<col width="15%" />
						<col width="*" />
					</colgroup>
					<tbody>
						<tr>
							<th>성명</th>
							<td style="text-align:left;"><input type="text" id="name2" name=""  value="" class="join_input" /></td>
						</tr>
						<tr>
							<th>주소</th>
							<td style="text-align:left;"><input type="text" id="postcode2" name=""  value="" class="join_input" style="width:50px; margin-bottom:5px;" /> 
						 <a href=""><img src="../images/market/basket_btn03.gif" style="margin-bottom:5px;" /></a><br />
							<input type="text" id="addr2_1" name=""  value="" class="join_input" style="width:300px; margin-bottom:5px;" /> 기본주소<br />
							<input type="text" id="addr2_2" name=""  value="" class="join_input" style="width:300px;" /> 나머지주소
							<input type="hidden" name="addr" value="${member_info.email }" /></td>
						</tr>
						<tr>
							<th>휴대폰</th>
							<td style="text-align:left;"><input type="text" id="phone2_1" name=""  value="" class="join_input" style="width:50px;" /> - 
							<input type="text" id="phone2_2" name=""  value="" class="join_input" style="width:50px;" /> - 
							<input type="text" id="phone2_3" name=""  value="" class="join_input" style="width:50px;" /></td>
						</tr>
						<tr>
							<th>이메일주소</th>
							<td style="text-align:left;"><input type="text" id="email2_1" name=""  value="" class="join_input" style="width:100px;" /> @ 
							<input type="text" id="email2_2" name=""  value="" class="join_input" style="width:100px;" /></td>
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
							<td style="text-align:left;"><span class="money">
							<input type="hidden" name="total_price" value="${total_price }" />
								<fmt:formatNumber value="${ total_price }" pattern="#,###"/>원
								 </span></td>
						</tr>
						<tr>
							<th>결제방식선택</th>
							<td style="text-align:left;"><input name="credit" type="radio" value="card"/> 카드결제&nbsp;&nbsp;&nbsp;
							<input name="credit" type="radio" value="bank"/> 무통장입금&nbsp;&nbsp;&nbsp;
							<input name="credit" type="radio" value="transfer"/> 실시간 계좌이체</td>
						</tr>
					</tbody>
				</table>
				
				<p style="text-align:right;">
				<input type="image" onclick="goOrder();" src="../images/market/basket_btn04.gif" ></input>
				</p>
				</form>
			</div>
		</div>
		<%@ include file="../include/quick.jsp" %>
	</div>
	

	<%@ include file="../include/footer.jsp" %>
</center>
 </body>
</html>
