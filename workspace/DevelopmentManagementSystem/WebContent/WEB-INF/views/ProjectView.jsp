<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
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

	<a href="#" class="btn btn-primary mr-3" id="menuToggle">Menu</a>

	<!-- Sidebar -->
	<div id="sidebarWrapper">
		<ul class="sidebar-nav">
			<li><a>Projects</a></li>
			<li><a>To-do</a></li>
			<li><a>Calendar</a></li>
		</ul>
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