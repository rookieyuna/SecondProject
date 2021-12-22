<%@page import="java.io.FileNotFoundException"%>
<%@page import="utils.JSFunction"%>
<%@page import="java.io.OutputStream"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
// 파일이 저장된 디렉토리의 물리적경로를 얻어온다.
String saveDirectory = application.getRealPath("/Uploads");
// 서버에 저장된 파일명과 원본파일명을 파라미터로 받아온다.
String saveFilename = request.getParameter("sFile");
String originalFilename = request.getParameter("oFile");


	try{
		// 물리적경로와 파일명을 통해 File객체 생성
		File file = new File(saveDirectory, saveFilename);
		// 파일의 내용을 읽어오기 위한 입력스트림 생성
		InputStream inStream = new FileInputStream(file);
		
		
		//사용자의 웹브라우저 종류를 알아내기 위해 요청헤더를 얻어온다.
		String client = request.getHeader("User-Agent");
		if(client.indexOf("WOW64") == -1 ){
			// 인터넷 익스플로러가 아닌경우 한글파일명 인코딩
			originalFilename = new String(originalFilename.getBytes("UTF-8"), "ISO-8859-1");
		}else{
			// 인터넷 익스플로러 일떄 한글파일명 인코딩
			originalFilename = new String(originalFilename.getBytes("KSC5601"), "ISO-8859-1");
		}
		/*
		 	위 처리를 통해 원본파일명이 한글인 경우 깨짐을 방지할 수 있다.
		 	getBytes() : String 객체를 byte형의 배열로 반환해준다.
		*/
		
		/*
			파일 다운로드를 위한 응답 헤더 설정
			1. 응답헤더 초기화
			2. 웹브라우저가 인식하지 못하는 컨텐츠 타입을 설정하여 다운로드 창을 강제로 띄우게 함.
			3. 파일명을 변경하기 위한 응답헤더를 설정하고 파일사이즈도 설정한다.
		*/
		response.reset();
		response.setContentType("application/octet-stream");
		response.setHeader("Content-Disposition", "attachment; filename=\"" + originalFilename + "\"");
		response.setHeader("Content-Length", "" + file.length());
		
		// 새로운 출력스트림을 생성하기 위해 초기화
		out.clear();
		// 새로운 출력스트림을 생성해서 파일을 내보낸다.
		OutputStream outStream = response.getOutputStream();
		
		byte b[] = new byte[(int)file.length()];
		int readBuffer = 0;
		while((readBuffer = inStream.read(b)) > 0){
			outStream.write(b, 0, readBuffer);
		}
		// 입출력 스트림을 닫아준다.(자원해제)
		inStream.close();
		outStream.close();
		
		
	}catch(FileNotFoundException e){
		JSFunction.alertBack("파일을 찾을 수 없습니다.", out);
	}catch(Exception e){
		JSFunction.alertBack("예외가 발생하였습니다.", out);
	}

%>
