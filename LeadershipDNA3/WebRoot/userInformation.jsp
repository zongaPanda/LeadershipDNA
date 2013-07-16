<%@ page language="java" contentType="text/html; charset=utf8"
    pageEncoding="utf8"%>
<%@ page import="po.*" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.util.Calendar" %>
<%@ page import="java.util.List" %>
<%@ page import="java.text.SimpleDateFormat" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf8">
<title>Leadership DNA</title>
<script type="text/javascript" src="/js/bootstrap-datetimepicker.js" charset="UTF-8"></script>
<script type="text/javascript" src="/js/bootstrap-datetimepicker.fr.js" charset="UTF-8"></script>
<link rel="shortcut icon" href="img/sc.ico" />
</head>
		<script src="js/jquery1.83.js" > </script>
        <script src="js/bootstrap-transition.js"></script>
        <script src="js/bootstrap-modal.js"></script>
        <script src="js/bootstrap-button.js"></script>
        <script type="text/javascript" src="js/bootstrap.min.js"></script>
        <script src="js/messenger.min.js"></script>
		
        <link rel="stylesheet" type="text/css" href="css/messenger.css">
        <link rel="stylesheet" type="text/css" href="css/messenger-theme-future.css">
		<link rel="stylesheet" type="text/css" href="css/bootstrap.css">
		<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
		<link href="/css/datetimepicker.css" rel="stylesheet" media="screen">
		<link href="css/bootstrap.min.css" rel="stylesheet" media="screen">
    	<link href="css/datetimepicker.css" rel="stylesheet" media="screen">
