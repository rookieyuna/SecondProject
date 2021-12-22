<%@page import="utils.JSFunction"%>
<%@page import="board.BoardDAO"%>
<%@page import="board.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//수정페이지에서 전송한 폼값 받기
String num = request.getParameter("num");
String cate = request.getParameter("cate");
/* String pass = request.getParameter("pass"); */
String name = request.getParameter("name");
String email = request.getParameter("email");
String title = request.getParameter("title");
String content = request.getParameter("content");


//DTO객체에 입력값 추가하기 
BoardDTO dto = new BoardDTO();
dto.setNum(num);
/* dto.setPass(pass); */
dto.setName(name);
dto.setEmail(email);
dto.setTitle(title);
dto.setContent(content);
dto.setCategory(cate);

//DB연결
BoardDAO dao = new BoardDAO();
//수정처리 
int affected = dao.updateEdit(dto);
//자원해제
dao.close();

if(affected == 1) {
	//수정에 성공한 경우에는 수정된 내용을 확인하기 위해 상세보기 페이지로 이동
	response.sendRedirect("ad_boardView.jsp?cate=" + cate + "&num=" + num);
}
else { 
	//실패한 경우에는 뒤로 이동 
	JSFunction.alertBack("수정하기에 실패하였습니다.", out);
}
%>