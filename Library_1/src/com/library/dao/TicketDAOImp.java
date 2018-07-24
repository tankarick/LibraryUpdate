package com.library.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.library.entity.Tickets;
import com.library.entity.Users;
@Repository
@Transactional
public class TicketDAOImp implements TicketDAO{
	
	@Autowired
	SessionFactory sessionFactory;
	
	@Override
	public void openTicket(Tickets ticket) {
		sessionFactory.getCurrentSession().save(ticket);
		
	}

	@Override
	public Tickets getTicket(int ticketID) {
		Tickets ticket = (Tickets) sessionFactory.getCurrentSession().get(Tickets.class, ticketID);
		return ticket;
	}

	@Override
	public List<Tickets> getAllTicket() {
/*		List<Tickets> list = (List<Tickets>) sessionFactory.getCurrentSession().createQuery("FROM tickets");*/
		return (List<Tickets>) sessionFactory.getCurrentSession().createQuery("from tickets").list();
	}

	@Override
	public List<Tickets> getTicketsByUserID(int userID) {
		Query query = sessionFactory.getCurrentSession().createQuery("FROM tickets WHERE user_id=:userID");
		query.setInteger("userID", userID);
		return query.list();
	}

	@Override
	public void closeTicket(Tickets ticket) {
		sessionFactory.getCurrentSession().update(ticket);
		
	}

	

}
