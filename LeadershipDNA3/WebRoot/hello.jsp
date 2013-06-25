<%@ page language="java" contentType="text/html; charset=utf8"
    pageEncoding="utf8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <title>bootstrap学习 by 司徒正美</title>
        <meta http-equiv="Content-type" content="text/html; charset=utf-8">

        <!--  <link rel="stylesheet" href="http://files.cnblogs.com/rubylouvre/bootstrap.css"/> -->
        <script src="js/jquery1.83.js" > </script>
        <script src="js/bootstrap-transition.js"></script>
        <script src="js/bootstrap-modal.js"></script>
        <script src="js/bootstrap-button.js"></script>
		<link rel="stylesheet" type="text/css" href="css/bootstrap.css">



        <script>
            $(function(){
                //$("#static").modal();
                
 
                $('#myModal').on('show', function () {
                   // alert("show");
                });
                $('#myModal').on('shown', function () {
                   // alert("shown");
                });
                $('#myModal').on('hide', function () {
                   // alert("hide");
                });
                $('#myModal').on('hidden', function () {
                   // alert("hidden");
                });
            });
             
        </script>
    </head>
    <body>
        <p>静态</p>
        
        <p>动态</p>
        <a href="#myModal" role="button" class="btn" data-toggle="modal">Launch demo modal</a>

        <!-- Modal -->
        <div id="myModal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h3 id="myModalLabel">Modal header</h3>
            </div>
            <div class="modal-body">
                <p>输入有误！！！</p>
            </div>
            <div class="modal-footer">
                <button class="btn" data-dismiss="modal" aria-hidden="true">Close</button>
                <button class="btn btn-primary">Save changes</button>
            </div>
        </div>
    </body>
</html>
