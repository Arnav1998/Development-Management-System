<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>

<sql:setDataSource
	driver="com.mysql.jdbc.Driver"
	url="jdbc:mysql://148.66.138.112:3306/projectX3337"
	user="Arnav"
	password="projectX3337"
/>
  
<!DOCTYPE html>

<html>

<head>

	<meta charset="UTF-8">
	<title>Dashboard</title>
	<meta charset="UTF-8">
	<title>Login</title>
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
	
	<style type="text/css">
		
		.left, .right {
			height: 50vh;
			width: 100%;
		}
		
		@media screen and (min-width:768px) {
			
			.left, .right {
				height: 100vh;
			}
		
		}
		 
		.left {
			background: url(images/leftDashboardImg.jpg) no-repeat center center;
			background-size: cover;
		}
		
		.right {
			background: url(images/rightDashboardImg.jpg) no-repeat center center;
			background-size: cover;
		}
		
		
	</style>
		
</head>

<body>
 	
 	<nav class="navbar navbar-expand-lg navbar navbar-dark bg-dark">
	
		<a class="navbar-brand" href="#">Navbar</a>

		<ul class="navbar-nav mr-auto">
			<li class="nav-item">
				<a class="nav-link" href="Dashboard?email=${param.email}&key=${param.key}">Dashboard</a>
			</li>
		</ul>
		
		<form class="form-inline" action="Search" method="POST">
			<input class="form-control mr-sm-2" name="searchQuery" type="search" placeholder="Search" aria-label="Search">
			<input type="hidden" name="email" value="${param.email}">
			<input type="hidden" name="key" value="${param.key}">
			<button class="btn btn-outline-primary my-2 my-sm-0 m-2 text-light">Search</button>
		</form>

		<a class="btn btn-outline-primary mr-1 text-light" href="Logout?email=${param.email}">Logout</a>

	</nav>

	<div class="row no-gutters">
	
		<div class="col-md-6 no-gutters">
			<div class="left d-flex justify-content-center align-items-center">
				<div>
					<h3>Existing Projects</h3>
					<c:if test="${not empty projectList}">
						<c:forEach items="${projectList}" var="projectId">
	
							<sql:query var="items">
								SELECT `name` FROM `projects` WHERE `id`= ${projectId}
							</sql:query>
	
							<c:forEach items="${items.rowsByIndex}" var="row">
								<c:forEach items="${row}" var="col">
<<<<<<< HEAD
									<a href="#" class="btn btn-primary lg d-flex justify-content-center align-items-center mt-1">${col}</a>
=======
									<a href="ProjectDashboard?email=${param.email}&key=${param.key}&projectId=${projectId}&projectName=${col}" class="btn btn-primary lg d-flex justify-content-center align-items-center mt-1">${col}</a>
>>>>>>> 1659176728bd51cc56608c34f066ce1df726b07b
								</c:forEach>
							</c:forEach>
	
						</c:forEach>
					</c:if>
					<c:if test="${empty projectList}">
						<h3 class="btn btn-danger lg d-flex justify-content-center align-items-center">No projects found</h3>
					</c:if>
				</div>
			</div>
		</div>
	
		<div class="col-md-6 no-gutters">
			<div class="right d-flex justify-content-center align-items-center">
				<div>
					<h3> Create New Project</h3>
					<a href="NewProject?email=${param.email}&key=${param.key}" class="btn btn-primary lg d-flex justify-content-center align-items-center">Create Project</a>
				</div>
			</div>
		</div>
	
	</div>

</body>

</html>