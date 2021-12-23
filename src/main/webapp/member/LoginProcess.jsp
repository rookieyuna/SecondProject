<%@page import="utils.CookieManager"%>
<%@page import="utils.JSFunction"%>
<%@page import="membership.MemberDTO"%>
<%@page import="membership.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
/** 로그인 프로세스 - JYA 12/20 수정 **/

String userId = request.getParameter("user_id");
String userPwd = request.getParameter("user_pw");

//자동로그인 체크확인 파라미터(쿠키저장용)
String save_check = request.getParameter("save_check");

//데이터베이스 연결
MemberDAO dao = new MemberDAO();
//회원인증시도
MemberDTO memberDTO = dao.allMemberDTO(userId, userPwd);
//자원반납
dao.close();

if(memberDTO.getId() != null){
	//회원인증(로그인)에 성공한 경우 세션에 저장 후 
	session.setAttribute("UserId", memberDTO.getId());
	session.setAttribute("UserPwd", memberDTO.getPass());
	session.setAttribute("UserName", memberDTO.getName());
	session.setAttribute("UserEmail", memberDTO.getEmail());
	session.setAttribute("UserIdentity", memberDTO.getIdentity());
	
	//로그인 정보 저장을 위한 쿠키 생성
	if(save_check != null && save_check.equals("Y")){
		//저장체크시=> 쿠키값은 로그인아이디, 유효기간은 1일로 설정
		CookieManager.makeCookie(response, "loginId", userId, 86400);
		CookieManager.makeCookie(response, "loginPw", userPwd, 86400);
	}
	
	else{
		//저장 체크 안했으면 쿠키 삭제
		CookieManager.deleteCookie(response, "loginId");
		CookieManager.deleteCookie(response, "loginPw");
	}
	
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
