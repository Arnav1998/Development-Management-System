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

@WebServlet("/ToDoList")
public class ToDoList extends HttpServlet {
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
		        
		          String query = "SELECT * FROM `todo"+request.getParameter("projectId")+"`;";
		          ResultSet rs = stmt.executeQuery( query );
		          
		          List<ArrayList<String>> todos = new ArrayList<ArrayList<String>>();
		          
		          while (rs.next()) {
		        	   
		        	  ArrayList<String> todo = new ArrayList<String>();
		        	  
		        	  todo.add(rs.getString("todo"));
		        	  todo.add(rs.getString("userName"));
		        	  todo.add(rs.getString("due"));
		        	  todo.add(""+rs.getInt("progressId"));
		        	  
		        	  
		        	  todos.add(todo);
		        	  
		          }
		          
		         request.setAttribute("todos", todos);
		         request.setAttribute("email", request.getParameter("email"));
		         request.setAttribute("key", request.getParameter("key"));
		         request.setAttribute("projectName", request.getParameter("projectName"));
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
			
			request.getRequestDispatcher("/WEB-INF/views/ToDoList.jsp").forward(request, response);
			
		}

		
		protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
			doGet(request, response);
			
		}

}
