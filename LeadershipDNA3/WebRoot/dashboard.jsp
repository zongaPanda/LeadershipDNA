<%@ page language="java" contentType="text/html; charset=utf8"
    pageEncoding="utf8"%>
<%@ page import="po.*" %>
<%@ page import="method.*" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf8">
<title>Leadership DNA</title>
</head>
		<script src="js/jquery1.83.js" > </script>
        <script src="js/bootstrap-transition.js"></script>
        <script src="js/bootstrap-modal.js"></script>
        <script src="js/bootstrap-button.js"></script>
        <script src="js/messenger.min.js"></script>
        <link rel="stylesheet" type="text/css" href="css/messenger.css">
        <link rel="stylesheet" type="text/css" href="css/messenger-theme-future.css">
		<link rel="stylesheet" type="text/css" href="css/bootstrap.css">
		<link rel="shortcut icon" href="img/sc.ico" />
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
	
	.allPro{
		position:absolute;
		margin-left:100px;
		margin-top:50px;
		margin-right:50px;
		height:200px;
		background-color:#ebebeb;
		/*border:1px solid blue;*/
		
	}
	
	.pro{
		position:relative;
		height:40px;
		width:140px;
		background-color: #FAFAFA; 
		font-size:26px;
		-webkit-transform: skew(40deg,0deg);
		border: 5px solid #b9b9b9;
		
	}
	
	.pro:HOVER {
 		-webkit-animation: turns 1s ease-in-out;
	}
	
	
	
	.prob{
		position:absolute;
		top:14px;
		left:65px;
		font-size:26px;
		color:#b9b9b9;
		
	}
	
	.prob:HOVER {
		-webkit-animation: turnss 1s ease-in-out;
	}
	
	.bigbox{
		position:relative;
		margin-left:10px;
		float:left;
		height:160px;
		/*border:1px solid blue;*/
		
	}
	
	.start{
		/*border:1px solid red;*/
		position:absolute;
		height:200px;
		width:800px;
		top:50px;
		left:100px;
	}
	
	.opt{
		position:relative;
		/*border:1px solid black;*/
		height:90px;
		width:125px;
		margin-top:10px;
		margin-left:20px;
		margin-right:0px;
		
	}
	
	.opt a{
		/*border:1px solid black;*/
		position:absolute;
		
		font-size:14px;
		color:grey;
	}
	
	.cover{
		height:22px;
		width:124px;
		position:absolute;
		
	}
	
	@-webkit-keyframes turns {
		  0%{
		    -webkit-transform: skew(40deg,0deg) translate(0);
		  }
		  10%{
		    -webkit-transform: skew(40deg,0deg) translate(-10px,0px);
		  }
		  30%{
		    -webkit-transform: skew(40deg,0deg) translate(9px,0px);
		  }
		  55%{
		    -webkit-transform: skew(40deg,0deg) translate(-7px,0px);
		  }
		  75%{
		    -webkit-transform: skew(40deg,0deg) translate(4px,0px);
		  }
		  90%{
		    -webkit-transform: skew(40deg,0deg) translate(-2px,0px);
		  }
		  95%{
		    -webkit-transform: skew(40deg,0deg) translate(1px,0px);
		  }
		  100%{
		    -webkit-transform: skew(40deg,0deg) translate(0);
		  }
		}
		
		@-webkit-keyframes turnss {
		  0%{
		    -webkit-transform:  translate(0);
		  }
		  10%{
		    -webkit-transform:  translate(-10px,0px);
		  }
		  30%{
		    -webkit-transform:  translate(9px,0px);
		  }
		  55%{
		    -webkit-transform:  translate(-7px,0px);
		  }
		  75%{
		    -webkit-transform:  translate(4px,0px);
		  }
		  90%{
		    -webkit-transform:  translate(-2px,0px);
		  }
		  95%{
		    -webkit-transform:  translate(1px,0px);
		  }
		  100%{
		    -webkit-transform:  translate(0);
		  }
		 }
</style>
	
