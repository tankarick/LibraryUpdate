package com.library.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.library.entity.Books;
import com.library.entity.Tickets;
import com.library.entity.Users;
import com.library.service.BookService;
import com.library.service.TicketService;
import com.library.service.UserService;

@Controller
public class TicketController {
	@Autowired
	BookService bookService;

	@Autowired
	UserService userService;

	@Autowired
	TicketService ticketService;

	@RequestMapping("/openTicket{bookID}/{price}")
	public String openTicket(HttpServletRequest request, @PathVariable("bookID") int bookID,
			@PathVariable("price") int price) {
		HttpSession session = request.getSession();
		int userID = (int) session.getAttribute("id");
		// 1: borrow; 0: return book
		int status = 1;
		Tickets ticket = new Tickets();
		ticket.setBook_id(bookID);
		ticket.setUser_id(userID);
		ticket.setPrice(price);
		ticket.setStatus(status);
		Date openDate = new Date(System.currentTimeMillis());
		ticket.setDateOpen(openDate);
		ticket.setDateClose(null);

		ticketService.openTicket(ticket);
		Books book = bookService.getBookByID(bookID);
		int remain = book.getRemain() - 1;
		book.setRemain(remain);
		bookService.updateBook(book);
		// SimpleDateFormat sdf = new SimpleDateFormat("dd:MM:yyyy hh:mm",
		// Locale.getDefault());
		// System.out.println(sdf.format(openDate));

		return "redirect:/admin";
	}

	@RequestMapping("/ticketmanagement")
	public String ticketManagement(HttpServletRequest request, Model model, HttpServletResponse response)
			throws ServletException, IOException {
		List<Tickets> list = ticketService.getAllTicket();
		List<Users> listUser = new ArrayList<>();
		List<Books> listBook = new ArrayList<>();
		for (Tickets ticket : list) {
			int idUser = ticket.getUser_id();
			listUser.add(userService.findUser(idUser));
			int idBook = ticket.getBook_id();
			listBook.add(bookService.getBookByID(idBook));
		}
		model.addAttribute("list", list);
		model.addAttribute("listuser", listUser);
		model.addAttribute("listbook", listBook);
		return "TicketManagement";
	}

	@RequestMapping("/closeTicket{ticketID}/{bookID}/{userID}")
	public String closeTicket(HttpServletRequest request, @PathVariable("ticketID") int ticketID,
			@PathVariable("bookID") int bookID, @PathVariable("userID") int userID, HttpSession session) {
		// return = 0
		int status = 0;
		Tickets closeTicket = ticketService.getTicket(ticketID);
		closeTicket.setStatus(status);
		closeTicket.setUserNameClosed(session.getAttribute("username").toString());
		Date closedate = new Date(System.currentTimeMillis());
		closeTicket.setDateClose(closedate);
		ticketService.closeTicket(closeTicket);

		Books returnedBook = bookService.getBookByID(bookID);
		returnedBook.setRemain(returnedBook.getRemain() + 1);
		bookService.updateBook(returnedBook);
		return "redirect:/ticketmanagement";
	}

	@RequestMapping("/userticket")
	public String userticket(HttpServletRequest request, Model model, HttpServletResponse response, HttpSession session)
			throws ServletException, IOException {
		List<Tickets> list = ticketService.getTicketsByUserID(Integer.parseInt(session.getAttribute("id").toString()));
		List<Users> listUser = new ArrayList<>();
		List<Books> listBook = new ArrayList<>();
		for (Tickets ticket : list) {
			int idUser = ticket.getUser_id();
			listUser.add(userService.findUser(idUser));
			int idBook = ticket.getBook_id();
			listBook.add(bookService.getBookByID(idBook));
		}
		model.addAttribute("listuser", listUser);
		model.addAttribute("listbook", listBook);
		model.addAttribute("list", list);
		return "UserTicket";
	}

}
