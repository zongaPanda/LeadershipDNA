package servlet;

import java.io.IOException;
import java.util.Date;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import po.ChosenActions;
import po.ChosenActionsDAO;
import po.Plan;
import po.PlanDAO;

public class agreePlan extends HttpServlet{
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException,IOException{
		doPost(request,response);
	}
	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException {
		
		//String action=request.getParameter("action");
		
		ChosenActionsDAO caDao=new ChosenActionsDAO();
		
		
		HttpSession hSession=request.getSession();
		String spid=(String)hSession.getAttribute("planID");
		Long pid=Long.parseLong(spid);
		  
		String []scid=request.getParameterValues("cid");
		String []sdate=request.getParameterValues("duedate");
		String []support=request.getParameterValues("support");
		//System.out.println("date.length "+sdate.length);
		if(scid!=null){
		  for(int i=0;i<scid.length;i++){
			try{
			Date date=null;	
			if(sdate[i]!="")	{
			  date=sdf.parse(sdate[i]);
			}
			  Long cid=Long.parseLong(scid[i]);
			  ChosenActions ca=caDao.findById(cid);
			  caDao.agree(date, support[i], ca);//agree on 2 things
			  
			}catch(Exception e){
				e.printStackTrace();
				continue;
			}
			
			
		  }
		}
		/*submit and confirm plan after which the actions could not be edited any more*/
		  
		  PlanDAO pDao=new PlanDAO();
		  Plan plan=pDao.findById(pid);
		//  System.out.println(plan.getIsConfirmed());
		  pDao.doConfirm(plan);
		  
		  
	}
}
