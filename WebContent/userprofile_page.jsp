<%@ page language="java" import="demo.project.brainmentor.AppUtility"
	contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/styles.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/style.css">
<style type="text/css">
body {
	background:
		url("${pageContext.request.contextPath}/assets/images/background.jpg");
}

.button {
	padding: 10px 15px;
	font-size: 14px;
	line-height: 100%;
	text-shadow: 0 1px rgba(0, 0, 0, 0.4);
	color: #fff;
	vertical-align: middle;
	text-align: center;
	cursor: pointer;
	font-weight: bold;
	transition: background 0.1s ease-in-out;
	-webkit-transition: background 0.1s ease-in-out;
	-moz-transition: background 0.1s ease-in-out;
	-ms-transition: background 0.1s ease-in-out;
	-o-transition: background 0.1s ease-in-out;
	text-shadow: 0 1px rgba(0, 0, 0, 0.3);
	color: #fff;
	-webkit-border-radius: 40px;
	-moz-border-radius: 40px;
	border-radius: 40px;
	font-family: 'Helvetica Neue', Helvetica, sans-serif;
}

.button, .button:hover, .button:active {
	outline: 0 none;
	text-decoration: none;
	color: #fff;
}

.username {
	background-color: #2ecc71;
	box-shadow: 0px 3px 0px 0px #239a55;
}
</style>

<title>Profile</title>
</head>

<body>


	<div id='cssmenu'>
		<ul>
			<li class=''><a href='/Brain_Mentor/home_page.jsp'><span>Home</span></a></li>
		</ul>
	</div>
  <div id="wrapper">
  <div class="display-profile">
  <centre><img src="assets/images/hq.png" ><centre>
   <table cellspacing="10">		
		<tr>
			<td>
			 	<div class="heading">
				<label> User ID: </label>
				</div>
			</td>
			<td>
				<div class="data">
				<label><%=session.getAttribute(AppUtility.USER_ID)%> </label>
				</div>
			</td>
		</tr>
		<tr>
			<td>
				<div class="heading">
				<label> User Name: </label>
				</div>
			</td>
			<td>
				<div class="data">
				<label><%=session.getAttribute(AppUtility.USERNAME)%> </label>
				</div>
			</td>
		</tr>
		<tr>
			<td>
				<div class="heading">
				<label> First Name: </label>
			    </div>
			</td>
			<td>
				<div class="data">
				<label><%=session.getAttribute(AppUtility.USER_FIRSTNAME)%> </label>
				</div>
			</td>
		</tr>
		<tr>
			<td>
				<div class="heading">
				<label> Last Name: </label>
				</div>
			</td>
			<td>
				<div class="data">
				<label><%=session.getAttribute(AppUtility.USER_LASTNAME)%> </label>
				</div>
			</td>
		</tr>
		<tr>
			<td>
				<div class="heading">
				<label> Email:</label>
				</div>
			</td>
			<td>
				<div class="data">
				<label><%=session.getAttribute(AppUtility.USER_EMAIL)%> </label>
				</div>
			</td>
		</tr>
		<tr>
			<td>
				<div class="heading">
				<label>Mobile No: </label>
				</div>
			</td>
			<td>
				<div class="data">
				<label><%=session.getAttribute(AppUtility.USER_MOBILENO)%> </label>
				</div>
			</td>
		</tr>
		<tr>
			<td>
				<div class="heading">
				<label> Role Type: </label>
				</div>
			</td>
			<td>
				<div class="data">
				<label><%=session.getAttribute(AppUtility.ROLE_TYPE)%> </label>
				</div>
			</td>
		</tr>
			
	</table>
</div>
</div>
</body>
</html>
