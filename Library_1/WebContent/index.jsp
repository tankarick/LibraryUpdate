<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Login Form</title>
		<link rel="stylesheet" type="text/css" href="style/style.css"/>
		<script src="style/script.js"></script>
	</head>
	<body>
		<div class="login-box">
			<img src="style/avatar.png" class="avatar">
			<h1>Welcome to Library Management</h1>
			<form method="POST" onsubmit="return validateForm()" action="login">
				<p>Username</p>
				<input type="text" name="username" placeholder="Enter username" id="username">
				<p>Password</p>
				<input type="password" name="password" placeholder="Enter password" id="password">
				<input type="submit" name="submit" value="Login" id="submit">
			</form>
			<a href="register.jsp">Register</a>
		</div>
	</body>
</html>