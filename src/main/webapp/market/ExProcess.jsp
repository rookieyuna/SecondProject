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
emailInfo.put("to", request.getParameter("to")); 				//받는 사람
emailInfo.put("subject", request.getParameter("subject")); 		//제목

String name = request.getParameter("name"); 					//고객명/회사명
String disabled = request.getParameter("disabled"); 			//장애유무
String typeOfDisability = request.getParameter("typeOfDisability"); //주요장애유형
String helpingTool = request.getParameter("helpingTool"); 		//보장구 사용 유무
String nameOfTool = request.getParameter("nameOfTool"); 		//보장구명
String cel = request.getParameter("cel1")+"-"+					//연락처
			request.getParameter("cel2")+"-"+request.getParameter("cel3"); 
String eCel = request.getParameter("eCel1")+"-"+				//담당자 휴대폰
			request.getParameter("eCel2")+"-"+request.getParameter("eCel3"); 
String email = request.getParameter("email1")+"@"+request.getParameter("email2"); //이메일
String exp_sel = request.getParameter("exp_sel"); 				//체험 내용
String date = request.getParameter("date"); 					//체험 희망 날짜
String type = request.getParameter("type"); 					//접수 종류
String others = request.getParameter("others"); 				//기타 사항



String htmlContent = ""; //HTML용으로 변환된 내용을 담을 변수
try{//getRealPath 사용시 반드시 컨텍스트 루트를 제외하고 입력
	String templatePath = application.getRealPath("/market/MailForm.html");
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

//out.print(htmlContent); //출력 테스트용

//메일 폼의 "__contents__" 부분을 메일 내용으로 대체(변환 완료)
htmlContent = htmlContent.replace("__name__", name);
htmlContent = htmlContent.replace("__disabled__", disabled);
htmlContent = htmlContent.replace("__typeOfDisability__", typeOfDisability);
htmlContent = htmlContent.replace("__helpingTool__", helpingTool);
htmlContent = htmlContent.replace("__nameOfTool__", nameOfTool);
htmlContent = htmlContent.replace("__cel__", cel);
htmlContent = htmlContent.replace("__eCel__", eCel);
htmlContent = htmlContent.replace("__email__", email);
htmlContent = htmlContent.replace("__exp_sel__", exp_sel);
htmlContent = htmlContent.replace("__date__", date);
htmlContent = htmlContent.replace("__type__", type);
htmlContent = htmlContent.replace("__others__", others);


//변환된 내용을 저장
emailInfo.put("content", htmlContent);
emailInfo.put("format", "text/html;charset=UTF-8");

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
