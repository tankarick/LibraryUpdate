package com.library.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.library.dao.UserDAOImp;
import com.library.entity.Books;
import com.library.entity.Users;
import com.library.service.UserService;
import com.library.service.UserServiceImp;
import com.library.service.BookService;

@Controller
public class UserController {
		
	@Autowired
	BookService bookService;
	@Autowired
	UserService userService;	
	@RequestMapping("/login")
	public String addUser(HttpServletRequest request, Model model,  HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String username = request.getParameter("username").toString();
		String password = request.getParameter("password").toString();
		if(username != null && password != null) {
			Users user = userService.getUserName(username, password);
			if(user != null) {
				String role = user.getRole();
				session.setAttribute("username", username);
				session.setAttribute("role", role);
				session.setAttribute("id", user.getId());
				List<Books> list = bookService.getAllBook();
				model.addAttribute("listbook", list);
				request.setAttribute("addBook", new Books());
				return "Admin";
				
			}else {
				model.addAttribute("sucess", "Fail!");
				return "Login";
			}
		}
		//return "Login";
		return "Fail";
		
	}
	@RequestMapping("/logout")
	public String logOut(HttpServletRequest request, Model model,  HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		session.invalidate();
		return "Login";		
	}
	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String login(HttpServletRequest request, Model model) {
		
		String username = request.getParameter("username").toString();
		String password = request.getParameter("password").toString();
		String fullname = request.getParameter("name").toString();
		String email = request.getParameter("email").toString();
		
		if(username != null) {
			Users user = userService.getUserByName(username);
			if(user == null) {
				Users u = new Users();
				u.setUserName(username);
				u.setPassWord(password);
				u.setRole("student");				
				u.setQuantityOfBookCanBorrow(5);
				u.setFullName(fullname);
				u.setEmail(email);
				userService.addUser(u);
				return "Login";
			}else {
				return "Register";
			}
		}
		return null;
	}
	@RequestMapping("/admin")
	public String admin(HttpServletRequest request, Model model,  HttpServletResponse response) throws ServletException, IOException {
		List<Books> list = bookService.getAllBook();
		model.addAttribute("listbook", list);
		request.setAttribute("addBook", new Books());
		return "Admin";
		
	}
	@RequestMapping(value ="/usermanagement", method = RequestMethod.GET)
	public String userManagement(HttpServletRequest request, Model model,  HttpServletResponse response) throws ServletException, IOException {
		List<Users> list = userService.getAllUser();
		model.addAttribute("list",list);
		return "UserManagement";		
	}

	@RequestMapping(value ="/updateuser", method = RequestMethod.POST)
	public String updateUser(Model model,  HttpServletRequest request) throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id").toString());
		String userName = request.getParameter("userName");
		String passWord = request.getParameter("passWord");
		String role = request.getParameter("roless");
		int limitBorrowingBook = Integer.parseInt(request.getParameter("limitBorrowingBook"));
		Users u = new Users();
		u.setId(id);
		u.setUserName(userName);
		u.setPassWord(passWord);
		u.setRole(role);
		u.setQuantityOfBookCanBorrow(limitBorrowingBook);
		userService.updateUser(u);
		List<Users> list = userService.getAllUser();
		model.addAttribute("list",list);
		return "UserManagement";		
	}
	@RequestMapping(value ="/deleteuser{id}", method = RequestMethod.GET)
	public String deleteUser(@PathVariable int id, Model model,  HttpServletRequest request) throws ServletException, IOException {
		Users u = userService.findUser(id);
		userService.deleteUser(u);
		List<Users> list = userService.getAllUser();
		model.addAttribute("list",list);
		return "UserManagement";		
	}
	
}
