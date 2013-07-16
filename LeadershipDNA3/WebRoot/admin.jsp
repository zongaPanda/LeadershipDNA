<%@ page language="java" contentType="text/html; charset=utf8"
    pageEncoding="utf8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf8">
<script src="js/jquery1.83.js" ></script>
<script src="js/jquery.pin.js"></script>
<script src="js/bootstrap.js"></script>
<script type="text/javascript"></script>
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="css/bootstrap-responsive.min.css">
<meta http-equiv="Content-Type" content="text/html; charset=utf8">
<title>Administrator</title>
<link rel="shortcut icon" href="img/sc.ico" />
</head>
<style>
	.border{
		position:relative;
		margin-top:50px;
		margin-left:50px;
	}
</style>
<body>
	<body>
	<%
		String currentAdmin = (String)session.getAttribute("currentAdmin");
		System.out.println("staticHead.jsp, the currentUser is : "+currentAdmin);
	%>
	<form id="logout" method="post" action="./Logout"></form>
	<div id="daohang" class="navbar navbar-inverse navbar-fixed-top">
      <div class="navbar-inner">
        <div class="container">
          <button type="button" class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="brand" href="#">Leadership DNA</a>
          <div class="nav-collapse collapse">
            <ul class="nav">
              <li class="active"><a href="staticHead.jsp" >Home Page</a></li>
              <li class="active"><a id="inOrOut" href="login.jsp">log in</a></li>
            </ul>
          </div>
        </div>
      </div>
    </div>
    <%
    	if(currentAdmin!=null){
    %>
    <script type="text/javascript">
    	
    	$("#inOrOut").html('log out');
    	$("#inOrOut").attr("href","./AdminLogout");
    	</script>
    <%
    	}else if(currentAdmin==null){
    %>
    	<script>
    	$("#inOrOut").html('log in');
    	$("#inOrOut").attr("href","AdminLogin.jsp");
    	</script>
    <%
    	}    
    %>
	<script type="text/javascript">
	$("#daohang").pin();
	</script>
	
	<div class="border">
			<div class="tabbable tabs-left" id="tabs-962820">
				<ul class="nav nav-tabs">
					<li>
						<a href="#panel-572356" data-toggle="tab">registered users</a>
					</li>
					<li class="active">
						<a href="#panel-684433" data-toggle="tab">license cap</a>
					</li>
					<li class="active">
						<a href="#panel-684433" data-toggle="tab">cycles</a>
					</li>
					<li class="active">
						<a href="#panel-684433" data-toggle="tab">questions</a>
					</li>
					<li class="active">
						<a href="#panel-684433" data-toggle="tab">actions</a>
					</li>
					<li class="active">
						<a href="#panel-684433" data-toggle="tab">help page</a>
					</li>
				</ul>
				<div class="tab-content">
					<div class="tab-pane" id="panel-572356">
						<p>
							第一部分内容.
						</p>
					</div>
					<div class="tab-pane active" id="panel-684433">
						<p>
							第二部分内容.
						</p>
					</div>
				</div>
			</div>
	</div>

</body>
</html>