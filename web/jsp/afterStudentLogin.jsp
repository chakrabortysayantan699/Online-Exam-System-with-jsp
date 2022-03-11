<%@ page language="java" contentType="text/html"  pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">


<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <!--[if IE]>
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <![endif]-->
    <title>Online Exam System</title>
    
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
  <script>
    
    function myFunction(count) {
      start(count);

        
    }
  var selectTopic;

  function start(count){
    
    if(count==0){

     selectTopic = document.getElementById("mySelect").value;
     document.location.href = "examTest.jsp?selectTopic=" + selectTopic;
    
    }
    else{
      selectTopic = document.getElementById("mySelect").value;
      up();
      // document.location.href = "examTest.jsp?selectTopic=" + selectTopic;
      console.log(selectTopic);
      // document.write(selectTopic);
    }

    
        

  }

</script>
<script type="text/javascript">
 function up(){
    $("#myModal").modal('show');
  };

</script>

</script>
  

</head>
<%    %>
<body data-spy="scroll" data-target=".site-navbar-target" data-offset="300" onload="up()">
  <div id="myModal" class="modal fade">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Exam Instructions</h5>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
            <div class="modal-body">
        <p>Read These carefully</p>
                <form >
                    <ul>
                <li><b>Quiz contains Multiple Choice Questions.</b></li>
                
                <li><b>You can finish the exam at any time.</b></li>
                <li><b>Read the question carefully before answering.</b></li>
                <li><b>You can change your answers before submitting.</b></li>
                <li><b>Good luck for the test.</b></li>
                <br>
              </ul>
                </form>
            </div>
        </div>
    </div>
</div>

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
                <li >
                  <a onclick="document.getElementById('id01').style.display='block'" class="nav-link text-left">Exams</a>
                  
                </li>
                <!-- <li>
                  <a href="admissions.html" class="nav-link text-left" >Schedule</a>
                </li> -->
                <li>
                  <a href="checkResult.jsp" class="nav-link text-left">Results</a>
                </li>
                <li class="has-children">
                    <a href="studentProfile.jsp" class="nav-link text-left">Profile</a>
                    <ul class="dropdown">
                    <li><a href="editStudentProfile.jsp">Edit Profile</a></li>
                    <li><a href="passwordChange.jsp">Change Password</a></li>                    
                  </ul>
                  </li>
                <li>
                    <div >                

                <a href="">Welcome <%=session.getAttribute("uname")%> (<%=session.getAttribute("uid") %>)</a>
            </div>
                </li>
            <li>
                <div>
                    <a href="log_out.jsp" class="btn  pull-right"><img src="images/icons/logout-rounded-up.png"style="width: 30%;"></a>

                </div>
            </li>
              </ul>                                                                                                                                                                                                                                                                                          
            </nav>

          </div>
          
         
        </div>
      </div>

    </header>

    <div class="w3-container w3-center w3-cyan">
    <div id="id01" class="w3-modal w3-center">
    <div class="w3-modal-content w3-cyan">
      <div class="w3-container">
        <br><br>
        <span onclick="document.getElementById('id01').style.display='none'" class="w3-button w3-display-topright">&times;</span>
        <b><label class="w3-text-red">Select Topic:</label> </b>
        <select name="selectTopic"id="mySelect" onchange="myFunction(0)" class="form-control">
          <!-- <select name="selectTopic"id="mySelect" onchange="up()" class="form-control"> -->
        <option>Select Exam Subject Topic</option>
                        <%
                        if (session.getAttribute("uname") != null) {


                        try {
                            Class.forName("com.mysql.jdbc.Driver");
                            Connection con =DriverManager.getConnection ("jdbc:mysql://localhost:3306/test","root","papon728**");
                            ResultSet selectExamTopic = con.createStatement().executeQuery("select distinct subjectTopic from questions");
                            while (selectExamTopic.next()) {
                        %>
                            <option><%=selectExamTopic.getString("subjectTopic") %></option>
                        <%
                            }
                        }
                        catch(Exception e){
                            out.println(e);
                        }
                      }
                      else{
                        response.sendRedirect("index.html");
                      }


                        %>
                        <% String selectTopic = request.getParameter("selectTopic");
                        session.setAttribute("selectTopic", selectTopic);
                        System.out.println("selectTopic  "+selectTopic); %>
                    </select>
                    <br>
        <!-- <button class="w3-button w3-green"  onclick="location.href='examination.jsp'">Start exam</button> -->
        <br> <br>
      </div>
    </div>
  </div>
