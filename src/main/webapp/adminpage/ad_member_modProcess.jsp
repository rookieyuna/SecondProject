<%@page import="utils.JSFunction"%>
<%@page import="membership.MemberDAO"%>
<%@page import="membership.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 글쓰기 처리(insert) 전 로그인 확인 -->
<%-- <%@ include file="./IsLoggedIn.jsp" %> --%>
<%
//폼값 받기

String id = request.getParameter("user_id");
String identity = request.getParameter("identity");

//사용자가 입력한 폼값을 저장하기 위해 DTO객체 생성
MemberDTO dto = new MemberDTO();

dto.setId(id);
dto.setIdentity(identity);

//DAO객체 생성 및 DB연결
MemberDAO dao = new MemberDAO();
//dto객체를 매개변수로 전달하여 레코드 update
int iResult = dao.modifyIdentity(dto);
//자원해제
dao.close();

if(iResult == 1){
	//회원정보 수정 성공시 메인 페이지로 이동
	JSFunction.alertLocation("등급 수정 완료!", "./ad_member.jsp", out);
} else{
	//실패 시 뒤로 이동
	JSFunction.alertBack("회원정보수정에 실패하였습니다.", out);
}
%>
