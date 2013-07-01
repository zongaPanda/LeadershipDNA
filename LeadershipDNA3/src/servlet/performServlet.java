package servlet;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.hibernate.Session;
import org.hibernate.Transaction;

import po.Answers;
import po.Questions;
import test.getQuestion;
import test.saveAnswers;
import SessionFactory.HibernateSessionFactory;

/**
 * Servlet implementation class performServlet
 */
public class performServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List list= getQuestion.ret();
		
		for(int i = 0; i < list.size(); i++ ){
			String myAnswer = request.getParameter("que_"+i);
			String myComment = request.getParameter("comm_"+i );
			System.out.println( myAnswer);
			System.out.println( myComment);
			
			Answers ans = new Answers();
			Questions que = new Questions();
			que.setQid(i+1);
			ans.setComment(myComment);
			ans.setQuestions(que);
			ans.setAnswer(myAnswer);
			saveAnswers sa = new saveAnswers();
			sa.saveAAA(ans);
		}
	/*	String getQues = request.getParameter("action");
		if(getQues != null)
		{
			if(getQues.equals("getgetQuestion"))
				List list= test.getQuestion.ret();
		}
		*/
		
	
//		checkloginMethod clm = new checkloginMethod();
//		if(clm.checkNameAndPwd(name, psw)){
//			response.sendRedirect("success.jsp");
//		}
//		else{
//			response.sendRedirect("fail.html");
//		}
	
	}

}
