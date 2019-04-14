package controllers;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/AddContact")
public class AddContact extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public void init(ServletConfig config) throws ServletException {
		super.init(config);

		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			throw new ServletException(e);
		}
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// then redirect to search
		response.sendRedirect("Contacts");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// code to add someone to user's contact list
		Connection c = null;
		try {
			String url = "jdbc:mysql://148.66.138.112:3306/projectX3337";
			String username = "Arnav";
			String dbPassword = "projectX3337";

			c = DriverManager.getConnection(url, username, dbPassword);
			Statement stmt = c.createStatement();

			String addingid = request.getParameter("addingid");
			String userid = request.getParameter("userid");
			String query = "SELECT 'contacts' from 'users' WHERE id='" + userid + "'";
			ResultSet rs = stmt.executeQuery(query);

			rs.next();

			// incomplete, likely to result in runtime error

			ArrayList<Integer> contactlist = (ArrayList<Integer>) rs.getObject("contacts");
			contactlist.add(Integer.parseInt(addingid));

			stmt.executeUpdate("UPDATE users SET contacts=" + contactlist.toString() + " WHERE id=" + userid + "");

		} catch (SQLException e) {
			throw new ServletException(e);
		} finally {
			try {
				if (c != null)
					c.close();
			} catch (SQLException e) {
				throw new ServletException(e);
			}
		}

		doGet(request, response);
	}

}
