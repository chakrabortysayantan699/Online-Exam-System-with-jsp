<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ page import="java.sql.*"%>
<!doctype html>
<html class="no-js" lang="">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>Online Exam System</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <link rel="manifest" href="site.webmanifest">
        <link rel="apple-touch-icon" href="icon.png">
        <!-- Place favicon.ico in the root directory -->

        <link rel="stylesheet" href="css/normalize.css">
        <link rel="stylesheet" href="css/main.css">
    </head>
    <body>
    	<%
    	        String id1=request.getParameter("sid");
				int id=Integer.parseInt(id1);
				String name=request.getParameter("sname");
				String email=request.getParameter("email");
				String address=request.getParameter("address");
				String edu=request.getParameter("education");
    	try{
				Class.forName("com.mysql.jdbc.Driver");
				Connection con =DriverManager.getConnection ("jdbc:mysql://localhost:3306/test","root","papon728**");

				


				PreparedStatement stmt=con.prepareStatement("update student set studentName=?,email=?,address=?,education=? where id=?");
				stmt.setString(1,name);
				stmt.setString(2,email);
				stmt.setString(3,address);
				stmt.setString(4,edu);
				stmt.setInt(5,id);

				int x=stmt.executeUpdate();
				if(x>0){
					response.sendRedirect("admin_profile.jsp");
				}else{
					out.println("Update Failed : id doesn't exists");
				}
			}
			catch(Exception e){
				out.println(e);
			}
    	 %>
        

       
        
    </body>
</html>