function validateForm(){
	var username = document.getElementById("username").value == "";
	var password = document.getElementById("password").value == "";
	var passwordConfirm = document.getElementById("password").value == "";
	
	var password1 = document.getElementById("password").value;
	var passwordConfirm1 = document.getElementById("passwordConfirm").value;
	if(username | password | passwordConfirm){
		alert("Please enter your username and password!");
		return false;
	}
	if(!(password1 === passwordConfirm1)){
		alert("Password mismatch!");
		alert(password1+" "+passwordConfirm1);
		return false;
	}
}