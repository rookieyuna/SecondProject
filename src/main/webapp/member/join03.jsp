<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="membership.MemberDTO"%>
<%@page import="membership.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/global_head.jsp" %>

<!-- 회원정보 수정 전 로그인 확인 -->
<%@ include file="./IsLoggedIn.jsp" %>

<!-- 기존 회원정보 불러오기위한 작업 -->
<%
String id = session.getAttribute("UserId").toString(); //로그인 id
String pass = session.getAttribute("UserPwd").toString(); //로그인 pass
MemberDAO dao = new MemberDAO(); //DB연결
MemberDTO dto = dao.allMemberDTO(id, pass); //계정정보조회
dao.close();

 if (!id.equals(dto.getId())){
	JSFunction.alertBack("작성자 본인만 수정할 수 있습니다", out);
	return;
}

//전화번호, 핸드폰번호, 이메일
if(dto.getPhone1()!=null){
	String[] phone1Arr = dto.getPhone1().split("-");
	pageContext.setAttribute("tel", phone1Arr); //page영역에 저장
}
String[] phone2Arr = dto.getPhone2().split("-");
String[] emailArr = dto.getEmail().split("@");
%>

<script>
	//이메일주소 선택시 자동입력 함수
	function domainInput(obj){
	    document.myform.email2.value = obj.value;
	    if(obj.value=='직접입력'){ //친절한개발자용if문
	        document.myform.email2.value='';
	        document.myform.email2.focus();
	        document.myform.email2.readOnly=false;
	    }
	    else{
	        document.myform.email2.readOnly=true;
	    }
	}
	//전화번호 입력시 자동으로 포커스 이동하는 함수
	function fnFocusMove(name1, name2, num){
	    var thisObj = document.getElementsByName(name1);
	    var nextObj = document.getElementsByName(name2);
	    
	    var strLen = thisObj[0].value.length;
	    if(strLen>=num){
	        nextObj[0].focus();
	    }
	}
	
	//submit 후 폼 전체 유효성 검증 함수
	
	function formValidate(frm){
		
		//이름 입력 확인
	    if(frm.name.value==''){
	        alert('이름을 입력하세요');
	        frm.name.focus();
	        return false;
	    }

	    //패스워드 입력여부 확인
	    if(!frm.pass1.value || !frm.pass2.value){
	        alert('비밀번호를 입력하세요');
	        frm.pass1.focus();
	        return false;
	    }
	  	//패스워드 검증작업1-패스워드 길이 확인
	    if(frm.pass1.value.length<4 ||frm.pass1.value.length>12){
	        alert('비밀번호는 4~12자로 입력하세요');
	        frm.pass1.value=''; //지워준다
	        frm.pass2.value=''; //지워준다
	        frm.pass1.focus();
	        return false;
	    }
	    //패스워드 검증작업2-영문자/숫자만사용
	    var pwCheck= true;
	    for(var i=0; i<frm.pass1.value.length; i++){
	        if(!((frm.pass1.value[i]>='a' && frm.pass1.value[i]<='z')||
	            (frm.pass1.value[i]>='A' && frm.pass1.value[i]<='Z') ||
	            (frm.pass1.value[i]>='1' && frm.pass1.value[i]<='9')))
	        	pwCheck = false;
	    }
	    if(pwCheck==false){
	        alert('비밀번호는 숫자와 영문자만 가능합니다');
	        frm.pass1.value=''; //지워준다
	        frm.pass2.value=''; //지워준다
	        frm.pass1.focus();
	        return false;
	    }
	    
	    //패스워드 일치여부 확인
	    if(frm.pass1.value != frm.pass2.value){
	        alert('패스워드가 일치하지 않습니다.');
	        frm.pass1.value="";
	        frm.pass2.value="";
	        frm.pass1.focus();
	        return false;
	    }

	    //휴대전화 입력 확인
	    if(frm.mobile1.value=='' || frm.mobile2.value=='' || frm.mobile3.value==''){
	        alert('휴대전화를 입력하세요');
	        frm.mobile1.focus();
	        return false;
	    }
	    //이메일 입력 확인
	    if(frm.email1.value=='' || frm.email2.value==''){
	        alert('이메일을 입력하세요');
	        frm.email1.focus();
	        return false;
	    }
	    //주소입력확인
	    if(frm.zipcode.value=='' || frm.addr1.value=='' || frm.addr2.value==''){
	        alert('주소를 입력하세요');
	        frm.zipcode.focus();
	        return false;
	    }
	    
	    return true;
	}
	
