<%@page import="utils.JSFunction"%>
<%@page import="board.BoardDTO"%>
<%@page import="board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String[] bd_no = request.getParameterValues("chk");
	String cate = request.getParameter("cate");
	
	BoardDAO dao = new BoardDAO();
	int res = dao.deletePost(bd_no);
	dao.close();
	
	if(res == bd_no.length){
		// 게시물 삭제에 성공하면 리스트로 이동한다.
		if(cate.equals("notB")) JSFunction.alertLocation("모두 삭제되었습니다.", "ad_notice.jsp?cate="+cate, out);
		if(cate.equals("freeB")) JSFunction.alertLocation("모두 삭제되었습니다.", "ad_freeboard.jsp?cate="+cate, out);
		if(cate.equals("photoB")) JSFunction.alertLocation("모두 삭제되었습니다.", "ad_photo.jsp?cate="+cate, out);
		if(cate.equals("infoB")) JSFunction.alertLocation("모두 삭제되었습니다.", "ad_information.jsp?cate="+cate, out);
		if(cate.equals("stafB")) JSFunction.alertLocation("모두 삭제되었습니다.", "ad_staff.do?cate="+cate, out);
		if(cate.equals("guardB")) JSFunction.alertLocation("모두 삭제되었습니다.", "ad_staff.do?cate="+cate, out);
		
	}else{
		JSFunction.alertBack("삭제에 실패하였습니다.", out);
	}
	
%>