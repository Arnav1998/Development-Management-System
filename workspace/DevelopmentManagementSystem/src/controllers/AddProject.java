package controllers;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/AddProject")
public class AddProject extends HttpServlet {
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
	        Statement stmt = c.createStatement();
	        
	        //get userId for user 
	        String query = "select `id` from `users` WHERE email='"+request.getParameter("email")+"' AND password='"+request.getParameter("key")+"'";
	        ResultSet rs = stmt.executeQuery( query );
	        
	        rs.next(); //remove unnecessary values
	        int userId = rs.getInt("id");
	        int projectId = Integer.parseInt(request.getParameter("projectId"));
	        
	        //insert ids accordingly to add project to user's account
	        stmt.executeUpdate("INSERT INTO `user-projects` (`userId`, `projectId`) VALUES ('"+userId+"' , '"+projectId+"')");
	         
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
		
	     response.sendRedirect("Dashboard?email="+request.getParameter("email")+"&key="+request.getParameter("key"));
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
