<%@ page language="java" import="demo.project.brainmentor.AppUtility,demo.project.brainmentor.ExamCalculator"
	contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Quiz</title>
<style type="text/css">
body {
	background:
		url("${pageContext.request.contextPath}/assets/images/background.jpg");
}
</style>

</head>
<br />
<body>
	<div style="position: absolute; left: 50px; top: 20px">
		<%
			int currentQuestion = ((ExamCalculator) request.getSession().getAttribute(AppUtility.CURRENT_EXAM))
					.getCurrentQuestion();
			// System.out.println("Question Number "+currentQuestion+ " retrieved ");
		%>
		Current Question ${sessionScope.question.questionNumber} / 10
	</div>


	<div
		style="position: absolute; width: 1000px; padding: 25px; height: 200px; border: 1px solid green; left: 100px; top: 60px">
		<span>${sessionScope.question.question}</span><br /> <br />
		<form action="exam" method="post">
			<input type="radio" name="answer" value="1">${sessionScope.question.questionOption1}
			<br /> <input type="radio" name="answer" value="2">${sessionScope.question.questionOption2}
			<br /> <input type="radio" name="answer" value="3">${sessionScope.question.questionOption3}
			<br /> <input type="radio" name="answer" value="4">${sessionScope.question.questionOption4}
			<br /> <br />

			<%
				if (currentQuestion > 0) {
			%>
			<input type="submit" name="action" value="Previous" />
			<%
				}
			%>

			<%
				if (currentQuestion < AppUtility.NO_OF_QUESTIONS - 1) {
			%>
			<input type="submit" name="action" value="Next" />
			<%
				}
			%>
			<input type="submit" name="action" value="Finish Exam" />

		</form>
	</div>


</body>
</html>