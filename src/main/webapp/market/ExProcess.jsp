<%@page import="utils.NaverSMTP"%>
<%@page import="java.io.FileReader"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//폼값(이메일 내용) 저장
Map<String, String> emailInfo = new HashMap<String, String>();
emailInfo.put("from", request.getParameter("from")); 			//보내는 사람
emailInfo.put("format", request.getParameter("format")); 		//메일 포멧(text 혹은 html)
emailInfo.put("to", request.getParameter("to")); 				//받는 사람
emailInfo.put("subject", request.getParameter("subject")); 		//제목
emailInfo.put("name", request.getParameter("name")); 			//고객명/회사명
emailInfo.put("disabled", request.getParameter("disabled")); 	//장애유무
emailInfo.put("typeOfDisability", request.getParameter("typeOfDisability")); //주요장애유형
emailInfo.put("helpingTool", request.getParameter("helpingTool")); //보장구 사용 유무
emailInfo.put("nameOfTool", request.getParameter("nameOfTool")); //보장구명
emailInfo.put("cel1", request.getParameter("cel1")); 			//연락처1
emailInfo.put("cel2", request.getParameter("cel2")); 			//연락처2
emailInfo.put("cel3", request.getParameter("cel3")); 			//연락처3
emailInfo.put("eCel1", request.getParameter("eCel1")); 			//담당자 휴대폰1
emailInfo.put("eCel2", request.getParameter("eCel2")); 			//담당자 휴대폰2
emailInfo.put("eCel3", request.getParameter("eCel3")); 			//담당자 휴대폰3
emailInfo.put("email1", request.getParameter("email1")); 		//이메일1
emailInfo.put("email2", request.getParameter("email2")); 		//이메일2
emailInfo.put("exp_sel", request.getParameter("exp_sel")); 		//체험 내용
emailInfo.put("date", request.getParameter("date")); 			//체험 희망 날짜
emailInfo.put("type", request.getParameter("type")); 			//접수 종류
emailInfo.put("others", request.getParameter("others")); 		//접수 종류

//내용은 메일 포멧에 따라 다르게 처리
/* String content = request.getParameter("content"); //내용 */
String format = request.getParameter("format"); //메일 포멧(text 혹은 html)
String content = emailInfo.toString();


if(format.equals("text")){
	//텍스트 포맷일 경우 그대로 저장
	emailInfo.put("content", content);
	emailInfo.put("format", "text/plain;charset=UTF-8");
}
else if(format.equals("html")){
	//HTML태그일 경우 HTML 형태로 변환하여 저장
	/* content = content.replace("\r\n", "<br>"); */
	
	String htmlContent = ""; //HTML용으로 변환된 내용을 담을 변수
	try{
		String templatePath = application.getRealPath("./MailForm.html");
		BufferedReader br = new BufferedReader(new FileReader(templatePath));
		
		//한 줄씩 읽어 htmlContent 변수에 저장
		String oneLine;
		while((oneLine = br.readLine()) != null){
			htmlContent += oneLine + "\n";
		}
		br.close();
	}
	catch(Exception e){
		e.printStackTrace();
	}
	
	//템플릿의 "__CONTENT__" 부분을 메일 내용으로 대체(변환 완료)
	htmlContent = htmlContent.replace("__CONTENT__", content);
	//변환된 내용을 저장
	emailInfo.put("content", htmlContent);
	emailInfo.put("format", "text/plain;charset=UTF-8");
}

try{
	NaverSMTP smtpServer = new NaverSMTP(); //메일 전송 클래스 생성
	smtpServer.emailSending(emailInfo); //전송
	out.print("이메일 전송 성공");
}
catch(Exception e){
	out.print("이메일 전송 실패");
	e.printStackTrace();
}
%>
