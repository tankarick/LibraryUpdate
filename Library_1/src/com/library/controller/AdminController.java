package com.library.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.library.entity.Users;
import com.library.service.UserService;

public class AdminController {
	@Autowired
	UserService userService;
	@RequestMapping("/admin")
	public String addUser(HttpServletRequest request, Model model,  HttpServletResponse response) throws ServletException, IOException {
		/*HttpSession session = request.getSession();
		String username = request.getParameter("username").toString();
		String password = request.getParameter("password").toString();
		if(username != null && password != null) {
			User user = userService.getUserName(username, password);
			if(user != null) {
				session.setAttribute("username", username);
				session.setAttribute("password", password);
				//RequestDispatcher dispatcher = request.getRequestDispatcher("../Admin");
				//dispatcher.forward(request, response);
				//model.addAttribute("sucess", username);
				return "Admin";
				
			}else {
				model.addAttribute("sucess", "Fail!");
				return "Fail";
			}
		}
		//return "Login";
		return "Fail";*/
		return "Login";
		
	}

}
