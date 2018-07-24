<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<title>Register Form</title>
		<link rel="stylesheet" type="text/css" href="style/style.css"/>
		<script src="style/registerScript.js"></script>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<style>
			.login-box{height: 600px;}
		</style>
	</head>
	<body>
		<div class="login-box">
			<img src="style/avatar.png" class="avatar">
			<h1>Register new account</h1>
			<form method="POST" onsubmit="return confirm('Click Ok to register account?')" action="register">
				<p>Username</p>
				<input type="text" name="username" placeholder="Enter username" id="username">
				<p>Password</p>
				<input type="password" name="password" placeholder="Enter password" id="password">
				<p>Password Confirm</p>
				<input type="password" name="passwordConfirm" placeholder="Confirm password" id="passwordConfirm">
				<br>
				<p>Sorry.Account existing !</p>
				<br>
				<input type="submit" name="submit" value="Register" id="register" onclick="return validateForm()">
			</form>
			<a href="index.jsp">Login</a>
			<br>
			
		</div>
		
	</body>
</html>