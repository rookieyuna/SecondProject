<%@page import="market.marketApplicationDTO"%>
<%@page import="market.marketApplicationDAO"%>

<%@page import="utils.NaverSMTP"%>
<%@page import="java.io.FileReader"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String name = request.getParameter("name");
String address = request.getParameter("zip1");
String phone1 = request.getParameter("cel1")+request.getParameter("cel2") + request.getParameter("cel3") ;
String phone2 = request.getParameter("eCel1") + request.getParameter("eCel2") + request.getParameter("eCel3");
String email =  request.getParameter("email1") + request.getParameter("email2");
String date = request.getParameter("date");
//접수 종류
	String submit_type = null;
	if((request.getParameter("type")).equals("rsvn")){
		submit_type = "예약 신청";
	}
	else if((request.getParameter("type")).equals("estm")){
		submit_type = "견적 문의";
	}
String clean_type = request.getParameter("clean_type");
String clean_area = request.getParameter("area");
String others = request.getParameter("others");


marketApplicationDTO dto = new marketApplicationDTO();
dto.setName(name);
dto.setAddress(address);
dto.setPhone1(phone1);
dto.setPhone2(phone2);
dto.setEmail(email);
dto.setDate(date); 
dto.setSubmit_type(submit_type);
dto.setClean_type(clean_type);
dto.setClean_area(clean_area);
dto.setOthers(others);

marketApplicationDAO dao = new marketApplicationDAO();
 
int iResult = dao.insertClean(dto); 
dao.close();

if (iResult == 1) {
	request.setAttribute("InsertSuccess", "데이터 입력 성공"); 
}


//폼값(이메일 내용) 저장
Map<String, String> emailInfo = new HashMap<String, String>();
emailInfo.put("from", request.getParameter("from")); 			//보내는 사람
emailInfo.put("to", request.getParameter("to")); 				//받는 사람
emailInfo.put("subject", request.getParameter("subject")); 		//제목

String htmlContent = ""; //HTML용으로 변환된 내용을 담을 변수
try {
	String templatePath = application.getRealPath("/market/MailForm2.html");
	BufferedReader br = new BufferedReader(new FileReader(templatePath));

	//한 줄씩 읽어 htmlContent 변수에 저장
	String oneLine;
	while ((oneLine = br.readLine()) != null) {
		htmlContent += oneLine + "\n";
	}
	br.close();
} catch (Exception e) {
	e.printStackTrace();
}

//템플릿의 "__CONTENT__" 부분을 메일 내용으로 대체(변환 완료)
htmlContent = htmlContent.replace("__name__", name);
htmlContent = htmlContent.replace("__addr__", address);
htmlContent = htmlContent.replace("__cel__", phone1); 
htmlContent = htmlContent.replace("__eCel__", phone2);
htmlContent = htmlContent.replace("__email__", email);
htmlContent = htmlContent.replace("__clean_type__", clean_type);
htmlContent = htmlContent.replace("__clean_area__", clean_area);
htmlContent = htmlContent.replace("__date__", date);
htmlContent = htmlContent.replace("__type__", submit_type);
htmlContent = htmlContent.replace("__others__", others);





//변환된 내용을 저장
emailInfo.put("content", htmlContent);
emailInfo.put("format", "text/html;charset=UTF-8");

try {
	NaverSMTP smtpServer = new NaverSMTP(); //메일 전송 클래스 생성
	smtpServer.emailSending(emailInfo); //전송
	/* out.print("이메일 전송 성공");  */
	request.setAttribute("EmailSuccess", "이메일 전송 성공");
	request.getRequestDispatcher("sub03.jsp").forward(request, response);

} catch (Exception e) {
	out.print("이메일 전송 실패");
	e.printStackTrace();
}
%>

