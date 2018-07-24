package com.library.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.library.dao.BookDAO;
import com.library.entity.Books;
@Service
@Transactional
public class BookServiceImp implements BookService{
	
	@Autowired
	BookDAO bookDAO;
	
	@Transactional
	@Override
	public void insertBook(Books book) {
		bookDAO.insertBook(book);
		
	}

	@Transactional
	@Override
	public void deleteBook(Books book) {
		bookDAO.deleteBook(book);
		
	}

	@Override
	public void updateBook(Books book) {
		bookDAO.updateBook(book);
		
	}

	@Transactional
	@Override
	public List<Books> getAllBook() {
		
		return bookDAO.getAllBook();
	}

	@Transactional
	@Override
	public Books getBookByID(int bookID) {
		
		return bookDAO.getBookByID(bookID);
	}

	@Override
	public Books getBookByName(String bookName) {
		
		return bookDAO.getBookByName(bookName);
	}

}
