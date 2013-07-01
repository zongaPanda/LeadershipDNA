<%@page import="test.getQuestion"%>
<%@page import="java.util.List" %>
<%@page import="po.*" %>
<%@page import="servlet.*" %>
<%@ page language="java" contentType="text/html; charset=utf8"
    pageEncoding="utf8"%>
<%@page import="test.getQuestion" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf8">
<title>perform rating</title>
</head>
<body>

<h1 align="center">Perform rating for the rater:</h1>
<form name="perform" action="./performServlet?action=getQuestion" method="post">

<div>
	<h5>Rater ID:    <%
		List list= test.getQuestion.ret();
		for(int i = 0 ; i < list.size() ; i++ ){
	%>
		<div style="background: yellow; margin-top: 20px;max-width: 500px;">
		<%=((Questions)list.get(i)).getQid() %>
		<br>
		<%=((Questions)list.get(i)).getContent() %>
		    <br />
			0:<input type="radio" name=<%= "que_"+ i %> value="0"  />
			<br />
			1:<input type="radio" name=<%= "que_"+ i %> value="1"  />
			<br />
			2:<input type="radio" name=<%= "que_"+ i %> value="2"  />
			<br />
			3:<input type="radio" name=<%= "que_"+ i %> value="3"  />
			<br />
			4:<input type="radio" name=<%= "que_"+ i %> value="4"  />
			<br />
			comments here:<input type="text"  name = <%= "comm_"+ i %>  value="">

		</div> 
		<%
	}
    %>
	</h5>
</div>
<br />
<br />
	
    <input type="submit" name="submit" value="Submit Now!">

</form>


</body>
</html>