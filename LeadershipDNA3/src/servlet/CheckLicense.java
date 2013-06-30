package servlet;
import method.*;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;


public class CheckLicense extends HttpServlet{
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException,IOException{
		doPost(request,response);
	}
	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException {
		HttpSession session = request.getSession();
		//session.invalidate();
		String inputLicense=request.getParameter("input_license");
		String registerUser = (String)session.getAttribute("registerUser");
		Long l = Long.parseLong(registerUser);
		System.out.println("进入CheckLicense");
		//HttpSession session = request.getSession();
		if(method.CheckLicenseMethod.check(registerUser, inputLicense)){
			//session.setAttribute("login", true);
			//session.setAttribute("currentUser", uid);
			System.out.println("您输入的license是一致的");
			response.sendRedirect("register3.jsp");
		}
		
		else{
			session.setAttribute("license", "notsame");
			System.out.println("您输入的license是不一致的");
			response.sendRedirect("register2.jsp");
		}
		//response.sendRedirect("staticHead.jsp");
	}
}
