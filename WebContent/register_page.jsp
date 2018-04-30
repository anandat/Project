<!DOCTYPE html>
<html>
<head>
<title>Register</title>
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
		var userFirstName = document.fromregister.user_fname.value;
		var userLastName = document.fromregister.user_lname.value;
		var userName = document.fromregister.user_userName.value;
		var userPassword = document.fromregister.user_password.value;
		var userConfirmPassword = document.fromregister.user_confirmpassword.value;
		var userEmail = document.fromregister.user_email.value;
		var userPhoneNo = document.fromregister.user_phoneNumber.value;

		if (userFirstName.length == 0) {
			alert("User First Name Field Cannot be Left Blank");
			document.fromregister.user_fname.focus();
			return false;
		} else if (userName.length == 0) {
			alert("User  Name Field Cannot be Left Blank");
			document.fromregister.user_userName.focus();
			return false;
		} else if (userLastName.length == 0) {
			alert("User Last Name Field Cannot be Left Blank");
			document.fromregister.user_lname.focus();
			return false;
		} else if (userPassword.length <= 6) {
			alert("Password Field Length should be greater than 6");
			document.fromregister.user_password.focus();
			return false;
		} else if (userPassword != userConfirmPassword) {
			alert("Password & Confirm Password not matching");
			document.fromregister.user_password.focus();
			document.fromregister.user_confirmpassword.focus();
			return false;
		} else if (userEmail.length == 0) {
			alert("User Email Cannot be Left Blank ");
			document.fromregister.user_email.focus();
			return false;
		} else if (!(/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/
				.test(userEmail))) {
			alert("User Email is invalid !!");
			document.fromregister.user_email.focus();
			return false;
		} else if (userPhoneNo.length == 0) {
			alert("User Phone No Cannot be Left Blank");
			document.fromregister.user_phoneNumber.focus();
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
			<li><a href='/Brain_Mentor/login_page.jsp'><span>Login</span></a></li>
		</ul>
	</div>

	<c:choose>
		<c:when test='${not empty sessionScope.errorMessage}'>
			<div style="position: absolute; left: 550px; top: 50px">
				<font color="red">${sessionScope.errorMessage}</font>
			</div>

		</c:when>
		<c:otherwise>
			<div style="position: absolute; left: 500px; top: 100px">
				Already have an account, click here to <a
					href='/Brain_Mentor/login_page.jsp'>Login</a>
			</div>
		</c:otherwise>
	</c:choose>

	<div id="wrapper">


		<form class="login-form" action="/Brain_Mentor/Register" method="post"
			name="fromregister" onSubmit="return validate();">



			<div class="header">
				<h1>Register</h1>
				<span></span>
			</div>

			<div class="content">
				<input name="user_fname" id="user_fname" type="text"
					class="input username" placeholder="First Name" />

				<div class="user-icon"></div>
				<br> <br> <input name="user_lname" id="user_lname"
					type="text" class="input username" placeholder="Last Name" />

				<div class="user-icon"></div>
				<br> <br> <input name="user_userName" id="user_userName"
					type="text" class="input username" placeholder="Username" />

				<div class="user-icon"></div>
				<br> <br> <input name="user_email" id="user_email"
					type="text" class="input username" placeholder="Email" />
				<div class="user-icon"></div>
				<br> <br> <input name="user_phoneNumber"
					id="user_phoneNumber" type="text" class="input username"
					placeholder="Contact No" />
				<div class="user-icon"></div>
				<input name="user_password" id="user_password" type="password"
					class="input password" placeholder="Password" />
				<div class="pass-icon"></div>
				<input name="user_confirmpassword" id="user_confirmpassword"
					type="password" class="input password"
					placeholder="Confirm Password" />
				<div class="pass-icon"></div>
				<br>
			</div>

			<div class="footer">
				<input type="submit" class="button" name="submit" value="Register"
					onclick="submit" />
			</div>
		</form>

	</div>
	<div class="gradient"></div>
</body>
</html>