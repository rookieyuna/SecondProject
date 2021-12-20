<%@page import="utils.JSFunction"%>
<%@page import="board.BoardDTO"%>
<%@page import="board.BoardDAO"%>
<%@page import="membership.MemberDTO"%>
<%@page import="membership.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

String userid = session.getAttribute("UserId").toString();
String pass = request.getParameter("pass");
String name = request.getParameter("name");
String email = request.getParameter("email");
String title = request.getParameter("title");
String content = request.getParameter("content");
String cate = "freeB";

BoardDTO dto = new BoardDTO();
dto.setId(userid);
dto.setPass(pass);
dto.setName(name);
dto.setEmail(email);
dto.setTitle(title);
dto.setContent(content);
dto.setCategory(cate);

BoardDAO dao = new BoardDAO();

int iResult = dao.insertWrite(dto);

// 자원해제
dao.close();

if(iResult == 1){
	// 글쓰기에 성공했다면 리스트(목록) 페이지로 이동한다.
	response.sendRedirect("sub03.jsp");
}else{
	// 실패한 경우 글쓰기 페이지로 이동한다. 즉 뒤로 이동한다.
	JSFunction.alertBack("글쓰기에 실패하였습니다.", out);
}
%>