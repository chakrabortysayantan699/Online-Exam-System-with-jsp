<%@ page language="java" contentType="text/html"  pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<html lang="en"><head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Admin Controls</title>
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet" href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="css/jquery-ui.css">
  <link rel="stylesheet" href="css/owl.carousel.min.css">
  <link rel="stylesheet" href="css/owl.theme.default.min.css">
  <link rel="stylesheet" href="css/owl.theme.default.min.css">
  <link rel="stylesheet" type="text/css" href="css/w3.css">
  

  <link rel="stylesheet" href="css/jquery.fancybox.min.css">

  <link rel="stylesheet" href="css/bootstrap-datepicker.css">

  <link rel="stylesheet" href="fonts/flaticon/font/flaticon.css">

  <link rel="stylesheet" href="css/aos.css">
  <link href="css/jquery.mb.YTPlayer.min.css" media="all" rel="stylesheet" type="text/css">

  <link rel="stylesheet" href="css/style.css">

<style>
body {
	color: #566787;
	background: #f5f5f5;
	font-family: 'Varela Round', sans-serif;
	font-size: 13px;
}
.table-responsive {
    margin: 30px 0;
}
.table-wrapper {
	background: #fff;
	padding: 20px 25px;
	border-radius: 3px;
	min-width: 1000px;
	box-shadow: 0 1px 1px rgba(0,0,0,.05);
}
.table-title {        
	padding-bottom: 15px;
	background: #435d7d;
	color: #fff;
	padding: 16px 30px;
	min-width: 100%;
	margin: -20px -25px 10px;
	border-radius: 3px 3px 0 0;
}
.table-title h2 w	margin: 5px 0 0;
	font-size: 24px;
}
.table-title .btn-group {
	float: right;
}
.table-title .btn {
	color: #fff;
	float: right;
	font-size: 13px;
	border: none;
	min-width: 50px;
	border-radius: 2px;
	border: none;
	outline: none !important;
	margin-left: 10px;
}
.table-title .btn i {
	float: left;
	font-size: 21px;
	margin-right: 5px;
}
.table-title .btn span {
	float: left;
	margin-top: 2px;
}
table.table tr th, table.table tr td {
	border-color: #e9e9e9;
	padding: 12px 15px;
	vertical-align: middle;
}
table.table tr th:first-child {
	width: 60px;
}
table.table tr th:last-child {
	width: 100px;
}
table.table-striped tbody tr:nth-of-type(odd) {
	background-color: #fcfcfc;
}
table.table-striped.table-hover tbody tr:hover {
	background: #f5f5f5;
}
table.table th i {
	font-size: 13px;
	margin: 0 5px;
	cursor: pointer;
}	
table.table td:last-child i {
	opacity: 0.9;
	font-size: 22px;
	margin: 0 5px;
}
table.table td a {
	font-weight: bold;
	color: #566787;
	display: inline-block;
	text-decoration: none;
	outline: none !important;
}
table.table td a:hover {
	color: #2196F3;
}
table.table td a.edit {
	color: #FFC107;
}
table.table td a.delete {
	color: #F44336;
}
table.table td i {
	font-size: 19px;
}
table.table .avatar {
	border-radius: 50%;
	vertical-align: middle;
	margin-right: 10px;
}
.pagination {
	float: right;
	margin: 0 0 5px;
}
.pagination li a {
	border: none;
	font-size: 13px;
	min-width: 30px;
	min-height: 30px;
	color: #999;
	margin: 0 2px;
	line-height: 30px;
	border-radius: 2px !important;
	text-align: center;
	padding: 0 6px;
}
.pagination li a:hover {
	color: #666;
}	
.pagination li.active a, .pagination li.active a.page-link {
	background: #03A9F4;
}
.pagination li.active a:hover {        
	background: #0397d6;
}
.pagination li.disabled i {
	color: #ccc;
}
.pagination li i {
	font-size: 16px;
	padding-top: 6px
}
.hint-text {
	float: left;
	margin-top: 10px;
	font-size: 13px;
}    
/* Custom checkbox */
.custom-checkbox {
	position: relative;
}
.custom-checkbox input[type="checkbox"] {    
	opacity: 0;
	position: absolute;
	margin: 5px 0 0 3px;
	z-index: 9;
}
.custom-checkbox label:before{
	width: 18px;
	height: 18px;
}
.custom-checkbox label:before {
	content: '';
	margin-right: 10px;
	display: inline-block;
	vertical-align: text-top;
	background: white;
	border: 1px solid #bbb;
	border-radius: 2px;
	box-sizing: border-box;
	z-index: 2;
}
.custom-checkbox input[type="checkbox"]:checked + label:after {
	content: '';
	position: absolute;
	left: 6px;
	top: 3px;
	width: 6px;
	height: 11px;
	border: solid #000;
	border-width: 0 3px 3px 0;
	transform: inherit;
	z-index: 3;
	transform: rotateZ(45deg);
}
.custom-checkbox input[type="checkbox"]:checked + label:before {
	border-color: #03A9F4;
	background: #03A9F4;
}
.custom-checkbox input[type="checkbox"]:checked + label:after {
	border-color: #fff;
}
.custom-checkbox input[type="checkbox"]:disabled + label:before {
	color: #b8b8b8;
	cursor: auto;
	box-shadow: none;
	background: #ddd;
}
/* Modal styles */
.modal .modal-dialog {
	max-width: 400px;
}
.modal .modal-header, .modal .modal-body, .modal .modal-footer {
	padding: 20px 30px;
}
.modal .modal-content {
	border-radius: 3px;
	font-size: 14px;
}
.modal .modal-footer {
	background: #ecf0f1;
	border-radius: 0 0 3px 3px;
}
.modal .modal-title {
	display: inline-block;
}
.modal .form-control {
	border-radius: 2px;
	box-shadow: none;
	border-color: #dddddd;
}
.modal textarea.form-control {
	resize: vertical;
}
.modal .btn {
	border-radius: 2px;
	min-width: 100px;
}	
.modal form label {
	font-weight: normal;
}	
</style>
<script>
$(document).ready(function(){
	// Activate tooltip
	$('[data-toggle="tooltip"]').tooltip();
	
	// Select/Deselect checkboxes
	var checkbox = $('table tbody input[type="checkbox"]');
	$("#selectAll").click(function(){
		if(this.checked){
			checkbox.each(function(){
				this.checked = true;                        
			});
		} else{
			checkbox.each(function(){
				this.checked = false;                        
			});
		} 
	});
	checkbox.click(function(){
		if(!this.checked){
			$("#selectAll").prop("checked", false);
		}
	});
});
</script>
</head>
<body class="">
	
   <div class="w3-sidebar w3-bar-block w3-card w3-animate-left" style="display:none" id="mySidebar">
  <button class="w3-bar-item w3-button w3-large w3-hover-cyan"onclick="w3_close()">Close &times;</button>
  <a href="editadmin.jsp" class="w3-bar-item w3-button w3-hover-green">Profile</a>
  <a href="AdminPage.jsp" class="w3-bar-item w3-button w3-hover-purple">Exams</a>
  <a href="admin_profile.jsp" class="w3-bar-item w3-button w3-hover-orange">Accounts</a>
  <a href="admin_results.jsp" class="w3-bar-item w3-button w3-hover-teal">Results</a>
  <a href="index.html" class="w3-bar-item w3-button w3-hover-red">Log out</a>
