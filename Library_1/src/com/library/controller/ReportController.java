package com.library.controller;

import java.io.IOException;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.library.entity.Books;
import com.library.entity.Tickets;
import com.library.entity.Users;
import com.library.service.BookService;
import com.library.service.TicketService;
import com.library.service.UserService;
@Controller
public class ReportController {
	
	@Autowired
	TicketService ticketService;
	
	@Autowired
	BookService bookService;
	
	@Autowired
	UserService userService;
	
	@RequestMapping("/reportlibrary")
	public String reportLibrary(HttpServletRequest request, Model model,  HttpServletResponse response) throws ServletException, IOException {
		List<Users> listUser = new ArrayList<>();
		List<Books> listBook = new ArrayList<>();
		List<Tickets> listTicket = ticketService.getAllTicket();
		int income = 0 ;
		for(Tickets ticket:listTicket) {
			listBook.add(bookService.getBookByID(ticket.getBook_id()));
			listUser.add(userService.findUser(ticket.getUser_id()));
			income = income + ticket.getPrice();
		}
		model.addAttribute("listTicket", listTicket);
		model.addAttribute("listBook", listBook);
		model.addAttribute("listUser", listUser);
		model.addAttribute("income", income);
		return "Report";		
	}
	
	@RequestMapping("/sortReport")
	public String sortReport(Model model, HttpServletRequest request) {
		String startDate = request.getParameter("startDate");
		String endDate = request.getParameter("endDate");
		
		List<Tickets> listTicket = ticketService.getSortTicket(startDate, endDate);
		int income = 0;
		List<Users> listUser = new ArrayList<>();
		List<Books> listBook = new ArrayList<>();
		for (Tickets ticket : listTicket) {
			int idUser = ticket.getUser_id();
			listUser.add(userService.findUser(idUser));
			int idBook = ticket.getBook_id();
			listBook.add(bookService.getBookByID(idBook));
			income = income + ticket.getPrice();
		}
		
		model.addAttribute("listUser", listUser);
		model.addAttribute("listBook", listBook);
		model.addAttribute("listTicket", listTicket);
		model.addAttribute("startDate", startDate);
		model.addAttribute("endDate", endDate);
		model.addAttribute("income", income);
		return "Report";
	}

}
