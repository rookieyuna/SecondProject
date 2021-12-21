<%@page import="utils.JSFunction"%>
<%@page import="board.BoardDAO"%>
<%@page import="board.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
System.out.println("넘어옴");
String cate = request.getParameter("cate");
String num = request.getParameter("num");
System.out.println(num);

BoardDTO dto = new BoardDTO();
BoardDAO dao = new BoardDAO();
dto = dao.selectView(num);

String sessionId = session.getAttribute("UserId").toString();
System.out.println("sessionId : " + sessionId);
System.out.println("dto.getId() : " + dto.getId());
int delResult = 0;

if(sessionId.equals(dto.getId())){ 
	dto.setNum(num);
	delResult = dao.deletePost(dto);
	// 연결 해제
	dao.close();
	
	if(delResult == 1){
		// 게시물 삭제에 성공하면 리스트로 이동한다.
		JSFunction.alertLocation("삭제되었습니다.", "board_list.jsp?cate="+cate, out);
	}else{
		JSFunction.alertBack("삭제에 실패하였습니다.", out);
	}
}else{ // 작성자 본인 아닐시 > 삭제할 수 없음.
	JSFunction.alertBack("본인만 삭제할 수 있습니다.", out);
	return;
}
%>