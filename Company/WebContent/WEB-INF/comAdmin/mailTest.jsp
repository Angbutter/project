<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="javax.mail.*,javax.mail.internet.*, java.util.Properties" %> 
<%@ page import="com.util.HangulConversion" %>   
<%	
	// 보내는 사람
	String smtpServer = "smtp.naver.com";
	int	   smtpPort   = 465;
	
	final String sendId="minkh1212";
	final String sendPass="qnpfr!2502";
	String sendEmailAddress= "minkh1212@naver.com";
	
	// 받는 사람
	String receiveEmailAddress = request.getParameter("email");
	String subject 			   = "요청하신 비밀번호";
	String content			   = "요청하신 비밀번호는 '"+request.getParameter("emp_pw")+"' 입니다.";

	Properties props = System.getProperties();
	props.put("mail.smtp.host", smtpServer);
	props.put("mail.smtp.port", smtpPort);
	props.put("mail.smtp.auth", true);
	props.put("mail.smtp.ssl.enable", true);
	props.put("mail.smtp.ssl.trust", smtpServer);
	
	Session session2 = Session.getDefaultInstance(props, new Authenticator(){
		protected PasswordAuthentication getPasswordAuthentication(){
			return new PasswordAuthentication(sendId, sendPass);
		}
	});
	session2.setDebug(true);
	Message mimeMessage = new MimeMessage(session2);
	mimeMessage.setFrom(new InternetAddress(sendEmailAddress));
	mimeMessage.setRecipient(Message.RecipientType.TO, new InternetAddress(receiveEmailAddress));
	mimeMessage.setSubject(subject);
	mimeMessage.setText(content);
	Transport.send(mimeMessage);
	
	response.sendRedirect("./sendSuccess.jsp");
%>
