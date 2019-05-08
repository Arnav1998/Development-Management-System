<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
    
<!DOCTYPE html>

<html>

	<head>
		<meta charset="UTF-8">
		<title>Search</title>
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
	</head>

	<body>

		<nav class="navbar navbar-expand-lg navbar navbar-dark bg-dark">
	
			<a class="navbar-brand" href="#">Project X</a>
	
			<ul class="navbar-nav mr-auto">
				<li class="nav-item"><a class="nav-link"
					href="Dashboard?email=${param.email}&key=${param.key}">Dashboard</a>
				</li>
			</ul>
	
			<form class="form-inline" action="Search" method="POST">
				<input class="form-control mr-sm-2" name="searchQuery" type="search"
					placeholder="Search" aria-label="Search"> <input
					type="hidden" name="email" value="${email}"> <input
					type="hidden" name="key" value="${key}">
				<button class="btn btn-outline-primary my-2 my-sm-0 m-2 text-light">Search</button>
			</form>
	
			<a class="btn btn-outline-primary mr-1 text-light"
				href="Logout?email=${param.email}">Logout</a>
	
		</nav>


		<h1 class="text-center mt-5">Results</h1>
		<h4 class="text-center mt-5">${fn:length(projectMap)} item(s) found</h4>
		
		<div class="mt-5 mx-auto border p-5 bg-light" style="width: 600px;">

			<table class="table table-bordered table-striped table-hover text-center">
			
				<c:forEach items="${projectMap}" var="entry">
					<tr>
						<td><strong><a href="ProjectDescriptor?email=${email}&key=${key}&id=${entry.key}&name=${entry.value}">${entry.value}</a></strong></td>
					</tr>
				</c:forEach>
				
			</table>
		
		</div>
		
		
</body>

</html>