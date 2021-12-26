<%@page import="java.sql.Date"%>
<%@page import="utils.JSFunction"%>
<%@page import="board.BoardDAO"%>
<%@page import="board.BoardDTO"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.Calendar"%>
<%
String id = request.getParameter("id");
String title = request.getParameter("title");
String postdate = request.getParameter("postdate");
String content = request.getParameter("content");
String cate = request.getParameter("cate");

BoardDTO dto = new BoardDTO();

dto.setId(id);
dto.setTitle(title);
dto.setPostdate(postdate);
dto.setContent(content);
dto.setCategory(cate);

BoardDAO dao = new BoardDAO();

//DB 1개씩 동시 입력(본기능)
int iResult = dao.pinsertWrite(dto);

/* DB 여러개 동시 입력
int iResult = 0;
for(int i=1; i<=30; i++){
	dto.setTitle(title + "-" + i);
	iResult = dao.pinsertWrite(dto);
}
*/
dao.close();

if(iResult == 1) {
	//글쓰기에 성공했다면 목록페이지로 이동한다. 
	response.sendRedirect("ad_program.jsp?cate=" + cate);
}
else {
	//실패한 경우에는 글쓰기 페이지로 이동한다. 즉 뒤로 이동한다. 
	JSFunction.alertBack("글쓰기에 실패하였습니다.", out);
}

%>
