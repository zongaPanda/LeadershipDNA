package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class GetBackPassword extends HttpServlet{
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException,IOException{
		doPost(request,response);
	}
	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException {
		HttpSession session = request.getSession();
		String job_number = request.getParameter("job_number");
		String name = request.getParameter("name");
		//System.out.println(job_number+name);
		boolean a = method.GetBackPasswordMethod.getBackPasswordMethod(job_number, name);
		if(a){
			response.sendRedirect("login.jsp");
		}
		else response.sendRedirect("getBackPasswordFailed.html");
	}
}
