<!-- 
	author:hsz
	date:2013/7/2
 -->

<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="en">
        <script src="js/jquery1.83.js" > </script>
        <script src="js/bootstrap-transition.js"></script>
        <script src="js/bootstrap-modal.js"></script>
        <script src="js/bootstrap-button.js"></script>      
         <script src="js/modernizr-2.6.2-respond-1.1.0.min.js"></script>
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
  
  <%//session.setAttribute("planID","1");
  //should be set when start the plan or continue reviewing
     
  %>
  
  
  <form id="review" action="" method="post">
<div class="container-fluid">
  <div class="row-fluid">
    <div style="border:1px; background:#FFF" class="span12" >
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
    
  </div>
</div>
<center>
<input type="submit" value="ok, I'd like to apply for the approval from my manager " class="btn btn-info" >
</center>
  </form>
    
   </body>
   
   
  
</html>
