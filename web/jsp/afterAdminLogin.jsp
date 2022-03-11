<%@ page language="java" contentType="text/html"  pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!doctype html>
<html class="no-js" lang="">
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
  <link rel="stylesheet" type="text/css" href="fonts/material-icon/material-design-iconic-font.min.css">
  <link rel="stylesheet" href="css/bootstrap.min.css">
  <script type="text/javascript" src="vendor/jquery/jquery-3.2.1.min.js"></script>
  <script type="text/javascript" src="vendor/bootstrap/js/bootstrap.min.js"></script>
  <script type="text/javascript" src="vendor/bootstrap/js/popper.min.js"></script>
  <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
  <script type="text/javascript" src="vendor/bootstrap/js/tooltip.js"></script>
  <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>


  <link rel="stylesheet" href="css/jquery-ui.css">
  <link rel="stylesheet" href="css/owl.carousel.min.css">
  <link rel="stylesheet" href="css/owl.theme.default.min.css">
  <link rel="stylesheet" href="css/owl.theme.default.min.css">
  <link rel="stylesheet" type="text/css" href="font-awesome-4.7.0/css/font-awesome.min.css">

  <link rel="stylesheet" href="css/jquery.fancybox.min.css">

  <link rel="stylesheet" href="css/bootstrap-datepicker.css">

  <link rel="stylesheet" href="fonts/flaticon/font/flaticon.css">

  <link rel="stylesheet" href="css/aos.css">
  <link href="css/jquery.mb.YTPlayer.min.css" media="all" rel="stylesheet" type="text/css">

  <link rel="stylesheet" href="css/style.css">


  <script>
    $(document).ready(function(){
      $('[data-toggle="tooltip"]').tooltip();
      var actions = $("table td:last-child").html();
      // Append table with add row form on add new button click
      $(".add-new").click(function(){
        $(this).attr("disabled", "disabled");
        var index = $("table tbody tr:last-child").index();
        var row = '<tr>' +
            '<td><input type="text" class="form-control" name="name" id="name"></td>' +
            '<td><input type="text" class="form-control" name="department" id="department"></td>' +
            '<td><input type="text" class="form-control" name="phone" id="phone"></td>' +
      '<td>' + actions + '</td>' +
        '</tr>';
      $("table").append(row);   
    $("table tbody tr").eq(index + 1).find(".add, .edit").toggle();
        $('[data-toggle="tooltip"]').tooltip();
    });
  // Add row on add button click
  $(document).on("click", ".add", function(){
    var empty = false;
    var input = $(this).parents("tr").find('input[type="text"]');
        input.each(function(){
      if(!$(this).val()){
        $(this).addClass("error");
        empty = true;
      } else{
                $(this).removeClass("error");
            }
    });
    $(this).parents("tr").find(".error").first().focus();
    if(!empty){
      input.each(function(){
        $(this).parent("td").html($(this).val());
      });     
      $(this).parents("tr").find(".add, .edit").toggle();
      $(".add-new").removeAttr("disabled");
    }   
    });
  // Edit row on edit button click
  $(document).on("click", ".edit", function(){    
        $(this).parents("tr").find("td:not(:last-child)").each(function(){
      $(this).html('<input type="text" class="form-control" value="' + $(this).text() + '">');
    });   
    $(this).parents("tr").find(".add, .edit").toggle();
    $(".add-new").attr("disabled", "disabled");
    });
  // Delete row on delete button click
  $(document).on("click", ".delete", function(){
        $(this).parents("tr").remove();
    $(".add-new").removeAttr("disabled");
    });
});
</script>
        
    </head>
    <body>
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
                <li>
                  <a href="addQuestion.jsp" class="nav-link text-left" >Add Questions</a>
                </li>
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
                    <a href="index.html" class="btn  pull-right"><img src="images/icons/logout-rounded-up.png"style="width: 30%;"></a>

                </div>
            </li>
              </ul>                                                                                                                                                                                                                                                                                          
            </nav>

          </div>
          
         
        </div>
      </div>

    </header>
    <br><br><br><br>
    <button type="button" class="btn btn-info add-new pull-right"><i class="fa fa-plus"></i> Add New</button>
    <div class=" w3-center w3-container ">
      <h4>Active Exams</h4>
      <center>
      
      <div class="w3-card w3-center" style="width:70%">

        
      <table class="w3-table-all w3-hoverable">
        <tr class="w3-green"><th>Exam Name</th><th>Duration(minutes)</th><th>Action</th></tr>
        <%
        Class.forName("com.mysql.jdbc.Driver");
  Connection con =DriverManager.getConnection ("jdbc:mysql://localhost:3306/test","root","papon728**");
        ResultSet rs=con.createStatement().executeQuery("select * from exam_name");
        while(rs.next()){
      %>
      
        
        <tr><td><b><%=rs.getString(1)%></b></td><td><b><%=rs.getInt(2)%></b></td><td>
                            <a class="add" title="Add" data-toggle="tooltip"><i class="material-icons">&#xE03B;</i></a>
                            <a class="edit  w3-blue" title="Edit" data-toggle="tooltip"><i class="material-icons">&#xE254;</i></a>
                            <a class="delete" title="Delete" data-toggle="tooltip"><i class="material-icons">&#xE872;</i></a>
                        </td></tr>

      <%
    }

  %>

      </table>
      <br>
      <button class="w3-button w3-blue w3-round">Update duration </button>
      <button class="w3-button w3-green w3-round">Add exams </button>
      <br>


      </div>
      </center>

<br> <br>
<center>
  <h4>Active Students</h4>
<div class="w3-card  w3-center" style="width:70%">
        
<table class="w3-table-all w3-hoverable">
        <tr class="w3-orange"><th>Id</th><th>studentName</th><th>email </th><th> address </th><th>education</th><th>username</th> </tr>
<%

ResultSet rs1=con.createStatement().executeQuery("select * from student");
while (rs1.next()){

%>
<tr><td><b><%=rs1.getInt(1)%></b></td><td><b><%=rs1.getString(2)%></b></td><td><b><%=rs1.getString(3)%></b></td><td><b><%=rs1.getString(4)%></b></td><td><b><%=rs1.getString(5)%></b></td><td><b><%=rs1.getString(6)%></b></td></tr></b>

      <%
    }

  %>
  </table>
  <br>
      <button class="w3-button w3-blue w3-round">add student </button>
      <!-- <button class="w3-button w3-green w3-round"> </button> -->
      <br><br>

    </div>
  </center>
    <br><br><br>
  </div>
  


    </body>
</html>