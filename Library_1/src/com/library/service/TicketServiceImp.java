package com.library.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.library.dao.TicketDAO;
import com.library.entity.Tickets;

import sun.security.krb5.internal.Ticket;

@Service
@Transactional
public class TicketServiceImp implements TicketService{

	@Autowired
	TicketDAO ticketDAO;

	@Override
	public List<Tickets> getAllTicket() {
		// TODO Auto-generated method stub
		return ticketDAO.getAllTicket();
	}

	@Override
	public List<Tickets> getTicketsByUserID(int userID) {
		// TODO Auto-generated method stub
		return ticketDAO.getTicketsByUserID(userID);
	}

	@Override
	public void openTicket(Tickets ticket) {
		ticketDAO.openTicket(ticket);
		
	}

	@Override
	public Tickets getTicket(int ticketID) {
		return ticketDAO.getTicket(ticketID);
	}

	@Override
	public void closeTicket(Tickets ticket) {
		ticketDAO.closeTicket(ticket);
		
	}

	@Override
	public List<Tickets> getSortTicket(String startDate, String endDate) {
		
		return ticketDAO.getSortTicket(startDate, endDate);
	}

	
}
