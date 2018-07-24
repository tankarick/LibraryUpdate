package com.library.dao;

import java.util.List;

import com.library.entity.Users;

public interface UserDAO {
	
	public void addUser(Users user);
	public Users getUserByName(String userName);
	public void deleteUser(Users user);
	public void updateUser(Users user);
	public List<Users> getAllUser();
	public Users findUser(int id);
	public Users getUserName(String userName, String password);
	public Users getRole(String userName);
}
