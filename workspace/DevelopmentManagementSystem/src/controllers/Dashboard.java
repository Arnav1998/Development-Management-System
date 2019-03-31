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

import models.Encrypter;


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
		         
	          String query = "select * from `users` WHERE email='"+request.getParameter("email")+"' AND password='"+securedPassword+"'";
	          ResultSet rs = stmt.executeQuery( query );
	
	          if (rs.next()) {
	        	  //c if user has projects. If yes create an ArrayList consisting of id's of user projects. If no then just forward to jsp.
	        	  String projectQuery = "select `projectId` from `users` WHERE email='"+request.getParameter("email")+"' AND password='"+securedPassword+"'";
		          ResultSet rs2 = stmt.executeQuery( projectQuery );
	        	  
		          rs2.next(); //skip the column entry result which will always be true
	        	  if (rs2.next()) {
	        		  List<Integer> projectIds = new ArrayList<Integer>();
	        		  while (rs2.next()) {
	        			  projectIds.add(rs2.getInt("projectId"));
	        		  }
	        		  
	        		  request.setAttribute("projectList", projectIds);
	        		  request.getRequestDispatcher("/WEB-INF/views/DashboardPage.jsp").forward(request, response);
	        		  
	        	  } else {
	        		  request.getRequestDispatcher("/WEB-INF/views/DashboardPage.jsp").forward(request, response);
	        	  }
	        	 
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
