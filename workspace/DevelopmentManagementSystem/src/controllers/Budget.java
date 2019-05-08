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

@WebServlet("/Budget")
public class Budget extends HttpServlet {
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

	        String query = "select `budget` from `projects` WHERE `id`="+request.getParameter("projectId");
	        ResultSet rs = stmt.executeQuery( query );
	        
	        rs.next(); //remove unnecessary values
	        int budget = rs.getInt("budget");
	        
	        request.setAttribute("budget", budget);
	        

	        String query2 = "select `amount_used` from `budget"+request.getParameter("projectId")+"`";
	        ResultSet rs2 = stmt.executeQuery( query2 );
	        
	        int moneySpent = 0;
	        
	        while (rs2.next()) {
	        	moneySpent += rs2.getInt("amount_used");
	        }
	        
	        request.setAttribute("moneySpent", moneySpent);
	        
	        String query3 = "select * from `budget"+request.getParameter("projectId")+"`";
	        ResultSet rs3 = stmt.executeQuery( query3 );
	        
	        List<ArrayList<String>> budgetList = new ArrayList<ArrayList<String>>();
	        
	        while (rs3.next()) {
	        	
	        	ArrayList<String> budgetItem = new ArrayList<String>();
	        	
	        	budgetItem.add(""+rs3.getInt("id"));
	        	budgetItem.add(rs3.getString("title"));
	        	budgetItem.add(""+rs3.getInt("amount_used"));
	        	budgetItem.add(rs3.getString("authorizer"));
	        	
	        	budgetList.add(budgetItem);
	        	
	        }
	         
	        request.setAttribute("budgetList", budgetList);
	        
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
	      
		 request.setAttribute("email", request.getParameter("email"));
	     request.setAttribute("key", request.getParameter("key"));
	     request.setAttribute("projectName", request.getParameter("projectName"));
	     request.setAttribute("projectId", request.getParameter("id"));
		 request.getRequestDispatcher("/WEB-INF/views/BudgetView.jsp").forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
