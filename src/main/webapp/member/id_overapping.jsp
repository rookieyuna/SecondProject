<%@page import="membership.MemberDAO"%>
<%@page import="membership.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>id_overapping.jsp</title>
    <script>
        /*
        부모창에서 팝업창을 열 때 readonly속성이 적용되어
        내용을 수정할 수 없지만, JS를 이용하면 수정할 수 있다.
        또한 opener 속성으로 부모창으로 아이디값 전송
        */
        function idUse(userid) {
            opener.document.myform.id.value = userid;
            self.close();
        }
        
    </script>
    <style>
    	html{
    		background : #efefef;
    	}
    	body{
    		padding: 25px;
    		margin: 25px;
    		border: 1px solid #d9d9d9;
    		background: #fff;
    	}
    	h2{
    		margin: 0;
    		border-bottom: 1px solid #d9d9d9;
    		border-radius: 4px;
    		padding: 16px 0;
    		position: relative;
    		font-size: 1.25rem;
   		    margin-bottom: 24px;
    	}
    	h2::after{
   		    content: "";
		    display: inline-block;
		    width: 50px;
		    height: 2px;
		    background: #2388b8;
		    position: absolute;
		    top: 58px;
		    left: 0;
    	}
    	h3:nth-of-type(1){
    		text-align: center;
		    border: 1px solid #d9d9d9;
		    border-radius: 14px;
		    width: fit-content;
		    margin: 0 auto;
		    padding: 10px 35px;
		    background: #ededed;
		    color: #777;
		    font-size: 1rem;
		    font-weight: normal;
    	}
    	h3:nth-of-type(2){
    		text-align: center;
    		margin: 28px 0;
    	}
    	h3.noCrmId{
    		color: red;
    	}
    	h3.okCrmId{
    		color: #24d041;
    	}
    	form[name=overlapFrm]{
  		    display: flex;
		    flex-direction: column;
    	}
    	input[name=id]{
  		    padding: 0.8em 0.5em;
		    border: 1px solid #d9d9d9;
		    border-bottom: 0;
		    font-family: inherit;
    	}
    	input[type=submit], button[type=button]{
    	    border: 1px solid #d9d9d9;
	    	padding: 0.8em 0.8em;
	    	background: #f9f9f9;
	        font-size: 1rem;
	    	color: #858796;
    	}
    	input[type=submit]:hover, button[type=button]:hover{
    	    background: #2388b8;
		    -webkit-transition: all ease 0.3s;
		    transition: all ease 0.3s;
		    color: #fff;
		    cursor: pointer;
    	}
    	button[type=button]{
    	    display: block;
    		width: 100%;
    	}
    </style>
</head>
<body>
    <h2>아이디 중복 확인하기</h2>
    
    <h3>입력한 아이디 : <%=request.getParameter("id") %></h3>
<%
String id = request.getParameter("id");

MemberDAO dao = new MemberDAO();
//dto객체를 매개변수로 전달하여 레코드 insert처리
int iResult = dao.idOverChk(id);
//자원해제
dao.close();

if(iResult==1){
%>
    <h3 class="noCrmId">아이디가 중복되므로 재입력해주세요</h3>
    <form name="overlapFrm">
        <input type="text" name="id" size="20">
        <input type="submit" value="아이디재검색" >
    </form>
<%
}
else{
%>
	<h3 class="okCrmId">사용 가능한 아이디 입니다.</h3>
	<button type="button" onclick="idUse('<%=request.getParameter("id") %>');">아이디 사용</button>
<%
}
%>
</body>
</html>