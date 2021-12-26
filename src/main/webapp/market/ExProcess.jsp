<%@page import="market.marketApplicationDAO"%>
<%@page import="market.marketApplicationDTO"%>
<%@page import="utils.NaverSMTP"%>
<%@page import="java.io.FileReader"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//폼값(이메일 내용) 가져오기
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
String exp_sel = null;
//체험 내용
	if((request.getParameter("exp_sel")).equals("bread")){
		exp_sel = "빵 만들기";
	}
	else if((request.getParameter("exp_sel")).equals("cookie")){
		exp_sel = "쿠키 만들기";
	}
	else if((request.getParameter("exp_sel")).equals("cake")){
		exp_sel = "케익 만들기";
	}
String date = request.getParameter("date"); 					//체험 희망 날짜
//접수 종류
	String type = null;
	if((request.getParameter("type")).equals("rsvn")){
		type = "예약 신청";
	}
	else if((request.getParameter("type")).equals("estm")){
		type = "견적 문의";
	}
String others = request.getParameter("others"); 				//기타 사항

//폼값 DTO 속성 저장
marketApplicationDTO dto = new marketApplicationDTO();
dto.setName(name);
dto.setEx_disabled(disabled);
dto.setEx_typeofdisability(typeOfDisability);
dto.setEx_helpingtool(helpingTool);
dto.setEx_nameoftool(nameOfTool);
dto.setPhone1(cel);
dto.setPhone2(eCel);
dto.setEmail(email);
dto.setEx_type(exp_sel);
dto.setDate(date);
dto.setSubmit_type(type);
dto.setOthers(others);

//DAO 객체에 저장
marketApplicationDAO dao = new marketApplicationDAO();
int iResult = dao.insertExp(dto); 
dao.close();

if (iResult == 1) {
	request.setAttribute("InsertSuccess", "데이터 입력 성공"); 
}


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


//제목, 발신/수신메일과 변환된 메일 내용을 저장
Map<String, String> emailInfo = new HashMap<String, String>();

emailInfo.put("subject", request.getParameter("subject")); 	//제목
emailInfo.put("to", request.getParameter("to")); 			//받는 사람
emailInfo.put("content", htmlContent);						//내용
emailInfo.put("format", "text/html;charset=UTF-8");
emailInfo.put("from", "secondpj@naver.com");				//보내는 사람

try{
	NaverSMTP smtpServer = new NaverSMTP(); //메일 전송 클래스 생성
	smtpServer.emailSending(emailInfo); //전송
	/* out.print("이메일 전송 성공"); */
	request.setAttribute("EmailSuccess", "이메일 전송 성공");
	request.getRequestDispatcher("sub05.jsp").forward(request, response);
}
catch(Exception e){
	out.print("이메일 전송 실패");
	e.printStackTrace();
}
%>