<style type="text/css">
	.box{
		position:relative;
		border: 1px solid #d5d5d5;
		width: 1000px;
		display:block;
		height: 760px;
		margin-top:50px;
		margin-left:350px;
		border-radius:0 120px 120px 165px / 0 20px 20px 165px;
		background: -webkit-gradient(linear, 0% 20%, 0% 100%, from(#fff), to(#f5f7f7));	
		
	}
	
	.box b{
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

<script>
	$(function(){
		$("#myModal").modal('hide');
		
	});
	
	function test(e){
		//$("#sex").val(2011);
		//window.alert($("#sex").val());
		//$("#2_011").attr("selected",true);
		window.alert($('#sex').val());
		window.alert($("#education").val());
		window.alert($("#select_id").find("option:selected").text());
		$("#bir_year").val('2011');	
	}
	
	function save(e){
		var $sex = $("#sex");
		var $email = $("#email");
		var $telephone = $("#telephone");
		var $address = $("#address");
		var $birthday = $("#birthday");
		var $qq = $("#qq");
		var $education = $("#education");
		var $myModal = $("#myModal");
		var $cautionContent = $("#cautionContent");
		var $information = $("#information");
		//window.alert($sex.val());
		//window.alert($email.val());
		//window.alert($telephone.val());
		//window.alert($address.val());
		//window.alert($birthday.val());
		//window.alert($qq.val());
		//window.alert($education.val());
		var regu = "^(([0-9a-zA-Z]+)|([0-9a-zA-Z]+[_.0-9a-zA-Z-]*[0-9a-zA-Z]+))@([a-zA-Z0-9-]+[.])+([a-zA-Z]{2}|net|NET|com|COM|gov|GOV|mil|MIL|org|ORG|edu|EDU|int|INT)$"  
		var re = new RegExp(regu);
		if($email.val()!=''){
			if($email.val().search(re)!=-1){
				
			}
			else{
				$cautionContent.html('not legal email format');
				$myModal.modal('show');
				return false;
			}
		}
		
		$information.submit();

	}
</script>
<body>
	<%@ include file="afterLogin.jsp" %>
	<%
		currentUser = (String)session.getAttribute("currentUser");
		System.out.println("userInformation.jsp, the currentUser is : "+currentUser);
		UsersDAO uDAO = new UsersDAO();
		Users u = new Users();
		Date d = ((Users)uDAO.findByUid(Long.parseLong(currentUser)).get(0)).getBirthday();
		//int year = d.getYear();
		//Calendar c1 = Calendar.getInstance(); 
		//c1.setTime(d);
		int tasknum = (Integer)session.getAttribute("tasknum");
		System.out.println("tasknum="+tasknum);
	%>
	
	
		<div class="box" >
			<b>User information</b>
			<div class="yxj"></div>
			
			<form id="information" name="information" method="post" action="./UpdateInfo">
			
			<div style="position:relative;margin-top: 50px; margin-left: 80px;height:80%;padding-top: 20px;" >
				<div class="row">
					<div class="left" >PWID</div>
					<div id="job_number" style="font-size: 18px;padding: 0 10px;" class="right"><%=currentUser %>
						<a href="changePassword.jsp" style="color:#a37652;">change password</a>
					</div>
				</div>
				
				<div class="row">
					<div class="left" >gender</div>
					<div style="font-size: 18px;padding: 0 10px;" class="right">
						<select id="sex" name="sex" class="span2 right">
							<option value="-1">------------------------</option>
							<option value="0">male</option>
							<option value="1">female</option>
						</select>
					</div>
				</div>
				
				<div class="row">
					<div class="left" >email</div>
					<div style="font-size: 18px;padding: 0 10px;" class="right">
						<input id="email" name="email" class="span3" type="text" value="" MaxLength="30"/>
					</div>
				</div>
				
				<div class="row">
					<div class="left">telephone</div>
					<div style="font-size: 18px;padding: 0 10px;" class="right">
						<input id="telephone" name="telephone" class="span3" type="text" value="" MaxLength="11"/>
					</div>
				</div>
				
				<div class="row">
					<div class="left">address</div>
					<div style="font-size: 18px;padding: 0 10px;" class="right">
						<input id="address" name="address" class="span3" type="text" value="" MaxLength="45"/>
					</div>
				</div>
				
				<div class="row">
					<div class="left">birthday</div>
					<div style="font-size: 18px;padding: 0 10px;" class="right">
						
						<div class="input-append date form_datetime" >
    						<input id="birthday" name="birthday" size="16" type="text" value="" readonly>
    						<span class="add-on"><i class="icon-remove"></i></span>
    						<span class="add-on"><i class="icon-calendar"></i></span>
						</div>
						
					</div>
						
				</div>
				
				<div class="row" style="display:none;">
					<div class="left">qq</div>
					<div style="font-size: 18px;padding: 0 10px;" class="right">
						<input id="qq" name="qq" class="span3" type="text" value="" MaxLength="10"/>
					</div>
				</div>
				
				<div class="row">
					<div class="left">education</div>
					<div style="font-size: 18px;padding: 0 10px;" class="right">
						<select id="education" name="education" class="span2 right">
							<option value="-1">------------------------</option>
							<option value="1">doctor</option>
							<option value="2">master</option>
							<option value="3">university student</option>
							<option value="4">community college</option>
							<option value="5">polytechnic school</option>
							<option value="6">vocational school</option>
							<option value="7">senior high school</option>
							<option value="8">junior high school</option>
							<option value="9">primary school</option>
						</select>
					</div>
				</div>
				
				<div class="row">
					<button class="btn btn-primary left" type="button" onclick="save(this)">sava</button>
				</div>
				
			</div>
			</form>
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
   	<script type="text/javascript" src="js/bootstrap-datetimepicker.js" charset="UTF-8"></script>
	<script type="text/javascript" src="js/locales/bootstrap-datetimepicker.fr.js" charset="UTF-8"></script>
   <script>
	   	var tasknum = <%=tasknum %>;
		var $tasknum = $("#tasknum");
		
		if(tasknum==0){
			$tasknum.hide();
		}else{
			$tasknum.html(tasknum);
		}
		$(".form_datetime").datetimepicker({
	        format: "yyyy-mm-dd",
	        weekStart: 1,
	        autoclose: true,
	        startView:2,
	        minView:2,
	        maxView:4,
	        keyboardNavigation:true,
	        todayBtn: true,
	        pickerPosition: "bottom-left"
	    });

   </script>
   <%
   	List ulist = uDAO.findByUid(Long.parseLong(currentUser));
	int ulistLength = ulist.size();
	
	if(ulistLength!=0){
		Users user = (Users)ulist.get(0);
		String sex = user.getSex();
		if(sex!=null){
	%>
		<script>
			$(function(){
				$("#sex").val(<%=sex %>);
			});
		</script>
	<%
		}
		String email = user.getEmail();
		if(email!=null){
	%>
		<script>
			$(function(){
				$("#email").val('<%=email%>');
			});
		</script>
	<%
		}
		String telephone = user.getTelephone();
		if(telephone!=null){
	%>
		<script>
			$(function(){
				$("#telephone").val('<%=telephone%>');
			});
		</script>
	<%
		}
		String address = user.getAddress();
		if(address!=null){
	%>
		<script>
			$(function(){
				$("#address").val('<%=address%>');
			});
		</script>
	<%
		}
		Date birthday = user.getBirthday();
		if(birthday!=null){
			SimpleDateFormat fmt = new SimpleDateFormat("yyyy-MM-dd");
			String birthdayStr = fmt.format(birthday);
			//System.out.println("birthdayStr"+birthdayStr);
	%>
			<script>
				$(function(){
					$("#birthday").val('<%=birthdayStr%>');
				});
			</script>
	<%
		}
		String education = user.getEducation();
		//System.out.println("education"+education);
		if(education!=null){
	%>
				<script>
					$(function(){
						$("#education").val(<%=education %>);
					});
				</script>
	<%
				}
	}
   %>
</body>
</html>
