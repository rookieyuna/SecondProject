<%@page import="utils.JSFunction"%>
<%@page import="board.BoardDAO"%>
<%@page import="board.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String cate = request.getParameter("cate");
String num = request.getParameter("num");
String title = request.getParameter("title");
String content = request.getParameter("content");

BoardDTO dto = new BoardDTO();
dto.setNum(num);
dto.setTitle(title);
dto.setContent(content);

BoardDAO dao = new BoardDAO();
//수정처리
int affected = dao.updateEdit(dto);
dao.close();

if(affected == 1){
	response.sendRedirect("board_view.jsp?cate="+ cate +"&num=" + dto.getNum());
}else{
	JSFunction.alertBack("수정하기에 실패하였습니다.", out);
}
%>