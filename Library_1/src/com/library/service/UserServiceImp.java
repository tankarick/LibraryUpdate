package com.library.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.library.dao.UserDAO;
import com.library.entity.Users;
@Service
public class UserServiceImp implements UserService{

	@Autowired
	UserDAO userDao;
	
	@Transactional
	@Override
	public void addUser(Users user) {
		userDao.addUser(user);
		
	}
	@Transactional
	@Override
	public Users getUserByName(String userName) {
		
		return userDao.getUserByName(userName);
	}
	@Transactional
	@Override
	public void deleteUser(Users user) {
		// TODO Auto-generated method stub
		userDao.deleteUser(user);
	}
	@Transactional
	@Override
	public void updateUser(Users user) {
		// TODO Auto-generated method stub
		userDao.updateUser(user);		
	}
	@Transactional
	@Override
	public List<Users> getAllUser() {
		
		return userDao.getAllUser();
	}
	@Transactional
	@Override
	public Users getUserName(String userName, String password) {
		return userDao.getUserName(userName, password);
		
	}
	@Transactional
	@Override
	public Users findUser(int id) {
		return userDao.findUser(id);
		
	}
	
	@Transactional
	@Override
	public Users getRole(String userName) {
		// TODO Auto-generated method stub
		return userDao.getRole(userName);
	}

}
