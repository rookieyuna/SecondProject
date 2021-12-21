<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/global_head.jsp" %>
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
	    
	    //var thisObj = eval('document.myform.'+name1); //name1은 문자열이므로 나머지를 문자열화 시켜서
	    //var nextObj = eval('document.myform.'+name2); //eval 함수로 씌워주면 해당 문자열이 그대로 실행됨
	    
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
	    //아이디 입력여부 확인
	    if(frm.id.value==''){
	        alert('아이디를 입력하세요');
	        frm.id.focus();
	        return false;
	    }
	    //아이디 검증작업1-아이디 길이 확인
	    if(frm.id.value.length<4 ||frm.id.value.length>12){
	        alert('아이디는 4~12자로 입력하세요');
	        frm.id.focus();
	        return false;
	    }
	    //아이디 검증작업2-영문자/숫자만사용
	    var idCheck= true;
	    for(var i=0; i<frm.id.value.length; i++){
	        if(!((frm.id.value[i]>='a' && frm.id.value[i]<='z')||
	            (frm.id.value[i]>='A' && frm.id.value[i]<='Z') ||
	            (frm.id.value[i]>='1' && frm.id.value[i]<='9')))
	            idCheck = false;
	    }
	    if(idCheck==false){
	        alert('숫자와 영문자만 가능합니다');
	        frm.id.focus();
	        return false;
	    }
	    
	    //아이디 중복확인 체크
	    if(frm.id.readOnly==false){
	        alert('아이디 중복확인하세요');
	        frm.id.focus();
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
	
	function idCheck(fn){
        //아이디가 입력되지 않은 상태라면
        if(fn.id.value===""){
            alert("중복확인 할 아이디를 입력하세요");
            fn.id.focus();
        }
        else {
            /*
            중복확인 후 검증된 id를 수정할 수 없도록 readOnly 속성 추가
            사용자는 중복확인창 script를 통해서만 수정이 가능하다.
            */
            fn.id.readOnly = true; 
            /*
            부모창에서 입력된 아이디를 파라미터로 팝업창 전달
            이때 파라미터명(name)은 id이고 전달되는 값은 입력한 value값이다
            */
            window.open("./id_overapping.jsp?id="+fn.id.value, 
                "idover", "width=500,height=400");

        }
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
				
				<form name="myform" action="JoinProcess.jsp" method="post" onsubmit="return formValidate(this);">
				<p class="join_title"><img src="../images/join_tit03.gif" alt="회원정보입력" /></p>
				<table cellpadding="0" cellspacing="0" border="0" class="join_box">
					<colgroup>
						<col width="80px;" />
						<col width="*" />
					</colgroup>
					<tr>
						<th><img src="../images/join_tit001.gif" /></th>
						<td><input type="text" name="name" value="" class="join_input" /></td>
					</tr>
					<tr>
						<th><img src="../images/join_tit002.gif" /></th>
						<td><input type="text" name="id"  value="" class="join_input" />&nbsp;
						<button type="button" onclick="idCheck(this.form);" style="cursor:hand; border:0px"><img src="../images/btn_idcheck.gif" alt="중복확인"/></button>&nbsp;&nbsp;
						<span>* 4자 이상 12자 이내의 영문/숫자 조합하여 공백 없이 기입</span></td>
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
							<select name="tel1" class="userSelect w50" onchange="document.myform.tel2.focus();">
		                        <option value=""></option>
		                        <option value="02">02</option><option value="031">031</option><option value="032">032</option>
		                        <option value="033">033</option><option value="041">041</option><option value="042">042</option>
		                        <option value="043">043</option><option value="051">051</option><option value="052">052</option>
		                        <option value="053">053</option><option value="054">054</option><option value="055">055</option>
		                        <option value="061">061</option><option value="062">062</option><option value="063">063</option>
		                        <option value="064">064</option>
	                    	</select> -
							<!-- <input type="text" name="tel1" value="" maxlength="3" class="join_input" style="width:50px;" />&nbsp;-&nbsp; -->
							<input type="text" name="tel2" value="" maxlength="4" class="join_input" style="width:50px;" onkeyup="fnFocusMove('tel2','tel3',4)"/>&nbsp;-&nbsp;
							<input type="text" name="tel3" value="" maxlength="4" class="join_input" style="width:50px;" onkeyup="fnFocusMove('tel3','mobile1',4)" />
						</td>
					</tr>
					<tr>
						<th><img src="../images/join_tit07.gif" /></th>
						<td>
							<select name="mobile1" class="userSelect w50" onchange="document.myform.mobile2.focus();">
		                        <option value=""></option>
		                        <option value="010">010</option><option value="011">011</option><option value="017">017</option>
		                        <option value="018">018</option><option value="019">019</option>
		                    </select> -
							<!-- <input type="text" name="mobile1" value="" maxlength="3" class="join_input" style="width:50px;" />&nbsp;-&nbsp; -->
							<input type="text" name="mobile2" value="" maxlength="4" class="join_input" style="width:50px;" onkeyup="fnFocusMove('mobile2','mobile3',4)"/>&nbsp;-&nbsp;
							<input type="text" name="mobile3" value="" maxlength="4" class="join_input" style="width:50px;" /></td>
					</tr>
					<tr>
						<th><img src="../images/join_tit08.gif" /></th>
						<td>
 
						<input type="text" name="email1" style="width:100px;height:20px;border:solid 1px #dadada;" value="" /> @ 
						<input type="text" name="email2" style="width:150px;height:20px;border:solid 1px #dadada;" value="" readonly="readonly"/>
						<select name="last_email_check2" onchange="domainInput(this);" class="pass" id="last_email_check2" >
							<option selected="" value="">선택해주세요</option>
							<option value="직접입력" >직접입력</option>
							<option value="empal.com" >empal.com</option>
							<option value="empas.com" >empas.com</option>
							<option value="freechal.com" >freechal.com</option>
							<option value="hanafos.com" >hanafos.com</option>
							<option value="hanmail.net" >hanmail.net</option>
							<option value="hotmail.com" >hotmail.com</option>
							<option value="nate.com" >nate.com</option>
							<option value="naver.com" >naver.com</option>
						</select>
	 
						<input type="checkbox" name="open_email" value="1">
						<span>이메일 수신동의</span></td>
					</tr>
					<tr>
						<th><img src="../images/join_tit09.gif" /></th>
						<td>
						<input type="text" name="zipcode" value=""  class="join_input" style="width:50px;" />
						<a href="javascript:;" title="우편번호검색" onClick="addressFind();" onkeypress="">[우편번호검색]</a>
						<br/>
						
						<input type="text" name="addr1" value=""  class="join_input" style="width:550px; margin-top:5px;" /><br>
						<input type="text" name="addr2" value=""  class="join_input" style="width:550px; margin-top:5px;" />
						
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
