package com.library.dao;

import java.util.List;

import javax.management.Query;
import javax.transaction.Transactional;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.library.entity.Books;
@Repository
@Transactional
public class BookDAOImp implements BookDAO{

	@Autowired
	SessionFactory sessionFactory;
	
	@Transactional
	@Override
	public void insertBook(Books book) {
		sessionFactory.getCurrentSession().save(book);
		
	}

	@Transactional
	@Override
	public void deleteBook(Books book) {
		sessionFactory.getCurrentSession().delete(book);
		
	}

	@Override
	public void updateBook(Books book) {
		sessionFactory.getCurrentSession().update(book);
		
	}

	@Transactional
	@Override
	public List<Books> getAllBook() {
		List<Books> list = sessionFactory.getCurrentSession().createQuery("FROM books").list();
		return list;
	}

	@Transactional
	@Override
	public Books getBookByID(int bookID) {
		
		return (Books) sessionFactory.getCurrentSession().get(Books.class, bookID);
	}

	@Override
	public Books getBookByName(String bookName) {
		org.hibernate.Query query = sessionFactory.getCurrentSession().createQuery("FROM books where name=:name");
		query.setString("name", bookName);
		return (Books) query.uniqueResult();
	}

}
