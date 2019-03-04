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

@WebServlet("/Login")
public class Login extends HttpServlet {
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
		request.getRequestDispatcher("/WEB-INF/views/LoginPage.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		
		if (!email.isEmpty() && !password.isEmpty()) {
			

			Connection c = null;
		      try
		      {
		        String url = "jdbc:mysql://148.66.138.112:3306/projectX3337";
		      	String username="Arnav";
		      	String dbPassword="projectX3337";
		
		          c = DriverManager.getConnection( url, username, dbPassword );
		          Statement stmt = c.createStatement();;
		         
		          String query = "select * from `users` WHERE email='"+email+"' AND password='"+password+"'";
		          ResultSet rs = stmt.executeQuery( query );
		
		          if (rs.next()) {
		        	  System.out.println("Logged In.");
		          } else {
		        	  System.out.println("Incorrect Username/Password");
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
			
		} else {
			
			response.sendRedirect("Login");
			
		}
	}

}
