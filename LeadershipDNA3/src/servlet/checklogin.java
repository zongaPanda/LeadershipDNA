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
		String name=request.getParameter("username");
		String psw=request.getParameter("password");
		checkloginMethod clm = new checkloginMethod();
		if(clm.checkNameAndPwd(name, psw)){
			response.sendRedirect("staticHead.jsp");
		}
		else{
			response.sendRedirect("loginfailed.html");
		}
		//response.sendRedirect("staticHead.jsp");
	}
	
}
