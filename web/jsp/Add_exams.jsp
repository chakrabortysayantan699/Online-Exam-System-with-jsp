<%@ page language="java" contentType="text/html"  pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<%
String id1=request.getParameter("exam_id");
int id=Integer.parseInt(id1);
String exam_name=request.getParameter("exam_name");
String dur=request.getParameter("duration");
int duration=Integer.parseInt(dur);

try {
	Class.forName("com.mysql.jdbc.Driver");
	Connection con =DriverManager.getConnection ("jdbc:mysql://localhost:3306/test","root","papon728**");
	PreparedStatement ps=con.prepareStatement("insert into exam_name values(?,?,?)");
	ps.setString(1,exam_name);
	ps.setInt(2,duration);
	ps.setInt(3,id);
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
