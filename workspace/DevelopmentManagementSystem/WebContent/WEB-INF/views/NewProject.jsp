<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>

<html>

	<head>
		<meta charset="UTF-8">
		<title>Create Project</title>
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
	</head>
	
	<body>
		
		<nav class="navbar navbar-expand-lg navbar navbar-dark bg-dark">
	
			<a class="navbar-brand" href="Dashboard?email=${param.email}&key=${param.key}">Dashboard</a> 
	
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				
				<a class="btn btn-outline-primary mr-1 text-light" href="Logout?email=${param.email}">Logout</a>
			
			</div>
		
		</nav>

		<h1 class="text-center mt-5">Create Project</h1>
	
		<h2 class="text-center mt-2 text-secondary">The best way to manage and keep track of your project.</h2>
		
		<div class="mt-5 mx-auto border p-5 bg-light" style="width: 600px;">
	
			<form action="NewProject" method="POST"> 
				<div class="form-group">
				
					<label class="font-weight-bold">Project Name</label> 
					<input type="text" class="form-control" placeholder="Tetris" name="projectName" minlength="1">
					
				</div>
				
				<input type="hidden" name="email" value="${param.email}">
				<input type="hidden" name="key" value="${param.key}">
				
				<button type="submit" class="btn btn-primary form-control">Create Project</button>
			
			</form>
		
		</div>
			
	</body>

</html>