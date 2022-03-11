<%@ page language="java" contentType="text/html"  pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<%
String id1=request.getParameter("Qu_id");
int id=Integer.parseInt(id1);
try {
	Class.forName("com.mysql.jdbc.Driver");
	Connection con =DriverManager.getConnection ("jdbc:mysql://localhost:3306/test","root","papon728**");
	PreparedStatement ps=con.prepareStatement("delete from  questions  where id= ?");
	ps.setInt(1,id);
	int x=ps.executeUpdate();
	if (x>0){
		response.sendRedirect("AdminPage.jsp");

%>



<%


	}
}catch(Exception e){
	out.println(e);
}
%>