</div>

<div class="w3-teal">
	<div class="col-sm-6">
  <button id="openNav" class="w3-button w3-teal w3-xlarge" onclick="w3_open()">&#9776;</button>
</div>

  <center>
  <h2>Admin <b>Controls</b></h2>
</center>

 </div>

    
<div id="main">
<div class="container-xl">
	<div class="table-responsive">
		<div class="table-wrapper">
			<div class="table-title">
				<div class="row">
					<div class="col-sm-6">
						<h2>Students <b>Results</b></h2>
					</div>
					
					<div class="col-sm-6">
						<a href="#addEmployeeModal" class="btn btn-success" data-toggle="modal"><i class="material-icons">filter_alt</i> <span>Filter By Name</span></a>
						<a href="#deleteEmployeeModal" class="btn btn-danger" data-toggle="modal"><i class="material-icons">filter_alt</i> <span>Filter By Topic</span></a>						
						<a href="#editEmployeeModal" class="btn w3-cyan" data-toggle="modal"><i class="material-icons">search</i> <span>Search</span></a>						

					</div>
				</div>
			</div>
			<center>
			<div class="w3-card" style="width:80%" >
			<table class="w3-table-all w3-hoverable">
				<thead>
					<tr class="w3-green">
						<!-- <th>
							<span class="custom-checkbox">
								<input type="checkbox" id="selectAll">
								<label for="selectAll"></label>
							</span>
						</th> -->
						<th>Checkbox</th>
						<th>UserName</th>
						<th>Topic Name</th>
						<th>Results</th>
						<th>Date&Time</th>
						
					</tr>
				</thead>
				<tbody>
					 <%
					 String uname=null;
					 Class.forName("com.mysql.jdbc.Driver");
		Connection con =DriverManager.getConnection ("jdbc:mysql://localhost:3306/test","root","papon728**");
		ResultSet rs=con.createStatement().executeQuery("select * from results");
		while(rs.next()){
			String id=rs.getString(1);
			ResultSet rs1=con.createStatement().executeQuery("select studentName from student where id='"+id+"'");

			while(rs1.next()){

				uname=rs1.getString(1);
				PreparedStatement ps=con.prepareStatement(" update results  set userName=?  where UID=?");
				ps.setString(1,uname);
				ps.setString(2,id);
				int x=ps.executeUpdate();
				
			}	

      %>
					<tr>
						<td>
							<span class="custom-checkbox">
								<input type="checkbox" id="checkbox1" name="options[]" value="1">
								<label for="checkbox1"></label>
							</span>
						</td>
						<td><%=uname%></td>
						<td><%=rs.getString(3)%></td>
						<td><%=rs.getInt(2)%></td>
						<td><%=rs.getString(4)%></td>
						
					</tr>
					<% }
				%>

					
				</tbody>
			</table>

		</div>
		


		</center>			
		</div>
	</div>        
