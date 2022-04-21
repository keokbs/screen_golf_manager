package com.sgm.user.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sgm.user.dao.UserDAO;
import com.sgm.user.model.User;

@Service
public class UserBO {

	@Autowired
	private UserDAO userDAO;
	
	public List<User> getUserList() {
		return userDAO.selectUserList();
	}

	public User getUserByLoginIdPassword(String loginId, String password) {
		return userDAO.selectUserByLoginPassword(loginId, password);
	}

	public User getUserByLoginId(String loginId) {
		return userDAO.selectUserByLoginId(loginId);
	}

	public int addUser(String loginId, String name, String password, int phoneNumber, String storeName) {
		return userDAO.insertUser(loginId, name, password, phoneNumber, storeName);
	}

}
