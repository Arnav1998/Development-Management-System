package controllers;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/Search")
public class Search extends HttpServlet {
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
		request.getRequestDispatcher("/WEB-INF/views/SearchPage.jsp").forward(request, response);
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
			
			String projectName = request.getParameter("searchQuery");

			String query = "SELECT * FROM projects WHERE name=\""+projectName+"\";";
			ResultSet rs = stmt.executeQuery( query );
			
			Map<Integer,String> projectMap = new HashMap<Integer,String>();

			while (rs.next()) {
				projectMap.put(rs.getInt("id"), rs.getString("name"));
			}
			
			request.setAttribute("email", request.getParameter("email"));
			request.setAttribute("key", request.getParameter("key"));
			request.setAttribute("projectMap", projectMap);
			doGet(request, response);
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
