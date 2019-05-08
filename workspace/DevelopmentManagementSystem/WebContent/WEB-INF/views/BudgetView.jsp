<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>

<html>

	<head>
		<meta charset="utf-8">
	    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	    <title>Budget Analysis</title>
		<link rel="icon" type="image/x-icon" href="http://example.com/favicon.ico" />
	    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
	
	    <style>
			body {
			  font-size: .875rem;
			}
			
			.feather {
			  width: 16px;
			  height: 16px;
			  vertical-align: text-bottom;
			}
			
			.sidebar {
			  position: fixed;
			  top: 0;
			  bottom: 0;
			  left: 0;
			  z-index: 100; 
			  padding: 0;
			  box-shadow: inset -1px 0 0 rgba(0, 0, 0, .1);
			}
			
			.sidebar-sticky {
			  position: -webkit-sticky;
			  position: sticky;
			  top: 48px; /* Height of navbar */
			  height: calc(100vh - 48px);
			  padding-top: .5rem;
			  overflow-x: hidden;
			  overflow-y: auto; 
			}
			
			.sidebar .nav-link {
			  font-weight: 500;
			  color: #333;
			}
			
			.sidebar .nav-link .feather {
			  margin-right: 4px;
			  color: #999;
			}
			
			.sidebar .nav-link.active {
			  color: #007bff;
			}
			
			.sidebar .nav-link:hover .feather,
			.sidebar .nav-link.active .feather {
			  color: inherit;
			}
			
			.sidebar-heading {
			  font-size: .75rem;
			  text-transform: uppercase;
			}
			
			.navbar-brand {
			  padding-top: .75rem;
			  padding-bottom: .75rem;
			  font-size: 1rem;
			  background-color: rgba(0, 0, 0, .25);
			  box-shadow: inset -1px 0 0 rgba(0, 0, 0, .25);
			}
			
			.navbar .form-control {
			  padding: .75rem 1rem;
			  border-width: 0;
			  border-radius: 0;
			}
			
			.form-control-dark {
			  color: #fff;
			  background-color: rgba(255, 255, 255, .1);
			  border-color: rgba(255, 255, 255, .1);
			}
			
			.form-control-dark:focus {
			  border-color: transparent;
			  box-shadow: 0 0 0 3px rgba(255, 255, 255, .25);
			}
			
			.border-top { border-top: 1px solid #e5e5e5; }
			.border-bottom { border-bottom: 1px solid #e5e5e5; }  
	    
	    </style>
	</head>
	
	<body>
	
		<nav class="navbar navbar-dark sticky-top bg-dark flex-md-nowrap p-0">
	      <a class="navbar-brand col-sm-3 col-md-2 mr-0" href="#">Project X</a>
	      <input class="form-control form-control-dark w-100" type="text" placeholder="Search" aria-label="Search">
	      <ul class="navbar-nav px-3">
	        <li class="nav-item text-nowrap">
	          <a class="nav-link" href="Logout?email=${param.email}">Sign out</a>
	        </li>
	      </ul>
	    </nav>
	
	
		<div class="container-fluid">
			<div class="row">
				<nav class="col-md-2 d-none d-md-block bg-light sidebar">
		          <div class="sidebar-sticky">
		            <ul class="nav flex-column">
		              <li class="nav-item">
		                <a class="nav-link" href="ProjectDashboard?email=${param.email}&key=${param.key}&projectId=${param.projectId}&projectName=${param.projectName}">
		                  <span data-feather="home"></span>
		                  Dashboard <span class="sr-only">(current)</span>
		                </a>
		              </li>
		              <li class="nav-item">
		                <a class="nav-link" href="ToDoList?email=${param.email}&key=${param.key}&projectId=${param.projectId}&projectName=${param.projectName}">
		                  <span data-feather="file"></span>
		                  Todo
		                </a>
		              </li>
		              <li class="nav-item">
		                <a class="nav-link" href="Contacts?email=${param.email}&key=${param.key}&projectId=${param.projectId}&projectName=${param.projectName}">
		                  <span data-feather="users"></span>
		                  Contacts
		                </a>
		              </li>
		              <li class="nav-item">
		                <a class="nav-link" href="Chatroom?email=${param.email}&key=${param.key}&projectId=${param.projectId}&projectName=${param.projectName}">
		                  <span data-feather="message-circle"></span>
		                  Chat Room
		                </a>
		              </li>
		              <li class="nav-item">
		                <a class="nav-link active" href="Budget?email=${param.email}&key=${param.key}&projectId=${param.projectId}&projectName=${param.projectName}">
		                  <span data-feather="bar-chart-2"></span>
		                  Budget Analysis
		                </a>
		              </li>
		              <li class="nav-item">
		                <a class="nav-link" href="Calendar?email=${param.email}&key=${param.key}&projectId=${param.projectId}&projectName=${param.projectName}"">
		                  <span data-feather="calendar"></span>
		                  Calendar
		                </a>
		<!--               </li>
		                <li class="nav-item">
		                <a class="nav-link" href="#">
		                  <span data-feather="alert-triangle"></span>
		                  Reminders
		                </a>
		              </li> -->
		              <li class="nav-item">
		                <a class="nav-link" href="MeetingScheduler?email=${param.email}&key=${param.key}&projectId=${param.projectId}&projectName=${param.projectName}">
		                  <span data-feather="clock"></span>
		                  Meeting Scheduler
		                </a>
		              </li>
		              <li class="nav-item">
		                <a class="nav-link" href="Dashboard?email=${param.email}&key=${param.key}">
		                  <span data-feather="grid"></span>
		                  All Projects
		                </a>
		              </li>
		              
		            </ul>
		          </div>
		        </nav>
				
				<main role="main" class="col-md-9 ml-sm-auto col-lg-10 pt-3 px-4">
					
					<h1 class="text-center mb-0 ml-3">Budget Report</h1>
					
					<div class="row mt-5">
					
						  <div class="col bg-success p-3 text-white">
						  
						  	<c:if test="${budget!=0}">
						  		
						  		<h5 class="text-center">Project Budget: ${budget}$</h5>
						  	
						  	</c:if>
						  	
						  	<c:if test="${budget==0}">
						  		
						  		<label class="font-weight-bold">Set Project Budget:</label>
						  		<form action="AddBudget" method="POST"> 
									<div class="form-group"> 
										<input type="number" class="form-control" placeholder="250000" name="budget" minlength="1">
									</div>
									
									<input type="hidden" name="email" value="${param.email}">
									<input type="hidden" name="key" value="${param.key}">
									<input type="hidden" name="projectName" value="${param.projectName}">
									<input type="hidden" name="projectId" value="${param.projectId}">
									
									<button type="submit" class="btn btn-outline-light form-control">Add</button>
								
								</form>
						  		
						  	</c:if>
						  
						  </div>
						  
						  <div class="col bg-warning p-3 text-dark">
						  
						  	 <h5 class="text-center">Money Spent: ${moneySpent}$</h5>
						  
						  </div>
						  
						  <div class="col bg-danger p-3 text-white">
						  
						 	 <h5 class="text-center">Money Remaining: ${budget-moneySpent}$</h5>
						  
						  </div>
						  
					</div>
					
					<hr style="border: 1px solid light-grey;">
					
										
					<div class="mt-5 mx-auto border p-3 bg-light" style="width: 100%;">
						
						<h4 class="text-center">Expenses</h4>
					
						<table class="table table-bordered table-striped table-hover text-center">
							
								<tr>
				    				<td><strong>Number</strong></td>
									<td><strong>Title</strong></td>
									<td><strong>Amount Used</strong></td>
									<td><strong>Authorizer</strong></td>
									<!-- <td><strong>Action</strong></td> -->
								</tr> 
							
								<c:forEach items="${budgetList}" var="budgetItem">
									<tr>
										<c:forEach items="${budgetItem}" var="value" varStatus="index">
										
											<c:if test="${index.count==1}">
												<td style="border-left: 5px solid gold;">${value}</td>
											</c:if>
											 
											<c:if test="${index.count!=1}">
												<td >${value}</td>
											</c:if>
											
										</c:forEach>
									</tr>
								</c:forEach>
									
							</table>
						
						
						
						
						
					
					</div>
					
					<div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pb-2 mb-3 border-bottom">						
					
						<div class="mt-5 mx-auto border p-3 bg-light mb-3" style="width: 100%;">
				
							<h4 class="text-center">Add Expenses</h4>
							
							<form action="AddExpense" method="POST"> 
								<div class="form-group">
								
									<label class="font-weight-bold">Title</label> 
									<input type="text" class="form-control" placeholder="Testing Cost" name="title" minlength="1">
									
								</div>
								
								<div class="form-group">
								
									<label class="font-weight-bold">Amount Used</label> 
									<input type="number" class="form-control" placeholder="69000" name="amount_used" minlength="1">
									
								</div>
								
								<div class="form-group">
								
									<label class="font-weight-bold">Authorizer</label> 
									<input type="text" class="form-control" placeholder="Tim Apple" name="authorizer" minlength="1">
									
								</div>
								
								<input type="hidden" name="email" value="${param.email}">
								<input type="hidden" name="key" value="${param.key}">
								<input type="hidden" name="projectId" value="${param.projectId}">
								<input type="hidden" name="projectName" value="${param.projectName}">
								
								<button type="submit" class="btn btn-primary form-control">Add Expense</button>
							</form>
							
								
						</div>
						
						
					</div>
								
					<div class="mt-3 mx-auto border p-5 bg-light" style="width: 100%;">
						<canvas class="my-4" id="myChart" width="900" height="380"></canvas>				
					</div>
					
					<hr style="border: 5px solid gold;"> 
					
					<%-- <div class="mt-5 mx-auto border p-3 bg-light mb-5" style="width: 100%;">
						
						<!-- COCOMO COST PREDICTIONS -->
						<h4 class="text-center">Cost Predictions</h4>
						
						<div class="card mt-2 mx-auto mb-2" style="width: 100%;">
							<div class="card-header text-white bg-danger">Warning</div>
							<div class="card-body alert alert-danger">
					  			The functions used below to make cost or budget predictions are based on the Constructive Cost Model (COCOMO), a procedural software cost estimation model developed by Barry W. Boehm. The data produced below are just approximations meant to give an idea about the overall distribution of project cost and may not match the actual real world values.
							</div>
						</div>
						
						<form action="#" method="POST"> 
							<div class="form-group">
								
								<label class="font-weight-bold">Title</label> 
								<input type="text" class="form-control" placeholder="Testing Cost" name="title" minlength="1">
								
							</div>
							
							<div class="form-group">
							
								<label class="font-weight-bold">Amount Used</label> 
								<input type="number" class="form-control" placeholder="69000" name="amount_used" minlength="1">
									
							</div>
								
							<div class="form-group">
								
								<label class="font-weight-bold">Authorizer</label> 
								<input type="text" class="form-control" placeholder="Tim Apple" name="authorizer" minlength="1">
									
							</div>
								
							<input type="hidden" name="email" value="${param.email}">
							<input type="hidden" name="key" value="${param.key}">
							<input type="hidden" name="projectId" value="${param.projectId}">								<input type="hidden" name="projectName" value="${param.projectName}">
								
							<button type="submit" class="btn btn-primary form-control">Add Expense</button>
						</form>
						
						
						
						
						
						
					</div> --%>
					
					
				</main>
				
			</div>
		</div>
	
		<!-- Bootstrap core JavaScript
	    ================================================== -->
		<!-- Placed at the end of the document so the pages load faster -->
		<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
			integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
			crossorigin="anonymous"></script>
		<script>window.jQuery || document.write('<script src="../../assets/js/vendor/jquery-slim.min.js"><\/script>')</script>
		<script src="../../assets/js/vendor/popper.min.js"></script>
		<script src="../../dist/js/bootstrap.min.js"></script>
	
		<!-- Icons -->
		<script src="https://unpkg.com/feather-icons/dist/feather.min.js"></script>
		<script>
	      feather.replace()
	    </script>
	    
	    <!-- Graphs -->
	    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.1/Chart.min.js"></script>
	    <script>
		   	  var ctx = document.getElementById("myChart");
		      var myChart = new Chart(ctx, {
		        type: 'pie',
		        data: {
		          labels: ["Total Budget", "Amount Spent", "Amount Remaining"],
		          datasets: [{
		        	label: "Budget Overview",
		            data: [${budget}, ${moneySpent}, ${budget-moneySpent}],
		            backgroundColor: ["#1D4361", "#2F6D9D", "#74ABD6"],
		            borderColor: ["#CDA776", "060D12", "989898"],
		            borderWidth: [1,1,1],
		          }]
		        }
		      });
	    </script>
	
	</body>

</html>