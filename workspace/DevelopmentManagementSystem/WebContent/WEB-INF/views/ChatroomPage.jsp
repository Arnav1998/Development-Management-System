<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
	<head>
	
		 <meta charset="utf-8">
   		 <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
   		 <title>Chat Room</title>
		 <link rel="icon" type="image/x-icon" href="http://example.com/favicon.ico" />
    	 <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
		
		<script type="text/javascript">
			var websocket = new WebSocket("ws://localhost:8080/DevelopmentManagementSystem/chatroomServerEndpoint");
			websocket.onmessage = function processMessage(message) {
				var jsonData = JSON.parse(message.data);
				if(jsonData.message != null) messageTextArea.value += jsonData.message + "\n";
			}
			function sendMessage() {
				websocket.send(messageText.value);
				messageText.value = "";
			}
		</script>
		
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
		                <a class="nav-link active" href="Chatroom?email=${param.email}&key=${param.key}&projectId=${param.projectId}&projectName=${param.projectName}">
		                  <span data-feather="message-circle"></span>
		                  Chat Room
		                </a>
		              </li>
		              <li class="nav-item">
		                <a class="nav-link" href="Budget?email=${param.email}&key=${param.key}&projectId=${param.projectId}&projectName=${param.projectName}">
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
				
				<h3 class="mt-2 mb-0 text-center">Chat Room</h3>
				
				<div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pb-2 mb-3 border-bottom">
	
					<div class="container mt-3">
						<div class="row">
							<div class="col">
								<div class="chat" id="chat">
									<div class="form-group">
										<textarea class="form-control" id="messageTextArea" readonly="readonly" rows="10" style="border-left: 5px solid gold;"></textarea> <br>
										<label class="mb-0"><strong>Enter Message</strong></label> <br>
										<small id="emailHelp" class="form-text text-muted mt-0 mb-2">Your first message sets your chat user name.</small>
										<input type="text" id="messageText" style="width: 100%;"/>
										<input type="button" class="btn btn-primary mt-2" value="Send" onclick="sendMessage();" style="width: 100%;">
									</div>
								</div>
							</div>
						</div>
					</div>
				
				</div>

			</main>

		  </div>
	    </div>
	
	    <!-- Bootstrap core JavaScript
	    ================================================== -->
	    <!-- Placed at the end of the document so the pages load faster -->
	    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
	    <script>window.jQuery || document.write('<script src="../../assets/js/vendor/jquery-slim.min.js"><\/script>')</script>
	    <script src="../../assets/js/vendor/popper.min.js"></script>
	    <script src="../../dist/js/bootstrap.min.js"></script>
	
	    <!-- Icons -->
	    <script src="https://unpkg.com/feather-icons/dist/feather.min.js"></script>
	    <script>
	      feather.replace()
	    </script>

  </body>
</html>

