package com.sgm.user.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.sgm.user.model.User;

@Repository
public interface UserDAO {
	public List<User> selectUserList();
}
