<!-- 
	author:cyx
	date:2013/6/29
 -->
<%@ page language="java" contentType="text/html; charset=utf8"
    pageEncoding="utf8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="js/jquery1.83.js" ></script>
<script src="js/jquery.pin.js"></script>
<script src="js/bootstrap.js"></script>
<script type="text/javascript">
	//$('head').width(document.documentElement.clientWidth);
	//$('head').style.width = window.screen.clientWidth;

	
</script>
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="css/bootstrap-responsive.min.css">
<meta http-equiv="Content-Type" content="text/html; charset=utf8">
<title>Leadership DNA</title>
<link rel="shortcut icon" href="img/sc.ico" />
</head>

<style type="text/css">
			body {
		  background-color: #ebebeb;
		  /*background-color: #222222;
		  background-image: -webkit-linear-gradient(180deg, transparent 55%, #272727  45%);
		  background-image: -o-linear-gradient(180deg, transparent 50%, #272727  50%);
		  background-image: -ms-linear-gradient(180deg, transparent 50%, #272727  50%);
		  background-image: linear-gradient(90deg, transparent 50%, #272727  50%);
		  background-size: 30px 30px;*/
		  letter-spacing: 0.09em;
		}  
		.demo {
		  color: #fff;
		  line-height: 30px;
		  width: 370px;
		  height: 220px;
		  margin: 40px auto ;
		  
		}
		.quick_menu > li {
		  display: inline-block;
		  position: relative;
		  -webkit-perspective: 1000px;/*perspective: 透视效果*/
		  -moz-perspective: 1000px;
		  -ms-perspective: 1000px;
		  perspective: 1000px;
		}
		.quick_menu a,
		  .quick_menu a:hover{
		  color: #fff;
		  font-weight: bold;
		  text-decoration: none;
		}
		.quick_menu > li:hover .user_fun_sub {
		  opacity:1;
		  -webkit-animation: turn 2s ease-in-out;
		  -moz-animation: turn 2s ease-in-out;
		  -ms-animation: turn 2s ease-in-out;
		  animation: turn 2s ease-in-out;
		  visibility: visible;
		}
		.user_icon img {
		  width: 30px;
		  height: 30px;
		  border:  1px solid #fff;
		  border-radius: 3px;
		  vertical-align: middle;
		  box-shadow: 1px 1px 5px rgba(0,145,172,0.9 );
		}
		.user_icon b {
		  position: absolute;
		  top: -8px;
		  left: -8px;
		  display: inline-block;  
		  text-shadow: 0 1px 1px rgba(0,0,0,.2);
		  padding: 2px 5px;
		  line-height: 12px;
		  border-radius: 2px;
		  box-shadow: 0 1px 2px rgba(0,0,0,.2);
		  background-color: #ff8400;
		
		}
		.user_fun b {
		  position: absolute;
		  top: 8px;
		  padding-left: 2px;
		  font-weight: normal;
		  font-size: 22px;
		}
		.user_fun_sub {
		  position: absolute;
		  text-align: left;
		  line-height: 30px;
		  width: 125px;
		  padding: 5px 0;
		  border-radius: 5px;
		  background-color: #001013;/*几乎黑色*/
		  opacity: 0;
		  visibility: hidden;
		  -webkit-transform-origin: 50% 0%;
		  -moz-transform-origin: 50% 0%;
		  -ms-transform-origin: 50% 0%;
		  transform-origin: 50% 0%;
		}
		.user_fun_sub a {
		  display: block;
		  text-shadow: 0 1px 1px rgba(0,0,0,.2);
		  margin: 2px 5px 2px 5px;
		  padding-left:5px;
		}
		.user_fun_sub a:hover {
		  border-radius: 3px;
		 / box-shadow: 0 1px 0 #82c64f inset;
		  /*box-shadow: 5 5px 10 #82c64f inset;*/
		  background-color: #4daf04;
		}
		.log_out a {
		  display: block;
		  line-height: 15px;
		  padding: 5px 20px;
		  margin-left: 40px;
		  border: 1px solid #33707b;
		  border-radius: 3px;
		  -webkit-transition: all 1s ease;
		  -moz-transition: all 1s ease;
		  -ms-transition: all 1s ease;
		  -o-transition: all 1s ease;
		  transition: all 1s ease;
		}
		.log_out a:hover {
		  text-shadow: 0 0 20px rgba(255,255,255,.9);
		}
		
		@-webkit-keyframes turn {
		  0%{
		    -webkit-transform: rotateX(90deg);
		  }
		  20%{
		    -webkit-transform: rotateX(-30deg) rotateY(10deg);
		  }
		  35%{
		    -webkit-transform: rotateX(20deg) rotateY(-3deg);
		  }
		  55%{
		    -webkit-transform: rotateX(-15deg) rotateY(8deg);
		  }
		  85%{
		    -webkit-transform: rotateX(20deg) rotateY(-2deg);
		  }
		  100%{
		    -webkit-transform: rotateX(0);
		  }
		}
		@-moz-keyframes turn {
		  0%{
		    -moz-transform: rotateX(90deg);
		  }
		  20%{
		    -moz-transform: rotateX(-30deg) rotateY(10deg);
		  }
		  35%{
		    -moz-transform: rotateX(20deg) rotateY(-3deg);
		  }
		  55%{
		    -moz-transform: rotateX(-15deg) rotateY(8deg);
		  }
		  85%{
		    -moz-transform: rotateX(20deg) rotateY(-2deg);
		  }
		  100%{
		    -moz-transform: rotateX(0);
		  }
		}
		@-ms-keyframes turn {
		  0%{
		    -ms-transform: rotateX(90deg);
		  }
		  20%{
		    -ms-transform: rotateX(-30deg) rotateY(10deg);
		  }
		  35%{
		    -ms-transform: rotateX(20deg) rotateY(-3deg);
		  }
		  55%{
		    -ms-transform: rotateX(-15deg) rotateY(8deg);
		  }
		  85%{
		    -ms-transform: rotateX(20deg) rotateY(-2deg);
		  }
		  100%{
		    -ms-transform: rotateX(0);
		  }
		}
		@keyframes turn {
		  0%{
		    transform: rotateX(90deg);
		  }
		  20%{
		    transform: rotateX(-30deg) rotateY(10deg);
		  }
		  35%{
		    transform: rotateX(20deg) rotateY(-3deg);
		  }
		  55%{
		    transform: rotateX(-15deg) rotateY(8deg);
		  }
		  85%{
		    transform: rotateX(20deg) rotateY(-2deg);
		  }
		  100%{
		    transform: rotateX(0);
		  }
		}		
