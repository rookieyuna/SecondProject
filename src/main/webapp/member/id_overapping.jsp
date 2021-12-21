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
    <h3>아이디가 중복되므로 재입력해주세요</h3>
    <form name="overlapFrm">
        <input type="text" name="id" size="20">
        <input type="submit" value="아이디재검색" >
    </form>
<%
}
else{
%>
	<h3>사용 가능한 아이디 입니다.</h3>
	<button type="button" onclick="idUse('<%=request.getParameter("id") %>');">아이디 사용</button>
<%
}
%>
</body>
</html>