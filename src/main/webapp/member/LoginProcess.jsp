<%@page import="membership.MemberDTO"%>
<%@page import="membership.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//로그인 폼에서 사용자가 입력한 아이디, 패스워드 받기
String userId = request.getParameter("user_id");
String userPwd = request.getParameter("user_pw");


//데이터베이스 연결(오라클 접속)
MemberDAO dao = new MemberDAO();
//회원인증시도
MemberDTO memberDTO = dao.getMemberDTO(userId, userPwd);
//자원반납
dao.close();

if(memberDTO.getId() != null){
	//회원인증(로그인)에 성공한 경우 세션에 저장 후 
	session.setAttribute("UserId", memberDTO.getId());
	session.setAttribute("UserPwd", memberDTO.getPass());
	//메인 페이지로 이동
	response.sendRedirect("../main/main.jsp");
}
else {
	//인증에 실패한 경우
	request.setAttribute("LoginErrMsg", "아이디, 비밀번호를 확인하세요!");
	//로그인페이지로 실패메세지 전달
	request.getRequestDispatcher("login.jsp").forward(request, response);
}
%>