</script>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	//주소찾기 DAUM API
    function addressFind(){
        new daum.Postcode({
            oncomplete: function(data) {
                var frm = document.myform;
                frm.zipcode.value = data.zonecode;//12345(우편번호)
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

		<img src="../images/member/sub_image.jpg" id="main_visual" />
	
		<div class="contents_box">
			<div class="left_contents">
				<%@ include file = "../include/member_leftmenu.jsp" %>
			</div>
			<div class="right_contents">
				<div class="top_title">
					<img src="../images/join_tit.gif" alt="회원가입" class="con_title" />
					<p class="location"><img src="../images/center/house.gif" />&nbsp;&nbsp;멤버쉽&nbsp;>&nbsp;회원가입<p>
				</div>
				
				<form name="myform" action="ModProcess.jsp" method="post" onsubmit="return formValidate(this);">
				<p class="join_title"><img src="../images/join_tit03.gif" alt="회원정보입력" /></p>
				<table cellpadding="0" cellspacing="0" border="0" class="join_box">
					<colgroup>
						<col width="80px;" />
						<col width="*" />
					</colgroup>
					<tr>
						<th><img src="../images/join_tit001.gif" /></th>
						<td><input type="text" name="name" value="<%=dto.getName()%>" class="join_input" /></td>
					</tr>
					<tr>
						<th><img src="../images/join_tit002.gif" /></th>
						<td><input type="text" name="id" value="<%=id%>" readOnly></td>
					</tr>
					<tr>
						<th><img src="../images/join_tit003.gif" /></th>
						<td><input type="password" name="pass1" value="" class="join_input" />&nbsp;&nbsp;<span>* 4자 이상 12자 이내의 영문/숫자 조합</span></td>
					</tr>
					<tr>
						<th><img src="../images/join_tit04.gif" /></th>
						<td><input type="password" name="pass2" value="" class="join_input" /></td>
					</tr>
					

					<tr>
						<th><img src="../images/join_tit06.gif" /></th>
						<td>
							<input type="text" name="tel1" value="${tel[0]}" maxlength="3" class="join_input" style="width:40px;" onkeyup="fnFocusMove('tel1','tel2',3)"/>&nbsp;-&nbsp;
							<input type="text" name="tel2" value="${tel[1]}" maxlength="4" class="join_input" style="width:50px;" onkeyup="fnFocusMove('tel2','tel3',4)"/>&nbsp;-&nbsp;
							<input type="text" name="tel3" value="${tel[2]}" maxlength="4" class="join_input" style="width:50px;" onkeyup="fnFocusMove('tel3','mobile1',4)" />
						</td>
					</tr>
					<tr>
						<th><img src="../images/join_tit07.gif" /></th>
						<td>
							<%--번호선택 셀렉트형태 
							<select name="mobile1" value="<%=phone2Arr[0] %> class="userSelect w50" onchange="document.myform.mobile2.focus();">
		                        <option value=""></option>
		                        <option value="010">010</option><option value="011">011</option><option value="017">017</option>
		                        <option value="018">018</option><option value="019">019</option>
		                    </select> - --%>
							<input type="text" name="mobile1" value="<%=phone2Arr[0] %>" maxlength="4" class="join_input" style="width:40px;" onkeyup="fnFocusMove('mobile1','mobile2',3)"/>&nbsp;-&nbsp;
							<input type="text" name="mobile2" value="<%=phone2Arr[1] %>" maxlength="4" class="join_input" style="width:50px;" onkeyup="fnFocusMove('mobile2','mobile3',4)"/>&nbsp;-&nbsp;
							<input type="text" name="mobile3" value="<%=phone2Arr[2] %>" maxlength="4" class="join_input" style="width:50px;" /></td>
					</tr>
					<tr>
						<th><img src="../images/join_tit08.gif" /></th>
						<td>
 
						<input type="text" name="email1" style="width:100px;height:20px;border:solid 1px #dadada;" value="<%=emailArr[0] %>" /> @ 
						<input type="text" name="email2" style="width:150px;height:20px;border:solid 1px #dadada;" value="<%=emailArr[1] %>" readonly="readonly"/>
						<select name="last_email_check2" onchange="domainInput(this);" class="pass" id="last_email_check2" >
							<option selected="" value="">선택해주세요</option>
							<option value="직접입력" >직접입력</option>
							<option value="hanmail.net" >hanmail.net</option>
							<option value="naver.com" >naver.com</option>
							<option value="gmail.com" >gmail.com</option>
							<option value="nate.com" >nate.com</option>
							<option value="yahoo.com" >yahoo.com</option>
						</select>
	 
						<input type="checkbox" name="open_email" value="1">
						<span>이메일 수신동의</span></td>
					</tr>
					<tr>
						<th><img src="../images/join_tit09.gif" /></th>
						<td>
						<input type="text" name="zipcode" value="<%=dto.getPostcode()%>"  class="join_input" style="width:50px;" />
						<a href="javascript:;" title="우편번호검색" onClick="addressFind();" onkeypress="">[우편번호검색]</a>
						<br/>
						
						<input type="text" name="addr1" value="<%=dto.getAddr1()%>"  class="join_input" style="width:550px; margin-top:5px;" /><br>
						<input type="text" name="addr2" value="<%=dto.getAddr2()%>"  class="join_input" style="width:550px; margin-top:5px;" />
						
						</td>
					</tr>
				</table>

				<p style="text-align:center; margin-bottom:20px">
					<input type="image" src="../images/btn01.gif"  /> &nbsp;
					<a href="../main/main.jsp"><img src="../images/btn02.gif" /></a>
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
