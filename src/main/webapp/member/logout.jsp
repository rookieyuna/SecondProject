<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//로그아웃 : 개별속성 삭제
session.removeAttribute("UserId");
session.removeAttribute("UserPwd");
session.removeAttribute("UserName");
session.removeAttribute("UserEmail");
session.removeAttribute("UserIdentity");

response.sendRedirect("../main/main.jsp");
%>