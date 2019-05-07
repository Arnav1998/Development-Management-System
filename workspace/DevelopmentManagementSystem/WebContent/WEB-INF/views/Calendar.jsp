<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%  int id = 0; 
	String url = "jdbc:mysql://148.66.138.112:3306/projectX3337";
	String username="Arnav";
	String dbPassword="projectX3337";
%>

<%
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection( url, username, dbPassword );
    ResultSet rs = con.createStatement().executeQuery("SELECT COUNT(`id`) FROM `calendar"+request.getParameter("projectId")+"`");
    if (rs.next()) {
        id = rs.getInt(1)+1;
    }
%>


<!DOCTYPE html>

<html>

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<link href='css/fullcalendar.print.min.css' rel='stylesheet'
			media='print' />
		<link rel="stylesheet"
			href="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.4.0/fullcalendar.css" />
		<script
			src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
		<script
			src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
		<script
			src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.18.1/moment.min.js"></script>
		<script
			src="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.4.0/fullcalendar.min.js"></script>
		<script>
				            $(document).ready(function () {
				                $('#calendar').fullCalendar({
				                    editable: true,
				                    eventLimit: true, // allow "more" link when too many events
				                    events: "CalendarJsonServlet?projectId=<%=request.getParameter("projectId")%>",
				                    header:{
				               		   left:'month,agendaWeek,agendaDay',
				               		   center:'title',
				               		   right:'today, prevYear, prev, next, nextYear'
				               		},
				               		selectable:true,
				               	    selectHelper:true
				                });
				                
				            });
				</script>
		<link rel="icon" type="image/x-icon"
			href="http://example.com/favicon.ico" />
		<link rel="stylesheet"
			href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
			integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
			crossorigin="anonymous">
		
		<style>
		body {
			font-size: .875rem;
		}
		
		.feather {
			width: 16px;
			height: 16px;
			vertical-align: text-bottom;
		}
		
		.sidebar {
			position: fixed;
			top: 0;
			bottom: 0;
			left: 0;
			z-index: 100;
			padding: 0;
			box-shadow: inset -1px 0 0 rgba(0, 0, 0, .1);
		}
		
		.sidebar-sticky {
			position: -webkit-sticky;
			position: sticky;
			top: 48px; /* Height of navbar */
			height: calc(100vh - 48px);
			padding-top: .5rem;
			overflow-x: hidden;
			overflow-y: auto;
		}
		
		.sidebar .nav-link {
			font-weight: 500;
			color: #333;
		}
		
		.sidebar .nav-link .feather {
			margin-right: 4px;
			color: #999;
		}
		
		.sidebar .nav-link.active {
			color: #007bff;
		}
		
		.sidebar .nav-link:hover .feather, .sidebar .nav-link.active .feather {
			color: inherit;
		}
		
		.sidebar-heading {
			font-size: .75rem;
			text-transform: uppercase;
		}
		
		.navbar-brand {
			padding-top: .75rem;
			padding-bottom: .75rem;
			font-size: 1rem;
			background-color: rgba(0, 0, 0, .25);
			box-shadow: inset -1px 0 0 rgba(0, 0, 0, .25);
		}
		
		.navbar .form-control {
			padding: .75rem 1rem;
			border-width: 0;
			border-radius: 0;
		}
		
		.form-control-dark {
			color: #fff;
			background-color: rgba(255, 255, 255, .1);
			border-color: rgba(255, 255, 255, .1);
		}
		
		.form-control-dark:focus {
			border-color: transparent;
			box-shadow: 0 0 0 3px rgba(255, 255, 255, .25);
		}
		
		.border-top {
			border-top: 1px solid #e5e5e5;
		}
		
		.border-bottom {
			border-bottom: 1px solid #e5e5e5;
		}
		</style>

	</head>

	<body>
		<nav class="navbar navbar-dark sticky-top bg-dark flex-md-nowrap p-0">
			<a class="navbar-brand col-sm-3 col-md-2 mr-0" href="#">Project X</a>
			<input class="form-control form-control-dark w-100" type="text"
				placeholder="Search" aria-label="Search">
			<ul class="navbar-nav px-3">
				<li class="nav-item text-nowrap"><a class="nav-link"
					href="Logout?email=${param.email}">Sign out</a></li>
			</ul>
		</nav>
	
		<div class="container-fluid">
			<div class="row">
				<nav class="col-md-2 d-none d-md-block bg-light sidebar">
					<div class="sidebar-sticky">
						<ul class="nav flex-column">
							<li class="nav-item"><a class="nav-link active"
								href="ProjectDashboard?email=${param.email}&key=${param.key}&projectId=${param.projectId}&projectName=${param.projectName}">
									<span data-feather="home"></span> Dashboard <span
									class="sr-only">(current)</span>
							</a></li>
							<li class="nav-item"><a class="nav-link"
								href="ToDoList?email=${param.email}&key=${param.key}&projectId=${param.projectId}&projectName=${param.projectName}">
									<span data-feather="file"></span> Todo
							</a></li>
							<li class="nav-item"><a class="nav-link"
								href="Contacts?email=${param.email}&key=${param.key}&projectId=${param.projectId}&projectName=${param.projectName}">
									<span data-feather="users"></span> Contacts
							</a></li>
							<li class="nav-item"><a class="nav-link"
								href="Chatroom?email=${param.email}&key=${param.key}&projectId=${param.projectId}&projectName=${param.projectName}">
									<span data-feather="message-circle"></span> Chat Room
							</a></li>
							<li class="nav-item"><a class="nav-link"
								href="Budget?email=${param.email}&key=${param.key}&projectId=${param.projectId}&projectName=${param.projectName}">
									<span data-feather="bar-chart-2"></span> Budget Analysis
							</a></li>
							<li class="nav-item"><a class="nav-link" href="#"> <span
									data-feather="calendar"></span> Calendar
							</a></li>
							<li class="nav-item"><a class="nav-link" href="#"> <span
									data-feather="alert-triangle"></span> Reminders
							</a></li>
							<li class="nav-item"><a class="nav-link" href="#"> <span
									data-feather="clock"></span> Meeting Scheduler
							</a></li>
							<li class="nav-item"><a class="nav-link"
								href="Dashboard?email=${param.email}&key=${param.key}"> <span
									data-feather="clock"></span> All Projects
							</a></li>
	
						</ul>
					</div>
				</nav>
				
				<main role="main" class="col-md-9 ml-sm-auto col-lg-10 pt-3 px-4">
					
					<div style="margin: 15px;">
						<div id="calendar"></div>
		
						<hr style="border-top: 5px solid gold;">
						
						<h3 class="text-center mt-3 mb-0">Add Event</h3>
		
						<form action="AddCalendarEvent" method="POST" class="mt-3 mx-auto border p-5 bg-light">
							<div class="form-group" style=" display: none;">
								<label class="font-weight-bold">Id</label> 
								<input type="text" class="form-control" value="<%= id%>" name="id" minlength="1" readonly="readonly">
							</div>
		
							<div class="form-group">
								<label class="font-weight-bold">Title</label> 
								<input type="text" class="form-control" placeholder="Check db requirements" name="title" minlength="1">
							</div>
		
							<div class="form-group">
								<label class="font-weight-bold">Start</label> 
								<input type="date" class="form-control" placeholder="06/10/19" name="start">
							</div>
		
							<div class="form-group">
								<label class="font-weight-bold">End</label> 
								<input type="date" class="form-control" placeholder="06/11/19" name="end">
							</div>
		
							<input type="hidden" name="email" value="${param.email}"> 
							<input type="hidden" name="key" value="${param.key}"> 
							<input type="hidden" name="projectId" value="${param.projectId}">
							<input type="hidden" name="projectName" value="${param.projectName}">
							<button type="submit" class="btn btn-primary form-control">Add Event</button>
		
						</form>
					</div>

				</main>
			</div>
		</div>
		
	    <!-- Icons -->
	    <script src="https://unpkg.com/feather-icons/dist/feather.min.js"></script>
	    <script>
	      feather.replace()
	    </script>

	</body>

</html>