</div>
</div>
    

<script>
function w3_open() {
  document.getElementById("main").style.marginLeft = "25%";
  document.getElementById("mySidebar").style.width = "25%";
  document.getElementById("mySidebar").style.display = "block";
  document.getElementById("openNav").style.display = 'none';
  document.getElementById("main_1").style.marginLeft = "25%";
  
}
function w3_close() {
  document.getElementById("main").style.marginLeft = "0%";
  document.getElementById("mySidebar").style.display = "none";
  document.getElementById("openNav").style.display = "inline-block";
  document.getElementById("main_1").style.marginLeft = "0%";
}
</script>
<!-- add Modal HTML -->
<div id="addEmployeeModal" class="modal fade">
	<div class="modal-dialog">
		<div class="modal-content">
			<form action="Apply_filter1.jsp">
				<div class="modal-header">						
					<h4 class="modal-title">Add Exam</h4>
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
				</div>
				<div class="modal-body">					
					<div class="form-group">
						<label>Select Student</label>
						<select name="selectStudent" class="form-control">
							<option>Student</option>
							<%
                        try {
                            Class.forName("com.mysql.jdbc.Driver");
                            Connection con1 =DriverManager.getConnection ("jdbc:mysql://localhost:3306/test","root","papon728**");
                            ResultSet studentName = con1.createStatement().executeQuery("select distinct userName from results");
                            while (studentName.next()) {
                        %>
                 <option><%=studentName.getString(1) %></option>
             <%
           }
           %>
						</select>
					</div>
					<%				
					}catch(Exception e){
						out.println(e);
					}

							 %>
					
									
				</div>
				<div class="modal-footer">
					<input type="button" class="btn btn-default w3-o" data-dismiss="modal" value="Cancel">
					<input type="submit" class="btn btn-success" value="Apply Filter">
				</div>
			</form>
		</div>
	</div>
