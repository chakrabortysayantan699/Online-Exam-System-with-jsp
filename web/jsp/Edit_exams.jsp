<%@ page language="java" contentType="text/html"  pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet" href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>

<script type="text/javascript">
 function up(){
    $("#myModal").modal('show');
  };

</script>


<!doctype html>
<html class="no-js" lang="">
    <head>
       
    </head>
    <body onload="up()">
    	<div id="myModal" class="modal fade">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="w3-panel w3-green">Alert</h5>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
            <div class="modal-body">
        <p>Please insert everything carefully</p>
                <form action="AdminPage.jsp" >
                    <ul>
                <li>you have entered something wrong</li>
                <br>
              </ul>
              <input type="submit" name="" value="Go back">
                </form>
            </div>
        </div>
    </div>
</div>

        
 <%
String id1=request.getParameter("exam_id");
int id=Integer.parseInt(id1);
String exam_name=request.getParameter("exam_name");
String dur=request.getParameter("duration");
int duration=Integer.parseInt(dur);

try {
	Class.forName("com.mysql.jdbc.Driver");
	Connection con =DriverManager.getConnection ("jdbc:mysql://localhost:3306/test","root","papon728**");
	PreparedStatement ps=con.prepareStatement("update  exam_name set topicName=?,time=? where ex_id=?");
	ps.setString(1,exam_name);
	ps.setInt(2,duration);
	ps.setInt(3,id);
	int x=ps.executeUpdate();
	if (x>0){
		response.sendRedirect("AdminPage.jsp");
    }

%>



<%


	
}catch(Exception e){
	out.println(e);
}

						


%>


</body>
</html>