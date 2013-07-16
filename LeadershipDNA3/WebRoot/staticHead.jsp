<!-- 
	author:cyx
	date:2013/6/11
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
</script>
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
	
	<div class="carousel slide" id="carousel-289137">
				<ol class="carousel-indicators">
					<li class="active" data-slide-to="0" data-target="#carousel-289137">
					</li>
					<li data-slide-to="1" data-target="#carousel-289137">
					</li>
					<li data-slide-to="2" data-target="#carousel-289137">
					</li>
					<li data-slide-to="3" data-target="#carousel-289137">
					</li>
				</ol>
				<div class="carousel-inner">
					<div class="item active">
						<img alt="" src="img/4.jpg" />
						<div class="carousel-caption">
							<h4>
								渣打
							</h4>
							<p>
								渣打集团（Standard Chartered Bank）分别在伦敦及香港交易所上市，名列富时100指数(FTSE 100指数)前25家公司（以市值计算）
							</p>
						</div>
					</div>
					<div class="item">
						<img alt="" src="img/5.jpg" />
						<div class="carousel-caption">
							<h4>
								渣打
							</h4>
							<p>
								集团总部设在伦敦，渣打集团在全球部分最有活力的市场上已经经营超过150年，在亚洲、非洲及中东市场占领导地位。
							</p>
						</div>
					</div>
					<div class="item">
						<img alt="" src="img/6.jpg" />
						<div class="carousel-caption">
							<h4>
								渣打
							</h4>
							<p>
								渣打银行致力于引领国际市场，为客户提供卓越服务。渣打银行超过90%的营运收入和利润来自亚洲，非洲和中东市场，该收入通过提供企业银行和个人银行服务所获得。
							</p>
						</div>
					</div>
					<div class="item">
						<img alt="" src="img/7.jpg" />
						<div class="carousel-caption">
							<h4>
								渣打
							</h4>
							<p>
								集团不懈追求成为利益相关者的最佳伙伴，致力于建设长期发展的可持续业务，并通过坚持高标准的公司治理、履行社会责任、开展环境保护及员工多样化等行动赢得了世界的信任。
							</p>
						</div>
					</div>
				</div> <a data-slide="prev" href="#carousel-289137" class="left carousel-control">‹</a> <a data-slide="next" href="#carousel-289137" class="right carousel-control">›</a>
			</div>
			
			<script>
			$('#carousel-289137').carousel({
				  interval: 5000
			});
			</script>
			
		

</body>
</html>