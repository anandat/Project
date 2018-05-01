package demo.project.brainmentor.controllers;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import demo.project.brainmentor.AppUtility;
import demo.project.brainmentor.ExamCalculator;
import demo.project.brainmentor.QuizQuestion;

@WebServlet("/exam")
public class Exam extends HttpServlet {

	private static final long serialVersionUID = 3525029286301886770L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		boolean finish = false;

		HttpSession session = request.getSession();
		try {
			if (session.getAttribute(AppUtility.CURRENT_EXAM) == null) {
				session = request.getSession();
				String selectedExam = (String) request.getSession().getAttribute(AppUtility.EXAM);
				ExamCalculator newExam = new ExamCalculator(selectedExam);
				if (newExam.questionList.size() > 0) {
					session.setAttribute(AppUtility.CURRENT_EXAM, newExam);
					SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss a");
					Date date = new Date();
					String started = dateFormat.format(date);
					session.setAttribute(AppUtility.STARTED, started);
				} else {
					RequestDispatcher dispatcher = request.getRequestDispatcher("no_questions.html");
					dispatcher.forward(request, response);
					return;
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		ExamCalculator examCalculator = (ExamCalculator) request.getSession().getAttribute(AppUtility.CURRENT_EXAM);

		if (examCalculator.currentQuestion == 0) {
			QuizQuestion q = examCalculator.questionList.get(examCalculator.currentQuestion);
			session.setAttribute(AppUtility.QUESTION, q);
		}

		String action = request.getParameter(AppUtility.ACTION);

		String radio = request.getParameter(AppUtility.ANSWER);
		int selectedRadio = -1;
		examCalculator.selections.put(examCalculator.currentQuestion, selectedRadio);
		if ("1".equals(radio)) {
			selectedRadio = 1;
			examCalculator.selections.put(examCalculator.currentQuestion, selectedRadio);
			System.out.println("You selected " + selectedRadio);
		} else if ("2".equals(radio)) {
			selectedRadio = 2;
			examCalculator.selections.put(examCalculator.currentQuestion, selectedRadio);
			System.out.println("You selected " + selectedRadio);
		} else if ("3".equals(radio)) {
			selectedRadio = 3;
			examCalculator.selections.put(examCalculator.currentQuestion, selectedRadio);
			System.out.println("You selected " + selectedRadio);
		} else if ("4".equals(radio)) {
			selectedRadio = 4;
			examCalculator.selections.put(examCalculator.currentQuestion, selectedRadio);
			System.out.println("You selected " + selectedRadio);
		}

		if ("Next".equals(action) && examCalculator.currentQuestion + 1 < examCalculator.questionList.size()) {
			System.out.println("You clicked Next Button");
			examCalculator.currentQuestion++;
			QuizQuestion q = examCalculator.questionList.get(examCalculator.currentQuestion);
			session.setAttribute(AppUtility.QUESTION, q);
		} else if ("Previous".equals(action) && --examCalculator.currentQuestion - 1 >= 0) {
			System.out.println("You clicked Previous Button");
			examCalculator.currentQuestion--;
			QuizQuestion q = examCalculator.questionList.get(examCalculator.currentQuestion);
			session.setAttribute(AppUtility.QUESTION, q);
		} else if ("Finish Exam".equals(action)) {
			finish = true;
			int result = examCalculator.calculateResult(examCalculator);
			request.setAttribute(AppUtility.RESULT, result);
			request.getSession().setAttribute(AppUtility.CURRENT_EXAM, null);
			request.getRequestDispatcher("result_page.jsp").forward(request, response);

		} else if ("Next".equals(action) && examCalculator.currentQuestion + 1 == examCalculator.questionList.size()) {
			finish = true;
			int result = examCalculator.calculateResult(examCalculator);
			request.setAttribute(AppUtility.RESULT, result);
			request.getSession().setAttribute(AppUtility.CURRENT_EXAM, null);
			request.getRequestDispatcher("result_page.jsp").forward(request, response);

		}

		if (finish != true) {
			request.getRequestDispatcher("exam_page.jsp").forward(request, response);
		}

	}

}
