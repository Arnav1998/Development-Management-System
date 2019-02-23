<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>

<head>

	<meta charset="UTF-8">
	<title>Sign Up!</title>
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

		<form>
		
			<div class="form-row">
			
				<div class="form-group col-md-6">
					<label>Email</label> 
					<input type="email" class="form-control" placeholder="Email">
				</div>
				
				<div class="form-group col-md-6">
					<label>Password</label> 
					<input type="password" class="form-control" placeholder="Password">
				</div>
				
			</div>
			
			<div class="form-group">
			
				<label for="inputAddress">Address</label> 
				<input type="text" class="form-control" placeholder="1234 Main St">
				
			</div>
			
			<div class="form-row">
			
				<div class="form-group col-md-6">
					<label>City</label> 
					<input type="text" class="form-control">
				</div>
				
				<div class="form-group col-md-4">
				
					<label>State</label> 
					<select id="inputState" class="form-control">
						<option selected>Choose...</option>
						<option>...</option>
					</select>
				
				</div>
				
				<div class="form-group col-md-2">
					
					<label>Zip</label> 
					<input type="text" class="form-control">
				
				</div>
			
			</div>
			
			<div class="form-group">
			
				<div class="form-check">
					<input class="form-check-input" type="checkbox">
					<label class="form-check-label"> I agree to the terms and conditions! </label>
				</div>
				
			</div>
			
			<button type="submit" class="btn btn-primary">Sign Up</button>
		
		</form>
	
	</div>



</body>

</html>