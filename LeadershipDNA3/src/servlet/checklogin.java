package servlet;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import method.*;

public class checklogin extends HttpServlet{
	
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException,IOException{
		doPost(request,response);
	}
	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException {
		String uid=request.getParameter("username");
		String psw=request.getParameter("password");
		checkloginMethod clm = new checkloginMethod();
		Long l = Long.parseLong(uid);
		HttpSession session = request.getSession();
		if(clm.checkNameAndPwd(l, psw)){
			session.setAttribute("login", true);
			session.setAttribute("currentUser", uid);
			response.sendRedirect("staticHead.jsp");
		}
		
		else{
			session.setAttribute("login", false);
			response.sendRedirect("login.jsp");
		}
		//response.sendRedirect("staticHead.jsp");
	}
	
}
