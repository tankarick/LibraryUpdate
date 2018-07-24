package com.library.service;

import java.util.List;

import com.library.entity.Books;

public interface BookService {
	
	public void insertBook(Books book);
	public void deleteBook(Books book);
	public void updateBook(Books book);
	public List<Books> getAllBook();
	public Books getBookByID(int bookID);
	public Books getBookByName(String bookName);
}
