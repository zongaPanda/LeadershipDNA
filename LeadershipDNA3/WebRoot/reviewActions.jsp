<!-- 
	author:hsz
	date:2013/7/2
 -->

<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="po.CusActions" %>
<%@ page import="po.CusActionsDAO" %>
<%@ page import="po.ChosenActions" %>
<%@ page import="po.Plan" %>
<%@ page import="po.PlanDAO" %>
<%@ page import="po.ChosenActionsDAO" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="en">
        <script src="js/jquery1.83.js" > </script>
        <script src="js/bootstrap-transition.js"></script>
        <script src="js/bootstrap-modal.js"></script>
        <script src="js/bootstrap-button.js"></script>      
         <script src="js/modernizr-2.6.2-respond-1.1.0.min.js"></script>
		<link rel="stylesheet" type="text/css" href="css/bootstrap.css">
		<link rel="stylesheet" type="text/css" href="css/cikonss.css">

  


  <head> 
    <title>review actions</title>
    <script>
    var index=1;
    function more(){
    	index++;
    	$('.add').append('<tr id="'+index+'"><td>'+index+'</td><td><input type="text" name="content"></td><td><input type="text" name="link"></td><td><button class="btn btn-info" type="button" onClick="removeR('+index+')">delete</button></td></tr >');
    }
    function removeR(id){
    	$("#"+id).remove();
    	//$(this).parents("tr").remove();
    }
    </script>
  </head>
  
  <body >
  <%@ include file="staticTitle.jsp" %>
  
  <%//session.setAttribute("planID","2");
  	//String  pid = session.getAttribute("pid");
  //should be set when start the plan or continue reviewing
     String spid=(String)session.getAttribute("pid");
     Long pid=Long.parseLong(spid);
     PlanDAO pDao=new PlanDAO();
     ChosenActionsDAO chDao=new ChosenActionsDAO();
     Plan plan=pDao.findById(pid);
  %>
  
  
  <form id="review" action="addAction" method="post">
<div class="container-fluid">
  <div class="row-fluid">
    <div style="border:1px; background:#FFF" class="span6" >
    <h3>
				add new actions
			</h3>
      <table class="table table-striped">
        <thead>
          <tr>
            <th>
              index
            </th>
            <th>
              content
            </th>
            <th>
              links
            </th>
            <th>
              edit
            </th>
          </tr>
        </thead>
        <tbody class="add">
          <tr id="1">
            <td>
              1
            </td>
            <td>
              <input type="text" name="content">
            </td>
            <td>
              <input type="text" name="link">
            </td>
            <td>
              
              <button class="btn btn-info" type="button" onClick="removeR(1)">delete</button>
            </td>
            
          </tr >
          



       
        </tbody>
      </table>
      <button class="btn btn-info" type="button" onClick="more()">add more</button>
    </div>
    <div class="span6">
    <h3>
				select from custom actions
			</h3>
      <table class="table table-striped">
        <thead>
          <tr>
           
            <th>
              action ID
            </th>
            <th>
              content
            </th>
            <th>
              link
            </th>
           <th>
              exist
            </th>
            
          </tr>
        </thead>
        <tbody>
        <%
        CusActionsDAO cDao=new CusActionsDAO();
		List acts=cDao.findAll();
		Iterator it=acts.iterator();
		while(it.hasNext()){
			CusActions act=(CusActions)it.next(); %>
          <tr>
            
            <td>
              <%=act.getAid() %>
            </td>
            <td>
              <%=act.getContent() %>
            </td>
            <td>
            <%=act.getLink() %>
            </td>
            <td>
              <%
              System.out.println(act.getAid()+" isChosen: "+cDao.isChosen(act,plan));
              if(cDao.isChosen(act,plan)){
             %> 
              <input type="checkbox" name="cus" value="<%=act.getAid() %>" checked="checked">
              <%}
              else{%>
              <input type="checkbox" name="cus" value="<%=act.getAid() %>" >
              <%} %>
            </td>
            
          </tr>
          <%} %>
        </tbody>
      </table>
    </div>
  </div>
</div>
<center>
<input type="submit" value="ok, I want to go to the next step " class="btn btn-info" >
</center>
  </form>
    
   </body>
   
   
  
</html>
