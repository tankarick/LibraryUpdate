package com.library.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
@Entity(name = "tickets")
public class Tickets {
	
	@Id
	@Column(name = "id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	@Column(name = "user_id")
	private int user_id;
	
	@Column(name = "book_id")
	private int book_id;
	
	@Column(name = "status")
	private int status;
	
	@Column(name = "date_open")
	private Date dateOpen;
	
	@Column(name = "date_close")
	private Date dateClose;
	
	@Column(name = "price")
	private int price;
	
	@Column(name = "userclosed")
	private String userNameClosed;
	
	

	public String getUserNameClosed() {
		return userNameClosed;
	}

	public void setUserNameClosed(String userNameClosed) {
		this.userNameClosed = userNameClosed;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getUser_id() {
		return user_id;
	}

	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}

	public int getBook_id() {
		return book_id;
	}

	public void setBook_id(int book_id) {
		this.book_id = book_id;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public Date getDateOpen() {
		return dateOpen;
	}

	public void setDateOpen(Date dateOpen) {
		this.dateOpen = dateOpen;
	}

	public Date getDateClose() {
		return dateClose;
	}

	public void setDateClose(Date dateClose) {
		this.dateClose = dateClose;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}
	
	
}
