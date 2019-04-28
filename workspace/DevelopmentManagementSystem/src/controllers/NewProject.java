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


@WebServlet("/NewProject")
public class NewProject extends HttpServlet {
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
		request.getRequestDispatcher("/WEB-INF/views/NewProject.jsp").forward(request, response);
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
	        String query = "SELECT `AUTO_INCREMENT` FROM  INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'projectX3337' AND TABLE_NAME = 'projects';";
	        ResultSet rs = stmt.executeQuery( query );
	        rs.next(); //remove unnecessary value
	        int id = rs.getInt("AUTO_INCREMENT");
	        
	        String query2 = "select `id` from `users` WHERE email='"+request.getParameter("email")+"' AND password='"+request.getParameter("key")+"'";
	        ResultSet rs2 = stmt.executeQuery( query2 );
	        rs2.next();//remove unnecessary value
	        int userId = rs2.getInt("id");
	        
	        //insert into project table
	        stmt.executeUpdate( "INSERT INTO `projects` (`id`, `name`, `todoId`, `calendarId`, `expensesId`, `requirementsId`, `chatroomId`) VALUES (NULL, '"+request.getParameter("projectName")+"', '"+id+"', '"+id+"', '"+id+"', '"+id+"', '"+id+"');" );
	        
	        
	        
	        //Create tables for todo lists, calendar, expenses, requirements, and chatroom
	        
//	        ResultSet rs3 = stmt.executeQuery("SELECT firstName FROM users WHERE userId="+userId);
//	        rs3.next();
//	        String userName = rs3.getString("firstName");
	        
	        //create todo table
	        stmt.executeUpdate("CREATE TABLE `todo"+id+"` (id int AUTO_INCREMENT PRIMARY KEY, todo varchar(255) NOT NULL, userName varchar(255) NOT NULL, due varchar(255) NOT NULL, progressId int NOT NULL);");
	        
	        
	        
	        
	        
	        
	        
	        
	        
	        //insert into user-projects intermediary table
	        stmt.executeUpdate("INSERT INTO `user-projects` (`userId`, `projectId`) VALUES ('"+userId+"' , '"+id+"')");
	        
	        response.sendRedirect("Dashboard?email="+request.getParameter("email")+"&key="+request.getParameter("key")+"");
	        
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
