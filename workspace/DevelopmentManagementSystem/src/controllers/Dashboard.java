package controllers;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/Dashboard")
public class Dashboard extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	public void init( ServletConfig config ) throws ServletException
    {
        super.init( config );

        try
        {
            Class.forName( "com.mysql.jdbc.Driver" );
        }
        catch( ClassNotFoundException e )
        {
            throw new ServletException( e );
        }
    }
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//confirm that the user is logged in
		Connection c = null;
	      try
	      {
	        String url = "jdbc:mysql://148.66.138.112:3306/projectX3337";
	      	String username="Arnav";
	      	String dbPassword="projectX3337";
			String securedPassword = request.getParameter("key");

	          c = DriverManager.getConnection( url, username, dbPassword );
	          Statement stmt = c.createStatement();
		         
	          String query = "select `id` from `users` WHERE email='"+request.getParameter("email")+"' AND password='"+securedPassword+"'";
	          ResultSet rs = stmt.executeQuery( query );
	
	          if (rs.next()) {
	        	
	        	  int userId = rs.getInt("id");
	        	  String projectQuery = "SELECT `projectId` FROM `user-projects` WHERE userId="+userId;
		          ResultSet rs2 = stmt.executeQuery( projectQuery );
	        	  
		          List<Integer> projectIds = new ArrayList<Integer>();
	        	  while (rs2.next()) {
	        		  int projectId = rs2.getInt("projectId");
	        		  if (projectId!=0) { //check for null
	        			  projectIds.add(rs2.getInt("projectId"));
	        		  }
	        	  }

	        	request.setAttribute("projectList", projectIds);
	            request.getRequestDispatcher("/WEB-INF/views/DashboardPage.jsp").forward(request, response);
	        		  
	        	 
	        	 
	          } else {
	        	//if user is not logged in, redirect to the home page
	        	  response.sendRedirect("Home");
	          }
	       
	      }
	      
	      catch( SQLException e )
	      {
	          throw new ServletException( e );
	      }
	      finally
	      {
	          try
	          {
	              if( c != null ) c.close();
	          }
	          catch( SQLException e )
	          {
	              throw new ServletException( e );
	          }
	      }
	 
	      
	} 

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}