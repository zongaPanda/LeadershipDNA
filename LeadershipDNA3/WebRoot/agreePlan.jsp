<!-- 
	author:hsz
	date:2013/7/3
 -->

<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
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
        
		<link rel="stylesheet" type="text/css" href="css/bootstrap.css">
		

  


  <head> 
    <title>agree development plan</title>
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
  
<%
  ChosenActionsDAO cDao=new ChosenActionsDAO();
  PlanDAO pDao=new PlanDAO();
  
  session.setAttribute("planID","2");
  //should be set when start the plan or continue reviewing
  
  String spid=(String)session.getAttribute("planID");
  Long pid=Long.parseLong(spid);
  
  
  Plan plan=pDao.findById(pid);
  List cActions=cDao.findByPlan(plan);
  Iterator cit=cActions.iterator();
  
  int indx=0;
%>
  
  
  <form id="review" action="" method="post">
<div class="container-fluid">
  <div class="row-fluid">
    <div style="border:1px; background:#FFF" class="span12" >
    <h3>
				confirm the actions and agree the plan
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
              links
            </th>
            <th>
              dueDate
            </th>
            <th>
              support
            </th>
            <th>
              edit
            </th>
          </tr>
        </thead>
        <tbody class="add">
        <%while(cit.hasNext()){
        	ChosenActions ca=(ChosenActions)cit.next();
        	indx++;
        	%>
        
          <tr id=<%= indx%>>
            <td>
              <%=ca.getCusActions().getAid() %>
            </td>
            <td>
            <%=ca.getCusActions().getContent() %>
            </td>
            <th>
             <%=ca.getCusActions().getLink() %>
            </th>
            <td>
              <input type="text" name="duedate">
            </td>
            <td>
              <input type="text" name="support">
            </td>
            <td>
              
              <button class="btn btn-info" type="button" onClick="removeR(<%=indx%>)">delete</button>
            </td>
            
          </tr >
          <%
          }
          %>



       
        </tbody>
      </table>
      <button class="btn btn-info" type="button" onClick="more()">add more</button>
    </div>
    
  </div>
</div>
<center>
<input type="submit" value="ok, I'd like to apply for the approval from my manager " class="btn btn-info" >
</center>
  </form>
    
   </body>
   
   
  
</html>
