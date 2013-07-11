<!-- 
	author:cyx
	date:2013/7/10
 -->
<%@ page language="java" contentType="text/html; charset=utf8"
	pageEncoding="utf8"%>
<%@ page import="servlet.MailSender"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<script src="js/jquery1.83.js">
	
</script>
<script src="js/bootstrap-transition.js"></script>
<script src="js/bootstrap-modal.js"></script>
<script src="js/bootstrap-button.js"></script>
<script src="js/messenger.min.js"></script>
<link rel="stylesheet" type="text/css" href="css/messenger.css">
<link rel="stylesheet" type="text/css"
	href="css/messenger-theme-future.css">
<link rel="stylesheet" type="text/css" href="css/bootstrap.css">
<style type="text/css">
a:LINK {
	text-decoration: none;
	color: green;
}

a:hover {
	text-decoration: none;
	color: blue;
}
</style>
<script type="text/javascript">
	$(function(){
		var msm = <%=request.getParameter("msm")%>;
		var $myModal = $("#myModal");
		var $cautionContent = $("#cautionContent");
		if(msm==1){
			$cautionContent.html('该用户已经注册');
			$myModal.modal('show');
		}else if(msm==4){
			$cautionContent.html('不存在该员工');
			$myModal.modal('show');
		}else if(msm==2){
			$cautionContent.html('job number和用户名不匹配');
			$myModal.modal('show');
		}else{
			$myModal.modal('show');
		}
	});
</script>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf8">
<title>Leadership DNA</title>
<link rel="shortcut icon" href="img/sc.ico" />
</head>

<body>


		<div id="myModal" class="modal hide fade">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" onclick="window.location='staticHead.jsp'"
					>&times;</button>
				<h3 style="color: red;">ERROR!</h3>
			</div>
			<div class="modal-body">
				<p style="font-size: 20px;" id="cautionContent">please complete
					the information</p>
			</div>
			<div class="modal-footer">
				<a class="btn" data-dismiss="modal" onclick="window.location='staticHead.jsp'">Home page</a>
				<!-- <a href="#" class="btn btn-primary">Save changes</a> -->
			</div>
		</div>
		
</body>



</div>
</body>

</html>