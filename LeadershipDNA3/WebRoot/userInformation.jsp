<%@ page language="java" contentType="text/html; charset=utf8"
    pageEncoding="utf8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf8">
<title>Insert title here</title>
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
	.box{
		position:relative;
		border: 1px solid #d5d5d5;
		width: 1000px;
		display:block;
		height: 1000px;
		margin-top:50px;
		margin-left:350px;
		border-radius:0 120px 120px 165px / 0 20px 20px 165px;
		background: -webkit-gradient(linear, 0% 20%, 0% 100%, from(#fff), to(#f5f7f7));	
		
	}
	
	.box b{
		position:absolute;
		top: -15px;
		left: -15px;
		color:white;
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
	
	.box b:HOVER {
		box-shadow: 7px 7px 6px #777;
		-webkit-transform: translate(-7px,-7px);
		-moz-transform: rotate(-8deg);
		-o-transform: rotate(-8deg);
		-ms-transform: rotate(-8deg);
		transform: rotate(-8deg);
		background-color:#353535;
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
		margin-left:250px;
		word-wrap: break-word;
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
	}
	
	
</style>
<body>
	<%@ include file="afterLogin.jsp" %>
	
		<div class="box" >
			<b>User information</b>
			<div class="yxj"></div>
			<div style="position:relative;margin-top: 50px; margin-left: 80px;height:80%;padding-top: 20px;" >
				<!--  
					<div style="height:80px;vertical-align: middle;">
					<span class="left">sex</span>
					<select class="span2 right">
					<option>male</option>
					<option>female</option>
					</select>
					
				</div>
				<div>
					<span class="left" style="font-size: 20px;">sex</span>
				</div>
				https://github.com/zongaPanda/LeadershipDNA.git
				-->
				<div class="row">
					<div class="left" >job number</div>
					<div style="font-size: 18px;padding: 0 10px;" class="right">123450
						<a href="#" style="color:#a37652;">change password</a>
					</div>
				</div>
				
				<div class="row">
					<div class="left" >sex</div>
					<div style="font-size: 18px;padding: 0 10px;" class="right">
						<select class="span2 right">
							<option>male</option>
							<option>female</option>
						</select>
					</div>
				</div>
				
				<div class="row">
					<div class="left" >email</div>
					<div style="font-size: 18px;padding: 0 10px;" class="right">
						<input class="span3" type="text" value="1433119561@qq.com"/>
					</div>
				</div>
				
				<div class="row">
					<div class="left">telephone</div>
					<div style="font-size: 18px;padding: 0 10px;" class="right">
						<input class="span3" type="text" value="1433119561@qq.com"/>
					</div>
				</div>
				
				<div class="row">
					<div class="left">address</div>
					<div style="font-size: 18px;padding: 0 10px;" class="right">
						<input class="span3" type="text" value="Apple Rd."/>
					</div>
				</div>
				
				<div class="row">
					<div class="left">birthday</div>
					<div style="font-size: 18px;padding: 0 10px;" class="right">
						<input class="span3" type="text" value="Apple Rd."/>
					</div>
				</div>
				
			</div>
		</div>

</body>
</html>