package web.mail;


import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.Properties;

import javax.mail.Address;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.catalina.connector.Request;


public class MailSend{
	public void MailSend(HttpServletRequest request, HttpServletResponse response) {
		
		try {
			request.setCharacterEncoding("utf-8");
			String from = request.getParameter("from");
			String to = "cyeongb@naver.com";
			String subject = request.getParameter("subject");
			String content = request.getParameter("content");
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			Properties prop=System.getProperties();
			prop.put("mail.smtp.starttls.enable","true");
			prop.put("mail.smtp.host", "smtp.naver.com");
			prop.put("mail.smtp.auth","true");
			prop.put("mail.smtp.port","587");
			
			Authenticator auth=new MailAuth();
			Session session=Session.getDefaultInstance(prop,auth);
			MimeMessage msg=new MimeMessage(session);			
			Address sender_address = new InternetAddress(from);
			Address receiver_address = new InternetAddress(to);
			msg.setHeader("content-type", "text/html;charset=UTF-8");
			msg.setFrom(sender_address);
			msg.addRecipient(Message.RecipientType.TO, receiver_address);
			msg.setSubject(subject);
			msg.setContent(content,"text/html;charset=UTF-8");
			msg.setSentDate(new java.util.Date());
			Transport.send(msg);
			System.out.println("메일이 전송되었습니다.");
		}catch(AddressException ae) {
			System.out.println("AddressException:"+ae.getMessage());
		}catch(MessagingException me) {
			System.out.println("MessagingException:"+me.getMessage());
		} catch (UnsupportedEncodingException e) {		
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}				
	}
}
