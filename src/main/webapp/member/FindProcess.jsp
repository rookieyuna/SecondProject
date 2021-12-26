<%@page import="java.util.HashMap"%>
<%@page import="utils.NaverSMTP"%>
<%@page import="java.io.FileReader"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.util.Map"%>
<%@page import="utils.JSFunction"%>
<%@page import="membership.MemberDTO"%>
<%@page import="membership.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//아이디/비번찾기 폼에서 사용자가 입력한 아이디, 이름 받기
String userId = request.getParameter("user_id");
String userName = request.getParameter("user_name");
String userEmail = request.getParameter("user_email");

//데이터베이스 연결
MemberDAO dao = new MemberDAO();
//받아온 이름을 매개변수로 getMemberDTO()호출. 아이디찾기
MemberDTO memberDTO = dao.findMemberDTO(userId, userName, userEmail);
//자원반납
dao.close();

if(memberDTO.getId() != null){
	if(userId==null){
		//1. 이름&이메일로 아이디 찾기
		JSFunction.alertLocation("아이디: "+ memberDTO.getId(), "login.jsp", out);
	}
	else{
		//2. 아이디&이름으로 비번 찾기 (이메일발송API사용)
		
		Map<String, String> emailInfo = new HashMap<String, String>();
		emailInfo.put("from", "secondpj@naver.com"); 
		emailInfo.put("to", request.getParameter("user_email")); 
		emailInfo.put("subject", "회원님 비밀번호 발송드립니다.");  
		
		String content = memberDTO.getPass(); //반환된 비밀번호 저장
		String format = "html";    
		
		String htmlContent = "";  
		try {
		
		    String templatePath = application.getRealPath("/member/MailForm.html");
		    BufferedReader br = new BufferedReader(new FileReader(templatePath));
		     
		    String oneLine;
		    while ((oneLine = br.readLine()) != null) {
		        htmlContent += oneLine + "\n";
		    }
		    br.close();
		}
		catch (Exception e) {
		    e.printStackTrace();
		}
		
		htmlContent = htmlContent.replace("__CONTENT__", content);
		
		emailInfo.put("content", htmlContent);
		emailInfo.put("format", "text/html;charset=UTF-8");
		
		try {
		    NaverSMTP smtpServer = new NaverSMTP(); 
		    smtpServer.emailSending(emailInfo);  
		    out.print("이메일 전송 성공");
		}
		catch (Exception e) {
		    out.print("이메일 전송 실패");
		    e.printStackTrace();
		}
		
		JSFunction.alertLocation("비밀번호가 메일로 발송되었습니다", "login.jsp", out);
		//JSFunction.alertLocation("비밀번호: "+ memberDTO.getPass(), "login.jsp", out);
	}
}
else {
	//찾기에 실패한 경우
	JSFunction.alertBack("정보를 찾을 수 없습니다", out);
}
%>
