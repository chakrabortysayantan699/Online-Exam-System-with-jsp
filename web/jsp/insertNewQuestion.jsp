<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<% 


try{
	int id=0;
	int use_id=0;

	String selectTopic=request.getParameter("selectTopic");
	String question=request.getParameter("question");
	String option_1=request.getParameter("option1");
	String option_2=request.getParameter("option2");
	String option_3=request.getParameter("option3");
	String option_4=request.getParameter("option4");
	String cans=request.getParameter("correctAnswer");
	System.out.println("selectTopic  "+selectTopic);
	System.out.println("selectTopic  "+question);
	System.out.println("selectTopic  "+option_1);

	Class.forName("com.mysql.jdbc.Driver");
	Connection con =DriverManager.getConnection ("jdbc:mysql://localhost:3306/test","root","papon728**");
	ResultSet rs=con.createStatement().executeQuery("select max(id1) from (select id as id1 from questions)as t");
	while(rs.next()){
		id=rs.getInt(1);
		use_id=id+1;
	
	}
	int myid=0;
	 
    System.out.println(myid);
	PreparedStatement stmt1 = con.prepareStatement("insert into questions values(?,?,?,?,?,?,?,?) ");
	stmt1.setInt(1,use_id);
	stmt1.setString(2,question);
	stmt1.setString(3,option_1);
	stmt1.setString(4,option_2);
	stmt1.setString(5,option_3);
	stmt1.setString(6,option_4);
	stmt1.setString(7,cans);
	stmt1.setString(8,selectTopic);
	stmt1.executeUpdate();

	response.sendRedirect("newQuestion_msf.html");

}catch(Exception e){
	out.println(e);
}


%>