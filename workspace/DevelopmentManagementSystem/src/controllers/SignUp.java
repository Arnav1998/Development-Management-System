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

import models.Encrypter;

@WebServlet("/SignUp")
public class SignUp extends HttpServlet {
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
		request.getRequestDispatcher("/WEB-INF/views/SignUpPage.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
			String firstName = request.getParameter("firstName");
			String lastName = request.getParameter("lastName");
			String email = request.getParameter("email");
			String password = request.getParameter("password");
			String phone = request.getParameter("phone");
			String address = request.getParameter("address");
			String city = request.getParameter("city");
			String state = request.getParameter("state");
			String zip = request.getParameter("zip");
			
			if (!firstName.isEmpty() && !lastName.isEmpty() && !email.isEmpty() && !password.isEmpty() && !phone.isEmpty() && !address.isEmpty() && !city.isEmpty() && !state.isEmpty() && !zip.isEmpty()) {

				Connection c = null;
			      try
			      {
			        String url = "jdbc:mysql://148.66.138.112:3306/projectX3337";
			      	String username="Arnav";
			      	String dbPassword="projectX3337";
			      	new Encrypter();
					String securedPassword = Encrypter.encrypt(password);
			
			          c = DriverManager.getConnection( url, username, dbPassword );
			          Statement stmt = c.createStatement();;
			          String query = "INSERT INTO `users` (`id`, `firstName`, `lastName`, `email`, `password`, `phone`, `address`, `city`, `state`, `zip`, `projectId`) VALUES (NULL, '"+firstName+"', '"+lastName+"', '"+email+"', '"+securedPassword+"', '"+phone+"', '"+address+"', '"+city+"', '"+state+"', '"+zip+"', NULL);";
			          stmt.executeUpdate(query);
			          
			          response.sendRedirect("Login");
			       
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
				
				response.sendRedirect("SignUp");
				
			}
			
		
		
		
		
	}

}
