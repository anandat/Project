package demo.project.brainmentor;

public class QuizQuestion {

	private int questionNumber, questionId;

	public int getQuestionId() {
		return questionId;
	}

	public void setQuestionId(int questionId) {
		this.questionId = questionId;
	}

	private String question;
	private String questionOption1, questionOption2, questionOption3, questionOption4;
	private int correctOptionIndex;

	public String getQuestionOption1() {
		return questionOption1;
	}

	public void setQuestionOption1(String questionOption1) {
		this.questionOption1 = questionOption1;
	}

	public String getQuestionOption2() {
		return questionOption2;
	}

	public void setQuestionOption2(String questionOption2) {
		this.questionOption2 = questionOption2;
	}

	public String getQuestionOption3() {
		return questionOption3;
	}

	public void setQuestionOption3(String questionOption3) {
		this.questionOption3 = questionOption3;
	}

	public String getQuestionOption4() {
		return questionOption4;
	}

	public void setQuestionOption4(String questionOption4) {
		this.questionOption4 = questionOption4;
	}

	public String getQuestion() {
		return question;
	}

	public int getQuestionNumber() {
		return questionNumber;
	}

	public void setQuestionNumber(int i) {
		questionNumber = i;
	}

	public int getCorrectOptionIndex() {
		return correctOptionIndex;
	}

	public void setQuestion(String s) {
		question = s;
	}

	public void setCorrectOptionIndex(int i) {
		correctOptionIndex = i;
	}

}
