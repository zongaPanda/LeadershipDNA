package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import method.findRelationship;

import po.RatingDAO;

public class startPlan extends HttpServlet{
	RatingDAO ratingDao=new RatingDAO();
	findRelationship ship=new findRelationship();
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException,IOException{
		doPost(request,response);
	}
	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException {
		HttpSession session=request.getSession();
		String suid=(String)session.getAttribute("currentUser");
		long uid=Long.parseLong(suid);
		ratingDao.newRating(uid, uid);
		ratingDao.newRating(uid, ship.findManager(uid).getUid());
		System.out.println("in ser");
		String [] directs=request.getParameterValues("d");
		if(directs!=null){
		   for(int i=0;i<directs.length;i++){
			ratingDao.newRating(uid, Long.parseLong(directs[i]));
		   }
		}
		String [] others=request.getParameterValues("o");
		if(others!=null){
		  for(int i=0;i<others.length;i++){
			ratingDao.newRating(uid, Long.parseLong(others[i]));
		  }
		}
		
		response.sendRedirect("performRating.jsp");
	}
}