<body>

	<%@ include file="afterLogin.jsp" %>
	<%
		currentUser = (String)session.getAttribute("currentUser");
		System.out.println("dashboard.jsp, the currentUser is : "+currentUser);
	%>
	
	<div class="box" >
			<b>Dashboard</b>
			<div class="yxj"></div>
			<div id="pro" class="allPro">
				<div class="bigbox">
					<div id="pro1" class="pro">
					</div>
					<b id="prob1" class="prob">1</b>
					<div class="opt">
						<a id="opt1" href="#" onclick="" style="top:2px;">1.initiate</a>
						<div id="cover1" class="cover" style="top:2px;"></div>
					</div>
				</div>
				
				
				<%
					RatingDAO rdao = new RatingDAO();
					List rList = rdao.findByTargetId(Long.parseLong(currentUser));
					String RID = "";
					int rListLength = rList.size();
					if(rListLength!=0){
						for( int i = 0 ; i < rListLength ; i++ ){
							Rating r = (Rating)rList.get(i);
							if(r.getToWhom().equals(Long.parseLong(currentUser))&&r.getFinished()==false&&r.getVolid()==true){
								RID = Long.toString(r.getRindx());
							}
						}
					}
				%>
				<div class="bigbox">
					<div id="pro2" class="pro">
					</div>
					<b id="prob2" class="prob">2</b>
					<div class="opt">
						<a id="opt2" href="performRating.jsp?rid=<%=RID %>" style="top:2px;">2.rating myself</a>
						<div id="cover2" class="cover" style="top:2px;"></div>
						<a id="opt3" href="./remindOthers" style="top:24px;">3.remind others</a>
						<div id="cover3" class="cover" style="top:24px;"></div>
						<a id="opt4" href="./NextStep" onclick="" style="top:46px;">4.next step</a>
						<div id="cover4" class="cover" style="top:46px;"></div>
					</div>
				</div>
				
				<div class="bigbox">
					<div id="pro3" class="pro">
					</div>
					<b id="prob3" class="prob">3</b>
					<div class="opt">
						<a id="opt5" href="#" onclick="" style="top:2px;">5.view report</a>
						<div id="cover5" class="cover" style="top:2px;"></div>
						<a id="opt10" href="./StartAPlan" onclick="" style="top:24px;">6.start plan</a>
						<div id="cover10" class="cover" style="top:24px;"></div>
						<a id="opt6" href="reviewActions.jsp" onclick="" style="top:46px;">7.review actions</a>
						<div id="cover6" class="cover" style="top:46px;"></div>
						<a id="opt7" href="agreePlan.jsp" onclick="" style="top:68px;">8.agree 2 things</a>
						<div id="cover7" class="cover" style="top:68px;"></div>
					</div>
				</div>
				
				<div class="bigbox">
					<div id="pro4" class="pro">
					</div>
					<b id="prob4" class="prob">4</b>
					<div class="opt">
						<a id="opt8" href="executePlan" onclick="" style="top:2px;">9.execute plan</a>
						<div id="cover8" class="cover" style="top:2px;"></div>
					</div>
				</div>
				
				<div class="bigbox">
					<div id="pro5" class="pro">
					</div>
					<b id="prob5" class="prob">5</b>
					<div class="opt">
						<a id="opt9" href="./EndCycle" style="top:2px;">10.end this cycle</a>
						<div id="cover9" class="cover" style="top:2px;"></div>
					</div>
				</div>
				
			</div >
			
			<div id="start" class="start">
				
				<div class="hero-unit" style="height:200px;padding:60px 0px 0px 60px;background-color:white;">
				<h1>
					Start a new  cycle
				</h1>
				
				<p>
					<a class="btn btn-primary btn-large" href="#" style="margin-top:30px;margin-left:50px;" onclick="window.location='./StartACycle'">start!</a>
				</p>
				</div>
			</div>
			
			<div style="position:absolute;height:300px;margin-left:100px;width:850px;margin-top:300px;overflow:auto;background-color:#ebebeb;">
				<table class="table table-striped">
					<thead>
					<tr>
						<th>
							task
						</th>
						<th>
							initiator
						</th>
						<th>
							my role
						</th>

					</tr>
				</thead>
				<tbody>
				<% 	
					int tasknum = 0;
					RatingDAO ratingdao = new RatingDAO();
					List rlist = ratingdao.findByToWhom(Long.parseLong(currentUser));
					int rlistLength = rlist.size();
					System.out.println("dashboard rlist.size="+rlistLength);
					for( int i = 0 ; i < rlistLength ; i++ ){
						Rating rating = (Rating)rlist.get(i);
						if((rating.getTargetId()!=rating.getToWhom())&&(!rating.getFinished())&&(rating.getVolid())){
							tasknum++;
							String rid = Long.toString(rating.getRindx());
							Long targerID = rating.getTargetId();
							EmployeeDAO employeedao = new EmployeeDAO();
							String initiator = ((Employee)employeedao.findById(rating.getTargetId())).getEname();
							String role="";
							LayerDAO layerdao = new LayerDAO();
							Long managerID = layerdao.findById(Integer.parseInt(employeedao.findById(Long.parseLong(currentUser)).getLayerId())).getManagerId();
							if(managerID.equals(targerID)){
								role = "direct report";
							}
							else if(layerdao.findById(Integer.parseInt(employeedao.findById(targerID).getLayerId())).getManagerId().equals(Long.parseLong(currentUser))){
								role = "manager";
							}else {
								role = "others";
							}
				%>
					<tr>
						<td>
							<a href="performRating.jsp?rid=<%=rid%>">give a rating</a>
						</td>
						<td>
							<%=rating.getTargetId()%>(<%=initiator %>)
						</td>
						<td>
						<%=role %>
						</td>
					</tr>
				<%
						}
					}
					for( int i = 0 ; i < rlistLength ; i++ ){
						Rating rating = (Rating)rlist.get(i);
						if(whatRole.ifManager(Long.parseLong(currentUser), rating.getTargetId())&&options.ifHaveAReport(rating.getTargetId())){
							
				%>
					<tr>
						<td>
							<a href="#">view a report</a>
						</td>
						<td>
							<%=rating.getTargetId()%>(<%=jobnumberToName.jobnumtoname(rating.getTargetId()) %>)
						</td>
						<td>
							manager
						</td>
					</tr>
				<%			
						}
					}
					
					for( int i = 0 ; i < rlistLength ; i++ ){
						Rating rating = (Rating)rlist.get(i);
						if(whatRole.ifManager(Long.parseLong(currentUser), rating.getTargetId())&&!options.ifApproved(rating.getTargetId())){
						tasknum++;
				%>
					<tr>
						<td>
							<a href="approvePlan.jsp">approve</a>
						</td>
						<td>
							<%=rating.getTargetId()%>(<%=jobnumberToName.jobnumtoname(rating.getTargetId()) %>)
						</td>
						<td>
							manager
						</td>
					</tr>
				<%
						}
					}
					System.out.println("tasknum="+tasknum);
					session.setAttribute("tasknum", tasknum);
					for( int i = 0 ; i < rlistLength ; i++ ){
						Rating rating = (Rating)rlist.get(i);
						if(!ifPlanEnd.ifplanend(rating.getTargetId())){
				%>
					<tr>
						<td>
							<a href="executePlan2.jsp">view plan progress</a>
						</td>
						<td>
							<%=rating.getTargetId()%>(<%=jobnumberToName.jobnumtoname(rating.getTargetId()) %>)
						</td>
						<td>
							manager
						</td>
					</tr>
				<% 
						}
					}
				%>						
				</tbody>
				</table>
			</div>
	</div>
	
	
	
	<%
		if(ifHaveACycle.ifHaveACycle(currentUser)){
	%>
		<script>
			$("#start").hide();
			//$("#pro").hide();
			//$("#pro1").css({"background-color":"#ff9018","border":"5px solid black"});
			//$("#prob1").css("color","black");
			//$("#href").removeAttribute("href");	
		</script>
	<%
		int step = options.whichStep(currentUser);
		if(step==67||step==8||step==9){
			PlanDAO plandao = new PlanDAO();
			List plist = plandao.findByTargetId(Long.parseLong(currentUser));
			int plistLength = plist.size();
			for( int i = 0 ; i < plistLength ; i++ ){
				Plan plan = (Plan)plist.get(i);
				if(!plan.getFinished()){
					String p = Long.toString(plan.getPid());
					session.setAttribute("pid", p);
				}
			}
		}
		System.out.println("step:"+step);
		int bigStep = options.OneToFive(step);
		System.out.println("bigStep:"+bigStep);
	%>
		<script>
			var pro = "#pro"+<%=bigStep%>;
			var prob = "#prob"+<%=bigStep%>;
			var step = <%=step%>;
			var tasknum = <%=tasknum %>;
			var $tasknum = $("#tasknum");
			
			if(tasknum==0){
				$tasknum.hide();
			}else{
				$tasknum.html(tasknum);
			}
			$(pro).css({"background-color":"#ff9018","border":"5px solid black"});
			$(prob).css("color","black");
			$("#opt6").hide();
			$("#opt7").hide();
			if(step==1){
				$("#cover1").hide();
				$("#opt1").css("color","#ff9018");
			}
			else if(step==2){
				$("#cover2").hide();
				$("#opt2").css("color","#ff9018");
			}
			else if(step==23){
				$("#cover2").hide();
				$("#opt2").css("color","#ff9018");
				$("#cover3").hide();
				$("#opt3").css("color","#ff9018");
			}
			else if(step==3){
				$("#cover3").hide();
				$("#opt3").css("color","#ff9018");
			}
			else if(step==34){
				$("#cover3").hide();
				$("#opt3").css("color","#ff9018");
				$("#cover4").hide();
				$("#opt4").css("color","#ff9018");
			}
			else if(step==67){
				$("#opt6").show();
				$("#opt7").show();
				$("#cover5").hide();
				$("#opt5").css("color","#ff9018");
				$("#cover6").hide();
				$("#opt6").css("color","#ff9018");
				$("#cover7").hide();
				$("#opt7").css("color","#ff9018");
			}
			else if(step==8){
				$("#opt6").show();
				$("#opt7").show();
				$("#cover5").hide();
				$("#opt5").css("color","#ff9018");
				$("#cover8").hide();
				$("#opt8").css("color","#ff9018");
			}
			else if(step==9){
				$("#opt6").show();
				$("#opt7").show();
				$("#cover5").hide();
				$("#opt5").css("color","#ff9018");
				$("#cover9").hide();
				$("#opt9").css("color","#ff9018");
			}
			else if(step==10){
				$("#cover5").hide();
				$("#opt5").css("color","#ff9018");
				$("#cover10").hide();
				$("#opt10").css("color","#ff9018");
			}
		</script>	
	<%	
		}else{
	%>
		<script>			
			$("#pro").hide();
			//$("#start").show();
		</script>
	<%
		}
		
	%>

</body>
</html>
