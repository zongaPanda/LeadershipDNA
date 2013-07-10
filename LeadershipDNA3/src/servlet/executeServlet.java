package servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import po.Answers;
import po.AnswersDAO;
import po.ChosenActions;
import po.ChosenActionsDAO;
import po.CusActions;
import po.Plan;
import po.PlanDAO;
import po.Questions;
import po.QuestionsDAO;
import po.Remarks;
import po.RemarksDAO;

/**
 * Servlet implementation class executeServlet
 */
public class executeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public executeServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String myAid = request.getParameter("aid");
		long aid = Long.parseLong(myAid);
		String myPid = request.getParameter("pid");
		long pid = Long.parseLong(myPid);
		HttpSession session = request.getSession();
		String ifEnd = "OK";

		ChosenActionsDAO chodao = new ChosenActionsDAO();
		PlanDAO pladao = new PlanDAO();
		List list0 = pladao.findAll();
		List list = chodao.findAll();
		int thisAction = 0;

		for (int i = 0; i < list.size(); i++) {
			if (pid == ((ChosenActions) list.get(i)).getPid()) {
				thisAction++;
				if (aid == ((ChosenActions) list.get(i)).getCusActions()
						.getAid()) {
					chodao.updateFinish((ChosenActions) list.get(i));
				}
			}
		}
		
		int finished = 0;
		for(int i = 0; i < list.size(); i++){
			if (pid == ((ChosenActions) list.get(i)).getPid()) {
				if(((ChosenActions) list.get(i)).getFinished()){
					finished++;
				}
			}
		}
		
		if(finished == thisAction){
			for (int i = 0; i < list0.size(); i++) {
				if(pid == ((Plan)list0.get(i)).getPid()){
					pladao.updateFinish((Plan)list0.get(i));
				//	response.("<script>alert('asdasdasd');</script>");
					session.setAttribute("ifEnd", ifEnd);
				}
			}
		}
		
	//	System.out.println(list.size());
	//	System.out.println(thisAction);
		
		
		RemarksDAO remdao = new RemarksDAO();
		List list2 = remdao.findAll();
		
		for (int i = 0; i < list2.size(); i++) {
			if (pid == ((Remarks) list2.get(i)).getPlan().getPid()) {
				remdao.updateIsRead((Remarks) list2.get(i));
			}
		}

		response.sendRedirect("executePlan.jsp");
	}

}
