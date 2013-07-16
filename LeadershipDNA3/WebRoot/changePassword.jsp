<%@ page language="java" contentType="text/html; charset=utf8"
    pageEncoding="utf8"%>
<%@ page import="po.*" %>
<%@ page import="method.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf8">
<title>Leadership DNA</title>
<link rel="shortcut icon" href="img/sc.ico" />
</head>
		<script src="js/jquery1.83.js" > </script>
        <script src="js/bootstrap-transition.js"></script>
        <script src="js/bootstrap-modal.js"></script>
        <script src="js/bootstrap-button.js"></script>
        <script src="js/messenger.min.js"></script>
        <link rel="stylesheet" type="text/css" href="css/messenger.css">
        <link rel="stylesheet" type="text/css" href="css/messenger-theme-future.css">
		<link rel="stylesheet" type="text/css" href="css/bootstrap.css">
<style type="text/css">
		body {
		  background-color: #ebebeb;
			}  
			
	.box{
		position:relative;
		border: 1px solid #d5d5d5;
		width: 1000px;
		display:block;
		height: 660px;
		margin-top:50px;
		margin-left:350px;
		border-radius:0 120px 120px 165px / 0 20px 20px 165px;
		background: -webkit-gradient(linear, 0% 20%, 0% 100%, from(#fff), to(#f5f7f7));	
		
	}
	
	.box > b{
		position:absolute;
		top: -15px;
		left: -15px;
		color:#e6e6e6;
		text-shadow:0 0 5px #770101;
		display:inline-block;
		border:1px solid #5b0404;
		border-radius: 0 0 60px 0 / 0 0 60px 0;
		background-color: black;
		font-size: 40px;
		padding: 10px 30px 10px 10px;
		-webkit-transition: all 1s ease;
	}
	
	.box:before{
		content:'';
		width: 80px;
		height: 80px;
		position : absolute;
		bottom: 0;
		left:0;
		background:-webkit-gradient(linear, 0% 100%, 80% 20%, from(#d5d5d5), to(#fff));
		border-radius: 0 0 0 40px;
  		box-shadow:10px -10px 10px rgba(0, 0, 0, 0.3);
  		-webkit-transform:  rotate(15deg) skew(40deg,10deg) translate(42px,-37px);	
	}
	
	.box:after{
		  z-index: -1;
		  position: absolute;
		  content: "";
		  right: 35px;
		  bottom: 3%;
		  height: 50%;
		  max-height:400px;
		  left: 80%;
		  /*max-width:300px;*/
		  background: #777; 
		  box-shadow: 35px 0px 40px #777;
		  -webkit-transform: rotate(-8deg);
		  -moz-transform: rotate(-8deg);
		  -o-transform: rotate(-8deg);
		  -ms-transform: rotate(-8deg);
		  transform: rotate(-8deg);
	}
	
	.box:after{
		  
	}
	
	.yxj{
		  z-index: -1;
		  position: absolute;
		  content: "";
		  right: 35px;
		  bottom: 3%;
		  height: 50%;
		  max-height:400px;
		  left: 80%;
		  /*max-width:300px;*/
		  
		  box-shadow: 35px 0px 40px #777;
		  -webkit-transform: rotate(8deg);
		  -moz-transform: rotate(-8deg);
		  -o-transform: rotate(-8deg);
		  -ms-transform: rotate(-8deg);
		  transform: rotate(-8deg);
		  top:3%;
		  bottom:auto;
	}
	
	.box > b:HOVER {
		box-shadow: 7px 7px 6px #777;
		-webkit-transform: translate(-7px,-7px);
		-moz-transform: rotate(-8deg);
		-o-transform: rotate(-8deg);
		-ms-transform: rotate(-8deg);
		transform: rotate(-8deg);
		background-color:#353535;
	}
	
	.row{
		font-size: 12px;
		line-height: 30px;
		margin-bottom: 5px;
		position: relative;
		display: block;
		/*float:left;*/
		padding: 0 10px;
		height:60px;
		margin-top:50px;
		margin-left:200px;
	}
	
	.left{
		margin-left:100px;
		font-size: 18px;
		float: left;
		text-align: right;
		white-space: nowrap;
		color: #808080;
	}
	
	.right{
		margin-left:300px;
		word-wrap: break-word;
	}
</style>
<script>
	
	function test(e){
		var $old_password = $("#old_password");
		var $new_password = $("#new_password");
		var $v_password = $("#v_password");
		var $myModal = $("#myModal");
		var $cautionContent = $("#cautionContent");
		var $changepwd = $("#changepwd");
		if($old_password.val()==''){
			$cautionContent.html('old password...');
			$myModal.modal('show');
			return false;
		}
		if($new_password.val()==''){
			$cautionContent.html('new password...');
			$myModal.modal('show');
			return false;
		}
		if($v_password.val()==''){
			$cautionContent.html('validate new password...');
			$myModal.modal('show');
			return false;
		}
		if($new_password.val()!=$v_password.val()){
			$cautionContent.html("validate password is not the same with password");
			$myModal.modal('show');
			return false;
		}
		$changepwd.submit();
		
	}
	
	function keypress(e){
		var $new_password = $("#new_password");
		var $v_password = $("#v_password");
		if($new_password.val()==''){
			$v_password.val('');
		}
	}
</script>
<body>

	
	<div class="box" >
	<b>Change Password</b>
			<div class="yxj"></div>
			
			<div style="margin-top:100px;">
			<form id="changepwd" action="./ChangePassword" method="post">
				<div class="row">
					<div class="left" >old password</div>
					<div style="font-size: 18px;padding: 0 10px;" class="right">
						<input id="old_password" name="old_password" class="span3" type="password" value="" onkeyup="value=value.replace(/[\W]/g,'')" onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))" />
					</div>
				</div>
				
				<div class="row">
					<div class="left" >new password</div>
					<div style="font-size: 18px;padding: 0 10px;" class="right">
						<input id="new_password" name="new_password" class="span3" type="password" value="" onkeyup="value=value.replace(/[\W]/g,'')" onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))" />
					</div>
				</div>
				
				<div class="row">
					<div class="left" >validate new password</div>
					<div style="font-size: 18px;padding: 0 10px;" class="right">
						<input id="v_password" name="v_password" class="span3" type="password" value="" onkeyup="value=value.replace(/[\W]/g,'');keypress(this)" onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))" />
					</div>
				</div>

				
				<div class="row">
					<button class="left btn btn-primary " style="color:white;" type="button" onclick="test(this)">save</button>
				</div>
				</form>
			</div>
			
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
</html>