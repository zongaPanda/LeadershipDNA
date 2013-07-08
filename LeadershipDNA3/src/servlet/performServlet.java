package servlet;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.hibernate.Session;
import org.hibernate.Transaction;
import java.util.Iterator;
import po.Answers;
import po.AnswersDAO;
import po.Questions;
import po.QuestionsDAO;

import SessionFactory.HibernateSessionFactory;

/**
 * Servlet implementation class performServlet
 */
public class performServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		QuestionsDAO quedao = new QuestionsDAO();
		List list0 = quedao.findAll();
		int []qid = new int[1000];

        for(int i = 0 ; i < list0.size() ; i++ ){
		   qid[i] = ((Questions)list0.get(i)).getQid();
		}

		List list = AnswersDAO.ret();
		for(int i = 0; i < list.size(); i++ ){
				String myAnswer = request.getParameter("que_" + i);
				String myComment = request.getParameter("comm_" + i);
				System.out.println(myAnswer);
				System.out.println(myComment);

				Answers ans = new Answers();
				Questions que = new Questions();
				que.setQid(qid[i]);
				ans.setComment(myComment);
				ans.setQuestions(que);
				ans.setAnswer(myAnswer);
				AnswersDAO sa = new AnswersDAO();
				sa.save(ans);
			}
	
		/*
		 * String getQues = request.getParameter("action"); if(getQues != null)
		 * { if(getQues.equals("getgetQuestion")) List list=
		 * test.getQuestion.ret(); }
		 */

		// checkloginMethod clm = new checkloginMethod();
		// if(clm.checkNameAndPwd(name, psw)){
		// response.sendRedirect("success.jsp");
		// }
		// else{
		// response.sendRedirect("fail.html");
		// }

	}

}
