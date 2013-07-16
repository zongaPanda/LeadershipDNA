package servlet;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import po.Plan;
import po.PlanDAO;
import po.Remarks;
import po.RemarksDAO;

/**
 * Servlet implementation class executeServlet2
 */
public class executeServlet2 extends HttpServlet {
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String[] myContent = request.getParameterValues("content");

		HttpSession hSession = request.getSession();
		String spid = (String) hSession.getAttribute("pid");
		Long pid = Long.parseLong(spid);

		PlanDAO pDao = new PlanDAO();
		Plan plan = pDao.findById(pid);
		// pDao.doApprove(plan);

		if (myContent != null) {
			for (int i = 0; i < myContent.length; i++) {
				if (myContent[i] == "") {
					continue;
				} else {
					Date date = new Date();
					Remarks rem = new Remarks();
					rem.setContent(myContent[i]);
					rem.setIsRead(false);
					rem.setPlan(plan);
					rem.setRdate(date);

					RemarksDAO remdao = new RemarksDAO();
					remdao.save(rem);

				}
			}
		}
		
		response.sendRedirect("executePlan2.jsp");
		
		
		
	}

}
