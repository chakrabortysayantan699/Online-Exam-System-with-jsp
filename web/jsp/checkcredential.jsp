<%@ page language="java" contentType="text/html"  pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<% 
String uname=request.getParameter("uname") ;
String psw=request.getParameter("psw");
String ent_capctha=request.getParameter("vercode");
String captcha=(String)session.getAttribute("captcha");


try {
	response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");
	Class.forName("com.mysql.jdbc.Driver");
	Connection con =DriverManager.getConnection ("jdbc:mysql://localhost:3306/test","root","papon728**");
	PreparedStatement stmt1 = con.prepareStatement("select upass,id from student where uname= ? ");
	stmt1.setString(1,uname);

	ResultSet rs1=stmt1.executeQuery();
	rs1.next();
	String pass=rs1.getString(1);
	int uid=rs1.getInt(2);
	System.out.println(uname);
	out.println(uid);
	System.out.println(ent_capctha);
	System.out.println(captcha);
	session.setAttribute("uid",uid);
	session.setAttribute("uname",uname);
	

	
	if(pass.equals(psw)){


		Cookie ob= new Cookie("pass",uname);
		response.addCookie(ob);
		if(uname.equals("admin")){
			response.sendRedirect("AdminPage.jsp");
		}
		else{
		out.println(uname);
		RequestDispatcher rd = request.getRequestDispatcher("afterStudentLogin.jsp");
		rd.forward(request, response);
	
	}		


%>

<%
		
		
    }

	
	else{
		String site = new String("index.html");
		response.setStatus(response.SC_MOVED_TEMPORARILY);
		response.setHeader("Location", site); 		

	}
	
	
	
	}

	catch(Exception e){
		out.println(e);
	}

%>
<!-- response.sendRedirect('index.html') -->