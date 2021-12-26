<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/global_head.jsp" %>
<!-- 체험학습신청 페이지 진입전 로그인 확인 -->
<%-- <%@ include file="../member/IsLoggedIn.jsp" %> --%>
<link rel="stylesheet" href="//code.jquery.com/ui/1.13.0/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"></script>
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
		alert("체험 학습 신청 완료");
	<%
	}
	%>
});

//폼값 입력 여부 체크
function validateForm(form) {
	if(form.name.value==""){
		alert("고객명 또는 회사명을 입력하세요.");
		form.name.focus();
		return false;
	}
	if(form.disabled.value==""){
		alert("장애 유무를 선택하세요.");
		return false;
	}
	if(!form.helpingTool.value){
		alert("보장구 사용 유무를 선택하세요.");
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
	if(!form.exp_sel.value){
		alert("체험 내용을 선택하세요.");
		return false;
	}
	if(!form.date.value){
		alert("체험 희망 날짜를 선택하세요.");
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

//장애 또는 보장구 유무 선택시 상세내용 입력칸 활성화/비활성화
$(function() {
	$("input:radio[name=disabled]").click(function(){
		
		if($("input[name=disabled]:checked").val() == "Y"){
	        $("#typeOfDisability").attr("readOnly",false);
	    }
		else if($("input[name=disabled]:checked").val() == "N"){
			$("#typeOfDisability").val('');
			$("#typeOfDisability").attr("readOnly",true);
		}
    });
	
	$("input:radio[name=helpingTool]").click(function(){
		
		if($("input[name=helpingTool]:checked").val() == "Y"){
	        $("#nameOfTool").attr("readOnly",false);
	    }
		else if($("input[name=helpingTool]:checked").val() == "N"){
			$("#nameOfTool").val('');
			$("#nameOfTool").attr("readOnly",true);
		}
    });
	
	//참여 희망 날짜 datepicker 적용
	$('#date').datepicker();
	$('#date').datepicker("option", "dateFormat", "yy-mm-dd");
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
					<img src="../images/market/sub05_title.gif" alt="체험학습신청" class="con_title" />
					<p class="location"><img src="../images/center/house.gif" />&nbsp;&nbsp;열린장터&nbsp;>&nbsp;체험학습신청<p>
				</div>
				<p class="con_tit"><img src="../images/market/sub05_tit01.gif" /></p>
				
				<!-- 체험 학습 종류 설명 -->
				<ul class="dot_list">
					<li>무 방부제 • 무첨가제 수제 빵 제작 체험</li>
					<li>사전에 준비된 반죽으로 성형 및 굽기 체험</li>
					<li>참가비 : 일인당 20,000원 (교육비, 재료비 포함)</li>
				</ul>
				<p class="con_tit"><img src="../images/market/sub05_tit02.gif" /></p>
				<ul class="dot_list">
					<li>내가만든 맛있는 쿠키~!</li>
					<li>쿠키의 반죽 ,성형, 굽기 기술 경험의 기회! </li>
					<li>참가비 : 일인당 15,000원 (교육비, 재료비 포함)</li>
				</ul>
				<p class="con_tit"><img src="../images/market/sub05_tit03.gif" /></p>
				<ul class="dot_list">
					<li>만드는 즐거움 받는이에겐 감동을~!</li>
					<li>직접 데코레이션한 세상에서 하나뿐인 케익을 소중한 사람에게 전하세요~!</li>
					<li>준비된 케익시트에 테코레이션 과정 체험</li>
					<li>참가비 : 일인당 25,000원 (교육비, 재료비 포함)</li>
				</ul>
				<div style="text-align:left">
					<img src="../images/market/sub05_img01.jpg" style="margin-bottom:30px;" />
				</div>
				
				<!---------------------------------------------------------------------------------------------------------------------->
				<!-- 체험 학습 신청 양식 -->
				<form name="expFrm" method="post" onsubmit="return validateForm(this);" action="ExProcess.jsp">
					<!-- 숨김처리하여 폼값으로 전송할 메일 수신자(관리자 메일), 출력방식, 메일 제목 -->
					<input type="hidden" name="to" value="secondpj@naver.com" />
					<input type="hidden" name="subject" value="체험 학습 신청" />
				<table class="con_table" style="width:100%; padding:0; border-spacing:0; border-collapse: separate;">
					<colgroup>
						<col width="25%" />
						<col width="*" />
					</colgroup>
					<tbody>
						<tr>
							<th>고객명/회사명</th>
							<td style="text-align:left;"><input type="text" name="name"  value="" class="join_input" /></td>
						</tr>
						<tr>
							<th>장애 유무</th>
							<td style="text-align:left;" style="padding:0px;">
								<table style="width:100%; padding:0; border-spacing:0; border-collapse: separate;">
									<tr>
										<td style="border-bottom:0px;">
											<input type="radio" name="disabled" value="Y" /> 유&nbsp;&nbsp;&nbsp;
											<input type="radio" name="disabled" value="N" /> 무</td>
										<th style="border-bottom:0px;" width="100px">주요장애유형</th>
										<td style="border-right:0px; border-bottom:0px;">
											<input type="text" name="typeOfDisability" id="typeOfDisability" class="join_input"/></td>
									</tr>
								</table>
							</td>
						</tr>
						<tr>
							<th>보장구 사용 유무</th>
							<td style="text-align:left;" style="padding:0px;">
								<table style="width:100%; padding:0; border-spacing:0; border-collapse: separate;">
									<tr>
										<td style="border-bottom:0px;">
											<input type="radio" name="helpingTool" value="Y" /> 유&nbsp;&nbsp;&nbsp;
											<input type="radio" name="helpingTool" value="N" /> 무</td>
										<th style="border-bottom:0px;" width="100px">보장구 명</th>
										<td style="border-right:0px; border-bottom:0px;">
											<input type="text" name="nameOfTool" id="nameOfTool" class="join_input" /></td>
									</tr>
								</table>
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
							<th>담당자 휴대전화</th>
							<td style="text-align:left;">
								<input type="text" name="eCel1" value="" class="join_input" style="width:50px;" onkeyup="focusMove(this,'eCel2',3);"/> - 
								<input type="text" name="eCel2" value="" class="join_input" style="width:50px;" onkeyup="focusMove(this,'eCel3',4);"/> - 
								<input type="text" name="eCel3" value="" class="join_input" style="width:50px;" onkeyup="focusMove(this,'email1',4);"/>
							</td>
						</tr>
						<tr>
							<th>이메일</th>
							<td style="text-align:left;">
								<input type="text" name="email1"  value="" class="join_input" style="width:100px;" /> @ 
								<input type="text" name="email2"  value="" class="join_input" style="width:100px;" />
								<select name="email_sel" onchange="inputEmail(this.form);">
			                        <option value="" style="text-align: center" selected disabled> -- 선택 -- </option>
			                        <option value="naver.com">naver.com</option>
			                        <option value="nate.com">nate.com</option>
			                        <option value="gmail.com">gmail.com</option>
			                        <option value="daum.net">daum.net</option>
			                        <option value="hanmail.net">hanmail.net</option>
			                        <option value="직접입력">직접입력</option>
	                    		</select>
							</td>
						</tr>
						<tr>
							<th>체험 내용</th>
							<td style="text-align:left; left:5px;">
								<select name="exp_sel" onchange="">
			                        <option value="" style="text-align: center" selected disabled> ---- 선택 ---- </option>
			                        <option value="baking">빵 만들기 체험</option>
			                        <option value="cookie">쿠키 체험</option>
			                        <option value="cake">케익 체험</option>
	                    		</select>
							</td>
						</tr>
						<tr>
							<th>체험 희망 날짜</th>
							<!-- <td style="text-align:left;"><input type="text" name=""  value="" class="join_input" /> -->
							<td style="text-align:left;"><input type="text" name="date" id="date" style="border:1px solid #D2D2D2; width:112px;"/></td>
						</tr>
						<tr>
							<th>접수 종류 구분</th>
							<td style="text-align:left;">
								<input type="radio" name="type"  value="rsvn" /> 예약신청&nbsp;&nbsp;&nbsp;
								<input type="radio" name="type"  value="estm" /> 견적문의</td>
						</tr>
						<tr>
							<th>기타 특이사항</th>
							<td style="text-align:left;"><input type="text" name="others"  value="" class="join_input" style="width:400px;" /></td>
						</tr>
					</tbody>
				</table>
				<p style="text-align:center; margin-bottom:40px">
					<input type="image" src="../images/btn01.gif" />&nbsp;&nbsp;
					<a href="#"><img src="../images/btn02.gif" /></a></p>
				</form>
			</div>
		</div>
		<%@ include file="../include/quick.jsp" %>
	</div>
	
	<%@ include file="../include/footer.jsp" %>
	</center>
 </body>
</html>
