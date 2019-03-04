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
	
	<h1 class="text-center mt-5">Join Us</h1>
	
	<h2 class="text-center mt-2 text-secondary">The best way to manage and keep track of your project.</h2>
	
	<div class="mt-5 mx-auto border p-5 bg-light" style="width: 600px;">

		<form action="SignUp" method="POST">
			
			
			<div class="form-group">
			
				<label class="font-weight-bold">First Name</label> 
				<input type="text" class="form-control" placeholder="Tom" name="firstName" minlength="1">
				
			</div>
			
			
			<div class="form-group">
			
				<label class="font-weight-bold">Last Name</label> 
				<input type="text" class="form-control" placeholder="Bradley" name="lastName" minlength="1">
				
			</div>
		
			<div class="form-row">
			
				<div class="form-group col-md-6">
					<label class="font-weight-bold">Email</label> 
					<input type="email" class="form-control" placeholder="Email" name="email">
				</div>
				
				<div class="form-group col-md-6">
					<label class="font-weight-bold">Password</label> 
					<input type="password" class="form-control" placeholder="Password" name="password" minlength="5">
				</div>
				
			</div>
			
			<div class="form-group">
			
				<label class="font-weight-bold">Phone</label> 
				<input type="text" class="form-control" placeholder="8888888888" name="phone" minlength="10">
				
			</div>
			
			<div class="form-group">
			
				<label for="inputAddress" class="font-weight-bold">Address</label> 
				<input type="text" class="form-control" placeholder="1234 Main St" name="address" minlength="5">
				
			</div>
			
			<div class="form-row">
			
				<div class="form-group col-md-6">
					<label class="font-weight-bold">City</label> 
					<input type="text" class="form-control" name="city" placeholder="Los Angeles" minlength="1">
				</div>
				
				<div class="form-group col-md-4">
				
					<label class="font-weight-bold">State</label> 
					<select id="inputState" class="form-control" name="state">
						<option selected>Choose...</option>
						<option>Alabama</option>
						<option>Alaska</option>
						<option>Arizona</option>
						<option>Arkansas</option>
						<option>California</option>
						<option>Colorado</option>
						<option>Connecticut</option>
						<option>Delaware</option>
						<option>Florida</option>
						<option>Georgia</option>
						<option>Hawaii</option>
						<option>Idaho</option>
						<option>Illinois</option>
						<option>Indiana</option>
						<option>Iowa</option>
						<option>Kansas</option>
						<option>Kentucky</option>
						<option>Louisiana</option>
						<option>Maine</option>
						<option>Maryland</option>
						<option>Massachusetts</option>
						<option>Michigan</option>
						<option>Minnesota</option>
						<option>Mississippi</option>
						<option>Missouri</option>
						<option>Montana</option>
						<option>Nebraska</option>
						<option>Nevada</option>
						<option>New Hampshire</option>
						<option>New Jersey</option>
						<option>New Mexico</option>
						<option>New York</option>
						<option>North Carolina</option>
						<option>North Dakota</option>
						<option>Ohio</option>
						<option>Oklahoma</option>
						<option>Oregon</option>
						<option>Pennsylvania</option>
						<option>Rhode Island</option>
						<option>South Carolina</option>
						<option>South Dakota</option>
						<option>Tennessee</option>
						<option>Texas</option>
						<option>Utah</option>
						<option>Vermont</option>
						<option>Virginia</option>
						<option>Washington</option>
						<option>West Virginia</option>
						<option>Wisconsin</option>
						<option>Wyonming</option>
					</select>
				
				</div>
				
				<div class="form-group col-md-2">
					
					<label class="font-weight-bold">Zip</label> 
					<input type="text" class="form-control" name="zip" placeholder="90032" minlength="1">
				
				</div>
			
			</div>
			
			<!-- <div class="form-group">
			
				<div class="form-check">
					<input class="form-check-input" type="checkbox">
					<label class="form-check-label"> I agree to the terms and conditions! </label>
				</div>
				
			</div> -->
			
			<button type="submit" class="btn btn-primary form-control">Sign Up</button>
		
		</form>
	
	</div>



</body>

</html>