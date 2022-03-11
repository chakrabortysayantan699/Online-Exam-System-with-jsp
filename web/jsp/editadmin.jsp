<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">


<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1" />
<meta name="description" content="" />
<meta name="author" content="" />
<!--[if IE]>
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <![endif]-->
<title>Online Exam System</title>
<!-- BOOTSTRAP CORE STYLE  -->
<link href="css/bootstrap.min.css" rel="stylesheet" />
<!-- FONT AWESOME STYLE  -->
<link href="assets/css/font-awesome.css" rel="stylesheet" />
<!-- CUSTOM STYLE  -->
<link href="css/style.css" rel="stylesheet" />
<link rel="stylesheet" type="text/css" href="css/w3.css">
<!-- GOOGLE FONT -->
<link href='http://fonts.googleapis.com/css?family=Open+Sans'
	rel='stylesheet' type='text/css' />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>

  <div class="w3-sidebar w3-bar-block w3-card w3-animate-left" style="display:none" id="mySidebar">
  <button class="w3-bar-item w3-button w3-large w3-hover-cyan"onclick="w3_close()">Close &times;</button>
  
   <a href="editadmin.jsp" class="w3-bar-item w3-button w3-hover-green">Profile</a>


  <a href="#main" class="w3-bar-item btn w3-hover-purple">exams</a>
  <a href="admin_profile.jsp" class="w3-bar-item w3-button w3-hover-orange">Accounts</a>
  <a href="admin_results.jsp" class="w3-bar-item w3-button w3-hover-teal">Results</a>
  <a href="index.html" class="w3-bar-item w3-button w3-hover-red">Log out</a>
</div>
	<%
		if (session.getAttribute("uname") != null && session.getAttribute("uname") != "") {
	%>
	<div class="navbar navbar-inverse set-radius-zero">
		<div class="container">
			<div class="navbar-header">
				<!-- <button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target=".navbar-collapse">
					<span class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button> -->
				<a class="navbar-brand" href="index.jsp"> <img
					src="images/logo.jpg" style="width: 200px; height: 70px;" />
				</a>
			</div>

			<div class="right-div">
				<a href="index.html" class="btn btn-info pull-right">LOG ME OUT</a>
			</div>
		</div>
	</div>
	<jsp:include page="studentSideHeader.jsp"></jsp:include>
	<div class="w3-card w3-blue">
	<div class="content-wrapper">
		<div class="container">
			<div class="row pad-botm">
				<div class="col-md-12">
					<h4 class="header-line">Profile</h4>

				</div>
			</div>
			<div class="row">
				<%
				try{
				Class.forName("com.mysql.jdbc.Driver");
				Connection con =DriverManager.getConnection ("jdbc:mysql://localhost:3306/test","root","papon728**");
				
				Statement statement = con.createStatement();
				ResultSet resultSet = statement.executeQuery("select * from student where id='" + session.getAttribute("uid")
						+ "' and uname='" + session.getAttribute("uname") + "'");
				while (resultSet.next()) {
				%>
				<div class="col-md-8 col-sm-8 col-xs-12">
					<div class="panel panel-danger">
						<div class="panel-heading">My Profile</div>
						<div class="panel-body">
							<form action="updateStudentProfile.jsp" method="post">

								<div class="form-group">
									<b><label>Admin Id:</label></b> <input type="text" name="sid"
										class="form-control" value="<%=resultSet.getInt(1)%>" readonly>
								</div>
								<div class="form-group">
									<b><label>Student Name.:</label></b> <input type="text" name="sname"
										class="form-control" value="<%=resultSet.getString(2)%>">
								</div>

								<div class="form-group">
									<b><label>Email Id.:</label></b> <input type="text" name="email"
										class="form-control" value="<%=resultSet.getString(3)%>">
								</div>
								<div class="form-group">
									<b><label>Address.:</label></b>
									<textarea name="address" class="form-control"><%=resultSet.getString(4)%></textarea>
								</div>
								<div class="form-group">
									<b><label>Education.:</label></b><input type="text" name="education"
										class="form-control" value="<%=resultSet.getString(5)%>">
								</div>
								<div class="w3-center">
								<input type="submit" value="Update Profile"
									class="w3-button w3-green w3-round">
								
									
								</div>
								<br>
									
							</form>
							<div class="w3-center">
								<button class="w3-button w3-orange w3-round" onclick="location.href='AdminPage.jsp'"> Back</button>

								
							</div>
							<br>


						</div>
					</div>
				</div>
				<%
					}
				}catch(Exception e){
					out.println(e);
				}
				%>
			</div>
		</div>
	</div>	



	</div>
	
	<!-- CONTENT-WRAPPER SECTION END-->
	<section class="footer-section">
		<div class="container">
			<div class="row">
				<div class="col-md-12">&copy; sayantan</div>

			</div>
		</div>
	</section>
	<!-- FOOTER SECTION END-->
	<!-- JAVASCRIPT FILES PLACED AT THE BOTTOM TO REDUCE THE LOADING TIME  -->
	<!-- CORE JQUERY  -->
	<script src="assets/js/jquery-1.10.2.js"></script>
	<!-- BOOTSTRAP SCRIPTS  -->
	<script src="assets/js/bootstrap.js"></script>
	<!-- CUSTOM SCRIPTS  -->
	<script src="assets/js/custom.js"></script>
	<script>
		(function(i, s, o, g, r, a, m) {
			i['GoogleAnalyticsObject'] = r;
			i[r] = i[r] || function() {
				(i[r].q = i[r].q || []).push(arguments)
			}, i[r].l = 1 * new Date();
			a = s.createElement(o), m = s.getElementsByTagName(o)[0];
			a.async = 1;
			a.src = g;
			m.parentNode.insertBefore(a, m)
		})
				(
						window,
						document,
						'script',
						'../../../../../../www.google-analytics.com/analytics.js',
						'ga');

		ga('create', 'UA-58127580-1', 'auto');
		ga('send', 'pageview');
	</script>
	<%
		} else {
	response.sendRedirect("afterStudentLogin.jsp");
	}
	%>
</body>
</html>
