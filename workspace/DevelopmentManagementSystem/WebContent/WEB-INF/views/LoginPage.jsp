<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
					<a class="nav-link" href="Home">Home</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="#">About Us</a>
				</li>
			</ul>
			
			<a class="btn btn-outline-primary mr-1 text-light" href="SignUp">SignUp</a>
			<a class="btn btn-outline-primary text-light" href="Login">Login</a>
		
		</div>
		
	</nav>
	
	<h1 class="text-center mt-5">Sign In</h1>
	
	<c:if test="${param.access==0}">
		
		<div class="card mt-5 mx-auto" style="width: 600px;">
			<div class="card-header text-white bg-danger">An Error has occured.</div>
			<div class="card-body alert alert-danger">
	  				Incorrect username or password.
			</div>
		</div>
	
	</c:if>
	
	<div class="mt-5 mx-auto border p-5 bg-light" style="width: 600px;">

		<form action="Login" method="POST">
		
			<div class="form-group">		
				<label class="font-weight-bold">Email address</label> 
				<input type="email" class="form-control" placeholder="Enter email" name="email"> 
				<small class="form-text text-muted">We'll never share your email with anyone else.</small>
			</div>
			
			<div class="form-group">
				<label class="font-weight-bold">Password</label> 
				<input type="password" class="form-control" placeholder="Password" name="password" minlength="5">
			</div>
			<button type="submit" class="btn btn-primary form-control">Submit</button>
			
		</form>
		
	</div>
	
	<div class="mt-5 mx-auto border p-3 bg-light" style="width: 600px;">
	
		<label>Dont have an account? <a href="SignUp">Create an account.</a></label>
	
	</div>

</body>

</html>