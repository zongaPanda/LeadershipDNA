package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import method.AdminCheckLoginMethod;
import method.checkloginMethod;

/**
 * Servlet implementation class AdminCheckLogin
 */
public class AdminCheckLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminCheckLogin() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String uid = request.getParameter("username");
		String psw = request.getParameter("password");
		HttpSession session = request.getSession();
		boolean a = AdminCheckLoginMethod.adminchecklogin(uid, psw);
		if (a) {
			session.setAttribute("Adminlogin", true);
			session.setAttribute("currentAdmin", uid);
			response.sendRedirect("admin.jsp");
		}

		else {
			session.setAttribute("Adminlogin", false);
			response.sendRedirect("AdminLogin.jsp");
		}
		// response.sendRedirect("staticHead.jsp");
	}

}
