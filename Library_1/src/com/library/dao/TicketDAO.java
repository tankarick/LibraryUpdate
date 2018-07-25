package com.library.dao;

import java.util.List;

import com.library.entity.Tickets;

public interface TicketDAO {
	
	public void openTicket(Tickets ticket);
	public Tickets getTicket(int ticketID);
	public void closeTicket(Tickets ticket);
	public List<Tickets> getAllTicket();
	public List<Tickets> getTicketsByUserID(int userID);
	public List<Tickets> getSortTicket(String startDate, String endDate);
	
}
