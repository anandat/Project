package demo.project.brainmentor.controllers;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import demo.project.brainmentor.AppUtility;

@WebServlet("/giveExam")
public class GiveExam extends HttpServlet {

	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.getSession().setAttribute(AppUtility.CURRENT_EXAM, null);

		String exam = request.getParameter(AppUtility.TEST);
		request.getSession().setAttribute(AppUtility.EXAM, exam);

		System.out.println(request.getSession().getAttribute(AppUtility.USERNAME));
		if (request.getSession().getAttribute(AppUtility.USERNAME) == null) {
			request.getRequestDispatcher("login_page.jsp").forward(request, response);

		} else {
			RequestDispatcher dispatcher = request.getRequestDispatcher("quizDetails_page.jsp");
			dispatcher.forward(request, response);
		}

	}
}
