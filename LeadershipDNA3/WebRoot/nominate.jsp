<%@ page import="po.Employee" %>
<%@ page import="method.findRelationship" %>
<%@ page import ="java.util.Iterator"%>
<%@ page import ="java.util.List"%>
<!doctype html>
<html lang="en">
<head>
	
	<title>nominate</title>
	<link rel="stylesheet" href="css/jquery.ui.all.css">
	<script src="js/jquery-1.9.1.js"></script>
	<script src="js/jquery.ui.core.js"></script>
	<script src="js/jquery.ui.widget.js"></script>
	<script src="js/jquery.ui.accordion.js"></script>
	<script src="js/jquery.ui.button.js"></script>
	<link rel="stylesheet" href="css/demos.css">
	<link rel="stylesheet" href="css/jquery-ui-1.10.3.custom.min.css">
	
	<script>
	$(function() {
		$( "#accordion" ).accordion({
			collapsible: true
		});
	});
	</script>
	
		<script >
      function SelectLeastOne(e){
        object= document.getElementById("nominate"); 
        var directs=0;
        var others=0;
        //boolean islegal=true;
        window.alert(object.length);
<<<<<<< HEAD
    
        for (var i=0; i < object.length; i++){
        	//window.alert('hehe');
        	//window.alert('object['+i+'].type='+object[i].type+'     '+object[i].checked);
=======
        //request.setParameter("isle",false);
        var len = object.length;
        var i = 0 ; 
       // window.alert('hehe');
        for(i=0; i<len ; i++){
        	//window.alert('hehe');
        	//window.alert('object['+i+'].type='+object[i].type+'     '+object[i].checked+'  object\'s name is :'+object[i].value);
>>>>>>> refs/remotes/origin/master
                if ( object[i].type=="checkbox" &&  object[i].checked ){    
                	if(object[i].name=="d")
                		directs++;
                	else if(object[i].name=="o")
                		others++;
<<<<<<< HEAD
                //	alert('you have nominated '+ object[i].name);    
=======
                	//alert('you have nominated '+ object[i].name);    
>>>>>>> refs/remotes/origin/master
               // 	alert(directs);
                }
<<<<<<< HEAD
        }   
        if ( directs>0 && directs<3){
        	
=======
        }  
        var TorF = true;
       if ( directs>0 && directs<3){
        	//request.setParameter("islegal",false);
>>>>>>> refs/remotes/origin/master
        	alert("you need to nominate at least three direct reports");
        	//window.navigate("nominate.jsp"); 
<<<<<<< HEAD
        	return false;
=======
        	TorF = false;
        	//return false;
>>>>>>> refs/remotes/origin/master
        }
        if ( others>0 && others<3){
        	//request.setParameter("islegal",false);
        	alert("you need to nominate at least three others");
        	//window.navigate("nominate.jsp"); 
<<<<<<< HEAD
        	return false;
=======
        	TorF = false; 	
        	//return false;
>>>>>>> refs/remotes/origin/master
        }
<<<<<<< HEAD
        
=======
        return TorF;
>>>>>>> refs/remotes/origin/master
        $("#nominate").submit();
}
</script>

</head>
<body>
<%//session.setAttribute("currentUser", "106860");
  String suid=(String)session.getAttribute("currentUser");
  long uid=Long.parseLong(suid);%>
<form id="nominate" action="startPlan" method="post">
<div id="accordion">

	<h3>line manager(mandatory)</h3>
		<div>
			<%findRelationship p=new findRelationship();
			  Employee em=p.findManager(uid);
			 %>
			  <input type="checkbox" name="m" value ="<%=em.getUid() %>" disabled="disabled" checked="checked" ><%=em.getEname() %><br>
		</div>
	<h3>direct reports(optional)</h3>
	
	<div id="directs">
		<% List l=p.findDirects(uid);
		if(l!=null){
		Iterator itr = l.iterator();
		while (itr.hasNext()) {
			
		    Employee nextObj = (Employee) itr.next();
		   %>
		    <input type="checkbox"  name="d" value ="<%=nextObj.getUid() %>" ><%=nextObj.getEname() %><br>
		    <% 
		}
		}%>
	</div>
	
	<h3>others(optional)</h3>
	
	<div id="others">
		<% List l2=p.findOthers(uid);
		if(l2!=null){
		Iterator itr2 = l2.iterator();
		while (itr2.hasNext()) {
			
		    Employee nextObj = (Employee) itr2.next();
		   %>
		    <input type="checkbox"  name="o" value ="<%=nextObj.getUid() %>" ><%=nextObj.getEname() %><br>
		    <% 
		}
		}%>
	</div>
	
</div>



<div class="demo-description">
<p>By default, accordions always keep one section open. To allow for all sections to be be collapsible, set the <code>collapsible</code> option to true. Click on the currently open section to collapse its content pane.</p>
</div>
<<<<<<< HEAD
<input type="button" value="submit" onclick="SelectLeastOne()" class="ui-button ui-widget ui-state-default ui-corner-all" role="button" aria-disabled="false">
=======
<input type="button" value="submit" onclick="SelectLeastOne(this)" class="ui-button ui-widget ui-state-default ui-corner-all" role="button" aria-disabled="false">
>>>>>>> refs/remotes/origin/master
</form>
</body>
</html>
