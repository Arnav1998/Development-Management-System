package controllers;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ProgressButtonClicked")
public class ProgressButtonClicked extends HttpServlet {
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
	        
	          if(request.getParameter("status").equals("working")) {
	        	  
	        	  stmt.executeUpdate("UPDATE `todo"+request.getParameter("projectId")+"` SET progressId=2 WHERE id="+request.getParameter("todoId"));
	        	  
	          } else if (request.getParameter("status").equals("late")) {
	        	  
	        	  stmt.executeUpdate("UPDATE `todo"+request.getParameter("projectId")+"` SET progressId=3 WHERE id="+request.getParameter("todoId"));
	        	  
	          } else {
	        	  
	        	  stmt.executeUpdate("UPDATE `todo"+request.getParameter("projectId")+"` SET progressId=1 WHERE id="+request.getParameter("todoId"));
	        	  
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

	    response.sendRedirect("ToDoList?email="+request.getParameter("email")+"&key="+request.getParameter("key")+"&projectId="+request.getParameter("projectId")+"&projectName="+request.getParameter("projectName"));
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
