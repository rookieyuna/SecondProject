<%@page import="utils.JSFunction"%>
<%@page import="membership.MemberDTO"%>
<%@page import="membership.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//아이디/비번찾기 폼에서 사용자가 입력한 아이디, 이름 받기
String userId = request.getParameter("user_id");
String userName = request.getParameter("user_name");
String userEmail = request.getParameter("user_email");

System.out.println(userId+userName);

//데이터베이스 연결
MemberDAO dao = new MemberDAO();
//받아온 이름을 매개변수로 getMemberDTO()호출. 아이디찾기
MemberDTO memberDTO = dao.findMemberDTO(userId, userName, userEmail);
//자원반납
dao.close();

if(memberDTO.getId() != null){
	if(userId==null){
		//1. 이름&이메일로 아이디 찾기
		JSFunction.alertLocation("아이디: "+ memberDTO.getId(), "login.jsp", out);
	}
	else{
		//2. 아이디&이름으로 비번 찾기
		JSFunction.alertLocation("비밀번호: "+ memberDTO.getPass(), "login.jsp", out);
	}
}
else {
	//찾기에 실패한 경우
	//JSFunction.alertBack("정보를 찾을 수 없습니다", out);
}
%>
