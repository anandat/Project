<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/styles.css">
<title>Insert title here</title>
<style type="text/css">
body {
	background:
		url("${pageContext.request.contextPath}/assets/images/background.jpg");
}
</style>
</head>
<body>
	<div id='cssmenu'>
		<ul>
			<li class=''><a
				href='${pageContext.request.contextPath}/home_page.jsp'><span>Home</span></a></li>
			<c:if test='${ empty sessionScope.userName}'>
				<li><a href='${pageContext.request.contextPath}/login_page.jsp'><span>Login</span></a></li>
				<li><a
					href='${pageContext.request.contextPath}/register_page.jsp'><span>Register</span></a></li>
			</c:if>
		</ul>
	</div>
	<br>
	<br>
	<br>
	<h2 align="center">Instruction for ${sessionScope.exam} Quiz :</h2>

	<div style="position: absolute; left: 500px; top: 170px">
		<ul style="list-style-type: disc">
			<li>Quiz contains 10 Multiple Choice Questions</li>
			<li>Total time for the Quiz is 10 Minutes</li>
			<li>You can finish the exam at any time</li>
			<li>Read the question carefully before answering</li>
			<li>You can change your answers before submitting</li>
			<li>Good luck for the test.</li>
		</ul>
		<br> <br> <br>
	</div>

	<div style="position: absolute; left: 600px; top: 350px">
		<button
			onclick="location.href='${pageContext.request.contextPath}/exam'">Start
			Exam</button>
	</div>


</body>
</html>