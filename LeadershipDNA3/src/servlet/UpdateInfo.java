package servlet;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class UpdateInfo
 */
public class UpdateInfo extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateInfo() {
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
		HttpSession session = request.getSession();
		String currentUser = (String)session.getAttribute("currentUser");
		String sex = request.getParameter("sex");
		String email = request.getParameter("email");
		String telephone = request.getParameter("telephone");
		String address = request.getParameter("address");
		String birthday = request.getParameter("birthday");
		String qq = request.getParameter("qq");
		String education = request.getParameter("education");
		//System.out.println("UpdateInfo.jsp, sex= " + sex);
		//System.out.println("UpdateInfo.jsp, email= " + email);
		//System.out.println("UpdateInfo.jsp, telephone= " + telephone);
		//System.out.println("UpdateInfo.jsp, address= " + address);
		//System.out.println("UpdateInfo.jsp, birthday= " + birthday);
		//System.out.println("UpdateInfo.jsp, qq= " + qq);
		System.out.println("UpdateInfo.jsp, education= " + education);
		//Date datee = null;
		//SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		/*try {
			datee = format.parse(birthday);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}*/
		// String date = new SimpleDateFormat("yyyy-MM-dd").format(datee);
		Date date = null;
		if(!birthday.equals("")){
			SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
			try {
				 date = format.parse(birthday);
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		boolean a = method.UpdateInfoMethod.updateinfo(currentUser, sex, email, telephone, address, date, qq, education);
		if(a){
			response.sendRedirect("dashboard.jsp");
		}else response.sendRedirect("updateInfoFailed.html");
		
	}

}
