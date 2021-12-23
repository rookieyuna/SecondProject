<%@page import="membership.MemberDTO"%>
<%@page import="membership.MemberDAO"%>
<%@page import="utils.JSFunction"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
String id = request.getParameter("user_id");
String identity = request.getParameter("identity");

if(!identity.equals("3")){ //일반&직원계정일경우
	//사용자가 입력한 폼값을 저장하기 위해 DTO객체 생성
	MemberDTO dto = new MemberDTO();

	dto.setId(id);
	dto.setIdentity(identity);
	
	//DAO객체 생성 및 DB연결
	MemberDAO dao = new MemberDAO();
	//dto객체를 매개변수로 전달하여 레코드 update
	int iResult = dao.deleteMember(dto);
	//자원해제
	dao.close();
	
	if(iResult == 1){
		//회원정보 수정 성공시 메인 페이지로 이동
		JSFunction.alertLocation(id+" 회원 삭제 완료!", "./ad_member.jsp", out);
	} else{
		//실패 시 뒤로 이동
		JSFunction.alertBack(id+" 회원삭제에 실패하였습니다.", out);
	}
}else{ // 관리자계정일 경우
	JSFunction.alertBack("관리자계정은 삭제할 수 없습니다.", out);
	return;
}
%>


	

%>