</div>
<!-- Edit Modal HTML -->
<center>
	<br>
<div id="editEmployeeModal" class="modal fade" style="display: none;" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<form action="Search_results.jsp">
				<div class="modal-header">						
					<h4 class="modal-title">Search Records</h4>
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
				</div>
				<div class="modal-body">					
					<div class="form-group">
						<label> Select Topic</label>
						<select name="selectTopic" class="form-control">
							<option>Select Topic</option>
							<%
                        try {
                            Class.forName("com.mysql.jdbc.Driver");
                            Connection con1 =DriverManager.getConnection ("jdbc:mysql://localhost:3306/test","root","papon728**");
                            ResultSet selectExamTopic = con1.createStatement().executeQuery("select distinct Topic from results");
                            while (selectExamTopic.next()) {
                        %>
                 <option><%=selectExamTopic.getString(1) %></option>
             <%
           }
           %>
         </select>
					</div>
					<div class="form-group">
						<label>Select Student</label>
						<select name="selectStudent" class="form-control">
							<option>Student</option>
							<%
							String stuname=null;
							ResultSet rs2=con1.createStatement().executeQuery("select distinct uid from results ");
							while(rs2.next()){
								String id=rs2.getString(1);
								ResultSet rs3=con1.createStatement().executeQuery("select studentName from student where id='"+id+"'");
								while(rs3.next()){
									stuname=rs3.getString(1);

							}
							 %>
							  <option><%=stuname %></option>
							<%
						}
				%>
			</select>
				</div>

		<%				
					}catch(Exception e){
						out.println(e);
					}

							 %>
				<div class="modal-footer">
					<input type="button" class="btn btn-default w3-red" data-dismiss="modal" value="Cancel">
					<input type="submit" class="btn btn-info" value="search">

				</div>
			</form>
		
		</div>
	</div>
</div>
</center>
<!-- Delete Modal HTML -->
<div id="deleteEmployeeModal" class="modal fade" style="display: none;" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<form action="Apply_filter.jsp">
				<div class="modal-header">						
					<h4 class="modal-title">Filter Records</h4>
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
				</div>
				<div class="modal-body">
					<div class="form-group">
						<label> Select Topic</label>
						<select name="selectTopic" class="form-control">
							<option>Select Topic</option>
							<%
                        try {
                            Class.forName("com.mysql.jdbc.Driver");
                            Connection con1 =DriverManager.getConnection ("jdbc:mysql://localhost:3306/test","root","papon728**");
                            ResultSet selectExamTopic = con1.createStatement().executeQuery("select distinct Topic from results");
                            while (selectExamTopic.next()) {
                        %>
                 <option><%=selectExamTopic.getString(1) %></option>
             <%
           }
           %>
         </select>
					</div>
					<!-- <div class="form-group">
						<label>Select Student</label>
						<select name="selectStudent" class="form-control">
							<option>Student</option>
							<%
							String stuname=null;
							ResultSet rs2=con1.createStatement().executeQuery("select distinct uid from results ");
							while(rs2.next()){
								String id=rs2.getString(1);
								ResultSet rs3=con1.createStatement().executeQuery("select studentName from student where id='"+id+"'");
								while(rs3.next()){
									stuname=rs3.getString(1);

							}
							 %>
							  <option><%=stuname %></option>
							<%
						}
				%>
			</select>
				</div>

		<%				
					}catch(Exception e){
						out.println(e);
					}

							 %> -->
					
				</div>
				<div class="modal-footer">
					<input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
					<input type="submit" class="btn btn-danger" value="Apply Filter">
				</div>
			</form>
		</div>
	</div>
</div>


</body></html>