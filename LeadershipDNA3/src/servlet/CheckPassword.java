package servlet;
import method.*;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class CheckPassword extends HttpServlet{
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException,IOException{
		doPost(request,response);
	}
	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException {
		HttpSession session = request.getSession();
		String password=request.getParameter("password1");
		String registerUser = (String)session.getAttribute("registerUser");
		Long l = Long.parseLong(registerUser);
		if(method.CheckPasswordMethod.savepassword(registerUser, password)){
			session.setAttribute("currentUser", registerUser);
			response.sendRedirect("afterLogin.jsp");
		}
	}
}
