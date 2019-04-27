package web.mail;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

/* 메일을 보내기 위한 mail-1.4.7 jar파일에는 javax.mail패키지가 있다.
 * 주요 클래스는 Session , Message , Authenticator , Transport등이있다.
 * 사용자 인증을 하기 위해서는 Authenticator클래스 사용이 필요하다.
 * 
 * 
 * */
public class MailAuth extends Authenticator{
	PasswordAuthentication pa;
	
	public MailAuth() {
		String mail_id="cyeongb";
		String mail_pw="chldud0211!";
		
		pa=new PasswordAuthentication(mail_id,mail_pw);
	}
	
	public PasswordAuthentication getPasswordAuthentication() {
		return pa;
	}

}
