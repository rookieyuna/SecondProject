<%@page import="utils.JSFunction"%>
<%@page import="board.BoardDTO"%>
<%@page import="board.BoardDAO"%>
<%@page import="membership.MemberDTO"%>
<%@page import="membership.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String id = request.getParameter("id");
String title = request.getParameter("title");
String content = request.getParameter("content");
String pass = request.getParameter("pass");


BoardDTO dto = new BoardDTO();
dto.setId(id);
dto.setPass(pass);
dto.setTitle(title);
dto.setContent(content);

BoardDAO dao = new BoardDAO();

// DB 1개씩 동시 입력(본기능)
int iResult = dao.insertWrite(dto);
/* DB 여러개 동시 입력
int iResult = 0;
for(int i=1; i<=30; i++){
	dto.setTitle(title + "-" + i);
	iResult = dao.insertWrite(dto);
}
*/
// 자원해제
dao.close();

if(iResult == 1){
	// 글쓰기에 성공했다면 리스트(목록) 페이지로 이동한다.
	response.sendRedirect("ad_notice.jsp");
}else{
	// 실패한 경우 글쓰기 페이지로 이동한다. 즉 뒤로 이동한다.
	JSFunction.alertBack("글쓰기에 실패하였습니다.", out);
}
%>