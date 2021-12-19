<%@page import="utils.JSFunction"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
/* session 영역에 저장된 인증관련 속성값이 있는지 확인하여
	만약 없다면 로그인 페이지로 자동 이동 */
if(session.getAttribute("UserId") ==null){
	JSFunction.alertLocation("로그인 후 이용해주십시오.", 
						"../member/login.jsp", out);
	return;
}
%>