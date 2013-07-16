<%@page import="java.util.List"%>
<%@page import="po.*"%>
<%@page import="servlet.*"%>
<%@ page import="java.util.Iterator"%>
<%@ page language="java" contentType="text/html; charset=utf8"
	pageEncoding="utf8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html lang="en">
<script src="js/jquery1.83.js"></script>
<script src="js/bootstrap-transition.js"></script>
<script src="js/bootstrap-modal.js"></script>
<script src="js/bootstrap-button.js"></script>
<link rel="stylesheet" type="text/css" href="css/bootstrap.css">


<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf8">
<title>perform rating</title>
<script type="text/javascript" scr="js/jquery1.83.js"></script>

<script Language="javaScript">

	function validate() {
		var object = document.getElementById('myform');
		var a = 0;
		var que_num = (object.length - 1) / 6;
		var j = 0;
		for ( var i = 0; i < object.length - 1; i = i + 6) {
			var name = 'que_' + j;
			if (object[i].checked == false && object[i + 1].checked == false
					&& object[i + 2].checked == false
					&& object[i + 3].checked == false
					&& object[i + 4].checked == false) {
				a = a + 1;
			}
			j = j + 1;
		}
		if (a != 0) {
			window.alert("You donot answer all the question, please check.");
			return false;
		} else
			return true;
	}
</script>

</head>
<body>
	<%@ include file="staticTitle.jsp" %>
	<%
		String rid = request.getParameter("rid");
	%>

	<h3 class="text-center">Perform rating</h3>
	<form id="myform" action="./performServlet?rid=<%=rid %>" method="post" onsubmit="return validate()">

		<div class="container-fluid">
			<div class="row-fluid">
				<div class="span12">
					<table class="table table-hover">
						<thead>
							<tr>
								<th>No.</th>
								<th>Questions</th>
								<th>chosen</th>
								<th>comments</th>
							</tr>
						</thead>
						<tbody>
						<%
									List list = AnswersDAO.ret();
									AnswersDAO anDao = new AnswersDAO();
									if (list != null) {
										Iterator itr = list.iterator();
										int i = 0;
										while (itr.hasNext()) {
											Questions nextObj = (Questions) itr.next();
								%>
						
							<tr class="warning">
								
								<td>
									<%=i + 1%>
								</td>
								
								<td>
									<%=nextObj.getContent()%>
								</td>
								
								<td>
									&nbsp;0:
									<input type="radio" id=<%="que_" + i%> name=<%="que_" + i%> value="0" /> 
									&nbsp;1:
									<input type="radio" id=<%="que_" + i%> name=<%="que_" + i%> value="1" /> 
									&nbsp;2:
									<input type="radio" id=<%="que_" + i%> name=<%="que_" + i%> value="2" />
									&nbsp;3:
									<input type="radio" id=<%="que_" + i%> name=<%="que_" + i%> value="3" />  
									&nbsp;4:
									<input type="radio" id=<%="que_" + i%> name=<%="que_" + i%> value="4" />
								</td>
								
								<td>
									<input type="text" name=<%="comm_" + i%> value="">
								</td>


								<%
									i++;
										}
									}
								%>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>




		<br /> <br />
		<center>
			<button type="submit" class="btn">Submit Now!</button>
		</center>

	</form>


</body>
</html>