<%@page import="java.io.File"%>
<%@page import="utils.JSFunction"%>
<%@page import="board.BoardDAO"%>
<%@page import="board.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
String cate = request.getParameter("cate");
String num = request.getParameter("num");

BoardDTO dto = new BoardDTO();
BoardDAO dao = new BoardDAO();
dto = dao.selectView(num);

String sessionId = session.getAttribute("UserId").toString();

String saveDirectory = application.getRealPath("/Uploads");
String sFile = dto.getSfile();
File delFile = new File(saveDirectory + sFile);
delFile.delete();


int delResult = 0;

if(sessionId.equals(dto.getId())){ 
	dto.setNum(num);
	delResult = dao.deletePost(dto);
	// 연결 해제
	dao.close();
	
	if(delResult == 1){
		// 게시물 삭제에 성공하면 리스트로 이동한다.
		if(cate.equals("notB")) JSFunction.alertLocation("삭제되었습니다.", "ad_notice.jsp?cate="+cate, out);
		if(cate.equals("proB")) JSFunction.alertLocation("삭제되었습니다.", "ad_program.jsp?cate="+cate, out);
		if(cate.equals("freeB")) JSFunction.alertLocation("삭제되었습니다.", "ad_freeboard.jsp?cate="+cate, out);
		if(cate.equals("photoB")) JSFunction.alertLocation("삭제되었습니다.", "ad_photo.jsp?cate="+cate, out);
		if(cate.equals("infoB")) JSFunction.alertLocation("삭제되었습니다.", "ad_information.jsp?cate="+cate, out);
		if(cate.equals("stafB")) JSFunction.alertLocation("삭제되었습니다.", "ad_staff.do?cate="+cate, out);
		if(cate.equals("guardB")) JSFunction.alertLocation("삭제되었습니다.", "ad_staff.do?cate="+cate, out);
		
	}else{
		JSFunction.alertBack("삭제에 실패하였습니다.", out);
	}
}else{ // 작성자 본인 아닐시 > 삭제할 수 없음.
	JSFunction.alertBack("본인만 삭제할 수 있습니다.", out);
	return;
}
%>