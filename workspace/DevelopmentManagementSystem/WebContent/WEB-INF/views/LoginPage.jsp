<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>

<head>

	<meta charset="UTF-8">
	<title>Login</title>
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">

</head>

<body>

	<nav class="navbar navbar-expand-lg navbar navbar-dark bg-dark">
	
		<a class="navbar-brand" href="#">Navbar</a>

		<div class="collapse navbar-collapse" id="navbarSupportedContent">
		
			<ul class="navbar-nav mr-auto">
				<li class="nav-item">
					<a class="nav-link" href="#">Home</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="#">About Us</a>
				</li>
			</ul>
			
			<a class="btn btn-outline-primary mr-1 text-light" href="#">SignUp</a>
			<a class="btn btn-outline-primary text-light" href="Login">Login</a>
		
		</div>
		
	</nav>
	
	<div class="mt-5 mx-auto" style="width: 600px;">

		<form action="#">
		
			<div class="form-group">		
				<label>Email address</label> 
				<input type="email" class="form-control" placeholder="Enter email"> 
				<small class="form-text text-muted">We'll never share your email with anyone else.</small>
			</div>
			
			<div class="form-group">
				<label>Password</label> 
				<input type="password" class="form-control" placeholder="Password">
			</div>
			<button type="submit" class="btn btn-primary">Submit</button>
			
		</form>
		
	</div>

</body>

</html>