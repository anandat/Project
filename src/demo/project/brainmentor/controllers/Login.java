package demo.project.brainmentor.controllers;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

import demo.project.brainmentor.AppUtility;
import demo.project.brainmentor.User;

@WebServlet("/Login")
public class Login extends HttpServlet {

	private HttpSession session;
	private String userName, password;

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public Login() {

	}

	/**
	 * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
	 * methods.
	 *
	 * @param request
	 *            servlet request
	 * @param response
	 *            servlet response
	 * @throws IOException
	 *             if an I/O error occurs
	 */
	@SuppressWarnings("unchecked")
	private void authenticate(HttpServletRequest request, HttpServletResponse response) throws IOException {
		PrintWriter out = response.getWriter();
		String userName = request.getParameter("userName");
		String password = request.getParameter("userPassword");
		String userEmail = null, userFirstName = null, userLastName = null;

		System.out.println(userName + password);
		long userMobileNo = 1, userId = 1, roleId = 1;
		try {

			Configuration cfg = new Configuration();
			cfg.configure("hibernate_login.cfg.xml");
			SessionFactory factory = cfg.buildSessionFactory();
			Session sess = factory.openSession();
			Transaction tx = sess.beginTransaction();
			String hql = "FROM User U WHERE U.userName = :user_name and U.password = :pass_word";
			Query query = sess.createQuery(hql);
			query.setParameter("user_name", userName);
			query.setParameter("pass_word", password);
			List<User> list = (List<User>) query.list();
			if (list.size() > 0) {
				userId = list.get(0).getUserId();
				roleId = list.get(0).getRoleId();
				userName = list.get(0).getUserName();
				password = list.get(0).getPassword();
				userEmail = list.get(0).getUserEmail();
				userLastName = list.get(0).getLastName();
				userFirstName = list.get(0).getFirstName();

				userMobileNo = list.get(0).getUserMobileNo();
				this.userName = userName;
				this.password = password;
				session.setAttribute(AppUtility.USERNAME, userName);
				session.setAttribute(AppUtility.USER_FIRSTNAME, userFirstName);
				session.setAttribute(AppUtility.USER_LASTNAME, userLastName);
				session.setAttribute(AppUtility.USER_ID, userId);
				session.setAttribute(AppUtility.PASSWORD, password);
				session.setAttribute(AppUtility.USER_EMAIL, userEmail);
				session.setAttribute(AppUtility.USER_MOBILENO, userMobileNo);
				session.setAttribute(AppUtility.ROLE_TYPE, AppUtility.getRoleType((int) roleId));
				RequestDispatcher rd = request.getRequestDispatcher("home_page.jsp");
				rd.forward(request, response);
			} else {
				session.setAttribute(AppUtility.ERROR_MESSAGE, "Invalid username or password");
				RequestDispatcher rd = request.getRequestDispatcher("login_page.jsp");
				rd.forward(request, response);
				session.removeAttribute(AppUtility.ERROR_MESSAGE);
			}
			tx.commit();
			sess.close();
			factory.close();
		} catch (Exception e) {
			out.println(e);
			System.out.println(e.getMessage());
			e.printStackTrace();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		session = request.getSession(true);
		authenticate(request, response);
	}
}
