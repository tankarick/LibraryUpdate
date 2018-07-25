package com.library.dao;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.library.entity.Tickets;
import com.library.entity.Users;

@Repository
@Transactional
public class TicketDAOImp implements TicketDAO {

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
		/*
		 * List<Tickets> list = (List<Tickets>)
		 * sessionFactory.getCurrentSession().createQuery("FROM tickets");
		 */
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

	@Override
	public List<Tickets> getSortTicket(String startDate, String endDate) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd", Locale.getDefault());
		 
		try {
			Date sd = sdf.parse(startDate);
			
			Date ed = sdf.parse(endDate);
			ed.setHours(23);
			ed.setMinutes(59);
			ed.setSeconds(59);
			List<Tickets> list = sessionFactory.getCurrentSession()
					.createQuery("FROM tickets AS t WHERE t.dateOpen BETWEEN :stDate AND :edDate")
					.setParameter("stDate", sd).setParameter("edDate", ed).list();
			return list;
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return null;
	}

}
