package demo.project.brainmentor.controllers;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import demo.project.brainmentor.AppUtility;

@SuppressWarnings("serial")
@WebServlet("/Register")
public class Register extends HttpServlet {
	private HttpSession session;

	private void registerUser(HttpServletRequest request, HttpServletResponse response) throws IOException {
		PrintWriter out = response.getWriter();

		String userFirstName = request.getParameter("user_fname");
		String userLastName = request.getParameter("user_lname");
		String user_Name = request.getParameter("user_userName");
		String userPassword = request.getParameter("user_password");
		String userEmail = request.getParameter("user_email");
		String userPhoneNo = request.getParameter("user_phoneNumber");
		System.out.println("User Name : " + userFirstName + " " + userLastName);
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project","root","12345");
			Statement stmt = con.createStatement();
			String sql = "SELECT * FROM users";
			ResultSet rs = stmt.executeQuery(sql);
			String error = "";
			while (rs.next()) {
				// Retrieve by column name
				String userName = rs.getString("userName");
				String useremail = rs.getString("userEmail");
				String userMobileNo = rs.getString("userMobileNo");
				boolean temp = true;
				if (userName.equalsIgnoreCase(user_Name)) {
					error += "Username already used !!" + "<BR/>";
					temp = false;
				}
				if (userEmail.equalsIgnoreCase(useremail)) {
					error += "Email already used !!" + "<BR/>";
					temp = false;
				}
				if (userPhoneNo.equalsIgnoreCase(userMobileNo)) {
					error += "Phone No already used !!" + "<BR/>";
					temp = false;
				}
				if (!temp) {
					session.setAttribute(AppUtility.ERROR_MESSAGE, error);
					RequestDispatcher rd = request.getRequestDispatcher("register_page.jsp");
					rd.forward(request, response);
					session.removeAttribute(AppUtility.ERROR_MESSAGE);
					return;
				}
			}

			PreparedStatement s = con.prepareStatement(
					"Insert into users(firstName,lastName,userName,password,userEmail,userMobileNo,roleId) VALUES(?,?,?,?,?,?,?)");
			s.setString(1, userFirstName);
			s.setString(2, userLastName);
			s.setString(3, user_Name);
			s.setString(4, userPassword);
			s.setString(5, userEmail);
			s.setString(6, userPhoneNo);
			s.setInt(7, 1);

			s.executeUpdate();
			out.println("<font color=red size=7> Successfully Registered </font><BR/><BR/>");
			response.sendRedirect("regSuccess_page.jsp");
			stmt.close();
			rs.close();
			con.close();

		} catch (SQLException sqle) {
			out.println(sqle);
			System.out.println(sqle.getMessage());
		} catch (Exception e) {
			out.println(e);
			System.out.println(e.getMessage());
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
		session = request.getSession(true);
		registerUser(request, response);
	}
}