</div>

    <div class="navbar navbar-inverse set-radius-zero" >
        <div class="container">
            <div class="navbar-header">
               
                <a class="navbar-brand" href="index-2.html">

                    <img src="images/logo.jpg" />
                </a>

            </div>

            
        </div>
    </div>
    

    <div class="site-section">
      <div class="container">


        <div class="row mb-5 justify-content-center text-center">
          <div class="col-lg-6 mb-5">
            <h2 class="section-title-underline mb-3">
              <span>Your exams</span>
            </h2>
            <p>List of subject wise exams</p>
          </div>
        </div>

        <div class="row">
          <div class="col-12">
              <div class="owl-slide-3 owl-carousel">
                  <div class="course-1-item">
                    <figure class="thumnail">
                      <a href="course-single.html"><img src="images/course_1.jpg" alt="Image" class="img-fluid"></a>
                      <div class="price">699.00</div>
                      <div class="category"><h3>Database Management System</h3></div>  
                    </figure>
                    <div class="course-1-content pb-4">
                      <h2>How to interact with database</h2>
                      <div class="rating text-center mb-3">
                        <span class="icon-star2 text-warning"></span>
                        <span class="icon-star2 text-warning"></span>
                        <span class="icon-star2 text-warning"></span>
                        <span class="icon-star2 text-warning"></span>
                        <span class="icon-star2 text-warning"></span>
                      </div>
                      <p class="desc mb-4">every module have  exams  with most expected questions that you can face any interview and answer and socre card </p>
                      <p><a href="course-single.html" class="btn btn-primary rounded-0 px-4">Enroll For This Exam</a></p>
                    </div>
                  </div>
      
                  <div class="course-1-item">
                    <figure class="thumnail">
                      <a href="course-single.html"><img src="images/course_2.jpg" alt="Image" class="img-fluid"></a>
                      <div class="price">99.00</div>
                      <div class="category"><h3>Java Programming</h3></div>  
                    </figure>
                    <div class="course-1-content pb-4">
                      <h2>OOPs that is heavily used</h2>
                      <div class="rating text-center mb-3">
                        <span class="icon-star2 text-warning"></span>
                        <span class="icon-star2 text-warning"></span>
                        <span class="icon-star2 text-warning"></span>
                        <span class="icon-star2 text-warning"></span>
                        <span class="icon-star2 text-warning"></span>
                      </div>
                      <p class="desc mb-4">Java is a high level, robust, object-oriented and secure programming language</p>
                      <p><a href="course-single.html" class="btn btn-primary rounded-0 px-4">Enroll In This Exam</a></p>
                    </div>
                  </div>
      
                  <div class="course-1-item">
                    <figure class="thumnail">
                      <a href="course-single.html"><img src="images/course_3.jpg" alt="Image" class="img-fluid"></a>
                      <div class="price">99.00</div>
                      <div class="category"><h3>Opreating System Exam</h3></div>  
                    </figure>
                    <div class="course-1-content pb-4">
                      <h2>software that links user and hardware</h2>
                      <div class="rating text-center mb-3">
                        <span class="icon-star2 text-warning"></span>
                        <span class="icon-star2 text-warning"></span>
                        <span class="icon-star2 text-warning"></span>
                        <span class="icon-star2 text-warning"></span>
                        <span class="icon-star2 text-warning"></span>
                      </div>
                      <p class="desc mb-4">software programme required to manage and operate a computing device </p>
                      <p><a href="courses-single.html" class="btn btn-primary rounded-0 px-4">Enroll In This Exam</a></p>
                    </div>
                  </div>

                  <div class="course-1-item">
                    <figure class="thumnail">
                        <a href="course-single.html"><img src="images/course_4.jpg" alt="Image" class="img-fluid"></a>
                      <div class="price">799.00</div>
                      <div class="category"><h3>Programming & Data Structure</h3></div>  
                    </figure>
                    <div class="course-1-content pb-4">
                      <h2>write programs efficiently know indept view</h2>
                      <div class="rating text-center mb-3">
                        <span class="icon-star2 text-warning"></span>
                        <span class="icon-star2 text-warning"></span>
                        <span class="icon-star2 text-warning"></span>
                        <span class="icon-star2 text-warning"></span>
                        <span class="icon-star2 text-warning"></span>
                      </div>
                      <p class="desc mb-4">particular way of organizing data  so that it can be used effectively</p>
                      <p><a href="course-single.html" class="btn btn-primary rounded-0 px-4">Enroll In This Exam</a></p>
                    </div>
                  </div>
      
                  <div class="course-1-item">
                    <figure class="thumnail">
                        <a href="course-single.html"><img src="images/course_5.jpg" alt="Image" class="img-fluid"></a>
                      <div class="price">99.00</div>
                      <div class="category"><h3>Design and Implementation</h3></div>  
                    </figure>
                    <div class="course-1-content pb-4">
                      <h2>How To desingn and implement program efficiently</h2>
                      <div class="rating text-center mb-3">
                        <span class="icon-star2 text-warning"></span>
                        <span class="icon-star2 text-warning"></span>
                        <span class="icon-star2 text-warning"></span>
                        <span class="icon-star2 text-warning"></span>
                        <span class="icon-star2 text-warning"></span>
                      </div>
                      <p class="desc mb-4">It is a significant percentage of the overall design cycle.</p>
                      <p><a href="course-single.html" class="btn btn-primary rounded-0 px-4">Enroll In This Exam</a></p>
                    </div>
                  </div>
      
                  <div class="course-1-item">
                    <figure class="thumnail">
                        <a href="course-single.html"><img src="images/course_6.jpg" alt="Image" class="img-fluid"></a>
                      <div class="price">99.00</div>
                      <div class="category"><h3>Computer Networks</h3></div>  
                    </figure>
                    <div class="course-1-content pb-4">
                      <h2>Use network and computer eficiently</h2>
                      <div class="rating text-center mb-3">
                        <span class="icon-star2 text-warning"></span>
                        <span class="icon-star2 text-warning"></span>
                        <span class="icon-star2 text-warning"></span>
                        <span class="icon-star2 text-warning"></span>
                        <span class="icon-star2 text-warning"></span>
                      </div>
                      <p class="desc mb-4">It is a set of computers sharing resources located on or provided by network nodes.</p>
                      <p><a href="course-single.html" class="btn btn-primary rounded-0 px-4">Enroll In This Course</a></p>
                    </div>
                  </div>

                <div class="course-1-item">
                    <figure class="thumnail">
                        <a href="course-single.html"><img src="images/course-7.jpg" alt="Image" class="img-fluid"></a>
                      <div class="price">999.00</div>
                      <div class="category"><h3>Software Engineering</h3></div>  
                    </figure>
                    <div class="course-1-content pb-4">
                      <h2>Use network and computer eficiently</h2>
                      <div class="rating text-center mb-3">
                        <span class="icon-star2 text-warning"></span>
                        <span class="icon-star2 text-warning"></span>
                        <span class="icon-star2 text-warning"></span>
                        <span class="icon-star2 text-warning"></span>
                        <span class="icon-star2 text-warning"></span>
                      </div>
                      <p class="desc mb-4">It is a set of computers sharing resources located on or provided by network nodes.</p>
                      <p><a href="course-single.html" class="btn btn-primary rounded-0 px-4">Enroll In This Course</a></p>
                    </div>
                  </div>
      
              </div>
      
          </div>
        </div>
        </div>
    </div>




    
    <!-- LOGO HEADER END-->
    <section class="menu-section">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="navbar-collapse collapse ">
                        <ul id="menu-top" class="nav navbar-nav navbar-right">
                            <li><a href="index-2.html" >DASHBOARD</a></li>
                             
                            <li><a href="form.html">FORMS</a></li>
                            <li>
                                <a href="#" class="dropdown-toggle" id="ddlmenuItem" data-toggle="dropdown">Subjects<i class="fa fa-angle-down"></i></a>
                                <ul class="dropdown-menu" role="menu" aria-labelledby="ddlmenuItem">
                                    <li role="presentation"><a role="menuitem" tabindex="-1" href="ui.html">Python</a></li>
                                     <li role="presentation"><a role="menuitem" tabindex="-1" href="#">Java</a></li>
                                </ul>
                            </li>
                            <li><a href="tab.html">Schedule</a></li>
                            <li><a href="table.html">Results</a></li>
                            <li><a href="blank.html" class="menu-top-active">Profile</a></li>

                        </ul>
                    </div>
                </div>

            </div>
        </div>
    </section>

     <!-- MENU SECTION END-->
   <!--  <div class="content-wrapper">
         <div class="container">
        <div class="row pad-botm">
            <div class="col-md-12">
                <h4 class="header-line">Blank Page</h4>
                
                            </div>

        </div>
             <div class="row">
            <div class="col-md-12">
               <div class="alert alert-info">
                this is

                   <br />
                   Happy learning
                   <br />
                  
               </div>
                            </div>

        </div>
    </div>
    </div> -->
     <!-- CONTENT-WRAPPER SECTION END-->
    <section class="footer-section">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                   &copy; 
                </div>

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
  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
  })(window,document,'script','../../../../../../www.google-analytics.com/analytics.js','ga');

  ga('create', 'UA-58127580-1', 'auto');
  ga('send', 'pageview');

