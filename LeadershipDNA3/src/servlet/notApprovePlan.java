package servlet;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import po.ChosenActions;
import po.ChosenActionsDAO;
import po.CusActions;
import po.CusActionsDAO;
import po.Plan;
import po.PlanDAO;

public class notApprovePlan extends HttpServlet{
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException,IOException{
		doPost(request,response);
	}
	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException {
		ChosenActionsDAO caDao=new ChosenActionsDAO();
		CusActionsDAO cDao=new CusActionsDAO();
		HttpSession hSession=request.getSession();
		String spid=(String)hSession.getAttribute("planID");
		Long pid=Long.parseLong(spid);
		
		PlanDAO pDao=new PlanDAO();
		Plan plan=pDao.findById(pid);
        pDao.disConfirm(plan);
        
        /*update the support the manager want to add*/
        String []scid=request.getParameterValues("cid");
		
		String []support=request.getParameterValues("support");
		
		if(scid!=null){
		  for(int i=0;i<scid.length;i++){
			try{
		
			  Long cid=Long.parseLong(scid[i]);
			  ChosenActions ca=caDao.findById(cid);
			  caDao.updateSupport(support[i], ca);//update the support the manager could provide
			  
			}catch(Exception e){
				e.printStackTrace();
				continue;
			}
			
			
		  }
		}
		
		/*add some more actions the manager want to add*/
		String[] contents=request.getParameterValues("content");
		String []links=request.getParameterValues("link");
		String[] dates=request.getParameterValues("duedate2");
		String[] supports=request.getParameterValues("support2");
		if(contents!=null){
			 for(int i=0;i<contents.length;i++){
		    	 if(contents[i]==""&&links[i]==""){
		    		 continue;
		    	 }
		    	 else{
		    		 /*save to custom actions*/
		    		 CusActions cusA=new CusActions();
		    		 cusA.setContent(contents[i]);
		    		 cusA.setLink(links[i]);
		    		 cDao.save(cusA);
		    		 
		    		 /*save to chosen actions*/
		    		 ChosenActions choA=new ChosenActions();
		    		 choA.setPlan(plan);
		    		 choA.setFinished(false);
		    		 choA.setSupport(supports[i]);
		    		 try{
		    			 Date date=null;	
		    				if(dates[i]!="")	{
		    				  date=sdf.parse(dates[i]);
		    				  choA.setDueDate(date);
		    				}
		    		 }catch(Exception e){
		    			 e.printStackTrace();
		    			 continue;
		    		 }
		    		 choA.setCusActions(cusA);		    		 
		    		 caDao.save(choA);
		    	 }
		     }
		}
	}

}
