
<%@ page import="java.sql.*" %>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title></title>
	<link rel="stylesheet" type="text/css" href="css/style_admin.css">
	<link rel="stylesheet" type="text/css" href="css/style_backend.css">
	<link rel="stylesheet" type="text/css" href="css/style_front.css">
	<link rel="stylesheet" type="text/css" href="css/web1.css">
</head>
<body>
	
         <!-- SIDEBAR -->
			<div class="sidebar" style="background-image: url(sidebar-1.jpg)">
				<div class="sidebar-background" >
					<h2 class="logo-text">
						Online Examination System
					</h2>

					<div class="left-menu">
						<a class="active" href="adm-page.jsp?pgprt=0"><h2>Profile</h2></a>
						<a href="adm-page.jsp?pgprt=2"><h2>Courses</h2></a>
                                                <a href="adm-page.jsp?pgprt=3"><h2>Questions</h2></a>
						<a href="adm-page.jsp?pgprt=1"><h2>Accounts</h2></a>
					</div>
				</div>
			</div>
            <!-- CONTENT AREA -->
			<div class="content-area">
                            <div class="panel" style="float: left;max-width: 600px">
        
                                
        
            
           <div class="title">Profile</div>
           <div class="profile ">
           	<%
	String uname=(String)session.getAttribute("uname");
	Class.forName("com.mysql.jdbc.Driver");
	Connection con =DriverManager.getConnection ("jdbc:mysql://localhost:3306/test","root","papon728**");
	PreparedStatement stmt1=con.prepareStatement("select * from student where uname=?");
	stmt1.setString(1,uname);
	ResultSet rs=stmt1.executeQuery();
	while (rs.next()) {
		
	
	 %>
               <h2><span class="tag">Your Name</span><span class="val"><%=rs.getString(2) %></span><br/>
               <span class="tag">Email</span><span class="val"><%=rs.getString(3) %></span><br/>
               <span class="tag">education</span><span class="val"><%=rs.getString(5) %></span><br/>
               <span class="tag">UseName</span><span class="val"><%=rs.getString(6) %></span><br/>
               <span class="tag">Address</span><span class="val"><%=rs.getString(4) %></span></h2>
           </div>
               <br/>

               <a href="std-page.jsp?pgprt=0&pedt=1"><span class="add-btn">Edit Profile</span></a>
               
     <% } %>  
           
    
        </div>
    </div>
    </body>
</html>