</script>


  <!-- loader -->
  <div id="loader" class="show fullscreen"><svg class="circular" width="48px" height="48px"><circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/><circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#51be78"/></svg></div>

  <script src="js/jquery-3.3.1.min.js"></script>
  <script src="js/jquery-migrate-3.0.1.min.js"></script>
  <script src="js/jquery-ui.js"></script>
  <script src="js/popper.min.js"></script>
  <script src="js/bootstrap.min.js"></script>
  <script src="js/owl.carousel.min.js"></script>
  <script src="js/jquery.stellar.min.js"></script>
  <script src="js/jquery.countdown.min.js"></script>
  <script src="js/bootstrap-datepicker.min.js"></script>
  <script src="js/jquery.easing.1.3.js"></script>
  <script src="js/aos.js"></script>
  <script src="js/jquery.fancybox.min.js"></script>
  <script src="js/jquery.sticky.js"></script>
  <script src="js/jquery.mb.YTPlayer.min.js"></script>




  <script src="js/main.js"></script>
</body>

<!-- Mirrored from www.binarytheme.com/BTlivedemos/2014/08/29/horizontal-admin/blank.html by HTTrack Website Copier/3.x [XR&CO'2014], Sun, 14 Jul 2019 14:48:34 GMT -->
</html>
    