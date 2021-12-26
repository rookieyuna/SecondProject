
<%@page import="board.BoardDAO"%>
<%@page import="board.BoardDTO"%>
<%@page import="java.io.File"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%

	String saveDirectory = application.getRealPath("/Uploads");
	int maxPostSize = 1024 * 1000;
	String encoding = "UTF-8";
	
	try{
		
		MultipartRequest mr = new MultipartRequest(request, saveDirectory, maxPostSize, encoding);
		
		String fileName = mr.getFilesystemName("attachedFile");

		String ext = fileName.substring(fileName.lastIndexOf("."));

		String now = new SimpleDateFormat("yyyyMMdd_HmsS").format(new Date());

		String newFileName = now + ext;
		
		File oldFile = new File(saveDirectory + File.separator + fileName);
		File newFile = new File(saveDirectory + File.separator + newFileName);
		oldFile.renameTo(newFile);
		
		String userid = session.getAttribute("UserId").toString();
		String title = mr.getParameter("title");
		String content = mr.getParameter("content");
		String cate = mr.getParameter("cate");
		String num = mr.getParameter("num");
		
		BoardDTO dto = new BoardDTO();
		
		dto.setId(userid);
		dto.setTitle(title);
		dto.setContent(content);
		dto.setCategory(cate);
		dto.setOfile(fileName);
		dto.setSfile(newFileName);
		dto.setNum(num);
		
		// DAO객체 생성 및 insert 처리
		BoardDAO dao = new BoardDAO();
		dao.insertFile(dto);
		//DB 여러개 동시 입력
		
		/*
		int iResult = 0;
		for(int i=1; i<=30; i++){
			dto.setTitle(title + "-" + i);
			iResult = dao.insertWrite(dto);
		}
		*/
		dao.close();
		
		
		// 문제가 없다면 파일리스트로 이동한다.
		if(cate.equals("photoB")) response.sendRedirect("ad_photo.jsp?cate=" + cate);
		if(cate.equals("infoB")) response.sendRedirect("ad_information.jsp?cate=" + cate);
		
	}catch(Exception e){
		e.printStackTrace();
		// 예외가 발생하면 request영역에 메시지를 저장한 후 메인으로 포워드한다.
		request.setAttribute("errorMessage", "파일 업로드 오류");
		request.getRequestDispatcher("ad_boardFileWrite.jsp").forward(request, response);
	}
%>