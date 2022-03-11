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
<title>Online Exam System</title>
<!-- BOOTSTRAP CORE STYLE  -->
<link href="css/bootstrap.min.css" rel="stylesheet" />
<!-- FONT AWESOME STYLE  -->
<link href="assets/css/font-awesome.css" rel="stylesheet" />
<!-- CUSTOM STYLE  -->
<link href="css/style.css" rel="stylesheet" />
<!-- GOOGLE FONT -->
<link href='http://fonts.googleapis.com/css?family=Open+Sans'
	rel='stylesheet' type='text/css' />
<link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />
    <link rel="stylesheet" href="css/w3.css">
    <link href="https://fonts.googleapis.com/css?family=Muli:300,400,700,900" rel="stylesheet">
  <link rel="stylesheet" href="fonts/icomoon/style.css">

  <link rel="stylesheet" href="css/bootstrap.min.css">
  <link rel="stylesheet" href="css/jquery-ui.css">
  <link rel="stylesheet" href="css/owl.carousel.min.css">
  <link rel="stylesheet" href="css/owl.theme.default.min.css">
  <link rel="stylesheet" href="css/owl.theme.default.min.css">

  <link rel="stylesheet" href="css/jquery.fancybox.min.css">

  <link rel="stylesheet" href="css/bootstrap-datepicker.css">

  <link rel="stylesheet" href="fonts/flaticon/font/flaticon.css">

  <link rel="stylesheet" href="css/aos.css">
  <link href="css/jquery.mb.YTPlayer.min.css" media="all" rel="stylesheet" type="text/css">

  <link rel="stylesheet" href="css/style.css">
</head>
<body data-spy="scroll" data-target=".site-navbar-target" data-offset="300">
	<%
		if (session.getAttribute("uname") != null && session.getAttribute("uname") != "") {
			String exam=request.getParameter("examtopic");
	%>
<div class="site-wrap">
	<div class="site-mobile-menu site-navbar-target">
		<div class="site-mobile-menu-header">
			<div class="site-mobile-menu-close mt-3">
				<span class="icon-close2 js-menu-toggle"></span>
		        </div>
		</div>
	<div class="site-mobile-menu-body"></div>
	</div>
<header class="site-navbar py-4 js-sticky-header site-navbar-target" role="banner">
	<div class="container">
		<div class="d-flex align-items-center">
			<div class="site-logo">
				<a href="index.html" class="d-block">
					<img src="images/logo.jpg" alt="Image" class="img-fluid">
				</a>
			</div>
          
          <div class="mr-auto">
            <nav class="site-navigation position-relative text-right" role="navigation">
              <ul class="site-menu main-menu js-clone-nav mr-auto d-none d-lg-block">
                <li class="active">
                  <a href="afterStudentLogin.jsp" class="nav-link text-left">Home</a>
                </li>
                
                  <li><a href="examination.jsp">Exam Test</a></li>
                  
                <li>
                  <a href="studentProfile.jsp">Profile</a></li>
                
                <li class="has-children">
                  <a href="editStudentProfile.jsp">Edit Profile</a>
                  <ul class="dropdown">
                    <li><a href="passwordChange.jsp">Change Password</a></li>                    
                  </ul>
                </li>
                <li>
                    <a href=""><font color="#ff8c00"><%=exam%> Welcome <%=session.getAttribute("uname")%></font></a>
                  </li>
          </ul>

                   

            </nav>

          </div>
          
         
        </div>
      </div>

    </header>
    <br>
    <br>
    <br>
    <br>


                
                    <div class="w3-card w3-cyan">
	<jsp:include page="studentSideHeader.jsp"></jsp:include>
	<!-- MENU SECTION END-->
	<div class="content-wrapper">
		<div class="container">
			<div class="row pad-botm">
				<div class="col-md-12">
					<h4 class="header-line w3-text-red">Exam Instructions</h4>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12 col-sm-12 col-xs-12">
					<div class="panel panel-default">
						<div class="panel-heading">Read These carefully</div>
						<div class="panel-body">
							<ul>
								<li>Quiz contains Multiple Choice Questions.</li>
								<li>Total time for the Quiz is 5 Minutes.</li>
								<li>You can finish the exam at any time.</li>
								<li>Read the question carefully before answering.</li>
								<li>You can change your answers before submitting.</li>
								<li>Good luck for the test.</li>
								<br>
								<a href="examTest.jsp" class="btn btn-primary">Start Exam</a>
							</ul>

						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
</li>

	
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
</body>
<%
	} else {
		response.sendRedirect("index.jsp");
	}
%>
</html>
