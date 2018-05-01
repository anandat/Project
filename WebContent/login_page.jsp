<!DOCTYPE html>
<html>
<head>
<title>Login Form</title>
<link rel="stylesheet" type="text/css"
	href="/Brain_Mentor/assets/css/style.css" />
	
<link rel="stylesheet" href="/Brain_Mentor/assets/css/styles.css">
<style type="text/css">
body {
	background: url("/Brain_Mentor/assets/images/background.jpg");
}

.user-icon {
	top: 153px;
	/* Positioning fix for slide-in, got lazy to think up of simpler method. */
	background: rgba(65, 72, 72, 0.75)
		url('/Brain_Mentor/assets/images/user-icon.png') no-repeat center;
}

.pass-icon {
	top: 201px;
	background: rgba(65, 72, 72, 0.75)
		url('/Brain_Mentor/assets/images/pass-icon.png') no-repeat center;
}
</style>
<script language="JavaScript" type="text/JavaScript">
	function validate() {
		var useraName = document.fromlogin.userName.value;
		var password = document.fromlogin.userPassword.value;

		if (useraName.length == 0) {
			alert("User Name Field Cannot be Left Blank");
			document.fromlogin.userName.focus();
			return false;
		} else if (password.length <= 6) {
			alert("Invalid Password");
			document.fromlogin.userPassword.focus();
			return false;
		} else {
			return true;
		}
	}
</script>

</head>
<body>
	<div id='cssmenu'>
		<ul>
			<li class=''><a href='/Brain_Mentor/home_page.jsp'><span>Home</span></a></li>
			<li><a href='/Brain_Mentor/register_page.jsp'><span>Register</span></a></li>

		</ul>
	</div>

	<c:choose>
		<c:when test='${not empty sessionScope.errorMessage}'>
			<div style="position: absolute; left: 550px; top: 70px">
				<font color="red">${sessionScope.errorMessage}</font></div>
				
		</c:when>
		<c:otherwise>
			<div style="position: absolute; left: 500px; top: 90px">
				Don`t have an account, click here to <a
					href='/Brain_Mentor/register_page.jsp'>Register</a>
			</div>
		</c:otherwise>
	</c:choose>

	<div id="wrapper">

		<form name="fromlogin" class="login-form" action="/Brain_Mentor/Login"
			method="post" onSubmit="return validate();">

			<div class="header">
				<h1>Login</h1>
				<span></span>
			</div>

			<div class="content">
				<input type="text" class="input username" placeholder="Username"
					id="userName" name="userName" />
				<div class="user-icon"></div>
				<input id="userPassword" name="userPassword" type="password"
					class="input password" placeholder="Password" />
				<div class="pass-icon"></div>
			</div>

			<div class="footer">
				<input type="submit" name="submit" onclick="submit" value="Login"
					class="button" />

			</div>

		</form>

	</div>
	<div class="gradient"></div>



</body>
</html>