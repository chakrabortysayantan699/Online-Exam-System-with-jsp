<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.connection.*"%>
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
<title>Online Examination System</title>
<!-- BOOTSTRAP CORE STYLE  -->
<link href="css/bootstrap.min.css" rel="stylesheet" />
<!-- FONT AWESOME STYLE  -->
<link href="assets/css/font-awesome.css" rel="stylesheet" />
<!-- CUSTOM STYLE  -->
<link href="css/style.css" rel="stylesheet" />
<!-- GOOGLE FONT -->
<link href='http://fonts.googleapis.com/css?family=Open+Sans'
	rel='stylesheet' type='text/css' />
</head>
<body>
	<%
		response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");
		if (session.getAttribute("uname") != null && session.getAttribute("uname") != "") {
			try{
				Class.forName("com.mysql.jdbc.Driver");
				Connection con =DriverManager.getConnection ("jdbc:mysql://localhost:3306/test","root","papon728**");
				String selectTopic=session.getAttribute("selectTopic").toString();
				ResultSet rs =con.createStatement().executeQuery ("select id from questions where subjectTopic='"+selectTopic+"'");
				int count=0;
				Timestamp prio=new java.sql.Timestamp(new java.util.Date().getTime());;
				while (rs.next()) {
					
					int id1=rs.getInt(1);
					if(count==0){

						prio=new java.sql.Timestamp(new java.util.Date().getTime());
						count+=1;
					}
					String id=""+id1;
					String value=request.getParameter(id);
					String uid1=session.getAttribute("uid").toString();
					int uid=Integer.parseInt(uid1); 
					System.out.println(value);
					System.out.println(prio);
					System.out.println(count);
			PreparedStatement stmt1 = con.prepareStatement("insert into tblstudentresult values(?,?,?,?,?) ");
			stmt1.setInt(1,uid);
			stmt1.setInt(2,rs.getInt(1));
			stmt1.setString(3,value);
			stmt1.setTimestamp(4, prio);
			stmt1.setString(5,selectTopic);
			stmt1.executeUpdate();


			}
	%>
	<div class="navbar navbar-inverse set-radius-zero">
		<div class="container">
			<div class="navbar-header">
				
				<a class="navbar-brand" href="index.html"> <img
					src="images/logo.jpg" style="width: 200px; height: 70px;" />
				</a>
			</div>

			<div class="right-div">
				<a href="index.html" class="btn btn-info pull-right">LOG ME OUT</a>
			</div>
		</div>
	</div>
	<jsp:include page="studentSideHeader.jsp"></jsp:include>
	<!-- MENU SECTION END-->
	<div class="content-wrapper">
		<div class="container">
			<div class="row pad-botm">
				<div class="col-md-12">
					<h4 class="header-line">Submitted Sucessfully </h4>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12 col-sm-12 col-xs-12">
					<div class="panel panel-default">
						<div class="panel-heading">Congratulation</div>
						<div class="panel-body">
							<strong>Thanks for attending online exam.</strong><br> <br>
							<a href="checkResult.jsp" class="btn btn-danger">Please click here
								to check exam result.</a>
							</ul>

						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- CONTENT-WRAPPER SECTION END-->
	<section class="footer-section">
		<div class="container">
			<div class="row">
				<div class="col-md-12">&copy; syantan</div>

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
		}catch(Exception e){
			out.println(e);
		}
	}
		 else {
			response.sendRedirect("index.jsp");
		}
	%>
</body>
</html>
