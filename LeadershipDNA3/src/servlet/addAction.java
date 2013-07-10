package servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javassist.bytecode.Descriptor.Iterator;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import po.CusActions;
import po.CusActionsDAO;
import po.Plan;
import po.PlanDAO;
import po.ChosenActions;
import po.ChosenActionsDAO;

public class addAction extends HttpServlet{
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException,IOException{
		doPost(request,response);
	}
	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException {
		CusActionsDAO cDao=new CusActionsDAO();
		PlanDAO pDao=new PlanDAO();
		ChosenActionsDAO caDao=new ChosenActionsDAO();
		
		HttpSession hSession=request.getSession(); 
		String spid=(String)hSession.getAttribute("planID");
		Long pid=Long.parseLong(spid);
		Plan myPlan=pDao.findById(pid);
		
			
	     String []contents=request.getParameterValues("content");
	     String []links=request.getParameterValues("link");
	     
	/*     List choAs =caDao.findByPlan(myPlan);
	     java.util.Iterator dit=choAs.iterator();
	     while(dit.hasNext()){
	    	 caDao.delete((ChosenActions)dit.next());
	     }*/
	     List chosens=caDao.findByPlan(myPlan);
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
	    		 choA.setPlan(myPlan);
	    		 choA.setFinished(false);
	    		 
	    		 choA.setCusActions(cusA);
	    		 //choA.setPid();
	    		 caDao.save(choA);
	    		 ChosenActions pchoA=caDao.findFromChos(chosens, cusA);
	    		 chosens.remove(pchoA);
	    		 
	    	 }
	     }
	     
	     
	     String []cus=request.getParameterValues("cus");
	     if(cus!=null){
	       for(int i=0;i<cus.length;i++){
	    	 CusActions cusA=cDao.findById(Long.parseLong(cus[i]));
	    	 
	    	 /*find something chosen before is unchecked this time*/
	    	    if(cDao.isChosen(cusA, myPlan)){
	    	    	//
	    	    	ChosenActions ch=caDao.findFromChos(chosens, cusA);
	    	    	chosens.remove(ch);
	    	    	
	    	    	
	    	    	continue;
	    	    }
	    	   
	    	    /*if something hasn't been chosen is checked, save it to chosen actions*/
	    	 
    		    ChosenActions choA=new ChosenActions();
    		 
    		    choA.setPlan(myPlan);
    		 
    		   choA.setFinished(false);
    		   choA.setCusActions(cusA);
    		   caDao.save(choA);
	    	 
	      }
	       /*if something chosen before is unchecked this time, delete it*/
	       if(!chosens.isEmpty()){
	    	   @SuppressWarnings("rawtypes")
			java.util.Iterator it=chosens.iterator();
	    	   while(it.hasNext()){
	    		   caDao.delete((ChosenActions)it.next());
	    	   }
	    	   
	       }
	     }
	     response.sendRedirect("agreePlan.jsp");
	}
}
