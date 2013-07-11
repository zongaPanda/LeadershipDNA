<!-- 
	author:cyx
	date:2013/6/10
 -->
<%@ page language="java" contentType="text/html; charset=utf8"
    pageEncoding="utf8"%>
<%@ page import="servlet.MailSender" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
		
<html>
		<script src="js/jquery1.83.js" > </script>
        <script src="js/bootstrap-transition.js"></script>
        <script src="js/bootstrap-modal.js"></script>
        <script src="js/bootstrap-button.js"></script>
        <script src="js/messenger.min.js"></script>
        <link rel="stylesheet" type="text/css" href="css/messenger.css">
        <link rel="stylesheet" type="text/css" href="css/messenger-theme-future.css">
		<link rel="stylesheet" type="text/css" href="css/bootstrap.css">
		<style type="text/css">
			a:LINK{
				text-decoration: none;
				color:green;
			}
			a:hover{
				text-decoration: none;
				color:blue;
			}
		</style>
		<script type="text/javascript">
			//window.onload(function(){$('#rightDIV2').hide();}	);
			$(document).ready(function(){$('#rightDIV').hide();$('#rightDIV2').hide();$("#myModal").modal('hide');$('#flow2').css('color','black');$('#flow3').css("color","#CB1B1E");});
		
			function hiden(e){
				$('#rightDIV').hide(500);
				$('#rightDIV2').show(500);	
				$('#flow1').css('color','black');
				$('#flow2').css("color","#CB1B1E");
				
				}
			
			function hiden2(e){
				var inputLicense = $("#input_license");
				if(inputLicense.val()==''){
					$("#myModal").modal('show');
					return false;
				}
				
				$('#rightDIV2').hide(500);
				$('#rightDIV3').show(500);	
				$('#flow2').css('color','black');
				$('#flow3').css("color","#CB1B1E");	
				
				document.getElementById("LicenseForm").submit();
			}
			
			function hiden3(e){
				var password1 = $("#password1");
				var password2 = $("#password2");
				
				if(password1.val()==''){
					$("#cautionContent").html("not completed");
					$("#myModal").modal('show');
					return false;
				}else if(password1.val()!=password2.val()){
					$("#cautionContent").html("validate password is not the same with password");
					$("#myModal").modal('show');
					return false;
				}
				$('#PasswordForm').submit();
			}
			
			function keypress(e){
				var password1 = $("#password1");
				var password2 = $("#password2");
				if(password1.val()==''){
					//$("#myModal").modal('show');
					$("#password2").val('');
				}else{
					var regu = "^[A-Za-z0-9]+$";
					var re = new RegExp(regu); 
					if (password2.search(re) != -1) {  
					    return true;  
					} else {  
						password2.val('');
					    return false;  
					} 

				} 
			}
		</script>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf8">
<title>Leadership DNA</title>
<link rel="shortcut icon" href="img/sc.ico" />
</head>

<body>
<%@ include file="staticTitle.jsp" %>
<div class="container"  style="height:768px;width:1366px;padding-top: 0px;background-color: white;">
	<div style="text-align: center;max-height: 40px;">
	<h1>Register into the system</h1>
	</div>
	<div class="container" style="height:708px;width:400px;margin-left: 0px;margin-left: 20px;float: left;">
		<div align="center">
			<h3>register flow:</h3>
		</div>
		<div style="margin-left: 50px;">
			<a id='flow1'  style="color: black;font-size: 20px;" >1.enter personal information</a>
			<br>
			<a id='flow2'  style="color: #CB1B1E;font-size: 20px;">2.enter invite license</a>
			<br>
			<a id='flow3'  style="color: black;font-size: 20px;">3.enter username and password</a>
		</div>
	</div>

	<form id="PasswordForm" method="post" action="./CheckPassword">
	<div id="rightDIV3" class="container" style="background-color:#fefefe;border:2px solid #E1E1E1; height:688px;width:900px;margin-left: 0px;margin-left: 20px;float: left;">
		<div style="max-width: 850px;"><legend style="margin-left: 30px;">username and password</legend></div>
		<div style="margin-left: 30px;">
			<label style="margin-top: 30px;font-size: 20px;">enter your password</label>
    		<input id="password1" name="password1" class="input-xlarge" type="password" placeholder="password..." onkeyup="value=value.replace(/[\W]/g,'') " onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))">
    		<span class="text-warning">只能输入数字和字母</span>
    		<label style="margin-top: 30px;font-size: 20px;">validate your password</label>
    		<input id="password2" name="password2" class="input-xlarge" type="password" placeholder="enter your password again..." onkeyup="value=value.replace(/[\W]/g,'');keypress(this)">
    		<span class="text-warning">只能输入数字和字母</span>
    	</div>
    	<div style="margin-top: 30px;">
    		<button class="btn btn-large btn-primary"  type="button"  style="margin-left: 50px;" onclick="hiden3(this)">confirm</button>
    	</div>
	</div>
	</form>
	
	<div id="myModal" class="modal hide fade">
  			<div class="modal-header">
    			<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
    			<h3 style="color: red;">ERROR!</h3>
  			</div>
  			<div class="modal-body">
    			<p style="font-size: 20px;" id="cautionContent">please entry your license!!!</p>
 			</div>
  			<div class="modal-footer">
    			<a class="btn" data-dismiss="modal" aria-hidden="true">close</a>
   				<!-- <a href="#" class="btn btn-primary">Save changes</a> -->
  			</div>
		</div>
	
</div>
</body>
	
</html>