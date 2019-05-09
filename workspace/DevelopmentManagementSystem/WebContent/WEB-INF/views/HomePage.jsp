<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>

<head>

	<meta charset="UTF-8">
	<title>Home</title>
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
	<link href="http://maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">

	
	<style type="text/css">
		
		html, body {
			height: 100%;
			width: 100%;
		}

		.navbar {
			
			padding: 1%;
			font-size: 1.2em;
		}

		#home {
			background: url(images/homeImage.jpg) no-repeat center center fixed;
			display: table;
			height: 100%;
			position: relative;
			width: 100%;
			background-size: cover;
		}

		.landing-text {
			display: table-cell;
			text-align: center;
			vertical-align: middle;
			color: #FFF;
		}

		.landing-text h1 {
			font-size: 500%;
			font-weight: 700;
		}

		.padding {
			padding: 80px 0;
		}

		.padding img {
			width: 100%;
		}

		#fixed {
			background: no-repeat center center fixed;
			display: table;
			height: 60%;
			position: relative;
			width: 100%
		}

		.fa {
			padding: 15px;
			font-size: 25px;
			color: #FFF;
		}

		.fa:hover {
			color: #D5D5D5;
			text-decoration: none;
		}

		.icon {
			max-width: 200px;
		}

		@media (max-width: 768px) {
			.landing-text h1 {
				font-size: 300%;
			}
			.fa {
				font-size: 20px;
				padding: 10px;
			}
			.icon {
				padding-top: 5%;
				max-width: 100px;
			}
		}
		
	</style>
	
</head>

<body>
	
	<nav class="navbar navbar-expand-lg navbar navbar-dark bg-dark">
	
		<a class="navbar-brand text-white">Project X</a>

		<div class="collapse navbar-collapse" id="navbarSupportedContent">
		
			<ul class="navbar-nav mr-auto">
				<li class="nav-item">
					<a class="nav-link">Home</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="#">About Us</a>
				</li>
			</ul>
			
			<a class="btn btn-outline-primary mr-1 text-light" href="SignUp">SignUp</a>
			<a class="btn btn-outline-primary text-light" href="Login">Login</a>
		
		</div>
		
	</nav>

	<div id="home">
		<div class="landing-text">
			<h1>Project X</h1>
			<h3>An innovative way to track projects and stay on track.</h3>
			<a href="SignUp" class="btn btn-outline-light btn-lg">Get Started</a>
		</div>
	</div>


	<div class="padding" style="background: #f9f9f9;">
		
		<div class="container">
			
			<div class="row">
				<div class="col-sm-6">
					<img src="images/groupImage.jpg">
				</div>
				<div class="col-sm-6 text-center">
					<h2>All new way to customize your work-flow</h2>
					<p class="lead">A unique flexible way for teams to communicate with one another, while keeping track of the deadlines, and the progress.</p>
					<p class="lead">Check for work schedules, call in meetings, or simply contact any person in your team with one click.</p>
				</div>
			</div>

		</div>

	</div>


	<div class="padding">

		<div class="container">

			<div class="row">

				<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">

					<h4>Built with Affection</h4>
					<p class="lead">Project X has been designed to help you save time, and get over all the frustrations involved in group work. Save time, save effort and stay organized.</p>

				</div>

				<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">

					<img src="images/homeInfoImage.png" class="img-responsive">

				</div>

				<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">

					<h4>Built with dedication</h4>
					<p class="lead">See at a glance the next actions you should do in order to finish your project. See which tasks should be done today, which should be done soon and which are overdue.</p>
					
				</div>

				<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">

					<img src="images/homeInfoImage2.png" class="img-responsive">
					
				</div>


			</div>
		
		</div>

	</div>

	<div class="padding" style="background: #f9f9f9;">
		
		<div class="container align-items-center">
			
			<div class="row align-items-center bg-light">
				<div class="col-sm-6 text-center">
					<h2>Making life easier.</h2>
					<p class="lead">Stay up to date with your projects to make sure you will meet your deadlines.</p>
					<p class="lead">Share files, ideas, comments, and more to get work done as a team.</p>
				</div>
				<div class="col-sm-6">
					<img src="images/homeGroupWorkImage.jpg">
				</div>
			</div>

		</div>

	</div>


	<footer class="container-fluid text-center bg-dark" style="border-top: solid 5px gold;">
		<div class="row">
			<div class="col">
				<h3 style="color: #fff; padding-top: 2%;">Contact Us</h3>
			</div>
			<div class="col">
				<h3 style="color: #fff; padding-top: 2%;">Legal</h3>
			</div>
		</div>
	</footer>

</body>

</html>