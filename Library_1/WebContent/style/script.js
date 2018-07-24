function validateForm(){
	var username = document.getElementById("username").value == "";
	var password = document.getElementById("password").value == "";
	if(username || password){
		alert("Please enter your username and password!");
		return false;
	}
}
