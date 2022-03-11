<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
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
<link href="fonts/font-awesome-4.7.0/css/font-awesome.css" rel="stylesheet" />
<!-- CUSTOM STYLE  -->
<link href="css/style.css" rel="stylesheet" />
<!-- GOOGLE FONT -->
<link href='http://fonts.googleapis.com/css?family=Open+Sans'
	rel='stylesheet' type='text/css' />

</head>
<body>
	<%
		if (session.getAttribute("uname") != null && session.getAttribute("uname") != "") {
	%>
	<div class="navbar navbar-inverse set-radius-zero">
		<div class="container">
			<div class="navbar-header">
				
				<a class="navbar-brand" href="index.html"> <img
					src="images/logo.jpg" />
				</a>

			</div>

			<div class="right-div">
				<a href="logout.jsp" class="btn btn-info pull-right">LOG ME OUT</a>
			</div>
		</div>
	</div>
	<jsp:include page="adminHeader.jsp"></jsp:include>
	<!-- MENU SECTION END-->
	<div class="content-wrapper">
		<div class="container">
			<div class="row pad-botm">
				<div class="col-md-12">
					<h4 class="header-line">Add Exam Questions</h4>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12">
					<form action="updateQuestion.jsp" method="post">
						<div class="form-group">
							<b><label>Select Topic:</label></b>
							 
						<%
						try {
							String topic=session.getAttribute("edit_topic").toString();
							String qid=request.getParameter("exam_id");
							int quid=Integer.parseInt(qid);
							Class.forName("com.mysql.jdbc.Driver");
							Connection con =DriverManager.getConnection ("jdbc:mysql://localhost:3306/test","root","papon728**");
							ResultSet selectExamTopic = con.createStatement().executeQuery("select * from questions where id='"+qid+"'");
							while (selectExamTopic.next()) {
						%>
							
						<input type="text" name="selectTopic" class="form-control" value="<%=selectExamTopic.getString(8)%>" readonly>
					
						</div>
						<div class="form-group">
							<b><label>Question Id</label></b>
							<input type="text" name="id" class="form-control" value="<%=quid%>" readonly>
							
						</div>
						<div class="form-group">
							<b><label>Question:</label></b> <input type="text" name="question" value="<%=selectExamTopic.getString(2)%>" class="form-control" >
						
						</div>
						<div class="form-group">
							<b><label>Options-1</label></b> <input type="text" name="option1"
								class="form-control"  value="<%=selectExamTopic.getString(3)%>"  required>
						</div>
						<div class="form-group">
							<b><label>Options-2 </label></b> <input type="text" name="option2" value="<%=selectExamTopic.getString(4)%>"
								class="form-control" required>
						</div>
						<div class="form-group">
							<b><label>Options-3</label></b> <input type="text" name="option3"value="<%=selectExamTopic.getString(5)%>"
								class="form-control" required>
						</div>
						<div class="form-group">
							<b><label>Options-4</label></b> <input type="text" name="option4" value="<%=selectExamTopic.getString(6)%>"
								class="form-control" required>
						</div>
						<div class="form-group">
							<b><label>Correct Answer:</label></b> <input type="text"
								name="correctAnswer" value="<%=selectExamTopic.getString(7)%>" class="form-control" required>
						</div>
						<input type="submit" value="Update questions" class="btn btn-primary">
						<input type="reset" value="Clear" class="btn btn-danger">
					</form>
				</div>
			</div>
		</div>
	</div>
	<%
}
	}catch(Exception e){
		out.println(e);
		}
%>
	<!-- CONTENT-WRAPPER SECTION END-->
	<section class="footer-section">
		<div class="container">
			<div class="row">
				<div class="col-md-12">&copy; sayanatan</div>

			</div>
		</div>
	</section>
	<!-- FOOTER SECTION END-->
	<!-- JAVASCRIPT FILES PLACED AT THE BOTTOM TO REDUCE THE LOADING TIME  -->
	<!-- CORE JQUERY  -->
	<script src="vendor/jquery/jquery-3.2.1.min.js"></script>
	<!-- BOOTSTRAP SCRIPTS  -->
	<script src="vendor/bootstrap/js/bootstrap.js"></script>
	<script src="vendor/bootstrap/js/popper.js"></script>
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
	response.sendRedirect("index.html");
	}
	%>
</body>
</html>
