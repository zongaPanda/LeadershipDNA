package servlet;
import java.io.*;
import java.sql.*;
import java.util.*;
import java.util.Date;
import javax.activation.*;
import javax.mail.*;
import javax.mail.Message.*;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.*;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import method.*;

public class MailSender extends HttpServlet{
	public static final String mailAddress="168chengyuxing@sina.com";
	public static final String mailCount="168chengyuxing";
	public static final String mailPassword="2156616611";
	public static final String mailServer="smtp.sina.com";
	
	public static boolean send(String str_from,String str_to,String str_title,String str_content){
		try{//建立邮件会话
			Properties props = new Properties();
			props.put("mail.smtp.host",mailServer);
			props.put("mail.smtp.auth","true");
			Session s = Session.getInstance(props);
			s.setDebug(true);
			
			MimeMessage message = new MimeMessage(s);
			
			InternetAddress from = new InternetAddress(str_from);
			message.setFrom(from);
			
			InternetAddress to  = new InternetAddress(str_to);
			message.setRecipient(Message.RecipientType.TO,to );
			
			message.setSubject(str_title);
			
			message.setText(str_content);
			//message.setContent(str_content,"text/html;charset=utf8");
			message.setSentDate(new Date());
			
			Transport transport = s.getTransport("smtp");
			transport.connect(mailServer,mailCount,mailPassword);
			transport.sendMessage(message,message.getAllRecipients());
			transport.close();
			return true;
			
			
		}catch(Exception e){
			e.printStackTrace();
			return false;
		}	
	}
	
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException,IOException{
		doPost(request,response);
	}
	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
				
				//HttpSession.invalidate();
				String job_number = request.getParameter("jn");
				System.out.println("job number is : "+job_number);
				String name =request.getParameter("n");
				String email_address = request.getParameter("ea");
				HttpSession session = request.getSession();
				String currentUser = (String)session.getAttribute("currentUser");
				System.out.println("the current user's id is "+currentUser);
				int msm = MailSenderMethod.mailCheck(job_number,name,email_address);
				if(msm==0){
					session.setAttribute("registerUser", job_number);
					response.sendRedirect("register2.jsp");
				}else if(msm==1){
					System.out.println("错误类型："+msm);
					response.sendRedirect("registerfailed.jsp?msm=1");
				}else if(msm==2){
					System.out.println("错误类型："+msm);
					response.sendRedirect("registerfailed.jsp?msm=2");
				}else if(msm==3){
					session.setAttribute("registerUser", job_number);
					response.sendRedirect("register2.jsp");
				}else if(msm==4){
					System.out.println("错误类型："+msm);
					response.sendRedirect("registerfailed.jsp?msm=4");
				}
				//send(a,b,c,d);
				//response.sendRedirect("register2.jsp");	
			}
	
}
