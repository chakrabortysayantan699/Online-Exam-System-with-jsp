<%@ page language="java" contentType="text/html"  pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.security.SecureRandom" %>
<%
String name=request.getParameter("name");
String email=request.getParameter("email");
String pass=request.getParameter("pass");
String pass1=request.getParameter("re_pass");
String add=request.getParameter("address");
String edu=request.getParameter("edu");
String uname=request.getParameter("uname");
SecureRandom random = new SecureRandom();
int num = random.nextInt(100000);
String formatted = String.format("%05d", num); 
int getid=Integer.parseInt(formatted);



if(pass.equals(pass1)){

	
	try{

		Class.forName("com.mysql.jdbc.Driver");
		Connection con =DriverManager.getConnection ("jdbc:mysql://localhost:3306/test","root","papon728**");
		PreparedStatement stmt1=con.prepareStatement("insert into student values(?,?,?,?,?,?,?)");
		stmt1.setInt(1,getid);
		stmt1.setString(2,name);
		stmt1.setString(3,email);
		stmt1.setString(4,add);
		stmt1.setString(5,edu);
		stmt1.setString(6,uname);
		stmt1.setString(7,pass);
		int x=stmt1.executeUpdate();
				if(x>0){
					response.sendRedirect("index_msg.html");
				}else{
					out.println("update failed");
				}
		}catch(Exception e){
			out.println(e);
		}
}else{
	response.sendRedirect("index.html");
}


%>