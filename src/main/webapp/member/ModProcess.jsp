<%@page import="utils.JSFunction"%>
<%@page import="membership.MemberDAO"%>
<%@page import="membership.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 글쓰기 처리(insert) 전 로그인 확인 -->
<%-- <%@ include file="./IsLoggedIn.jsp" %> --%>
<%
//폼값 받기
String name = request.getParameter("name");
String id = request.getParameter("id");
String pass = request.getParameter("pass1");
String phone1 = request.getParameter("tel1")+"-"+request.getParameter("tel2")+"-"+request.getParameter("tel3");
String phone2 = request.getParameter("mobile1")+"-"+request.getParameter("mobile2")+"-"+request.getParameter("mobile3");
String email = request.getParameter("email1")+"@"+request.getParameter("email2");
String postcode = request.getParameter("zipcode");
String addr1 = request.getParameter("addr1");
String addr2 = request.getParameter("addr2");


//사용자가 입력한 폼값을 저장하기 위해 DTO객체 생성
MemberDTO dto = new MemberDTO();
dto.setName(name);
dto.setId(id);
dto.setPass(pass);
dto.setPhone1(phone1);
dto.setPhone2(phone2);
dto.setEmail(email);
dto.setPostcode(postcode);
dto.setAddr1(addr1);
dto.setAddr2(addr2);


//DAO객체 생성 및 DB연결
MemberDAO dao = new MemberDAO();
//dto객체를 매개변수로 전달하여 레코드 update
int iResult = dao.modifyMember(dto);
//자원해제
dao.close();

if(iResult == 1){
	//회원정보 수정 성공시 메인 페이지로 이동
	response.sendRedirect("../main/main.jsp");
} else{
	//실패 시 뒤로 이동
	JSFunction.alertBack("회원정보수정에 실패하였습니다.", out);
}
%>
