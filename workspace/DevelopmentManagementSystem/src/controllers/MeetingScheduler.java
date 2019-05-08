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

import models.SmsSender;


@WebServlet("/MeetingScheduler")
public class MeetingScheduler extends HttpServlet {
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
		
		 request.setAttribute("email", request.getParameter("email"));
	     request.setAttribute("key", request.getParameter("key"));
	     request.setAttribute("projectName", request.getParameter("projectName"));
	     request.setAttribute("projectId", request.getParameter("id"));
		 request.getRequestDispatcher("/WEB-INF/views/MeetingSchedulerView.jsp").forward(request, response);
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Connection c = null;
	      try
	      {
	        String url = "jdbc:mysql://148.66.138.112:3306/projectX3337";
	      	String username="Arnav";
	      	String dbPassword="projectX3337";
	
	      	c = DriverManager.getConnection( url, username, dbPassword );
	        Statement stmt = c.createStatement();

	        String query = "select `userId` from `user-projects` WHERE `projectId`="+request.getParameter("projectId");
	        ResultSet rs = stmt.executeQuery( query );
	        
	        List<String> phoneNumbers = new ArrayList<String>();
	        
	        Statement stmt2 = c.createStatement();
	        
	        while (rs.next()) {
	        	String query2 = "select `phone` from `users` WHERE `id`="+rs.getInt("userId");
	        	 ResultSet rs2 = stmt2.executeQuery( query2 );
	        	 
	        	 rs2.next();
	        	 phoneNumbers.add(rs2.getString("phone"));
	        }

	        Statement stmt3 = c.createStatement();
	        String query3 = "select `firstName` from `users` WHERE `email`=\""+request.getParameter("email")+"\"";
       	    ResultSet rs3 = stmt3.executeQuery( query3 );
       	    
       	    rs3.next();
       	    
       	    String schedulerName = rs3.getString("firstName");
	        
	        String textMessage = "A meeting has been scheduled by "+schedulerName+" using Project X. Meeting is set for "+request.getParameter("date")+" at "+request.getParameter("time")+". The associated message includes: "+request.getParameter("textMessage"); 
	       
	        for (int i = 0; i < phoneNumbers.size(); i++) {
	    		SmsSender.sendMessage("+1"+phoneNumbers.get(i), textMessage);
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
		
	    request.setAttribute("messageSent", "true");
		doGet(request, response);
		
		
	}

}
