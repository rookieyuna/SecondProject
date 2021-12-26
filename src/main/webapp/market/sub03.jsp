<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/global_head.jsp" %>
<link rel="stylesheet" href="//code.jquery.com/ui/1.13.0/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"></script>


<!-- 
1. 로그인이 확인되면 폼 작성할 수 있게
2. 주소가 아직 구현잉 안댐 ㅠ
5. 이메일 보내는거 디자인? 레이아웃

 -->

<script>
<% 
	if (session.getAttribute("UserId") == null) {
		%>
		alert("로그인 하세요");
		location.href = "../main/main.jsp";
		<% 
	}
	%>

$(function(){
	
	<%
	if((request.getAttribute("EmailSuccess") != null) && (request.getAttribute("InsertSuccess") != null) ){
	 %> 		
		alert("신청 완료");
	
	<%
	}
	%>
});

function validateForm(form) {
	
	if(form.name.value ==""){
		alert("고객명 또는 회사명을 입력하세요.");
		form.name.focus();
		return false;
	}
	if(form.zip1.value ==""){
		alert("주소를 입력하세요.");
		form.zip1.focus();
		return false;
	}
	
	if(!form.cel1.value){
		alert("연락처를 입력하세요.");
		form.cel1.focus();
		return false;
	}
	if(!form.eCel1.value){
		alert("담당자 휴대전화번호를 입력하세요.");
		form.eCel1.focus();
		return false;
	}
	if(!form.email1.value){
		alert("이메일을 입력하세요.");
		form.email1.focus();
		return false;
	}
	if(!form.clean_type.value){
		alert("청소종류를 선택하세요.");
		return false;
	}
	if(!form.area.value){
		alert("평수를 선택하세요.");
		return false;
	}
	if(!form.date.value){
		alert("희망 날짜를 선택하세요.");
		return false;
	}
	if(!form.type.value){
		alert("접수 종류를 선택하세요.");
		return false;
	}
}
//이메일 선택시 도메인 자동 입력
function inputEmail(frm){
	var domain = frm.email_sel.value;
	if(domain=='직접입력'){ //'직접입력' 선택시
        frm.email2.readOnly = false; //readonly속성 해제
        frm.email2.value = '';
        frm.email2.focus();
    }
    else{ //도메인 선택시
        frm.email2.value = domain;
        frm.email2.readOnly = true; //readonly속성 활성화
    }
}

//연락처 입력시 포커스 이동
function focusMove(thisObj, nextName, inputLen){
    //현재 입력된 글자수
    var strLen = thisObj.value.length;
    if(strLen >= inputLen){
        eval('document.expFrm.'+nextName).focus();
    }  
} 
$(function() {	
	//참여 희망 날짜 datepicker 적용
	$('#date').datepicker();
	$('#date').datepicker("option", "dateFormat", "yy-mm-dd");
});



