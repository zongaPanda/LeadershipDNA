<!-- 
	author:cyx
	date:2013/7/10
 -->
<%@ page language="java" contentType="text/html; charset=utf8"
    pageEncoding="utf8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="js/jquery1.83.js" ></script>
<script src="js/jquery.pin.js"></script>
<script src="js/bootstrap.js"></script>
<script type="text/javascript"></script>
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="css/bootstrap-responsive.min.css">
<meta http-equiv="Content-Type" content="text/html; charset=utf8">
<title>Leadership DNA</title>
<link rel="shortcut icon" href="img/sc.ico" />
</head>
<body>
	<%
		String currentUser = (String)session.getAttribute("currentUser");
		System.out.println("staticHead.jsp, the currentUser is : "+currentUser);
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
              <%
              	if(currentUser!=null){
              %>
              <li class="active"><a href="dashboard.jsp" >LeadershipDNA</a></li>
              <%
              	}
              %>
            </ul>
          </div>
        </div>
      </div>
    </div>
    <%
    	if(currentUser!=null){
    %>
    <script type="text/javascript">
    	
    	$("#inOrOut").html('log out');
    	$("#inOrOut").attr("href","./Logout");
    	</script>
    <%
    	}else if(currentUser==null){
    %>
    	<script>
    	$("#inOrOut").html('log in');
    	$("#inOrOut").attr("href","login.jsp");
    	</script>
    <%
    	}    
    %>
	<script type="text/javascript">
	$("#daohang").pin();
	</script>
	
			
		

</body>
</html>