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

import com.oracle.tools.packager.Log.Logger;

import models.CalendarDTO;


@WebServlet("/AddCalendarEvent")
public class AddCalendarEvent extends HttpServlet {
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
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Connection c = null;
		try {
            CalendarDTO cd = new CalendarDTO();
            cd.setId(Integer.parseInt(request.getParameter("id")));
            cd.setTitle(request.getParameter("title"));
            cd.setStart(request.getParameter("start"));
            cd.setEnd(request.getParameter("end"));
            
            String url = "jdbc:mysql://148.66.138.112:3306/projectX3337";
	      	String username="Arnav";
	      	String dbPassword="projectX3337";
	      	
            c = DriverManager.getConnection( url, username, dbPassword );
	        Statement stmt = c.createStatement();
            int success = stmt.executeUpdate("INSERT INTO `calendar" +request.getParameter("projectId")+ "` (`id`, `title`, `start`, `end`) VALUES ('" + cd.getId() + "','" + cd.getTitle() + "','" + cd.getStart() + "','" + cd.getEnd() + "')");
            if (success > 0) {
		        response.sendRedirect("Calendar?email="+request.getParameter("email")+"&key="+request.getParameter("key")+"&projectId="+request.getParameter("projectId")+"&projectName="+request.getParameter("projectName"));
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

}
