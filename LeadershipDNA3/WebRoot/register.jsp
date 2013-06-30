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
			$(document).ready(function(){$('#rightDIV2').hide();$('#rightDIV3').hide();$("#myModal").modal('hide')});
		
			function hiden(e){
				var job_number = $("#job_number");
				var name = $("#name");
				var email_address = $("#email_address");

				if(job_number.val()==''||name.val()==''||email_address.val()==''){
					$("#myModal").modal('show');
					return false;
				}
				
				var regu = "^(([0-9a-zA-Z]+)|([0-9a-zA-Z]+[_.0-9a-zA-Z-]*[0-9a-zA-Z]+))@([a-zA-Z0-9-]+[.])+([a-zA-Z]{2}|net|NET|com|COM|gov|GOV|mil|MIL|org|ORG|edu|EDU|int|INT)$"  
				var re = new RegExp(regu);
				
				if (email_address.val().search(re) != -1) {  
					  
				} else {  
					window.alert ("请输入有效合法的E-mail地址 ！")  
					return false;  
				} 

				$('#rightDIV').hide(500);
				$('#rightDIV2').show(500);	
				$('#flow1').css('color','black');
				$('#flow2').css("color","#CB1B1E");
				<%//MailSender.send("168chengyuxing@sina.com", "1433119561@qq.com", "hello", "3this is a test , cyx. Your license is 123456789");%>
				//$("#MailForm").submit();
				document.getElementById("MailForm").submit();
				
			}
			
			function hiden2(e){
				$('#rightDIV2').hide(500);
				$('#rightDIV3').show(500);	
				$('#flow2').css('color','black');
				$('#flow3').css("color","#CB1B1E");	
			}
			
			$._messengerDefaults = {
					extraClasses: 'messenger-fixed messenger-theme-future messenger-on-top messenger-on-right'
				}
			
			function showMsg(e){
				var msg;

				msg = $.globalMessenger().post({
				  message: 'You hava a new message',
				  type: 'info',
				  actions: {
				    cancel: {
				      label: 'cancel launch',
				      action: function() {
				        return msg.update({
				          message: 'Thermonuclear war averted',
				          type: 'success',
				          actions: false
				        });
				      }
				    }
				  }
				});

			}
		</script>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf8">
<title>register</title>
</head>

<body>
<div class="container"  style="height:768px;width:1366px;padding-top: 0px;background-color: #DCEAF4;">
	<div style="text-align: center;max-height: 40px;">
	<h1>Register into the system</h1>
	</div>
	<div class="container" style="height:708px;width:400px;margin-left: 0px;margin-left: 20px;float: left;">
		<div align="center">
			<h3>register flow:</h3>
		</div>
		<div style="margin-left: 50px;">
			<a id='flow1'  style="color: #CB1B1E;font-size: 20px;" >1.enter personal information</a>
			<br>
			<a id='flow2'  style="color: black;font-size: 20px;">2.enter invite license</a>
			<br>
			<a id='flow3'  style="color: black;font-size: 20px;">3.enter username and password</a>
		</div>
	</div>
	
	 <form id="MailForm" method="post" action="./MailSender"> 
		<div id="rightDIV" class="container" style="background-color:#F2F2F2;border:2px solid #E1E1E1; height:688px;width:900px;margin-left: 0px;margin-left: 20px;float: left;">
			<div style="max-width: 850px;"><legend style="margin-left: 30px;">personal information</legend></div>
			<div style="margin-left: 30px;">
				<label  style="margin-top: 30px;font-size: 20px;">enter your job number</label>
	    		<input    id="job_number" name="jn" class="input-xlarge" type="text" placeholder="job number...">
				<label style="margin-top: 30px;font-size: 20px;">enter your name</label>
	    		<input id="name" name="n" class="input-xlarge" type="text" placeholder="your name...">
	    		<label style="margin-top: 30px;font-size: 20px;">enter your email address you registed in company</label>
	    		<input id="email_address" name="ea" class="input-xlarge" type="text" placeholder="email address...">
	    		
	    	</div>
	    	<div style="margin-top: 30px;">
	    		<button class="btn btn-large btn-primary"  type="button"  style="margin-left: 50px;" onclick="hiden(this)">confirm and get a license</button>
	    	</div>
		</div>
	  </form>

	
	
	<div id="rightDIV2" class="container" style="background-color:#F2F2F2;border:2px solid #E1E1E1; height:688px;width:900px;margin-left: 0px;margin-left: 20px;float: left;">
		<div style="max-width: 850px;"><legend style="margin-left: 30px;">invite license</legend></div>
		<div style="margin-left: 30px;">
			<label style="margin-top: 30px;font-size: 20px;">we send an invite license to 168chengyuxing@sina.com, please enter it.</label>
			<label style="margin-top: 30px;font-size: 20px;">enter the invite license you received</label>
    		<input class="input-xlarge" type="text" placeholder="invite license...">
    	</div>
    	<div style="margin-top: 30px;">
    		<button class="btn btn-large btn-primary"  type="button"  style="margin-left: 50px;" onclick="hiden2(this)">confirm</button>
    	</div>
	</div>

	
	<div id="rightDIV3" class="container" style="background-color:#F2F2F2;border:2px solid #E1E1E1; height:688px;width:900px;margin-left: 0px;margin-left: 20px;float: left;">
		<div style="max-width: 850px;"><legend style="margin-left: 30px;">username and password</legend></div>
		<div style="margin-left: 30px;">
			<label style="margin-top: 30px;font-size: 20px;">enter the invite license you received</label>
    		<input class="input-xlarge" type="text" placeholder="invite license...">
    	</div>
    	<div style="margin-top: 30px;">
    		<button class="btn btn-large btn-primary"  type="button"  style="margin-left: 50px;" onclick="showMsg(this)">confirm</button>
    	</div>
	</div>

	<div id="myModal" class="modal hide fade">
  			<div class="modal-header">
    			<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
    			<h3 style="color: red;">ERROR!</h3>
  			</div>
  			<div class="modal-body">
    			<p style="font-size: 20px;" id="cautionContent">please complete the information</p>
 			</div>
  			<div class="modal-footer">
    			<a class="btn" data-dismiss="modal" aria-hidden="true">close</a>
   				<!-- <a href="#" class="btn btn-primary">Save changes</a> -->
  			</div>
		</div>
   </body>


	
</div>
</body>
	
</html>