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

@WebServlet("/ProjectDashboard")
public class ProjectDashboard extends HttpServlet {
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

	        String query = "SELECT `AUTO_INCREMENT` FROM  INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'projectX3337' AND TABLE_NAME = 'todo"+request.getParameter("projectId")+"';";
	        ResultSet rs = stmt.executeQuery( query );
	        
	        rs.next(); //remove unnecessary values
	        int todoCount = rs.getInt("AUTO_INCREMENT") - 1;
	        
	        request.setAttribute("todoCount", todoCount);
	        

	        String query2 = "SELECT COUNT(*) FROM todo"+request.getParameter("projectId")+" WHERE progressId=3";
	        ResultSet rs2 = stmt.executeQuery( query2 );
	        
	        rs2.next();
	        int tasksCompleted = rs2.getInt("COUNT(*)");
	        
	        request.setAttribute("tasksCompleted", tasksCompleted);
	        
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
		
		request.getRequestDispatcher("/WEB-INF/views/ProjectDashboardView.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
