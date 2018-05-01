package demo.project.brainmentor;

import java.util.Collection;

public class AppUtility {
	public static final String USERNAME = "userName";
	public static final String USER_FIRSTNAME = "userFirstName";
	public static final String USER_LASTNAME = "userLastName";
	public static final String PASSWORD = "password";
	public static final String USER_MOBILENO = "userMobileNo";
	public static final String USER_EMAIL = "userEmail";
	public static final String USER_ID = "userId";
	public static final String ROLE_TYPE = "roleType";
	public static final String ERROR_MESSAGE = "errorMessage";
	public static final String CURRENT_EXAM = "currentExam";
	public static final String TEST = "test";
	public static final String EXAM = "exam";
	public static final String STARTED = "started";
	public static final String QUESTION = "question";
	public static final String ACTION = "action";
	public static final String ANSWER = "answer";
	public static final String RESULT = "result";
	public static final int NO_OF_QUESTIONS = 10;

	public static String getRoleType(int i) {
		switch (i) {
		case 1:
			return "STUDENT";
		case 2:
			return "ADMIN";
		default:
			return "STUDENT";
		}
	}

	public static int getSubjectIdbyName(String name) {
		switch (name.trim().toUpperCase()) {
		case "C++":
			return 1;
		case "JAVA":
			return 2;
		case "PYTHON":
			return 3;
		case "JS":
			return 4;
		case "SQL":
			return 5;
		default:
			return 1;
		}
	}

}
