<%@page import="java.util.List"%>
<%@page import="po.*"%>
<%@page import="servlet.*"%>
<%@ page import="java.util.Iterator"%>
<%@ page language="java" contentType="text/html; charset=utf8"
	pageEncoding="utf8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf8">
<title>perform rating</title>
<script type="text/javascript" scr="js/jquery1.83.js"></script>

<script Language="javaScript">
	function validate() {
		//	var list = document.getElementsByTagName("input");
		//	int a = list.length();
		//List list1 = AnswersDAO.ret();
		//	if (a < list1.size()){
		/*int i = 0;
		while (i <= list1.size()){
			var que = 'que'+i;
			//document.getElementByName(que).value=='';
			window.alert(document.getElementByName(que).value);
			 if(document.getElementByName(que).value=='')//document.getElementByName('myform').child
		     {   
		             alert("please answer all the questions!");   
		             document.myform.que_i.focus();   
		             return false;   
		     }   
			 i++;
			
		}
		return true;*/
		var object = document.getElementById('myform');
		var a = 0;
		var que_num = (object.length - 1) / 6;
		var j = 0;
		//window.alert(que_num);
		for ( var i = 0; i < object.length - 1; i = i + 6) {
			//if(object[i].type==)
			//window.alert(object[i].type);
			var name = 'que_' + j;
			if (object[i].checked == false && object[i + 1].checked == false
					&& object[i + 2].checked == false
					&& object[i + 3].checked == false
					&& object[i + 4].checked == false) {
				//window.alert("第"+(j+1)+"题没填！！");
				a = a + 1;
			}
			j = j + 1;
		}
		//window.alert(a);
		if (a != 0) {
			window.alert("You donot answer all the question, please check.");
			return false;
		} else
			return true;
		//document.getElementById('myform').submit();
		//$("#myform").submit();
		//window.alert(document.getElementById('que_1').length);
	}
</script>

</head>
<body>

	<h1 align="center">Perform rating</h1>
	<form id="myform" action="./performServlet" method="post"
		onsubmit="return validate()">

		<div>
			<h5>
				FOR--Target ID:


				<%
				List list = AnswersDAO.ret();
				AnswersDAO anDao = new AnswersDAO();
				if (list != null) {
					Iterator itr = list.iterator();
					int i = 0;
					while (itr.hasNext()) {

						Questions nextObj = (Questions) itr.next();
			%>
				<div style="background: pink; margin-top: 20px; max-width: 580px;">
					<%=i + 1%>
					<br>
					<%=nextObj.getContent()%>
					<br /> 0:<input type="radio" id=<%="que_" + i%>
						name=<%="que_" + i%> value="0" /> <br /> 1:<input type="radio"
						id=<%="que_" + i%> name=<%="que_" + i%> value="1" /> <br /> 2:<input
						type="radio" id=<%="que_" + i%> name=<%="que_" + i%> value="2" />
					<br /> 3:<input type="radio" id=<%="que_" + i%>
						name=<%="que_" + i%> value="3" /> <br /> 4:<input type="radio"
						id=<%="que_" + i%> name=<%="que_" + i%> value="4" /> <br />
					comments here: <input type="text" name=<%="comm_" + i%> value="">
				</div>
				<%
					i++;
						}
					}
				%>
			</h5>
		</div>
		<br /> <br /> <input type="submit" name="submit" value="Submit Now!">

	</form>


</body>
</html>