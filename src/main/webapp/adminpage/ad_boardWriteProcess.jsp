<%@page import="fileupload.FileUtil"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.io.File"%>
<%@page import="utils.JSFunction"%>
<%@page import="board.BoardDTO"%>
<%@page import="board.BoardDAO"%>
<%@page import="membership.MemberDTO"%>
<%@page import="membership.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String cate = request.getParameter("cate");
String userid = session.getAttribute("UserId").toString();
String name = request.getParameter("name");
String email = request.getParameter("email");
String title = request.getParameter("title");
String content = request.getParameter("content");


BoardDTO dto = new BoardDTO();
dto.setId(userid);
dto.setName(name);
dto.setEmail(email);
dto.setTitle(title);
dto.setContent(content);
dto.setCategory(cate);

BoardDAO dao = new BoardDAO();

// DB 1개씩 동시 입력(본기능)
//int iResult = dao.insertWrite(dto);

//DB 여러개 동시 입력
int iResult = 0;
for(int i=1; i<=30; i++){
	dto.setTitle(title + "-" + i);
	iResult = dao.insertWrite(dto);
}


//자원해제
dao.close();

if(iResult == 1){
	// 글쓰기에 성공했다면 리스트(목록) 페이지로 이동한다.
	if(cate.equals("notB")) response.sendRedirect("ad_notice.jsp?cate=" + cate);
	if(cate.equals("freeB")) response.sendRedirect("ad_freeboard.jsp?cate=" + cate);
	
}else{
	// 실패한 경우 글쓰기 페이지로 이동한다. 즉 뒤로 이동한다.
	JSFunction.alertBack("글쓰기에 실패하였습니다.", out);
}
%>
