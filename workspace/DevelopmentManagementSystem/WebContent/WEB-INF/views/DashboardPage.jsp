<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>

<html>

<head>

	<meta charset="UTF-8">
	<title>Dashboard</title>
	<meta charset="UTF-8">
	<title>Login</title>
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
	<style type="text/css">
		
		/* Sidebar */
		#sidebarWrapper {
			z-index: 1;
			position: absolute;
			width: 0;
			height: 100%;
			overflow-y: hidden;
			background: #f8f9fa;
		}
		
		/* Page content */
		#pageContentWrapper {
			width: 100%;
			position: absolute;
			padding: 15px;
		}
		
		/* Change the width of the sidebar to display it */
		#wrapper.menuDisplayed #sidebarWrapper {
			width: 250px;
		}
		
		/* fix overlapping when side menu opens up */
		#wrapper.menuDisplayed #pageContentWrapper {
			padding-left: 250px;
		}
		
		/* sidebar styling*/
		.sidebar-nav {
			padding: 0;
			list-style: none;
		}
		
		.sidebar-nav li {
			text-indent: 20px;
			line-height: 80px;
		}
		
		.sidebar-nav li a {
			display: block;
			text-decoration: none;
			color: #dc3545;
			font-weight: 900;
		}
		
		.sidebar-nav li a:hover {
			background: #E0E0E0;
		}
		
	</style>
	
</head>

<body>
	
	<nav class="navbar navbar-expand-lg navbar navbar-dark bg-dark">
	
		<a href="#" class="btn btn-primary mr-3" id="menuToggle">Menu</a>
	
		<a class="navbar-brand" href="#">Navbar</a>

		<div class="collapse navbar-collapse" id="navbarSupportedContent">
		
			<ul class="navbar-nav mr-auto">
				<li class="nav-item">
					<a class="nav-link" href="Dashboard?email=${param.email}&key=${param.key}">Dashboard</a>
				</li>
			</ul>
			
			<a class="btn btn-outline-primary mr-1 text-light" href="Logout?email=${param.email}">Logout</a>
		
		</div>
		
	</nav>
	
	<div id="wrapper">

		<!-- Sidebar -->
		<div id="sidebarWrapper">
			<ul class="sidebar-nav">
				<li><a>Projects</a></li>
				<li><a>To-do</a></li>
				<li><a>Calendar</a></li>				
				<li><a>COCOMO Calculator</a></li>				
				<li><a>Chat Rooms</a></li>				
			</ul>
		</div>
		
		<!-- Page Content -->	
	
		<div id="pageContentWrapper">
			<div class="container-fluid">
				<div class="row">
					<div class="col-lg-12">
						<h1>Sidebar Layout</h1>
					</div>
				</div>
			</div>
		</div>
	
	
	</div>
	
	<!--  Menu toggle script -->
	<script>
		$("#menuToggle").click(function(e){
			e.preventDefault();
			$("#wrapper").toggleClass("menuDisplayed");
		});
	</script>
	
</body>

</html>