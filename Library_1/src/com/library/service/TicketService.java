package com.library.service;

import java.util.List;

import com.library.entity.Tickets;

import sun.security.krb5.internal.Ticket;

public interface TicketService {

	public void openTicket(Tickets ticket);
	public Tickets getTicket(int ticketID);
	public List<Tickets> getAllTicket();
	public List<Tickets> getTicketsByUserID(int userID);
	public void closeTicket(Tickets ticket);
}
