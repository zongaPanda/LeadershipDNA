package servlet;

import java.io.IOException;
import method.*;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class StartAPlan extends HttpServlet{
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException,IOException{
		doPost(request,response);
	}
	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException {
		HttpSession session = request.getSession();
		String currentUser = (String)session.getAttribute("currentUser");
		if(StartAPlanMethod.startAPlan(currentUser)){
			response.sendRedirect("dashboard.jsp");
		}	
	}
}
