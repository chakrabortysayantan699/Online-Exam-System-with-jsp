<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.connection.*"%>
<%@ page import="java.sql.*"%>

<%
String uid=session.getAttribute("uid").toString();
int id=Integer.parseInt(uid);
String pass=request.getParameter("password");
String pass1=request.getParameter("confpass");

try{
				Class.forName("com.mysql.jdbc.Driver");
				Connection con =DriverManager.getConnection ("jdbc:mysql://localhost:3306/test","root","papon728**");
				if(pass.equals(pass1)){
					PreparedStatement stmt=con.prepareStatement("update student set upass=? where id=?");
				stmt.setString(1,pass1);
				stmt.setInt(2,id);

				int x=stmt.executeUpdate();
				if(x>0){
					response.sendRedirect("reqSuc.html");
				}else{
					out.println("Update Failed ");
				}
			}
			else{
					out.println("Update Failed ");
				}


		}
			catch(Exception e){
				out.println(e);
			}

				
				


				
    	 %>




%>