<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<% 


try{
	int id=0;
	int use_id=0;
    String qid=request.getParameter("id");
    int questionId=Integer.parseInt(qid);
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
	PreparedStatement stmt1 = con.prepareStatement("update  questions set question=?,option1=?,option2=?,option3=?,option4=?,answer=?,subjectTopic=? where id=? ");
	stmt1.setInt(8,questionId);
	stmt1.setString(1,question);
	stmt1.setString(2,option_1);
	stmt1.setString(3,option_2);
	stmt1.setString(4,option_3);
	stmt1.setString(5,option_4);
	stmt1.setString(6,cans);
	stmt1.setString(7,selectTopic);
	int x=stmt1.executeUpdate();
	if(x>0){
		response.sendRedirect("AdminPage.jsp");
	}
	else{
		out.println("update failed");
	}

	

}catch(Exception e){
	out.println(e);
}


%>