</style>

<body>
		<%
			String currentUser = (String)session.getAttribute("currentUser");
	    	System.out.println("staticHead.jsp, the currentUser is : "+currentUser);
		%>
	
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
          </div><!--/.nav-collapse -->
        </div>
      </div>
    </div>
    <%	
    	if(currentUser!=null){
    %>
    <script type="text/javascript">
    	
    	$("#inOrOut").html('log out');
    	$("#inOrOut").attr("href","./Logout");
    	//$("#inOrOut").click(function(){
    		//$("#logout").submit();
    		//location.reload();
    	//});
    </script>
    <%
    	}else if(currentUser==null){
    %>
    	<script>
    	$("#inOrOut").html('log in');
    	$("#inOrOut").attr("href","login.jsp");
    	//$("#inOrOut").click(function(){
    		//location.href='login.jsp';
    	//});
    	</script>
    <%
    	}    
    %>

	<script type="text/javascript">
	$("#daohang").pin();
	</script>
	
	<div id="menu" style="width: 17%;margin-top: 41px;float: left;height:800px;;">
			<ul class="quick_menu">
		  <li style="color: #ff8400">Welcome,</li>
		  <li class="user_icon"><a href="userInformation.jsp" ><img src="img/sc.png" alt="Tina"><b id="tasknum" name="tasknum">4</b></a></li>
		  <li class="user_fun">
		    <a href="#" title="PandaThemes" style="color:#ff8400;"><%=currentUser %><b>ˇ</b></a>
		    <ul class="user_fun_sub">
		      <li><a href="dashboard.jsp">Dashboard</a></li>
		      <li><a href="userInformation.jsp">User information</a></li>
		    </ul>
		  </li>
		<ul>
	</div>
	
	
	
	<!--  <div style="margin-left:30px;;margin-top:41px;float:left;background-color: #ff8400 ;width: 60%;height:500px;">
	</div>-->

</body>
</html>