</script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	//주소찾기 DAUM API
    function addressFind(){
        new daum.Postcode({
            oncomplete: function(data) {
                var frm = document.cleanFrm;
                frm.zip1.value = data.zonecode;//12345(우편번호)
                frm.addr1.value = data.address;//서울시 금천구 가산동(기본주소)
                frm.addr2.focus();
            }
        }).open();
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
					<img src="../images/market/sub03_title.gif" alt="블루크리닝 견적 의뢰" class="con_title" />
					<p class="location"><img src="../images/center/house.gif" />&nbsp;&nbsp;열린장터&nbsp;>&nbsp;블루크리닝 견적 의뢰<p>
				</div>
				
				
				<form name="cleanFrm" method="post" onsubmit="return validateForm(this);"  action="CleanProcess2.jsp">
					<input type="hidden" name="to" value="secondpj@naver.com" />
					<input type="hidden" name="format" value="text" />	
					<input type="hidden" name="subject" value="블루클리닝" />
				
				<table cellpadding="0" cellspacing="0" border="0" class="con_table" style="width:100%;">
					<colgroup>
						<col width="25%" />
						<col width="*" />
					</colgroup>
					<tbody>
						<tr>
							<th>고객명/회사명</th>
							<td style="text-align:left;"><input type="text" name="name"   class="join_input" /></td>
						</tr>
						<tr>
							<th>청소할 곳 주소</th>
							<td style="text-align:left;">
								<input type="text" name="zip1" value=""  class="join_input" style="width:100px;" /><!-- &nbsp;-&nbsp;
								<input type="text" name="zip2" value=""  class="join_input" style="width:50px;" /> -->
								<a href="javascript:;" title="새 창으로 열림" onClick="addressFind();" onkeypress="">[우편번호검색]</a>
								<br/>
						
								<input type="text" name="addr1" value=""  class="join_input" style="width:550px; margin-top:5px;" /><br>
								<input type="text" name="addr2" value=""  class="join_input" style="width:550px; margin-top:5px;" />
							</td>
						</tr>
						<tr>
							<th>연락처</th>
							<td style="text-align:left;">
								<input type="text" name="cel1" value="" class="join_input" style="width:50px;" onkeyup="focusMove(this,'cel2',3);"/> - 
								<input type="text" name="cel2" value="" class="join_input" style="width:50px;" onkeyup="focusMove(this,'cel3',4);"/> - 
								<input type="text" name="cel3" value="" class="join_input" style="width:50px;" onkeyup="focusMove(this,'eCel1',4);"/>
								</td>
						</tr>
						<tr>
							<th>휴대전화</th>
							<td style="text-align:left;">
								<input type="text" name="eCel1" value="" class="join_input" style="width:50px;" onkeyup="focusMove(this,'eCel2',3);"/> - 
								<input type="text" name="eCel2" value="" class="join_input" style="width:50px;" onkeyup="focusMove(this,'eCel3',4);"/> - 
								<input type="text" name="eCel3" value="" class="join_input" style="width:50px;" onkeyup="focusMove(this,'email1',4);"/>
							 </td>
						</tr>
						<tr>
							<th>이메일</th>
							<td style="text-align:left;"><input type="text" name="email1"  value="" class="join_input" style="width:100px;" /> 
							@ <input type="text" name="email2"  value="" class="join_input" style="width:100px;" />
								<select name="email_sel" onchange="inputEmail(this.form);">
			                        <option value="" style="text-align: center" selected disabled> -- 선택 --</option>
			                        <option value="naver.com">naver.com</option>
			                        <option value="nate.com">nate.com</option>
			                        <option value="gmail.com">gmail.com</option>
			                        <option value="daum.net">daum.net</option>
			                        <option value="hanmail.net">hanmail.net</option>
			                        <option value="직접입력">직접입력</option>
	                    		</select>
	                    		<!-- asdfasdf
	                    		asdf
	                    		asdf
	                    		asdf -->
							<input type="hidden" name="from" value="secondpj@naver.com"/>
	                    		
	                    	</td>
						</tr>
						<tr>
							<th>청소의뢰내역</th>
							<td style="text-align:left;" style="padding:0px;">
								<table cellpadding="0" cellspacing="0" border="0" style="width:100%;">
									<tr>
										<td>청소종류</td>
										<td style="border-right:0px;">
										<select name="clean_type" onchange="">
					                        <option value="" style="text-align: center" selected disabled> ---- 선택 ---- </option>
					                        <option value="clean1">청소1</option>
					                        <option value="clean2">청소2</option>
					                        <option value="clean3">청소3</option>
	                    		</select>
										</td>
									</tr>
									<tr>
										<td style="border-bottom:0px;">분양평수/등기평수</td>
										<td style="border:0px;"><input type="text" name="area"  value="" class="join_input" /></td>
									</tr>
								</table>
							</td>
						</tr>
						<tr>
							<th>청소 희망날짜</th>
							<!-- <td style="text-align:left;"><input type="text" name=""  value="" class="join_input" /></td> -->
							<td style="text-align:left;"><input type="text" name="date" id="date" style="border:1px solid #D2D2D2; width:112px;"/></td>
						</tr>
						<tr>
							<th>접수종류 구분</th>
							<td style="text-align:left;">
								<input type="radio" name="type"  value="rsvn" /> 예약신청&nbsp;&nbsp;&nbsp;
								<input type="radio" name="type"  value="estm" /> 견적문의</td>
						</tr>
						<tr>
							<th>기타특이사항</th>
							<td style="text-align:left;"><input type="text" name="others"  value="" class="join_input" style="width:400px;" /></td>
						</tr>
					</tbody>
				</table>
				
				<p style="text-align:center; margin-bottom:40px">
					<!-- <a href="CleanProcess2.jsp"><img src="../images/btn01.gif" /></a> -->
					<input type="image" src="../images/btn01.gif" />
					&nbsp;&nbsp;
					<a href="#"><img src="../images/btn02.gif" /></a>
				</p>
			</form>
			</div>
		</div>
		<%@ include file="../include/quick.jsp" %>
	</div>
	

	<%@ include file="../include/footer.jsp" %>
	<!-- </center> -->
 </body>
</html>
