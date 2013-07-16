<!-- 
	author:cyx
	date:2013/6/9
 -->
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="en">
        <script src="js/jquery1.83.js" > </script>
        <script src="js/bootstrap-transition.js"></script>
        <script src="js/bootstrap-modal.js"></script>
        <script src="js/bootstrap-button.js"></script>
		<link rel="stylesheet" type="text/css" href="css/bootstrap.css">
		
<style type="text/css">

      .form-signin {
        max-width: 400px;
        
        padding: 19px 29px 29px;
        margin: 20px auto 20px;
        background-color: #fff;
        border: 1px solid #e5e5e5;
        -webkit-border-radius: 5px;
           -moz-border-radius: 5px;
                border-radius: 5px;
        -webkit-box-shadow: 0 1px 2px rgba(0,0,0,.05);
           -moz-box-shadow: 0 1px 2px rgba(0,0,0,.05);
                box-shadow: 0 1px 2px rgba(0,0,0,.05);
      }
      .form-signin .form-signin-heading,
      .form-signin .checkbox {
        margin-bottom: 10px;
      }
      .form-signin input[type="text"],
      .form-signin input[type="password"] {
        font-size: 16px;
        height: auto;
        margin-bottom: 15px;
        padding: 7px 9px;
      }
      a:HOVER {
		text-decoration: none;
	  }

    </style>
    
    <script>
    $(document).ready(function(){$('#myModal2').modal('hidden');});
    
    window.onload=function(){
    	var btn = document.getElementById("btn1");
    	btn.onclick = function(){
    		var b = document.getElementById('b').value;
    		var a = document.getElementById('a').value;
    		if(a.length<1&&b.length<1)
    			{
    			//alert("请填写用户名和密码");	
    			$('#cautionContent').html('please enter your username and password');
    			$('#myModal').modal('show');
    			return false;
    			}
    		if(a.length<1&&b.length>0)
    			{
    			$('#cautionContent').html('please enter your username');
    			$('#myModal').modal('show');
    			//alert("请填写用户名");		
    			return false;
    			}
    		if(a.length>0&&b.length<1)
    			{
    			$('#cautionContent').html('please enter your password');
    			$('#myModal').modal('show');
    			//alert("请填写密码");		
    			return false;
    			}
    		document.getElementById("form1").submit();
    	}
    }
    
    function modal(){
    	$('#myModal').modal('show');
    }
</script>
  


  <head> 
    <title>Leadership DNA</title>
    <link rel="shortcut icon" href="img/sc.ico" />
  </head>
  
  <body >
  
  	<%@ include file="staticTitle.jsp" %>
  

  
    <div  class="container" style="height:768px;width:1366px;padding-top: 0px;background-color: white;float: none;">
    	<div style="text-align: center;">
    		<h1>Leadership Development Need & Actions</h1>
    	</div>
      	 <form id="form1" class="form-signin" action="./CheckLogin" method="post">
        	<h2 class="form-signin-heading" style="text-align: center;">User</h2>
        	<input id="a" name="username" type="text" class="input-block-level" placeholder="your PWID ( digit only )" onkeyup="value=value.replace(/[^\d]/g,'') " onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))" >
        	<input id="b" name="password" type="password" class="input-block-level" placeholder="password" onkeyup="value=value.replace(/[\W]/g,'') " onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))">
     		<div>
      			<a href="getBackPwd.jsp" style="margin-bottom: 10px;">get back password</a>
     		</div>
     		<div>
      			<a href="AdminLogin.jsp" style="margin-bottom: 10px;">Administrator</a>
     		</div>
     		<div style="margin-top: 10px;">
     			<button id="btn1" class="btn btn-large btn-primary" type="button"   onclick="modal(this)" style="margin-left: 50px;">Log In</button>
     			<button id="btn2" class="btn btn-large btn-primary" type="button"   onclick="window.location.href='register.jsp'" style="float: right;margin-right: 50px;">Register</button>
     		</div>
      	</form>
   	</div>
   	
   	  	  <div id="myModal" class="modal hide fade">
  			<div class="modal-header">
    			<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
    			<h3 style="color: red;">ERROR!</h3>
  			</div>
  			<div class="modal-body">
    			<p style="font-size: 20px;" id="cautionContent">One fine body…</p>
 			</div>
  			<div class="modal-footer">
    			<a class="btn" data-dismiss="modal" aria-hidden="true">close</a>
   				<!-- <a href="#" class="btn btn-primary">Save changes</a> -->
  			</div>
		</div>
   </body>
   
   <div id="myModal2" class="modal hide fade">
  			<div class="modal-header">
    			<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
    			<h3 style="color: red;">ERROR!</h3>
  			</div>
  			<div class="modal-body">
    			<p style="font-size: 20px;" id="cautionContent">Wrong Username or Password</p>
 			</div>
  			<div class="modal-footer">
    			<a class="btn" data-dismiss="modal" aria-hidden="true" aria-hidden="true">close</a>
   				<!-- <a href="#" class="btn btn-primary">Save changes</a> -->
  			</div>
		</div>
		
		<%
    Boolean login = (Boolean)session.getAttribute("login");
		if(login!=null){
    if(!login){
      %>
        <script type="text/javascript">
          $("#myModal2").modal('show');
        </script>
      <%
    }
    session.removeAttribute("login");
		}
  %>
	
  
</html>
