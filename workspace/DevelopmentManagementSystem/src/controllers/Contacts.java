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

@WebServlet("/Contacts")
public class Contacts extends HttpServlet {
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
		
		Connection c = null;
	      try
	      {
	        String url = "jdbc:mysql://148.66.138.112:3306/projectX3337";
	      	String username="Arnav";
	      	String dbPassword="projectX3337";
	
	          c = DriverManager.getConnection( url, username, dbPassword );
	          Statement stmt = c.createStatement();;
	          Statement stmt2 = c.createStatement();
	        
	          String query = "SELECT * FROM `user-projects` WHERE projectId="+request.getParameter("projectId");
	          ResultSet userIdRS = stmt.executeQuery( query );
	          
	          List<ArrayList<String>> userInfoList = new ArrayList<ArrayList<String>>();
	          
	          while (userIdRS.next()) {
	        	  
	        	  String query2 = "SELECT * FROM users WHERE id="+userIdRS.getInt("userId");
	        	  ResultSet usersRS = stmt2.executeQuery( query2 );
	        	  
	        	  ArrayList<String> user = new ArrayList<String>();
	        	  
	        	  if (usersRS.next()) {
	        		  user.add(usersRS.getString("firstName"));
	        		  user.add(usersRS.getString("lastName"));
	        		  user.add(usersRS.getString("email"));
	        		  user.add(usersRS.getString("phone"));
	        		  user.add(usersRS.getString("address"));
	        		  user.add(usersRS.getString("city"));
	        		  user.add(usersRS.getString("state"));
	        		  user.add(usersRS.getString("zip"));
	        		  userInfoList.add(user);
	        	  }
	        	  
	          }
	          
	         request.setAttribute("userInfoList", userInfoList);
	         request.setAttribute("email", request.getParameter("email"));
	         request.setAttribute("key", request.getParameter("key"));
	         request.setAttribute("name", request.getParameter("name"));
	         request.setAttribute("projectId", request.getParameter("id"));

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
		
		// redirects to view of contact list
		request.getRequestDispatcher("/WEB-INF/views/ContactsView2.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}