package com.library.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.library.service.UserService;
@Controller
public class ReportController {
	@Autowired
	UserService userService;
	@RequestMapping("/report")
	public String report(HttpServletRequest request, Model model,  HttpServletResponse response) throws ServletException, IOException {
		return "Report";		
	}

}
