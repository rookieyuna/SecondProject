package utils;

import java.util.Map;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

//네이버 SMTP 서버를 통해 이메일을 전송해준다.
public class NaverSMTP
{
	private final Properties serverInfo; //서버 정보
	private final Authenticator auth; //인증 정보
	
	public NaverSMTP(){
		serverInfo = new Properties();
		serverInfo.put("mail.smtp.host", "smtp.naver.com");
		serverInfo.put("mail.smtp.port", "465");
		serverInfo.put("mail.smtp.starttls.enable", "true");
		serverInfo.put("mail.smtp.auth", "true");
		serverInfo.put("mail.smtp.debug", "");
		serverInfo.put("mail.smtp.", "true");
		serverInfo.put("mail.smtp.socketFactory.port", "465");
		serverInfo.put("mail.smtp.docketFactory.class", "javax.net.ssl.SSLSocketFactory");
		serverInfo.put("mail.smtp.socketFactory.fallback", "false");
		
		serverInfo.put("mail.smtp.ssl.enable", "true");
		serverInfo.put("mail.smtp.ssl.trust", "smtp.naver.com");
		
		//사용자 인증 정보
		auth = new Authenticator() {
			@Override
			protected PasswordAuthentication getPasswordAuthentication() {
				//네이버 아이디와 비밀번호
				return new PasswordAuthentication("secondpj", "kosmo99!");
			}
		};
	}
	
	//주어진 메일 내용을 네이버 SMTP 서버를 통해 전송
	public void emailSending(Map<String, String> mailInfo) throws MessagingException{
		//1. 세션 생성
		Session session = Session.getInstance(serverInfo, auth);
		session.setDebug(true);
		
		//2. 메시지 작성
		MimeMessage msg = new MimeMessage(session);
		msg.setFrom(new InternetAddress(mailInfo.get("from"))); //보내는 사람
		msg.addRecipient(Message.RecipientType.TO, new InternetAddress(mailInfo.get("to"))); //받는 사람
		msg.setSubject(mailInfo.get("subject")); //제목
		msg.setContent(mailInfo.get("content"), mailInfo.get("format")); //내용
		
		//3. 전송
		Transport.send(msg);
	}
}
