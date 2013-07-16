<%@ page language="java" contentType="text/html; charset=utf8"
	pageEncoding="utf8"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Collections"%>
<%@page import="po.*"%>
<%@page import="servlet.*"%>
<%@ page import="java.util.Iterator"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html lang="en">
<script src="js/jquery1.83.js">
	
</script>
<script src="js/bootstrap-transition.js"></script>
<script src="js/bootstrap-modal.js"></script>
<script src="js/bootstrap-button.js"></script>
<link rel="stylesheet" type="text/css" href="css/bootstrap.css">

<head>
<title>execute plan of manager</title>

<script>
		
	function more() {
	//	var index = document.getElementById("aaa").value;
		index++;
		$('.add')
				.append(
						'<tr id="'+index+'"><td>'
								+ index
								+ '</td><td><input type="text" name="content"></td><td><button class="btn" type="button" onClick="removeR('
								+ index + ')">delete</button></td></tr >');

	}
	function removeR(id) {
		$("#" + id).remove();

	}
</script>
</head>

<body>
<%@ include file="staticTitle.jsp" %>

	<div class="container-fluid">
		<div class="row-fluid">
			<div class="span12">
				<h3 class="text-center">Execute Plan of your employee:</h3>
				<%
					//maybe add the name of the employee!
				%>
				<table class="table table-bordered table-hover">
					<thead>
						<tr>
							<th>Action No.</th>
							<th>content</th>
							<th>link</th>
							<th>due date</th>
							<th>support</th>
							<th>if finished</th>
						</tr>
					</thead>
					<tbody>
						<%
							//	HttpSession session = request.getSession();
							//session.setAttribute("planID", "2");
							String spid = (String) session.getAttribute("pid");
							Long pid = Long.parseLong(spid);

							ChosenActionsDAO cho = new ChosenActionsDAO();
							List mylist = cho.findAllAndOrderByProperty(cho.DUEDATE, true);
							if (mylist != null) {
								Iterator itr = mylist.iterator();
								int i = 1;
								while (itr.hasNext()) {
									ChosenActions nextObj = (ChosenActions) itr.next();
									if (nextObj.getPid() == pid) {
										// NEED REVISE LATER!==pid
						%>

						<tr class="success">
						
							<td><%=i%></td>
							<td><%=nextObj.getCusActions().getContent()%></td>
							<td><a href="<%=nextObj.getCusActions().getLink()%>"><%=nextObj.getCusActions().getLink()%></a></td>
							<td><%=nextObj.getSDueDate()%></td>
							<td><%=nextObj.getSupport()%></td>
							<td><%=nextObj.getifFinished()%></td>
							<%
								i = i + 1;
										}
									}
								}
							%>
						</tr>

					</tbody>
				</table>
				<form id="execteform2" action="./executeServlet2" method="post">

					<div class="container-fluid">
						<div class="row-fluid">
							<div class="span12">
								<legend>Remarks about the plan</legend>
								<table class="table table-striped">
									<thead>
										<tr>
											<th>No.</th>
											<th>content</th>
										</tr>
									</thead>
									<tbody class="add">
										<%
										int a = 1;
										RemarksDAO remcho = new RemarksDAO();
										List list3 = remcho.findAll();
										if (list3 != null) {
											Iterator itr = list3.iterator();
											while (itr.hasNext()) {
												Remarks nextObj = (Remarks) itr.next();
												if (nextObj.getPlan().getPid() == pid) {
										%>
										<tr>
											<td><%=a%></td>
											<td><%=nextObj.getContent()%></td>
											<%
								a = a + 1;
										}
									}
								}
							%>
							</tr>
						               	<td><%=a%></td>
							 				<td><input type="text" name="content" /></td>
											<td><button type="button" class="btn" />delete
												</button></td>
									</tbody>
								</table>
							</div>
						</div>
					</div>
					<input type = "hidden" id="aaa" value="<%=a%>">
					<script>
					var index = document.getElementById("aaa").value;
					</script>
					<button type="button" class="btn" onClick="more()">add
						more</button>
					<br>
					<center>
						<button type="submit" class="btn">submit all</button>
					</center>
				</form>




				<p class="lead">Progress Bar Of Execution</p>
				<div class="progress progress-success">
					<div class="bar"></div>
				</div>
			</div>
		</div>
	</div>


</body>


</html>
