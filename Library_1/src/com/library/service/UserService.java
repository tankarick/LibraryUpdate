package com.library.service;

import java.util.List;

import com.library.entity.Users;

public interface UserService {

	public void addUser(Users user);
	public Users getUserByName(String userName);
	public void deleteUser(Users user);
	public void updateUser(Users user);
	public List<Users> getAllUser();
	public Users getUserName(String userName, String password);
	public Users findUser(int id);
	public Users getRole(String userName);
}
