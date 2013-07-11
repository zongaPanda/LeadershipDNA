<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
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
<title>execute plan</title>


</head>

<body>


	<form id="execteform" action="./executeServlet" method="post">

		<div class="container-fluid">
			<div class="row-fluid">
				<div class="span12">
					<h3 class="text-center">Execute Plan</h3>

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
								session.setAttribute("planID", "2");
								String spid = (String) session.getAttribute("planID");
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
								<td><input type="button" id=<%="myButton_" + i%>
									value="finished!!" <%if (nextObj.getFinished()) {%>
									disabled="disabled" <%}%> class="btn"
									onclick="window.location='executeServlet?aid=<%=nextObj.getCusActions().getAid()%>&pid=<%=nextObj.getPid()%>' ">
								</td>
								<%
									i = i + 1;
											}
										}
									}

									String ifEnd = (String) session.getAttribute("ifEnd");
									if (ifEnd == "OK") {
								%>

								<script type="text/javascript" language="javascript">
									alert("Congratulations! You have finished this plan!");
								</script>
								<%
									}
								%>
							</tr>
						</tbody>
					</table>

					<div class="container-fluid">
						<div class="row-fluid">
							<div class="span12">
								<legend>Remarks of the Line Manager</legend>
								<table class="table table-striped">
									<thead>
										<tr>
											<th>No.</th>
											<th>content</th>
										</tr>
									</thead>
									<tbody class="add">
										<%
											RemarksDAO remcho = new RemarksDAO();
											List mylist2 = remcho.findAll();
											if (mylist2 != null) {
												Iterator itr2 = mylist2.iterator();
												int i = 1;
												while (itr2.hasNext()) {
													Remarks nextObj = (Remarks) itr2.next();
													if (nextObj.getPlan().getPid() == pid) {
										%>
										<tr>
											<td><%=i%></td>
											<td><%=nextObj.getContent()%></td>
											<%
												i = i + 1;
														}
													}
												}
											
											RemarksDAO remdao = new RemarksDAO();
											List list2 = remdao.findAll();
											
											for (int i = 0; i < list2.size(); i++) {
												if (pid == ((Remarks) list2.get(i)).getPlan().getPid()) {
													remdao.updateIsRead((Remarks) list2.get(i));
												}
											}
											
											%>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
					</div>

					<p class="lead">Progress Bar Of Execution</p>
					<div class="progress progress-success">
						<div class="bar"></div>
					</div>
				</div>
			</div>
		</div>

	</form>

</body>


</html>
