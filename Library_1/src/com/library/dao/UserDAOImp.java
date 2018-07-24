package com.library.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.library.entity.Users;

@Repository
public class UserDAOImp implements UserDAO {

	@Autowired
	SessionFactory sessionFactory;

	@Override
	public void addUser(Users user) {
		sessionFactory.getCurrentSession().save(user);

	}
	@Transactional
	@Override
	public Users getUserByName(String userName) {
		Query query = sessionFactory.getCurrentSession().createQuery("FROM users WHERE username=:name");
		query.setString("name", userName);
		return (Users) query.uniqueResult();
	}
	@Transactional
	@Override
	public void deleteUser(Users user) {
		// TODO Auto-generated method stub
		sessionFactory.getCurrentSession().delete(user);
	}
	@Transactional
	@Override
	public void updateUser(Users user) {
		sessionFactory.getCurrentSession().update(user);
	}
	@Transactional
	@Override
	public List<Users> getAllUser() {
		
		return (List<Users>) sessionFactory.getCurrentSession().createQuery("from users").list();
	}
	@Transactional
	@Override
	//o day chi truyen vao duoc ID cua clas entity thôi. 
	public Users getUserName(String userName, String passWord) {
		//Em dung cau lenh HQL o day. 
		// FROM Ủe ƯHEE userName = ? //// xem hql 
		Query query = sessionFactory.getCurrentSession().createQuery("FROM users WHERE username=:name and password=:pass");
		query.setString("name", userName);
		query.setString("pass", passWord);
		return (Users) query.uniqueResult();

	}
	@Transactional
	@Override
	public Users findUser(int id) {
		// TODO Auto-generated method stub
		Query query = sessionFactory.getCurrentSession().createQuery("FROM users WHERE id=:id");
		query.setInteger("id", id);
		return (Users) query.uniqueResult();
		
	}
	@Transactional
	@Override
	public Users getRole(String userName) {
		Query query = sessionFactory.getCurrentSession().createQuery("FROM users WHERE username=:name");
		query.setString("name", userName);
		return (Users) query.uniqueResult();
	}

}
