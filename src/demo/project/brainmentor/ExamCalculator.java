package demo.project.brainmentor;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

public class ExamCalculator {
	public int currentQuestion = 0;

	public Map<Integer, Integer> selections = new LinkedHashMap<Integer, Integer>();
	public ArrayList<QuizQuestion> questionList = new ArrayList<QuizQuestion>(AppUtility.NO_OF_QUESTIONS);

	public ExamCalculator(String test) {
		getQuestions(AppUtility.getSubjectIdbyName(test));
	}

	private void getQuestions(int subjectIdbyName) {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project", "root", "12345");
			Statement stmt = con.createStatement();
			String sql = "SELECT * FROM questions where subId='" + subjectIdbyName + "'";
			ResultSet rs = stmt.executeQuery(sql);
			QuizQuestion quizQuestion = null;
			questionList.clear();
			while (rs.next()) {
				quizQuestion = new QuizQuestion();
				quizQuestion.setQuestionId(rs.getInt("questionId"));
				quizQuestion.setCorrectOptionIndex(rs.getInt("answerNo"));
				quizQuestion.setQuestion(rs.getString("questionName"));
				quizQuestion.setQuestionNumber(questionList.size() + 1);
				quizQuestion.setQuestionOption1(rs.getString("option1"));
				quizQuestion.setQuestionOption2(rs.getString("option2"));
				quizQuestion.setQuestionOption3(rs.getString("option3"));
				quizQuestion.setQuestionOption4(rs.getString("option4"));
				questionList.add(quizQuestion);
			}

			stmt.close();
			rs.close();
			con.close();
		} catch (Exception e) {
			System.out.println("Execption" + e.getMessage());
			e.printStackTrace();
		}
	}

	public ArrayList<QuizQuestion> getQuestionList() {
		return this.questionList;
	}

	public int getCurrentQuestion() {
		return currentQuestion;
	}

	public Map<Integer, Integer> getSelections() {
		return this.selections;
	}

	public int calculateResult(ExamCalculator exam) {
		int totalCorrect = 0;
		Map<Integer, Integer> userSelectionsMap = exam.selections;
		List<Integer> userSelectionsList = new ArrayList<Integer>(10);
		for (Map.Entry<Integer, Integer> entry : userSelectionsMap.entrySet()) {
			userSelectionsList.add(entry.getValue());
		}
		List<QuizQuestion> questionList = exam.questionList;
		List<Integer> correctAnswersList = new ArrayList<Integer>(10);
		for (QuizQuestion question : questionList) {
			correctAnswersList.add(question.getCorrectOptionIndex());
		}

		for (int i = 0; i < selections.size(); i++) {
			System.out.println(userSelectionsList.get(i) + " --- " + correctAnswersList.get(i));
			if (userSelectionsList.get(i) == correctAnswersList.get(i)) {
				totalCorrect++;
			}
		}

		System.out.println("You Got " + totalCorrect + " Correct");
		return totalCorrect;
	}

}
